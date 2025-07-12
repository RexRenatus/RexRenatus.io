# 🤖 Claude Code Integration Templates

> Professional templates for integrating Claude AI into your development workflow

## 📋 Table of Contents

- [Overview](#overview)
- [Template Files](#template-files)
- [Quick Start](#quick-start)
- [Using with Claude Code /hooks](#using-with-claude-code-hooks)
- [Manual Installation](#manual-installation)
- [Template Customization](#template-customization)
- [Supported Project Types](#supported-project-types)
- [Rule System](#rule-system)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 Overview

These templates provide a comprehensive system for integrating Claude AI into any development project. They include:

- **Automated project detection** - Identifies your project type and adapts accordingly
- **Rule-based development** - Enforces best practices and consistent code quality
- **Compliance checking** - Pre and post-task validation hooks
- **Intelligent initialization** - Sets up everything you need in one command

## 📁 Template Files

### 1. `claude_init.sh`
An intelligent initialization script that:
- Detects project type (React, Python, Rust, etc.)
- Creates appropriate directory structure
- Generates customized CLAUDE.md with project-specific rules
- Sets up pre/post task review hooks
- Creates tracking files (TODO, Journal, Index)
- Generates appropriate .gitignore

### 2. `CLAUDE_TEMPLATE.md`
The master template containing:
- 485+ lines of comprehensive development rules
- 15+ rule categories covering all aspects of development
- Project-specific placeholders for customization
- XML-formatted rules for easy parsing

### 3. `pre_task_review_template.sh`
Pre-execution compliance checking that:
- Verifies rule awareness before task execution
- Provides tool-specific warnings
- Checks for required files and structure
- Prevents common mistakes

### 4. `post_task_review_template.sh`
Post-execution validation that:
- Checks for rule violations
- Ensures documentation is updated
- Validates security compliance
- Provides actionable feedback

## 🚀 Quick Start

### Option 1: Using Claude Code /hooks (Recommended)

1. **In Claude Code**, use the `/hooks` command to set up integration:
   ```
   /hooks
   ```

2. **When prompted**, select "Install hooks from template"

3. **Provide the template location**:
   ```
   https://github.com/YourUsername/YourRepo/tree/main/docs/templates
   ```

4. **Follow the prompts** to configure for your project

### Option 2: Direct Initialization

1. **Download the init script**:
   ```bash
   curl -O https://raw.githubusercontent.com/YourUsername/YourRepo/main/docs/templates/claude_init.sh
   chmod +x claude_init.sh
   ```

2. **Run the initialization**:
   ```bash
   ./claude_init.sh
   ```

3. **Answer the prompts**:
   - Project Name: Your project's name
   - Project Purpose: Brief description
   - Confirm detected settings

## 🔧 Using with Claude Code /hooks

### Setting Up Hooks

1. **Open your project** in Claude Code

2. **Run the hooks command**:
   ```
   /hooks
   ```

3. **Configure hook settings**:
   ```json
   {
     "preTaskReview": "./pre_task_review.sh",
     "postTaskReview": "./post_task_review.sh",
     "enabled": true
   }
   ```

### Hook Behavior

- **Pre-Task Hook**: Runs before every Claude operation
  - Shows applicable rules
  - Warns about potential issues
  - Blocks dangerous operations

- **Post-Task Hook**: Runs after every Claude operation
  - Checks compliance
  - Updates tracking
  - Provides feedback

### Customizing Hooks

Edit `.claude/hooks.json` in your project:

```json
{
  "hooks": {
    "preTask": {
      "script": "./pre_task_review.sh",
      "blocking": true,
      "timeout": 5000
    },
    "postTask": {
      "script": "./post_task_review.sh",
      "blocking": false,
      "timeout": 10000
    }
  }
}
```

## 🛠️ Manual Installation

If you prefer manual setup:

1. **Copy template files** to your project root:
   ```bash
   cp CLAUDE_TEMPLATE.md ./CLAUDE.md
   cp pre_task_review_template.sh ./pre_task_review.sh
   cp post_task_review_template.sh ./post_task_review.sh
   chmod +x ./*.sh
   ```

2. **Replace placeholders** in CLAUDE.md:
   - `{{PROJECT_NAME}}` - Your project name
   - `{{PROJECT_PURPOSE}}` - Project description
   - `{{PROJECT_TYPE}}` - Project type (web, cli, library)
   - `{{PRIMARY_LANGUAGE}}` - Main programming language

3. **Create required directories**:
   ```bash
   mkdir -p planning docs/templates src tests
   ```

4. **Create tracking files**:
   ```bash
   touch planning/MASTER_TODO.md
   touch planning/PROJECT_JOURNAL.md
   touch PROJECT_INDEX.md
   ```

## 🎨 Template Customization

### Adding Project-Specific Rules

In your CLAUDE.md, add rules under the `project-specific-rules` section:

```xml
<rule-set name="Project-Specific Rules">
  <rule id="proj-1" priority="critical">All API endpoints must use OAuth2</rule>
  <rule id="proj-2" priority="mandatory">Database queries must use prepared statements</rule>
</rule-set>
```

### Modifying Hook Behavior

#### Pre-Task Customization

Add project-specific checks in `pre_task_review.sh`:

```bash
# PROJECT-SPECIFIC CHECKS
case "$PROJECT_TYPE" in
    "api-server")
        echo "⚠️  API SERVER CHECKS:"
        echo "  • Validate OpenAPI spec"
        echo "  • Check rate limiting"
        ;;
esac
```

#### Post-Task Customization

Add validation in `post_task_review.sh`:

```bash
# Check API documentation
if [[ "$PROJECT_TYPE" == "api-server" ]]; then
    if ! grep -q "openapi:" "./api-spec.yaml"; then
        add_warning "proj-1" "API specification not updated"
    fi
fi
```

## 📊 Supported Project Types

The templates automatically detect and adapt to:

### Web Projects
- React, Vue, Angular, Next.js
- Vanilla JavaScript/TypeScript
- Static sites

### Backend Projects
- Node.js/Express
- Python (Django, Flask, FastAPI)
- Ruby on Rails
- PHP (Laravel, Symfony)

### Systems Programming
- Rust projects
- Go applications
- C/C++ with CMake/Make

### Other
- Java (Maven/Gradle)
- Mobile apps
- CLI tools
- Libraries/Packages

## 📐 Rule System

### Rule Priorities

1. **Critical** 🔴 - Must be followed, blocks operations
2. **Mandatory** 🟡 - Should be followed, generates warnings
3. **Normal** 🟢 - Best practices, informational

### Key Rule Categories

- **Documentation Standards** - Keeping docs in sync
- **Development Process** - Code quality and testing
- **Security Compliance** - Preventing vulnerabilities
- **File Management** - Organization and naming
- **Git Operations** - Commit standards and workflow

### Example Rule Implementation

```xml
<rule id="sec-1" priority="critical">
  Hardcoded credentials are strictly forbidden
</rule>
```

This rule will:
- Block commits containing passwords
- Scan for common credential patterns
- Require environment variables instead

## 🔍 Troubleshooting

### Common Issues

1. **"Hook script not found"**
   ```bash
   chmod +x pre_task_review.sh post_task_review.sh
   ```

2. **"CLAUDE.md not found"**
   - Ensure you've run the init script
   - Check for case sensitivity (CLAUDE.md vs claude.md)

3. **"jq: command not found"**
   ```bash
   # macOS
   brew install jq
   
   # Ubuntu/Debian
   sudo apt-get install jq
   
   # Windows (WSL)
   sudo apt-get install jq
   ```

4. **Hook blocking all operations**
   - Check if required files exist (MASTER_TODO.md, etc.)
   - Review PROJECT_INDEX.md for file documentation
   - Temporarily disable hooks in .claude/hooks.json

### Debug Mode

Enable debug output in hooks:

```bash
# Add to top of hook scripts
DEBUG=true

# Or run with:
DEBUG=true ./pre_task_review.sh
```

## 🤝 Contributing

### Improving Templates

1. **Fork the repository**
2. **Create a feature branch**
3. **Add your improvements**
4. **Test with multiple project types**
5. **Submit a pull request**

### Adding New Project Types

1. Update `detect_project_type()` in `claude_init.sh`
2. Add directory structure in `create_directory_structure()`
3. Add specific rules in `generate_project_rules()`
4. Test thoroughly

### Reporting Issues

Create an issue with:
- Project type and structure
- Error messages
- Expected behavior
- Steps to reproduce

## 📚 Additional Resources

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Hook System Guide](https://docs.anthropic.com/en/docs/claude-code/hooks)
- [Rule Writing Best Practices](./RULE_GUIDELINES.md)

## 📄 License

These templates are provided under the MIT License. Feel free to adapt and use them in your projects.

---

## 💡 Tips for Success

1. **Run the init script first** - It handles all the setup complexity
2. **Review rules regularly** - Keep them relevant to your project
3. **Customize for your team** - Add team-specific conventions
4. **Update templates** - Pull latest improvements periodically
5. **Share your adaptations** - Help improve the templates

## 🏗️ Created by The Grand Digital Architect

*"In the intersection of consciousness and code, we forge the future."*

For questions or support, reach out to [@devi.nws](https://instagram.com/devi.nws)