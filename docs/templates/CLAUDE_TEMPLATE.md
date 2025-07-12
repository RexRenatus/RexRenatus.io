# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🎯 Project Overview

**Project**: The Grand Digital Architect - Personal Portfolio  
**Purpose**: {{PROJECT_PURPOSE}}
**Status**: {{PROJECT_STATUS}}

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
- **Change Log**: `/CHANGELOG.md` 📝 - Version history and updates
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

### Project Structure
```
{{PROJECT_STRUCTURE}}
```

## 🔄 Current Development Status

**{{CURRENT_PHASE}}** {{STATUS_EMOJI}} {{STATUS_TEXT}}
{{CURRENT_STATUS_DETAILS}}

**Next Steps**: {{NEXT_STEPS}}

## 🚀 Quick Commands

```bash
{{PROJECT_COMMANDS}}
```

## 📝 Project-Specific Rules

<project-specific-rules>
  <\!-- Add rules specific to this project type -->
  {{PROJECT_SPECIFIC_RULES}}
</project-specific-rules>

## 📝 Change Log

### {{CURRENT_DATE}}
- Initial CLAUDE.md created from template
- Adapted for {{PROJECT_TYPE}} project
- {{INITIAL_CHANGES}}

---

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

See `/CHANGELOG.md` for complete change history.

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
    <rule id="plan-11" priority="critical">Consult existing roadmaps before starting any enhancement or feature work</rule>
    <rule id="plan-12" priority="mandatory">If no roadmap exists for planned work, create one following roadmap rules before proceeding</rule>
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
    <rule id="create-2" priority="critical">Files documented in PROJECT_INDEX.md are considered "planned" and hooks should allow their creation</rule>
    <rule id="create-3" priority="mandatory">Follow this exact sequence: 1) Update PROJECT_INDEX.md, 2) Create file (touch or Write), 3) Add content</rule>
    <rule id="create-4" priority="critical">PROJECT_INDEX.md serves as the source of truth for planned file structure</rule>
    <rule id="create-5" priority="mandatory">If creating multiple related files, update PROJECT_INDEX.md with ALL files before creating any</rule>
    <rule id="create-6" priority="critical">Supporting files (CSS/JS for HTML pages) can be created without prior documentation if parent file exists</rule>
    <rule id="create-7" priority="mandatory">When removing files, update PROJECT_INDEX.md immediately to reflect the change</rule>
    <rule id="create-8" priority="critical">File paths in PROJECT_INDEX.md should be relative from project root for clarity</rule>
    <rule id="create-9" priority="mandatory">Add descriptive comments in PROJECT_INDEX.md explaining each file's purpose</rule>
    <rule id="create-10" priority="critical">Hook scripts should check PROJECT_INDEX.md to allow creation of documented files</rule>
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

  <rule-set name="Post-Task Review Compliance">
    <rule id="review-1" priority="critical">ALWAYS check post_task_review.sh output after any operation</rule>
    <rule id="review-2" priority="critical">Address ALL critical violations immediately before proceeding</rule>
    <rule id="review-3" priority="mandatory">Fix warnings shown in post-task review before starting next task</rule>
    <rule id="review-4" priority="critical">If new files are created, update PROJECT_INDEX.md immediately</rule>
    <rule id="review-5" priority="mandatory">When syntax errors appear in hook output, fix them in the same session</rule>
    <rule id="review-6" priority="critical">Never ignore compliance violations - they compound over time</rule>
    <rule id="review-7" priority="mandatory">Document any hook fixes or workarounds in PROJECT_JOURNAL.md</rule>
    <rule id="review-8" priority="critical">Treat post-task review as a mandatory checkpoint, not optional feedback</rule>
    <rule id="review-9" priority="mandatory">If violations repeat, update relevant rules to prevent recurrence</rule>
    <rule id="review-10" priority="critical">Complete all compliance fixes before marking any task as complete</rule>
  </rule-set>

  <rule-set name="Development Roadmap Planning">
    <rule id="roadmap-1" priority="critical">Create detailed roadmaps BEFORE starting any major feature or enhancement</rule>
    <rule id="roadmap-2" priority="critical">Break down all tasks larger than 4 hours into subtasks of 1-2 hours each</rule>
    <rule id="roadmap-3" priority="mandatory">Define clear success criteria and acceptance tests for each task</rule>
    <rule id="roadmap-4" priority="critical">Verify all information accuracy before including in roadmap (no assumptions)</rule>
    <rule id="roadmap-5" priority="mandatory">Include time estimates, dependencies, and required resources for each task</rule>
    <rule id="roadmap-6" priority="critical">Update roadmap immediately when scope changes or new information emerges</rule>
    <rule id="roadmap-7" priority="mandatory">Create visual roadmap diagrams for complex multi-phase projects</rule>
    <rule id="roadmap-8" priority="critical">Prioritize tasks based on value, dependencies, and technical constraints</rule>
    <rule id="roadmap-9" priority="mandatory">Review and update roadmaps at the start of each work session</rule>
    <rule id="roadmap-10" priority="critical">Store all roadmaps in /planning directory with descriptive names</rule>
  </rule-set>

  <rule-set name="Testing Standards Enhanced">
    <rule id="test-7" priority="critical">Write tests BEFORE implementing features (TDD approach)</rule>
    <rule id="test-8" priority="mandatory">Achieve minimum 80% code coverage for new code</rule>
    <rule id="test-9" priority="critical">All user-facing features must have end-to-end tests</rule>
    <rule id="test-10" priority="mandatory">Performance tests required for data-heavy operations</rule>
    <rule id="test-11" priority="critical">Accessibility tests must pass WCAG 2.1 AA standards</rule>
    <rule id="test-12" priority="mandatory">Test files must follow pattern: [feature].test.[ext]</rule>
    <rule id="test-13" priority="critical">API endpoints must have contract tests</rule>
    <rule id="test-14" priority="mandatory">Visual regression tests for UI components</rule>
    <rule id="test-15" priority="normal">Load tests required for features expecting >100 concurrent users</rule>
  </rule-set>

  <rule-set name="Code Organization Standards">
    <rule id="org-1" priority="critical">Files must not exceed 500 lines</rule>
    <rule id="org-2" priority="mandatory">Functions must not exceed 50 lines</rule>
    <rule id="org-3" priority="critical">Cyclomatic complexity must be less than 10</rule>
    <rule id="org-4" priority="mandatory">Import statements must be grouped and sorted</rule>
    <rule id="org-5" priority="critical">No circular dependencies allowed</rule>
    <rule id="org-6" priority="mandatory">Components must follow single responsibility principle</rule>
    <rule id="org-7" priority="normal">Prefer composition over inheritance</rule>
    <rule id="org-8" priority="critical">Shared code must be in designated modules</rule>
    <rule id="org-9" priority="mandatory">Configuration must be separate from implementation</rule>
    <rule id="org-10" priority="critical">No business logic in view layers</rule>
  </rule-set>

  <rule-set name="Enhanced Quality Gates">
    <rule id="qa-6" priority="critical">All PRs require 1+ approving review before merge</rule>
    <rule id="qa-7" priority="critical">Linter must pass with zero errors</rule>
    <rule id="qa-8" priority="mandatory">Security scan must show no high/critical issues</rule>
    <rule id="qa-9" priority="critical">Bundle size must not exceed defined limits</rule>
    <rule id="qa-10" priority="mandatory">Lighthouse score must be >90 for performance</rule>
    <rule id="qa-11" priority="critical">No console errors in production builds</rule>
    <rule id="qa-12" priority="mandatory">API response times must be <200ms for GET requests</rule>
    <rule id="qa-13" priority="critical">All forms must have proper validation and error handling</rule>
    <rule id="qa-14" priority="mandatory">Loading states required for async operations</rule>
    <rule id="qa-15" priority="critical">Error boundaries must wrap major UI sections</rule>
  </rule-set>

  <rule-set name="README Standards">
    <rule id="readme-16" priority="critical">All README files must follow the standard template in docs/README_TEMPLATE.md</rule>
    <rule id="readme-17" priority="mandatory">README must include all 13 required sections in order</rule>
    <rule id="readme-18" priority="critical">Installation instructions must be tested and working</rule>
    <rule id="readme-19" priority="mandatory">All code examples in README must be executable</rule>
    <rule id="readme-20" priority="critical">Technology stack must list all major dependencies</rule>
    <rule id="readme-21" priority="mandatory">Project structure diagram must match actual structure</rule>
    <rule id="readme-22" priority="critical">Contact information must be current and valid</rule>
    <rule id="readme-23" priority="mandatory">License section must match LICENSE file</rule>
    <rule id="readme-24" priority="normal">Include screenshots/GIFs for UI projects</rule>
    <rule id="readme-25" priority="critical">No broken links allowed in README files</rule>
  </rule-set>

  <rule-set name="Automation and Tooling">
    <rule id="auto-1" priority="critical">Pre-commit hooks must be installed for all developers</rule>
    <rule id="auto-2" priority="mandatory">Automated tests must run on every commit</rule>
    <rule id="auto-3" priority="critical">Code formatting must be automated with prettier/black</rule>
    <rule id="auto-4" priority="mandatory">Import sorting must be automated</rule>
    <rule id="auto-5" priority="critical">Security scanning must be part of CI/CD pipeline</rule>
    <rule id="auto-6" priority="mandatory">Dependency updates must be tested automatically</rule>
    <rule id="auto-7" priority="normal">Performance metrics should be tracked automatically</rule>
    <rule id="auto-8" priority="critical">Build process must be reproducible and documented</rule>
    <rule id="auto-9" priority="mandatory">Environment setup must be automated via scripts</rule>
    <rule id="auto-10" priority="critical">Deployment process must be automated with rollback capability</rule>
  </rule-set>

  <rule-set name="Hook Script Integrity">
    <rule id="hook-11" priority="critical">NEVER use unescaped parentheses in grep -E patterns within bash scripts</rule>
    <rule id="hook-12" priority="critical">Always escape special characters in echo statements: (), [], {}, $</rule>
    <rule id="hook-13" priority="mandatory">Test all hook scripts with bash -n before deployment</rule>
    <rule id="hook-14" priority="critical">Use shellcheck or similar linter for all bash scripts</rule>
    <rule id="hook-15" priority="mandatory">Avoid complex expressions in echo statements - use printf for complex output</rule>
    <rule id="hook-16" priority="critical">Always quote variables in bash scripts: "$VAR" not $VAR</rule>
    <rule id="hook-17" priority="mandatory">Use [[ ]] instead of [ ] for conditionals in bash</rule>
    <rule id="hook-18" priority="critical">Escape regex metacharacters properly: \( \) \| \[ \] \{ \}</rule>
    <rule id="hook-19" priority="mandatory">Include error handling for all external commands</rule>
    <rule id="hook-20" priority="critical">Document all regex patterns with examples of what they match</rule>
  </rule-set>

  <rule-set name="Project Initialization and Setup">
    <rule id="init-1" priority="critical">When entering a new project, IMMEDIATELY check for CLAUDE.md existence</rule>
    <rule id="init-2" priority="critical">If CLAUDE.md missing, ask user: "Would you like me to set up Claude integration for this project?"</rule>
    <rule id="init-3" priority="mandatory">Check for required files: pre_task_review.sh, post_task_review.sh, PROJECT_INDEX.md, MASTER_TODO.md, PROJECT_JOURNAL.md</rule>
    <rule id="init-4" priority="critical">Ask clarifying questions BEFORE creating files: project type, primary language, testing framework, deployment target</rule>
    <rule id="init-5" priority="mandatory">Adapt rules based on project type (web app, CLI tool, library, etc.)</rule>
    <rule id="init-6" priority="critical">Create project-specific rule adaptations in CLAUDE.md under "Project-Specific Rules" section</rule>
    <rule id="init-7" priority="mandatory">Set up directory structure appropriate to project type</rule>
    <rule id="init-8" priority="critical">Ask for permission before creating each major component</rule>
    <rule id="init-9" priority="mandatory">Provide summary of what will be created and get explicit approval</rule>
    <rule id="init-10" priority="critical">Copy hook scripts from template but adapt paths and checks to new project</rule>
    <rule id="init-11" priority="mandatory">Test all hooks work correctly in new environment before proceeding</rule>
    <rule id="init-12" priority="critical">Create initial entries in tracking files with project setup details</rule>
    <rule id="init-13" priority="mandatory">Document any project-specific adaptations made to standard rules</rule>
    <rule id="init-14" priority="critical">Ensure README follows standard template with Grand Digital Architect branding</rule>
    <rule id="init-15" priority="mandatory">Set up .gitignore appropriate to project technology stack</rule>
  </rule-set>

  <rule-set name="Template File Management">
    <rule id="template-1" priority="critical">Maintain template versions of: CLAUDE.md, pre_task_review.sh, post_task_review.sh</rule>
    <rule id="template-2" priority="mandatory">Template files must be technology-agnostic and adaptable</rule>
    <rule id="template-3" priority="critical">Include placeholders for project-specific values: {{PROJECT_NAME}}, {{PROJECT_TYPE}}, {{PRIMARY_LANGUAGE}}</rule>
    <rule id="template-4" priority="mandatory">Templates must include comments explaining customization points</rule>
    <rule id="template-5" priority="critical">Version control template files separately from project implementations</rule>
    <rule id="template-6" priority="mandatory">Test templates work across different project types before deployment</rule>
    <rule id="template-7" priority="critical">Include migration guide for updating existing projects to new template versions</rule>
    <rule id="template-8" priority="mandatory">Document all template variables and their expected values</rule>
    <rule id="template-9" priority="critical">Ensure templates are self-contained and don't depend on external resources</rule>
    <rule id="template-10" priority="mandatory">Include example adaptations for common project types</rule>
  </rule-set>

  <rule-set name="Cross-Project Compatibility">
    <rule id="cross-1" priority="critical">Rules must gracefully handle different project structures</rule>
    <rule id="cross-2" priority="mandatory">Hook scripts must detect project type and adjust checks accordingly</rule>
    <rule id="cross-3" priority="critical">Path references must be relative, never absolute</rule>
    <rule id="cross-4" priority="mandatory">Language-specific rules only apply when that language is detected</rule>
    <rule id="cross-5" priority="critical">Create fallback behaviors for when expected files/directories don't exist</rule>
    <rule id="cross-6" priority="mandatory">Support multiple package managers (npm, pip, cargo, etc.)</rule>
    <rule id="cross-7" priority="critical">Detect and respect existing project conventions before enforcing new ones</rule>
    <rule id="cross-8" priority="mandatory">Allow project-specific rule overrides in CLAUDE.md</rule>
    <rule id="cross-9" priority="critical">Maintain compatibility with common CI/CD systems</rule>
    <rule id="cross-10" priority="mandatory">Support both monorepo and single-project structures</rule>
  </rule-set>
</master-rules>

---

**Remember**: When adding significant documentation, IMMEDIATELY update the references section above!