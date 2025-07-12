#!/bin/bash

# Script: pre_task_review.sh
# Purpose: Review task request against claude.md rules before execution
# Template Version - Adapt for specific project needs

# Check if claude.md or CLAUDE.md exists (case-insensitive)
CLAUDE_FILE=""
if [ -f "./claude.md" ]; then
    CLAUDE_FILE="./claude.md"
elif [ -f "./CLAUDE.md" ]; then
    CLAUDE_FILE="./CLAUDE.md"
else
    echo "WARNING: No claude.md or CLAUDE.md file found. Creating one is recommended." >&2
    # Don't block if CLAUDE.md is missing - might be initial setup
fi

# Parse input from Claude
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')
FILE_PATH=$(echo "$INPUT" | jq -r '.file_path // ""' | sed 's|^/||')

# Create directories for tracking
TRACK_DIR="$HOME/.claude/hook_data"
mkdir -p "$TRACK_DIR"

echo "╔═══════════════════════════════════════════════════════════╗" >&2
echo "║              PRE-TASK COMPLIANCE CHECK                    ║" >&2
echo "╚═══════════════════════════════════════════════════════════╝" >&2
echo "" >&2
echo "🔍 Checking: $TOOL_NAME operation" >&2
if [ -n "$FILE_PATH" ]; then
    echo "📄 Target: $FILE_PATH" >&2
fi
echo "" >&2

# Initialize blocking flag
SHOULD_BLOCK=false
BLOCKING_REASON=""

# Function to add blocking reason
add_block() {
    local reason=$1
    SHOULD_BLOCK=true
    BLOCKING_REASON="${BLOCKING_REASON}❌ $reason\n"
}

# RULE CHECKS BASED ON TOOL TYPE
case "$TOOL_NAME" in
    "Write"|"Edit"|"MultiEdit")
        # Check if critical files exist for tracking
        if [ ! -f "./planning/MASTER_TODO.md" ] && [ "$FILE_PATH" != "planning/MASTER_TODO.md" ]; then
            echo "⚠️  WARNING: MASTER_TODO.md missing - should be created first" >&2
        fi
        
        if [ ! -f "./planning/PROJECT_JOURNAL.md" ] && [ "$FILE_PATH" != "planning/PROJECT_JOURNAL.md" ]; then
            echo "⚠️  WARNING: PROJECT_JOURNAL.md missing - should be created first" >&2
        fi
        
        # Don't block if it's a Write operation for a file documented in PROJECT_INDEX.md
        if [ "$TOOL_NAME" = "Write" ] && [ -n "$FILE_PATH" ] && [ -f "./PROJECT_INDEX.md" ]; then
            BASENAME=$(basename "$FILE_PATH")
            if grep -q "$BASENAME" "./PROJECT_INDEX.md"; then
                echo "✅ Allowing creation of documented file: $BASENAME" >&2
                SHOULD_BLOCK=false
            fi
        fi
        ;;
        
    "Bash")
        # Check for dangerous commands
        COMMAND=$(echo "$INPUT" | jq -r '.command // ""')
        if echo "$COMMAND" | grep -qE "rm -rf|:(){:|dd if=|format|fdisk"; then
            add_block "Potentially dangerous command detected"
        fi
        ;;
esac

# PROJECT-SPECIFIC CHECKS
# {{PROJECT_SPECIFIC_CHECKS}}

# Display result
if [ "$SHOULD_BLOCK" = true ]; then
    echo "" >&2
    echo "🚫 BLOCKING OPERATION - Rule Violations Detected:" >&2
    echo -e "$BLOCKING_REASON" >&2
    echo "" >&2
    echo "📋 Required Actions:" >&2
    echo "1. Address the violations listed above" >&2
    echo "2. Ensure compliance with claude.md rules" >&2
    echo "3. Retry the operation" >&2
    exit 1
else
    echo "✅ Pre-task checks PASSED" >&2
    echo "" >&2
    echo "📋 Reminders:" >&2
    echo "• Update MASTER_TODO.md after task completion (rule doc-2)" >&2
    echo "• Add significant changes to PROJECT_JOURNAL.md (rule doc-4)" >&2
    echo "• Follow project-specific guidelines in CLAUDE.md" >&2
fi

# Log the operation
echo "$(date '+%Y-%m-%d %H:%M:%S') - $TOOL_NAME - $FILE_PATH" >> "$TRACK_DIR/operations.log"

exit 0