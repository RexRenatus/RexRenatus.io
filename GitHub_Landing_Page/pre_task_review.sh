#!/bin/bash

# Script: pre_task_review.sh
# Purpose: Ensure Claude reviews claude.md rules before executing tasks
# Enhanced version for XML-formatted rules

# Check if claude.md exists
if [ ! -f "./claude.md" ]; then
    echo "ERROR: No claude.md file found in project root." >&2
    echo "This project requires claude.md for rule compliance." >&2
    exit 2
fi

# Get input from Claude
INPUT=$(cat)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')

# Create tracking directory
TRACK_DIR="$HOME/.claude/hook_data/claude_md_reviews"
mkdir -p "$TRACK_DIR"

echo "╔═══════════════════════════════════════════════════════════╗" >&2
echo "║               PRE-TASK RULE COMPLIANCE CHECK              ║" >&2
echo "╚═══════════════════════════════════════════════════════════╝" >&2
echo "" >&2
echo "📋 Operation: $TOOL_NAME" >&2
echo "🔍 Reviewing: ./claude.md" >&2
echo "" >&2

# Function to extract rules by priority
extract_rules_by_priority() {
    local priority=$1
    local icon=$2
    local color=$3
    
    echo -e "\n$icon $color PRIORITY RULES:" >&2
    echo "─────────────────────────────────────────" >&2
    
    # Extract rules with their IDs and text
    awk -v prio="$priority" '
    /<rule.*priority="'$priority'"/ {
        # Extract rule ID
        match($0, /id="([^"]+)"/, id_arr)
        rule_id = id_arr[1]
        
        # Extract rule text (handle both single line and multi-line)
        if (match($0, />([^<]+)</, text_arr)) {
            # Single line rule
            print "[" rule_id "] " text_arr[1]
        } else {
            # Multi-line rule
            getline
            gsub(/^[ \t]+/, "", $0)  # Remove leading whitespace
            gsub(/<\/rule>/, "", $0)  # Remove closing tag
            print "[" rule_id "] " $0
        }
    }' ./claude.md | head -15 >&2
}

# Extract rules by priority
extract_rules_by_priority "critical" "🔴" "CRITICAL"
extract_rules_by_priority "mandatory" "🟡" "MANDATORY"

# Check for first run in session
FIRST_RUN_MARKER="$TRACK_DIR/${SESSION_ID}_initialized"
if [ ! -f "$FIRST_RUN_MARKER" ]; then
    echo -e "\n⚡ FIRST TASK IN SESSION" >&2
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
    echo "Please read claude.md COMPLETELY before proceeding." >&2
    echo "This ensures all rules are properly loaded into context." >&2
    touch "$FIRST_RUN_MARKER"
fi

# Pre-check for common rule compliance issues
echo -e "\n📊 PRE-TASK COMPLIANCE CHECKLIST:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2

# Check if MASTER_TODO.md exists
if [ -f "./planning/MASTER_TODO.md" ]; then
    echo "✓ MASTER_TODO.md found (rule doc-2)" >&2
else
    echo "⚠️  MASTER_TODO.md not found - remember to update after tasks!" >&2
fi

# Check if PROJECT_JOURNAL.md exists
if [ -f "./planning/PROJECT_JOURNAL.md" ]; then
    echo "✓ PROJECT_JOURNAL.md found (rule doc-3)" >&2
else
    echo "⚠️  PROJECT_JOURNAL.md not found - create for tracking progress!" >&2
fi

# Check current phase from PHASE_ROADMAP.md
if [ -f "./planning/PHASE_ROADMAP.md" ]; then
    current_phase=$(grep -m1 "Current Phase:" ./planning/PHASE_ROADMAP.md 2>/dev/null || echo "Unknown")
    echo "📍 $current_phase" >&2
fi

echo -e "\n🎯 REQUIRED ACTIONS BEFORE PROCEEDING:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
echo "□ Read ALL rules in claude.md" >&2
echo "□ Understand the priority levels (critical > mandatory > normal)" >&2
echo "□ Note specific rules for $TOOL_NAME operations" >&2
echo "□ Verify your planned approach complies with:" >&2
echo "  • Development Process rules (dev-1 through dev-11)" >&2
echo "  • Documentation Standards (doc-1 through doc-10)" >&2
echo "  • Security Compliance (sec-1 through sec-6)" >&2
echo "  • File Management rules (file-1 through file-5)" >&2

# Special warnings for specific tools
case "$TOOL_NAME" in
    "Write"|"Edit"|"MultiEdit")
        echo -e "\n⚠️  FILE MODIFICATION WARNING:" >&2
        echo "  • Update PROJECT_INDEX.md if adding new files (file-1)" >&2
        echo "  • Include proper error handling (dev-5)" >&2
        echo "  • Add docstrings to all functions (dev-6)" >&2
        echo "  • No hardcoded credentials (sec-1)" >&2
        ;;
    "Bash")
        echo -e "\n⚠️  SHELL EXECUTION WARNING:" >&2
        echo "  • Validate all inputs (sec-2)" >&2
        echo "  • Avoid eval or unsanitized calls (sec-3)" >&2
        echo "  • Follow least privilege (sec-4)" >&2
        echo "  • Log sensitive operations (sec-5)" >&2
        ;;
    "Task")
        echo -e "\n⚠️  TASK EXECUTION WARNING:" >&2
        echo "  • Tasks must be clear and specific (task-1)" >&2
        echo "  • Break complex tasks into subtasks (task-3)" >&2
        echo "  • Update task status in MASTER_TODO.md (task-6)" >&2
        echo "  • Complete pseudocode before implementation (dev-1)" >&2
        ;;
esac

echo -e "\n✅ CONFIRMATION REQUIRED:" >&2
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" >&2
echo "By proceeding, you confirm that you have reviewed claude.md" >&2
echo "and will follow ALL applicable rules for this $TOOL_NAME operation." >&2
echo "" >&2
echo "Proceeding with rule-compliant execution..." >&2

# Exit with code 2 to block and show message to Claude
exit 2