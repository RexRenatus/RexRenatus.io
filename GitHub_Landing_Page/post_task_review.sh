#!/bin/bash

# Script: post_task_review.sh
# Purpose: Review task completion against claude.md XML rules
# Enhanced version with specific rule violation checking

# Check if claude.md exists
if [ ! -f "./claude.md" ]; then
    echo "ERROR: No claude.md file found. Cannot verify rule compliance." >&2
    exit 2
fi

# Parse input from Claude
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')

# Create directories for tracking
TRACK_DIR="$HOME/.claude/hook_data/compliance"
VIOLATION_LOG="$TRACK_DIR/violations_${SESSION_ID}.log"
mkdir -p "$TRACK_DIR"

echo "╔═══════════════════════════════════════════════════════════╗" >&2
echo "║              POST-TASK COMPLIANCE REVIEW                  ║" >&2
echo "╚═══════════════════════════════════════════════════════════╝" >&2
echo "" >&2
echo "📋 Completed Operation: $TOOL_NAME" >&2
echo "🔍 Checking Compliance: ./claude.md" >&2
echo "" >&2

# Find recently modified files (last 10 minutes)
RECENT_FILES=$(find . -type f -mmin -10 \
    -not -path "./.claude/*" \
    -not -path "./.git/*" \
    -not -name "*.log" \
    2>/dev/null | sort)

FILE_COUNT=$(echo -n "$RECENT_FILES" | grep -c '^' || echo "0")

# Initialize violation tracking
VIOLATIONS=()
WARNINGS=()

# Function to add violation
add_violation() {
    local rule_id=$1
    local description=$2
    VIOLATIONS+=("[$rule_id] $description")
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $TOOL_NAME - [$rule_id] $description" >> "$VIOLATION_LOG"
}

# Function to add warning
add_warning() {
    local rule_id=$1
    local description=$2
    WARNINGS+=("[$rule_id] $description")
}

# Display modified files
if [[ $FILE_COUNT -gt 0 ]]; then
    echo "📁 FILES MODIFIED ($FILE_COUNT total):" >&2
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
    echo "$RECENT_FILES" | head -20 >&2
    if [[ $FILE_COUNT -gt 20 ]]; then
        echo "... and $((FILE_COUNT - 20)) more files" >&2
    fi
    echo "" >&2
fi

# SPECIFIC RULE COMPLIANCE CHECKS
echo "🔍 CHECKING RULE COMPLIANCE:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Check 1: MASTER_TODO.md update (rule doc-2)
if [[ $FILE_COUNT -gt 0 ]]; then
    if ! echo "$RECENT_FILES" | grep -q "MASTER_TODO.md"; then
        # Check if MASTER_TODO.md was modified today at all
        if [ -f "./planning/MASTER_TODO.md" ]; then
            last_modified=$(stat -c %Y "./planning/MASTER_TODO.md" 2>/dev/null || stat -f %m "./planning/MASTER_TODO.md" 2>/dev/null || echo "0")
            current_time=$(date +%s)
            time_diff=$((current_time - last_modified))
            
            # If not modified in last hour (3600 seconds)
            if [ $time_diff -gt 3600 ]; then
                add_violation "doc-2" "MASTER_TODO.md not updated after task completion"
            fi
        fi
    else
        echo "✓ MASTER_TODO.md updated" >&2
    fi
fi

# Check 2: PROJECT_JOURNAL.md session summary (rule doc-4)
if [ -f "./planning/PROJECT_JOURNAL.md" ]; then
    today=$(date +%Y-%m-%d)
    if ! grep -q "$today" "./planning/PROJECT_JOURNAL.md"; then
        add_warning "doc-4" "No session summary found for today in PROJECT_JOURNAL.md"
    else
        echo "✓ PROJECT_JOURNAL.md has today's entry" >&2
    fi
fi

# Check 3: PROJECT_INDEX.md update for new files (rule file-1)
new_files=$(echo "$RECENT_FILES" | grep -v "^\./\." | grep -E "\.(md|py|js|json)$" || true)
if [ -n "$new_files" ] && [ -f "./PROJECT_INDEX.md" ]; then
    for file in $new_files; do
        if ! grep -q "$file" "./PROJECT_INDEX.md"; then
            add_warning "file-1" "New file not in PROJECT_INDEX.md: $file"
        fi
    done
fi

# Check 4: Security violations (rule sec-1)
if [ -n "$RECENT_FILES" ]; then
    for file in $RECENT_FILES; do
        if [[ -f "$file" ]] && [[ "$file" =~ \.(py|js|json|yaml|yml|env)$ ]]; then
            if grep -iE "password[[:space:]]*=|api_key[[:space:]]*=|secret[[:space:]]*=|token[[:space:]]*=" "$file" 2>/dev/null | grep -v "^[[:space:]]*#"; then
                add_violation "sec-1" "Possible hardcoded credentials in: $file"
            fi
        fi
    done
fi

# Check 5: Documentation in code files (rule dev-6)
python_files=$(echo "$RECENT_FILES" | grep "\.py$" || true)
if [ -n "$python_files" ]; then
    for file in $python_files; do
        if [ -f "$file" ]; then
            # Check for functions without docstrings
            if grep -E "^def |^class " "$file" | grep -B1 -v '"""' 2>/dev/null | grep -q "def\|class"; then
                add_warning "dev-6" "Missing docstrings in: $file"
            fi
        fi
    done
fi

# Check 6: File naming conventions
if [ -n "$RECENT_FILES" ]; then
    # Check for files without extensions (rule file-2 implies proper naming)
    no_ext_files=$(echo "$RECENT_FILES" | grep -v '\.' | grep -v '^\./\.' || true)
    if [ -n "$no_ext_files" ]; then
        add_warning "file-2" "Files without extensions: $no_ext_files"
    fi
    
    # Check for non-CAPS important files
    important_files=$(echo "$RECENT_FILES" | grep -E "(README|TODO|CHANGELOG|LICENSE)" | grep -v -E "(README\.md|TODO\.md|CHANGELOG\.md|LICENSE\.md)" || true)
    if [ -n "$important_files" ]; then
        add_warning "file-2" "Important files should use CAPS: $important_files"
    fi
fi

# Check 7: Deep nesting (design principle - KISS)
if [ -n "$RECENT_FILES" ]; then
    deep_files=$(echo "$RECENT_FILES" | awk -F'/' 'NF>6' || true)
    if [ -n "$deep_files" ]; then
        add_warning "design-1" "Deeply nested files (>5 levels) violate KISS principle"
    fi
fi

# Display results
echo "" >&2
echo "📊 COMPLIANCE SUMMARY:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

if [ ${#VIOLATIONS[@]} -eq 0 ] && [ ${#WARNINGS[@]} -eq 0 ]; then
    echo "✅ NO RULE VIOLATIONS DETECTED" >&2
else
    if [ ${#VIOLATIONS[@]} -gt 0 ]; then
        echo "❌ CRITICAL VIOLATIONS (${#VIOLATIONS[@]}):" >&2
        for violation in "${VIOLATIONS[@]}"; do
            echo "   • $violation" >&2
        done
        echo "" >&2
    fi
    
    if [ ${#WARNINGS[@]} -gt 0 ]; then
        echo "⚠️  WARNINGS (${#WARNINGS[@]}):" >&2
        for warning in "${WARNINGS[@]}"; do
            echo "   • $warning" >&2
        done
    fi
fi

# Extract and display relevant rules for reference
echo -e "\n📜 RELEVANT RULES FOR THIS OPERATION:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Show rules based on operation type
case "$TOOL_NAME" in
    "Task")
        grep -A1 'rule-set name="Task Management"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
    "Write"|"Edit"|"MultiEdit")
        grep -A1 'rule-set name="Development Process"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
    "Bash")
        grep -A1 'rule-set name="Security Compliance"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
esac

# Required actions
echo -e "\n📝 REQUIRED COMPLIANCE VERIFICATION:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
echo "Please verify and respond with one of the following:" >&2
echo "" >&2

if [ ${#VIOLATIONS[@]} -gt 0 ]; then
    echo "⚠️  VIOLATIONS DETECTED - You must:" >&2
    echo "1. Fix the violations listed above" >&2
    echo "2. Update affected files to comply with rules" >&2
    echo "3. Respond with: 'VIOLATIONS FIXED: [description of fixes]'" >&2
else
    echo "✓ No critical violations found - You must:" >&2
    echo "1. Review all changes for rule compliance" >&2
    echo "2. Address any war#!/bin/bash

# Script: post_task_review.sh
# Purpose: Review task completion against claude.md XML rules
# Enhanced version with specific rule violation checking

# Check if claude.md exists
if [ ! -f "./claude.md" ]; then
    echo "ERROR: No claude.md file found. Cannot verify rule compliance." >&2
    exit 2
fi

# Parse input from Claude
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')

# Create directories for tracking
TRACK_DIR="$HOME/.claude/hook_data/compliance"
VIOLATION_LOG="$TRACK_DIR/violations_${SESSION_ID}.log"
mkdir -p "$TRACK_DIR"

echo "╔═══════════════════════════════════════════════════════════╗" >&2
echo "║              POST-TASK COMPLIANCE REVIEW                  ║" >&2
echo "╚═══════════════════════════════════════════════════════════╝" >&2
echo "" >&2
echo "📋 Completed Operation: $TOOL_NAME" >&2
echo "🔍 Checking Compliance: ./claude.md" >&2
echo "" >&2

# Find recently modified files (last 10 minutes)
RECENT_FILES=$(find . -type f -mmin -10 \
    -not -path "./.claude/*" \
    -not -path "./.git/*" \
    -not -name "*.log" \
    2>/dev/null | sort)

FILE_COUNT=$(echo -n "$RECENT_FILES" | grep -c '^' || echo "0")

# Initialize violation tracking
VIOLATIONS=()
WARNINGS=()

# Function to add violation
add_violation() {
    local rule_id=$1
    local description=$2
    VIOLATIONS+=("[$rule_id] $description")
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $TOOL_NAME - [$rule_id] $description" >> "$VIOLATION_LOG"
}

# Function to add warning
add_warning() {
    local rule_id=$1
    local description=$2
    WARNINGS+=("[$rule_id] $description")
}

# Display modified files
if [[ $FILE_COUNT -gt 0 ]]; then
    echo "📁 FILES MODIFIED ($FILE_COUNT total):" >&2
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
    echo "$RECENT_FILES" | head -20 >&2
    if [[ $FILE_COUNT -gt 20 ]]; then
        echo "... and $((FILE_COUNT - 20)) more files" >&2
    fi
    echo "" >&2
fi

# SPECIFIC RULE COMPLIANCE CHECKS
echo "🔍 CHECKING RULE COMPLIANCE:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Check 1: MASTER_TODO.md update (rule doc-2)
if [[ $FILE_COUNT -gt 0 ]]; then
    if ! echo "$RECENT_FILES" | grep -q "MASTER_TODO.md"; then
        # Check if MASTER_TODO.md was modified today at all
        if [ -f "./planning/MASTER_TODO.md" ]; then
            last_modified=$(stat -c %Y "./planning/MASTER_TODO.md" 2>/dev/null || stat -f %m "./planning/MASTER_TODO.md" 2>/dev/null || echo "0")
            current_time=$(date +%s)
            time_diff=$((current_time - last_modified))
            
            # If not modified in last hour (3600 seconds)
            if [ $time_diff -gt 3600 ]; then
                add_violation "doc-2" "MASTER_TODO.md not updated after task completion"
            fi
        fi
    else
        echo "✓ MASTER_TODO.md updated" >&2
    fi
fi

# Check 2: PROJECT_JOURNAL.md session summary (rule doc-4)
if [ -f "./planning/PROJECT_JOURNAL.md" ]; then
    today=$(date +%Y-%m-%d)
    if ! grep -q "$today" "./planning/PROJECT_JOURNAL.md"; then
        add_warning "doc-4" "No session summary found for today in PROJECT_JOURNAL.md"
    else
        echo "✓ PROJECT_JOURNAL.md has today's entry" >&2
    fi
fi

# Check 3: PROJECT_INDEX.md update for new files (rule file-1)
new_files=$(echo "$RECENT_FILES" | grep -v "^\./\." | grep -E "\.(md|py|js|json)$" || true)
if [ -n "$new_files" ] && [ -f "./PROJECT_INDEX.md" ]; then
    for file in $new_files; do
        if ! grep -q "$file" "./PROJECT_INDEX.md"; then
            add_warning "file-1" "New file not in PROJECT_INDEX.md: $file"
        fi
    done
fi

# Check 4: Security violations (rule sec-1)
if [ -n "$RECENT_FILES" ]; then
    for file in $RECENT_FILES; do
        if [[ -f "$file" ]] && [[ "$file" =~ \.(py|js|json|yaml|yml|env)$ ]]; then
            if grep -iE "password[[:space:]]*=|api_key[[:space:]]*=|secret[[:space:]]*=|token[[:space:]]*=" "$file" 2>/dev/null | grep -v "^[[:space:]]*#"; then
                add_violation "sec-1" "Possible hardcoded credentials in: $file"
            fi
        fi
    done
fi

# Check 5: Documentation in code files (rule dev-6)
python_files=$(echo "$RECENT_FILES" | grep "\.py$" || true)
if [ -n "$python_files" ]; then
    for file in $python_files; do
        if [ -f "$file" ]; then
            # Check for functions without docstrings
            if grep -E "^def |^class " "$file" | grep -B1 -v '"""' 2>/dev/null | grep -q "def\|class"; then
                add_warning "dev-6" "Missing docstrings in: $file"
            fi
        fi
    done
fi

# Check 6: File naming conventions
if [ -n "$RECENT_FILES" ]; then
    # Check for files without extensions (rule file-2 implies proper naming)
    no_ext_files=$(echo "$RECENT_FILES" | grep -v '\.' | grep -v '^\./\.' || true)
    if [ -n "$no_ext_files" ]; then
        add_warning "file-2" "Files without extensions: $no_ext_files"
    fi
    
    # Check for non-CAPS important files
    important_files=$(echo "$RECENT_FILES" | grep -E "(README|TODO|CHANGELOG|LICENSE)" | grep -v -E "(README\.md|TODO\.md|CHANGELOG\.md|LICENSE\.md)" || true)
    if [ -n "$important_files" ]; then
        add_warning "file-2" "Important files should use CAPS: $important_files"
    fi
fi

# Check 7: Deep nesting (design principle - KISS)
if [ -n "$RECENT_FILES" ]; then
    deep_files=$(echo "$RECENT_FILES" | awk -F'/' 'NF>6' || true)
    if [ -n "$deep_files" ]; then
        add_warning "design-1" "Deeply nested files (>5 levels) violate KISS principle"
    fi
fi

# Display results
echo "" >&2
echo "📊 COMPLIANCE SUMMARY:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

if [ ${#VIOLATIONS[@]} -eq 0 ] && [ ${#WARNINGS[@]} -eq 0 ]; then
    echo "✅ NO RULE VIOLATIONS DETECTED" >&2
else
    if [ ${#VIOLATIONS[@]} -gt 0 ]; then
        echo "❌ CRITICAL VIOLATIONS (${#VIOLATIONS[@]}):" >&2
        for violation in "${VIOLATIONS[@]}"; do
            echo "   • $violation" >&2
        done
        echo "" >&2
    fi
    
    if [ ${#WARNINGS[@]} -gt 0 ]; then
        echo "⚠️  WARNINGS (${#WARNINGS[@]}):" >&2
        for warning in "${WARNINGS[@]}"; do
            echo "   • $warning" >&2
        done
    fi
fi

# Extract and display relevant rules for reference
echo -e "\n📜 RELEVANT RULES FOR THIS OPERATION:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Show rules based on operation type
case "$TOOL_NAME" in
    "Task")
        grep -A1 'rule-set name="Task Management"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
    "Write"|"Edit"|"MultiEdit")
        grep -A1 'rule-set name="Development Process"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
    "Bash")
        grep -A1 'rule-set name="Security Compliance"' ./claude.md | grep -E 'rule.*priority="(critical|mandatory)"' | head -5 | sed 's/<[^>]*>//g' >&2
        ;;
esac

# Required actions
echo -e "\n📝 REQUIRED COMPLIANCE VERIFICATION:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
echo "Please verify and respond with one of the following:" >&2
echo "" >&2

if [ ${#VIOLATIONS[@]} -gt 0 ]; then
    echo "⚠️  VIOLATIONS DETECTED - You must:" >&2
    echo "1. Fix the violations listed above" >&2
    echo "2. Update affected files to comply with rules" >&2
    echo "3. Respond with: 'VIOLATIONS FIXED: [description of fixes]'" >&2
else
    echo "✓ No critical violations found - You must:" >&2
    echo "1. Review all changes for rule compliance" >&2
    echo "2. Address any warnings if applicable" >&2
    echo "3. Respond with: 'COMPLIANCE CONFIRMED: All changes follow claude.md rules'" >&2
fi

if [ ${#WARNINGS[@]} -gt 0 ]; then
    echo "" >&2
    echo "📌 Also address these warnings or explain why they're acceptable" >&2
fi

# Special reminders based on context
echo -e "\n🔔 IMPORTANT REMINDERS:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Check time of day for session summary reminder
current_hour=$(date +%H)
if [ $current_hour -ge 16 ]; then  # After 4 PM
    echo "⏰ End of day approaching - Remember to add session summary (doc-4)" >&2
fi

# Check if it's been a while since last TODO update
if [ -f "./planning/MASTER_TODO.md" ]; then
    todo_age=$(($(date +%s) - $(stat -c %Y "./planning/MASTER_TODO.md" 2>/dev/null || stat -f %m "./planning/MASTER_TODO.md" 2>/dev/null || echo "0")))
    if [ $todo_age -gt 7200 ]; then  # 2 hours
        echo "📋 MASTER_TODO.md hasn't been updated in >2 hours" >&2
    fi
fi

echo "" >&2
echo "This compliance check is MANDATORY and ensures project consistency." >&2

# Exit 2 to ensure Claude processes this review
exit 2