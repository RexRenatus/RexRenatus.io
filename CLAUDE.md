# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🎯 Project Overview

**Project**: The Grand Digital Architect - Personal Portfolio  
**Purpose**: A philosophical developer portfolio showcasing the journey from military service through AI revolution to digital creation  
**Status**: 🚧 Personal Portfolio Development (Active)

## 📚 CRITICAL DOCUMENTATION PATTERN

<critical-documentation-pattern>
  <rule>ALWAYS ADD IMPORTANT DOCS HERE! When you create or discover:</rule>
  <action type="architecture">Architecture diagrams → Add reference path here</action>
  <action type="database">Database schemas → Add reference path here</action>
  <action type="problem">Problem solutions → Add reference path here</action>
  <action type="setup">Setup guides → Add reference path here</action>
  <reason>This prevents context loss! Update this file IMMEDIATELY when creating important docs.</reason>
</critical-documentation-pattern>

## 🗺️ Key Documentation References

### Planning & Architecture
- **Project Index**: `/PROJECT_INDEX.md` 📑 - Complete file map
- **Creator Questionnaire**: `/planning/CREATOR_QUESTIONNAIRE.md` 📝 - Vision & information
- **Landing Page Design**: `/planning/LANDING_PAGE_DESIGN.md` 🎨 - Comprehensive design plan
- **Component Architecture**: `[To be created]` 🏗️ - Modular component structure
- **GitHub API Integration**: `[To be created]` 🔌 - API connection setup

### Development Resources
- **HTML Structure**: `[To be created]` 📄 - Semantic markup
- **CSS Styles**: `[To be created]` 🎨 - Responsive design system
- **JavaScript Logic**: `[To be created]` ⚡ - Interactive features
- **Repository Showcase**: `[To be created]` 📦 - Project display system

### Project Management
- **Master Todo**: `/planning/MASTER_TODO.md` ✅ - Always keep updated!
- **Project Journal**: `/planning/PROJECT_JOURNAL.md` 📖 - Step-by-step history
- **Development Roadmap**: `[To be created]` 🗺️ - Implementation plan

## 🛠️ Development Guidelines

### Core Principles

<core-principles>
  <principle id="1" name="Mobile First">Design for mobile devices first, then scale up to desktop</principle>
  <principle id="2" name="Modular Components">Build reusable, self-contained UI components</principle>
  <principle id="3" name="Performance Focused">Optimize for fast loading and smooth interactions</principle>
  <principle id="4" name="Accessibility">Ensure WCAG compliance and keyboard navigation</principle>
</core-principles>

### Documentation Rules

<documentation-rules>
  <rule priority="normal">Update PROJECT_INDEX.md when adding new files</rule>
  <rule priority="normal">Add references to this file for critical docs</rule>
  <rule priority="normal">Use descriptive file names with CAPS for visibility</rule>
  <rule priority="normal">Include "Last Updated" dates on all docs</rule>
  <rule priority="critical">Update MASTER_TODO.md after completing ANY task</rule>
  <rule priority="critical">Add entries to PROJECT_JOURNAL.md for significant progress</rule>
  <rule priority="normal">Create flowcharts for complex processes using Mermaid syntax</rule>
  <rule priority="mandatory">
    Add "Session Summary" to PROJECT_JOURNAL.md at end of each work session including:
    - What was accomplished
    - Key metrics (files created, time spent, etc.)
    - Where to continue next session
    - Specific next steps with references
  </rule>
</documentation-rules>

### Project Structure
```
/src/                  # Source code directory
  /css/                # Stylesheets and design system
  /js/                 # JavaScript modules and logic
  /assets/             # Images, fonts, and media
  /components/         # Reusable UI components
/docs/                 # Technical documentation
/planning/             # Project management
/tests/                # Unit and integration tests
index.html             # Main landing page
```

## 🔄 Current Development Status

**Initial Setup Phase** 🚧 IN PROGRESS
- ✅ CLAUDE.md adapted for GitHub Landing Page project
- ⏳ Project structure to be created
- ⏳ Basic HTML structure pending
- ⏳ CSS design system pending
- ⏳ JavaScript functionality pending
- ⏳ GitHub API integration pending

**Next Steps**: Create basic project structure and initial HTML layout

## 🚀 Quick Commands

```bash
# View project structure
ls -la

# Start local development server (once created)
# python -m http.server 8000

# Run tests (once implemented)
# npm test

# Check current progress
cat planning/MASTER_TODO.md

# Build for production (to be implemented)
# npm run build
```

## 📝 Change Log

### 2025-07-04
- Initial CLAUDE.md created
- Updated with modular documentation pattern
- Added project structure and guidelines
- Implemented critical documentation section
- Added change log for tracking updates
- **Phase 1 Completed**: All pseudocode and design documents finalized
- Added 10 database designs with complete schemas
- Created implementation-ready Notion schemas
- Designed innovative Process Pipeline System
- Comprehensive requirements analysis with AI Epiphany engine
- Implemented PROJECT_JOURNAL.md with session summaries
- Added mandatory session summary rule
- Created comprehensive project flowcharts
- **Implemented XML formatting for all rules**
- Added Master Rules Reference section
- **Incorporated comprehensive AI operating principles**:
  - Code Quality Standards (error handling, docstrings, preconditions)
  - Documentation Protocols (synchronization, consistency, executability)
  - Task Management Rules (clarity, assignment, dependencies)
  - Security Compliance Guidelines (no hardcoded credentials, input validation)
  - Process Execution Requirements (logging, resource limits, retry logic)
  - Core Operational Principles (evidence-based decisions, traceability)
  - Design Philosophy (KISS, YAGNI, SOLID principles)
  - System Extension Guidelines (compatibility, testing, versioning)
  - Quality Assurance Procedures (review requirements, user clarity)
  - Testing & Simulation Rules (coverage, CI/CD, regression tests)
  - Change Tracking & Governance (audit trails, rollback plans)

### 2025-07-05
- **Added Pre-Execution Planning rule set** (plan-1 through plan-10)
  - Ensures rule compliance verification before any file operation
  - Emphasizes planning and precondition validation
  - Promotes atomic, trackable task breakdown
- **Added Backward Compatibility and Issue Resolution rule set** (compat-1 through compat-10)
  - Ensures proper handling when missing components are discovered in later phases
  - Mandates updating all previous documentation to prevent future issues
  - Creates systematic approach for retroactive fixes
  - Example: Missing relations between Goals↔Actions and Subjects↔Sessions discovered in Phase 3
- **Adapted CLAUDE.md for GitHub Landing Page Project**
  - Updated project overview from Notion Learning System to GitHub Directory Landing Page
  - Modified core principles to focus on web development best practices
- **Added Git Commit and Push Operations rule set** (git-1 through git-15)
  - Standardizes Git workflow with status checks before commits
  - Mandates descriptive commit messages with proper formatting
  - Includes security rules for SSH keys and authentication
  - Requires HEREDOC format for multi-line commits
  - Enforces co-author attribution and emoji standards
  - Adds post-commit tracking in MASTER_TODO.md and PROJECT_JOURNAL.md
- **Created comprehensive README.md file**
  - Professional portfolio documentation with badges
  - Complete feature list and technology stack
  - Installation and usage instructions
  - Project philosophy and connection links
- **Added README Maintenance rule set** (readme-1 through readme-15)
  - Ensures README stays synchronized with project changes
  - Mandates updates for structural and feature changes
  - Security rules against exposing sensitive information
  - Guidelines for consistent formatting and content accuracy
  - Requirements for maintaining valid links and instructions
  - Updated project structure for frontend development
  - Changed documentation references to reflect new project scope
  - Maintained all existing rules and governance structures
- **Added Hook and Prerequisite Management rule set** (hook-1 through hook-10)
  - Addresses pre-commit hook blocking issues encountered during file creation
  - Mandates creating MASTER_TODO.md and PROJECT_JOURNAL.md before other operations
  - Provides fallback strategies when Write tool is blocked (Bash heredoc, cat commands)
  - Ensures proper file creation sequence to avoid hook conflicts
  - Documents case sensitivity considerations for hook requirements
- **Added File Creation Sequence rule set** (create-1 through create-10)
  - CRITICAL: Must update PROJECT_INDEX.md BEFORE creating any new files
  - Prevents compliance check failures by hardcoding file locations
  - Establishes PROJECT_INDEX.md as source of truth for all file paths
  - Mandates specific sequence: Index → Create → Read → Write
  - Ensures hook compliance through proper documentation

---

## 📐 Master Rules Reference

**This section defines mandatory operating principles for all AI instances working on this project. It ensures consistent behaviour, robust execution, and secure collaboration across all tasks and phases.**

<master-rules>
  <rule-set name="Documentation Standards">
    <rule id="doc-1" priority="critical">All rules must be enclosed in XML format</rule>
    <rule id="doc-2" priority="critical">Update MASTER_TODO.md after ANY task completion</rule>
    <rule id="doc-3" priority="critical">Add PROJECT_JOURNAL.md entries for significant progress</rule>
    <rule id="doc-4" priority="mandatory">Create session summaries at end of each work session</rule>
    <rule id="doc-5" priority="normal">Use Mermaid syntax for flowcharts</rule>
    <rule id="doc-6" priority="critical">Documentation must be synchronized with code changes—no outdated references</rule>
    <rule id="doc-7" priority="normal">Markdown files must use consistent heading hierarchies and section formats</rule>
    <rule id="doc-8" priority="critical">Code snippets in documentation must be executable, tested, and reflect real use cases</rule>
    <rule id="doc-9" priority="mandatory">Each doc must clearly outline: purpose, usage, parameters, and examples</rule>
    <rule id="doc-10" priority="normal">Technical terms must be explained inline or linked to a canonical definition</rule>
  </rule-set>
  
  <rule-set name="Development Process">
    <rule id="dev-1" priority="critical">Complete pseudocode before implementation</rule>
    <rule id="dev-2" priority="critical">Pass phase gates before proceeding</rule>
    <rule id="dev-3" priority="normal">Test every component thoroughly</rule>
    <rule id="dev-4" priority="normal">Document limitations discovered</rule>
    <rule id="dev-5" priority="critical">All scripts must implement structured error handling with specific failure modes</rule>
    <rule id="dev-6" priority="mandatory">Every function must include a concise, purpose-driven docstring</rule>
    <rule id="dev-7" priority="critical">Scripts must verify preconditions before executing critical or irreversible operations</rule>
    <rule id="dev-8" priority="mandatory">Long-running operations must implement timeout and cancellation mechanisms</rule>
    <rule id="dev-9" priority="critical">When implementing Notion databases, prefer formulas over rollups when possible for reliability</rule>
    <rule id="dev-10" priority="mandatory">Use formula-based approaches for calculations that can be self-contained</rule>
    <rule id="dev-11" priority="critical">Document formula alternatives when Notion limitations require workarounds</rule>
  </rule-set>
  
  <rule-set name="File Management">
    <rule id="file-1" priority="normal">Update PROJECT_INDEX.md when adding files</rule>
    <rule id="file-2" priority="normal">Use CAPS for important file names</rule>
    <rule id="file-3" priority="normal">Include "Last Updated" dates</rule>
    <rule id="file-4" priority="critical">Reference critical docs in CLAUDE.md</rule>
    <rule id="file-5" priority="critical">File and path operations must verify existence and permissions before granting access</rule>
  </rule-set>

  <rule-set name="Task Management">
    <rule id="task-1" priority="critical">Tasks must be clear, specific, and actionable—avoid ambiguity</rule>
    <rule id="task-2" priority="mandatory">Every task must be assigned a responsible agent, explicitly tagged</rule>
    <rule id="task-3" priority="mandatory">Complex tasks must be broken into atomic, trackable subtasks</rule>
    <rule id="task-4" priority="critical">No task may conflict with or bypass existing validated system behaviour</rule>
    <rule id="task-5" priority="critical">Security-related tasks must undergo mandatory review by a designated reviewer agent</rule>
    <rule id="task-6" priority="mandatory">Agents must update task status and outcomes in the shared task file</rule>
    <rule id="task-7" priority="critical">Dependencies between tasks must be explicitly declared</rule>
    <rule id="task-8" priority="mandatory">Agents must escalate ambiguous, contradictory, or unscoped tasks for clarification</rule>
  </rule-set>

  <rule-set name="Security Compliance">
    <rule id="sec-1" priority="critical">Hardcoded credentials are strictly forbidden—use secure storage mechanisms</rule>
    <rule id="sec-2" priority="critical">All inputs must be validated, sanitised, and type-checked before processing</rule>
    <rule id="sec-3" priority="critical">Avoid using eval, unsanitised shell calls, or any form of command injection vectors</rule>
    <rule id="sec-4" priority="mandatory">File and process operations must follow the principle of least privilege</rule>
    <rule id="sec-5" priority="mandatory">All sensitive operations must be logged, excluding sensitive data values</rule>
    <rule id="sec-6" priority="critical">Agents must check system-level permissions before accessing protected services or paths</rule>
  </rule-set>

  <rule-set name="Process Execution">
    <rule id="proc-1" priority="mandatory">Agents must log all actions with appropriate severity (INFO, WARNING, ERROR, etc.)</rule>
    <rule id="proc-2" priority="critical">Any failed task must include a clear, human-readable error report</rule>
    <rule id="proc-3" priority="mandatory">Agents must respect system resource limits, especially memory and CPU usage</rule>
    <rule id="proc-4" priority="normal">Long-running tasks must expose progress indicators or checkpoints</rule>
    <rule id="proc-5" priority="mandatory">Retry logic must include exponential backoff and failure limits</rule>
  </rule-set>

  <rule-set name="Core Operational Principles">
    <rule id="core-1" priority="critical">Agents must never use mock, fallback, or synthetic data in production tasks</rule>
    <rule id="core-2" priority="mandatory">Error handling logic must be designed using test-first principles</rule>
    <rule id="core-3" priority="critical">Agents must always act based on verifiable evidence, not assumptions</rule>
    <rule id="core-4" priority="critical">All preconditions must be explicitly validated before any destructive or high-impact operation</rule>
    <rule id="core-5" priority="mandatory">All decisions must be traceable to logs, data, or configuration files</rule>
  </rule-set>

  <rule-set name="Design Philosophy">
    <rule id="design-1" priority="mandatory" principle="KISS">Solutions must be straightforward and easy to understand</rule>
    <rule id="design-2" priority="mandatory" principle="KISS">Avoid over-engineering or unnecessary abstraction</rule>
    <rule id="design-3" priority="critical" principle="KISS">Prioritise code readability and maintainability</rule>
    <rule id="design-4" priority="mandatory" principle="YAGNI">Do not add speculative features or future-proofing unless explicitly required</rule>
    <rule id="design-5" priority="mandatory" principle="YAGNI">Focus only on immediate requirements and deliverables</rule>
    <rule id="design-6" priority="normal" principle="YAGNI">Minimise code bloat and long-term technical debt</rule>
    <rule id="design-7" priority="critical" principle="SRP">Single Responsibility—each module or function should do one thing only</rule>
    <rule id="design-8" priority="mandatory" principle="OCP">Open-Closed—software entities should be open for extension but closed for modification</rule>
    <rule id="design-9" priority="mandatory" principle="LSP">Liskov Substitution—derived classes must be substitutable for their base types</rule>
    <rule id="design-10" priority="normal" principle="ISP">Interface Segregation—prefer many specific interfaces over one general-purpose interface</rule>
    <rule id="design-11" priority="mandatory" principle="DIP">Dependency Inversion—depend on abstractions, not concrete implementations</rule>
  </rule-set>

  <rule-set name="System Extension">
    <rule id="ext-1" priority="critical">All new agents must conform to existing interface, logging, and task structures</rule>
    <rule id="ext-2" priority="mandatory">Utility functions must be unit tested and peer reviewed before shared use</rule>
    <rule id="ext-3" priority="critical">All configuration changes must be reflected in the system manifest with version stamps</rule>
    <rule id="ext-4" priority="mandatory">New features must maintain backward compatibility unless justified and documented</rule>
    <rule id="ext-5" priority="normal">All changes must include a performance impact assessment</rule>
  </rule-set>

  <rule-set name="Quality Assurance">
    <rule id="qa-1" priority="critical">A reviewer agent must review all changes involving security, system config, or agent roles</rule>
    <rule id="qa-2" priority="mandatory">Documentation must be proofread for clarity, consistency, and technical correctness</rule>
    <rule id="qa-3" priority="mandatory">User-facing output (logs, messages, errors) must be clear, non-technical, and actionable</rule>
    <rule id="qa-4" priority="normal">All error messages should suggest remediation paths or diagnostic steps</rule>
    <rule id="qa-5" priority="critical">All major updates must include a rollback plan or safe revert mechanism</rule>
  </rule-set>

  <rule-set name="Testing and Simulation">
    <rule id="test-1" priority="critical">All new logic must include unit and integration tests</rule>
    <rule id="test-2" priority="critical">Simulated or test data must be clearly marked and never promoted to production</rule>
    <rule id="test-3" priority="mandatory">All tests must pass in continuous integration pipelines before deployment</rule>
    <rule id="test-4" priority="normal">Code coverage should exceed defined thresholds (e.g. 85%)</rule>
    <rule id="test-5" priority="mandatory">Regression tests must be defined and executed for all high-impact updates</rule>
    <rule id="test-6" priority="normal">Agents must log test outcomes in separate test logs, not production logs</rule>
  </rule-set>

  <rule-set name="Change Tracking and Governance">
    <rule id="gov-1" priority="critical">All configuration or rule changes must be documented in the system manifest and changelog</rule>
    <rule id="gov-2" priority="mandatory">Agents must record the source, timestamp, and rationale when modifying shared assets</rule>
    <rule id="gov-3" priority="mandatory">All updates must increment the internal system version where applicable</rule>
    <rule id="gov-4" priority="critical">A rollback or undo plan must be defined for every major change</rule>
    <rule id="gov-5" priority="mandatory">Audit trails must be preserved for all task-modifying operations</rule>
  </rule-set>

  <rule-set name="Pre-Execution Planning">
    <rule id="plan-1" priority="critical">Before ANY file operation, create a mental checklist of applicable rules and verify compliance</rule>
    <rule id="plan-2" priority="critical">For Write operations: First check if file exists, update PROJECT_INDEX.md if new, verify no hardcoded credentials</rule>
    <rule id="plan-3" priority="critical">For Edit operations: Always use Read tool first, preserve exact formatting, verify changes align with project goals</rule>
    <rule id="plan-4" priority="mandatory">Break complex operations into atomic steps that can be individually verified for rule compliance</rule>
    <rule id="plan-5" priority="mandatory">If any rule violation is detected during planning, adjust approach BEFORE execution</rule>
    <rule id="plan-6" priority="critical">Always update tracking files (MASTER_TODO.md, PROJECT_JOURNAL.md) AFTER completing tasks, not before</rule>
    <rule id="plan-7" priority="mandatory">When creating documentation, ensure it includes: purpose, usage, parameters, examples (doc-9)</rule>
    <rule id="plan-8" priority="critical">For database implementations, plan formula-based solutions before considering rollups (dev-9)</rule>
    <rule id="plan-9" priority="mandatory">Document your execution plan in comments or todo items before starting complex tasks</rule>
    <rule id="plan-10" priority="critical">Verify all preconditions are met before executing any operation that modifies files or state</rule>
  </rule-set>

  <rule-set name="Backward Compatibility and Issue Resolution">
    <rule id="compat-1" priority="critical">When discovering missing components in later phases, immediately create a fix document explaining what was missed and why</rule>
    <rule id="compat-2" priority="critical">Update ALL relevant previous phase documentation to include the missing components</rule>
    <rule id="compat-3" priority="mandatory">Create a dedicated FIX or PATCH file that clearly explains: problem identified, solution steps, verification process</rule>
    <rule id="compat-4" priority="critical">Update original implementation guides to prevent future users from encountering the same issue</rule>
    <rule id="compat-5" priority="mandatory">Add warnings or update sections to existing guides highlighting the discovered requirements</rule>
    <rule id="compat-6" priority="critical">Verify that all phases remain compatible after making retroactive changes</rule>
    <rule id="compat-7" priority="mandatory">Document in PROJECT_JOURNAL.md any backward compatibility fixes applied</rule>
    <rule id="compat-8" priority="critical">When relations or dependencies are discovered between phases, update both phases' documentation</rule>
    <rule id="compat-9" priority="mandatory">Create a "Lessons Learned" section in relevant documents to prevent similar oversights</rule>
    <rule id="compat-10" priority="critical">Always test the fix with fresh implementation to ensure it resolves the issue</rule>
  </rule-set>

  <rule-set name="Hook and Prerequisite Management">
    <rule id="hook-1" priority="critical">When encountering hook blocks, identify missing prerequisite files IMMEDIATELY and create them first</rule>
    <rule id="hook-2" priority="critical">Always create MASTER_TODO.md and PROJECT_JOURNAL.md BEFORE attempting other Write operations in a new project</rule>
    <rule id="hook-3" priority="mandatory">If Write tool is blocked by hooks, use alternative methods (Bash with heredoc, cat > file, etc.) to create required files</rule>
    <rule id="hook-4" priority="critical">Check for pre_task_review.sh and post_task_review.sh scripts in project root and understand their requirements</rule>
    <rule id="hook-5" priority="mandatory">When hooks check for specific files, verify exact filename case sensitivity (claude.md vs CLAUDE.md)</rule>
    <rule id="hook-6" priority="critical">Create empty files with touch command first if needed, then use Read→Write sequence to populate them</rule>
    <rule id="hook-7" priority="mandatory">Document any hook requirements discovered in PROJECT_JOURNAL.md for future reference</rule>
    <rule id="hook-8" priority="critical">Follow this sequence for new projects: 1) Create tracking files, 2) Update PROJECT_INDEX.md, 3) Create other documentation</rule>
    <rule id="hook-9" priority="mandatory">If MultiEdit tool fails, try single Edit operations or Bash commands as fallback</rule>
    <rule id="hook-10" priority="critical">Always verify hook compliance BEFORE attempting complex file operations</rule>
  </rule-set>

  <rule-set name="File Creation Sequence">
    <rule id="create-1" priority="critical">BEFORE creating ANY new file, ALWAYS update PROJECT_INDEX.md FIRST with the planned file path and description</rule>
    <rule id="create-2" priority="critical">File locations must be hardcoded in PROJECT_INDEX.md to prevent compliance check failures</rule>
    <rule id="create-3" priority="mandatory">Follow this exact sequence: 1) Update PROJECT_INDEX.md, 2) Create file with touch/mkdir, 3) Read empty file, 4) Write content</rule>
    <rule id="create-4" priority="critical">Never create files without first documenting them in PROJECT_INDEX.md - this prevents hook blocking</rule>
    <rule id="create-5" priority="mandatory">If creating multiple related files, update PROJECT_INDEX.md with ALL files before creating any</rule>
    <rule id="create-6" priority="critical">PROJECT_INDEX.md serves as the source of truth for file locations - keep it synchronized</rule>
    <rule id="create-7" priority="mandatory">When removing files, update PROJECT_INDEX.md immediately to reflect the change</rule>
    <rule id="create-8" priority="critical">File paths in PROJECT_INDEX.md must be absolute from project root for clarity</rule>
    <rule id="create-9" priority="mandatory">Add descriptive comments in PROJECT_INDEX.md explaining each file's purpose</rule>
    <rule id="create-10" priority="critical">Review PROJECT_INDEX.md before any file operation to ensure consistency</rule>
  </rule-set>

  <rule-set name="Git Commit and Push Operations">
    <rule id="git-1" priority="critical">ALWAYS check git status before committing to understand changes</rule>
    <rule id="git-2" priority="critical">Use descriptive commit messages explaining WHAT changed and WHY</rule>
    <rule id="git-3" priority="mandatory">Include emoji and co-author attribution in commit messages per standard format</rule>
    <rule id="git-4" priority="critical">Never commit with --force or --force-with-lease unless explicitly requested by user</rule>
    <rule id="git-5" priority="mandatory">Run git pull before push to avoid conflicts (handle merge vs rebase appropriately)</rule>
    <rule id="git-6" priority="critical">Verify SSH authentication is working before attempting push operations</rule>
    <rule id="git-7" priority="mandatory">Use git add -A for staging all changes unless specific files requested</rule>
    <rule id="git-8" priority="normal">Show git status output to user before committing for confirmation</rule>
    <rule id="git-9" priority="critical">If push fails, diagnose issue (auth, conflicts, etc) before retrying</rule>
    <rule id="git-10" priority="mandatory">Update MASTER_TODO.md and PROJECT_JOURNAL.md after successful push</rule>
    <rule id="git-11" priority="critical">Use HEREDOC format for multi-line commit messages to preserve formatting</rule>
    <rule id="git-12" priority="mandatory">Include "🤖 Generated with Claude Code" and co-author in commits</rule>
    <rule id="git-13" priority="normal">For initial commits, include comprehensive feature list in message</rule>
    <rule id="git-14" priority="critical">Never expose private SSH keys or authentication tokens in commits</rule>
    <rule id="git-15" priority="mandatory">After major commits, remind user to check GitHub Actions and deployment status</rule>
  </rule-set>

  <rule-set name="README Maintenance">
    <rule id="readme-1" priority="critical">README.md must exist in the root directory for GitHub visibility</rule>
    <rule id="readme-2" priority="critical">Update README.md whenever project structure changes significantly</rule>
    <rule id="readme-3" priority="mandatory">Keep project feature list synchronized with actual implementation</rule>
    <rule id="readme-4" priority="mandatory">Update technology stack section when new tools/libraries are added</rule>
    <rule id="readme-5" priority="critical">Ensure all links in README are valid and functional</rule>
    <rule id="readme-6" priority="mandatory">Update installation instructions if setup process changes</rule>
    <rule id="readme-7" priority="normal">Include badges for build status, version, and social links</rule>
    <rule id="readme-8" priority="mandatory">Document any new environment variables or configuration requirements</rule>
    <rule id="readme-9" priority="critical">Never include sensitive information (keys, passwords, tokens) in README</rule>
    <rule id="readme-10" priority="mandatory">Add new sections for major features as they are implemented</rule>
    <rule id="readme-11" priority="normal">Use consistent markdown formatting and heading hierarchy</rule>
    <rule id="readme-12" priority="mandatory">Update project philosophy section if core mission changes</rule>
    <rule id="readme-13" priority="critical">Ensure README accurately reflects current project state, not aspirational</rule>
    <rule id="readme-14" priority="mandatory">Include clear contributing guidelines and contact information</rule>
    <rule id="readme-15" priority="normal">Add screenshots or GIFs when visual features are implemented</rule>
  </rule-set>
</master-rules>

---

**Remember**: When adding significant documentation, IMMEDIATELY update the references section above!