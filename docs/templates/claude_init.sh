#!/bin/bash

# Claude Integration Intelligent Initialization Script
# Purpose: Automatically detect project type and set up Claude integration
# Version: 1.0

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_color() {
    color=$1
    message=$2
    echo -e "${color}${message}${NC}"
}

# Function to detect project type
detect_project_type() {
    print_color "$BLUE" "🔍 Detecting project type..."
    
    PROJECT_TYPE="unknown"
    PRIMARY_LANGUAGE="unknown"
    TEST_FRAMEWORK="none"
    BUILD_TOOL="none"
    PACKAGE_MANAGER="none"
    
    # Web project detection
    if [ -f "package.json" ]; then
        PROJECT_TYPE="web"
        PRIMARY_LANGUAGE="javascript"
        PACKAGE_MANAGER="npm"
        
        # Check for specific frameworks
        if grep -q "\"react\"" package.json 2>/dev/null; then
            PROJECT_TYPE="react-app"
        elif grep -q "\"vue\"" package.json 2>/dev/null; then
            PROJECT_TYPE="vue-app"
        elif grep -q "\"@angular/core\"" package.json 2>/dev/null; then
            PROJECT_TYPE="angular-app"
        elif grep -q "\"next\"" package.json 2>/dev/null; then
            PROJECT_TYPE="nextjs-app"
        fi
        
        # Check for TypeScript
        if [ -f "tsconfig.json" ]; then
            PRIMARY_LANGUAGE="typescript"
        fi
        
        # Check for test frameworks
        if grep -q "\"jest\"" package.json 2>/dev/null; then
            TEST_FRAMEWORK="jest"
        elif grep -q "\"mocha\"" package.json 2>/dev/null; then
            TEST_FRAMEWORK="mocha"
        elif grep -q "\"vitest\"" package.json 2>/dev/null; then
            TEST_FRAMEWORK="vitest"
        fi
        
        # Check for build tools
        if grep -q "\"webpack\"" package.json 2>/dev/null; then
            BUILD_TOOL="webpack"
        elif grep -q "\"vite\"" package.json 2>/dev/null; then
            BUILD_TOOL="vite"
        elif grep -q "\"parcel\"" package.json 2>/dev/null; then
            BUILD_TOOL="parcel"
        fi
        
    # Python project detection
    elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
        PROJECT_TYPE="python"
        PRIMARY_LANGUAGE="python"
        
        if [ -f "pyproject.toml" ]; then
            PACKAGE_MANAGER="poetry"
        elif [ -f "Pipfile" ]; then
            PACKAGE_MANAGER="pipenv"
        else
            PACKAGE_MANAGER="pip"
        fi
        
        # Check for Django/Flask
        if [ -f "manage.py" ] || grep -q "django" requirements.txt 2>/dev/null; then
            PROJECT_TYPE="django-app"
        elif grep -q "flask" requirements.txt 2>/dev/null; then
            PROJECT_TYPE="flask-app"
        elif grep -q "fastapi" requirements.txt 2>/dev/null; then
            PROJECT_TYPE="fastapi-app"
        fi
        
        # Check for test frameworks
        if grep -q "pytest" requirements.txt 2>/dev/null || [ -f "pytest.ini" ]; then
            TEST_FRAMEWORK="pytest"
        elif grep -q "unittest" requirements.txt 2>/dev/null; then
            TEST_FRAMEWORK="unittest"
        fi
        
    # Rust project detection
    elif [ -f "Cargo.toml" ]; then
        PROJECT_TYPE="rust"
        PRIMARY_LANGUAGE="rust"
        PACKAGE_MANAGER="cargo"
        BUILD_TOOL="cargo"
        
    # Go project detection
    elif [ -f "go.mod" ]; then
        PROJECT_TYPE="go"
        PRIMARY_LANGUAGE="go"
        PACKAGE_MANAGER="go"
        BUILD_TOOL="go"
        
    # Java project detection
    elif [ -f "pom.xml" ]; then
        PROJECT_TYPE="java-maven"
        PRIMARY_LANGUAGE="java"
        PACKAGE_MANAGER="maven"
        BUILD_TOOL="maven"
    elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
        PROJECT_TYPE="java-gradle"
        PRIMARY_LANGUAGE="java"
        PACKAGE_MANAGER="gradle"
        BUILD_TOOL="gradle"
        
    # C/C++ project detection
    elif [ -f "CMakeLists.txt" ]; then
        PROJECT_TYPE="cpp-cmake"
        PRIMARY_LANGUAGE="cpp"
        BUILD_TOOL="cmake"
    elif [ -f "Makefile" ]; then
        PROJECT_TYPE="c-make"
        PRIMARY_LANGUAGE="c"
        BUILD_TOOL="make"
        
    # Ruby project detection
    elif [ -f "Gemfile" ]; then
        PROJECT_TYPE="ruby"
        PRIMARY_LANGUAGE="ruby"
        PACKAGE_MANAGER="bundler"
        
        if [ -f "config.ru" ] || [ -d "app/controllers" ]; then
            PROJECT_TYPE="rails-app"
        end
        
    # PHP project detection
    elif [ -f "composer.json" ]; then
        PROJECT_TYPE="php"
        PRIMARY_LANGUAGE="php"
        PACKAGE_MANAGER="composer"
        
        if [ -f "artisan" ]; then
            PROJECT_TYPE="laravel-app"
        elif [ -f "bin/console" ] && [ -d "src" ]; then
            PROJECT_TYPE="symfony-app"
        fi
    fi
    
    # Deployment target detection
    DEPLOYMENT_TARGET="unknown"
    if [ -f "Dockerfile" ] || [ -f "docker-compose.yml" ]; then
        DEPLOYMENT_TARGET="docker"
    elif [ -f "vercel.json" ]; then
        DEPLOYMENT_TARGET="vercel"
    elif [ -f "netlify.toml" ]; then
        DEPLOYMENT_TARGET="netlify"
    elif [ -f ".github/workflows" ]; then
        DEPLOYMENT_TARGET="github-actions"
    elif [ -f "app.yaml" ] && grep -q "runtime:" app.yaml 2>/dev/null; then
        DEPLOYMENT_TARGET="google-app-engine"
    elif [ -f "serverless.yml" ]; then
        DEPLOYMENT_TARGET="serverless"
    fi
    
    print_color "$GREEN" "✅ Project Detection Complete:"
    echo "   Type: $PROJECT_TYPE"
    echo "   Language: $PRIMARY_LANGUAGE"
    echo "   Package Manager: $PACKAGE_MANAGER"
    echo "   Test Framework: $TEST_FRAMEWORK"
    echo "   Build Tool: $BUILD_TOOL"
    echo "   Deployment: $DEPLOYMENT_TARGET"
}

# Function to create project-specific directory structure
create_directory_structure() {
    print_color "$BLUE" "📁 Creating directory structure..."
    
    # Always create planning directory
    mkdir -p planning
    
    # Create project-specific directories
    case "$PROJECT_TYPE" in
        "web"|"react-app"|"vue-app"|"angular-app"|"nextjs-app")
            mkdir -p src/components src/hooks src/utils src/services
            mkdir -p public/assets tests docs
            ;;
        "python"|"django-app"|"flask-app"|"fastapi-app")
            mkdir -p src tests docs scripts
            if [[ "$PROJECT_TYPE" == "django-app" ]]; then
                mkdir -p static templates media
            fi
            ;;
        "rust"|"go")
            mkdir -p src tests docs examples benches
            ;;
        "java-maven"|"java-gradle")
            mkdir -p src/main/java src/test/java src/main/resources docs
            ;;
        *)
            mkdir -p src tests docs
            ;;
    esac
    
    print_color "$GREEN" "✅ Directory structure created"
}

# Function to adapt CLAUDE.md template
adapt_claude_template() {
    print_color "$BLUE" "📝 Adapting CLAUDE.md template..."
    
    # Get current date
    CURRENT_DATE=$(date +%Y-%m-%d)
    
    # Read template
    TEMPLATE_PATH="./docs/templates/CLAUDE_TEMPLATE.md"
    if [ ! -f "$TEMPLATE_PATH" ]; then
        print_color "$RED" "❌ Template not found at $TEMPLATE_PATH"
        return 1
    fi
    
    # Create adapted CLAUDE.md
    cp "$TEMPLATE_PATH" ./CLAUDE.md
    
    # Replace placeholders
    sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" ./CLAUDE.md
    sed -i "s/{{PROJECT_PURPOSE}}/$PROJECT_PURPOSE/g" ./CLAUDE.md
    sed -i "s/{{PROJECT_STATUS}}/🚧 Initial Setup/g" ./CLAUDE.md
    sed -i "s/{{PROJECT_TYPE}}/$PROJECT_TYPE/g" ./CLAUDE.md
    sed -i "s/{{PRIMARY_LANGUAGE}}/$PRIMARY_LANGUAGE/g" ./CLAUDE.md
    sed -i "s/{{CURRENT_DATE}}/$CURRENT_DATE/g" ./CLAUDE.md
    sed -i "s/{{CURRENT_PHASE}}/Initial Setup Phase/g" ./CLAUDE.md
    sed -i "s/{{STATUS_EMOJI}}/🚧/g" ./CLAUDE.md
    sed -i "s/{{STATUS_TEXT}}/IN PROGRESS/g" ./CLAUDE.md
    
    # Add project-specific structure
    PROJECT_STRUCTURE=$(generate_project_structure)
    # Escape slashes and newlines for sed
    ESCAPED_STRUCTURE=$(echo "$PROJECT_STRUCTURE" | sed 's/\//\\\//g' | sed ':a;N;$!ba;s/\n/\\n/g')
    sed -i "s/{{PROJECT_STRUCTURE}}/$ESCAPED_STRUCTURE/g" ./CLAUDE.md
    
    # Add project-specific commands
    PROJECT_COMMANDS=$(generate_project_commands)
    ESCAPED_COMMANDS=$(echo "$PROJECT_COMMANDS" | sed 's/\//\\\//g' | sed ':a;N;$!ba;s/\n/\\n/g')
    sed -i "s/{{PROJECT_COMMANDS}}/$ESCAPED_COMMANDS/g" ./CLAUDE.md
    
    # Add project-specific rules
    PROJECT_RULES=$(generate_project_rules)
    sed -i "s/{{PROJECT_SPECIFIC_RULES}}/$PROJECT_RULES/g" ./CLAUDE.md
    
    # Add initial status details
    STATUS_DETAILS="- ✅ Claude integration initialized\\n- ✅ Hook scripts installed\\n- ✅ Directory structure created\\n- ⏳ Implementation pending"
    sed -i "s/{{CURRENT_STATUS_DETAILS}}/$STATUS_DETAILS/g" ./CLAUDE.md
    
    # Add next steps
    NEXT_STEPS="Begin implementation according to project requirements"
    sed -i "s/{{NEXT_STEPS}}/$NEXT_STEPS/g" ./CLAUDE.md
    
    # Add initial changes
    INITIAL_CHANGES="- Set up Claude integration for $PROJECT_TYPE\\n- Created project-specific directory structure\\n- Configured hooks for $PRIMARY_LANGUAGE development"
    sed -i "s/{{INITIAL_CHANGES}}/$INITIAL_CHANGES/g" ./CLAUDE.md
    
    print_color "$GREEN" "✅ CLAUDE.md adapted for project"
}

# Function to generate project structure
generate_project_structure() {
    case "$PROJECT_TYPE" in
        "web"|"react-app"|"vue-app"|"angular-app"|"nextjs-app")
            cat << EOF
/src/                  # Source code
  /components/         # UI components
  /hooks/              # Custom hooks
  /utils/              # Utility functions
  /services/           # API services
/public/               # Static assets
  /assets/             # Images, fonts
/tests/                # Test files
/docs/                 # Documentation
/planning/             # Project management
EOF
            ;;
        "python"|"django-app"|"flask-app"|"fastapi-app")
            cat << EOF
/src/                  # Source code
/tests/                # Test files
/docs/                 # Documentation
/scripts/              # Utility scripts
/planning/             # Project management
EOF
            ;;
        *)
            cat << EOF
/src/                  # Source code
/tests/                # Test files
/docs/                 # Documentation
/planning/             # Project management
EOF
            ;;
    esac
}

# Function to generate project commands
generate_project_commands() {
    case "$PACKAGE_MANAGER" in
        "npm")
            cat << EOF
# Install dependencies
npm install

# Run development server
npm run dev

# Run tests
npm test

# Build for production
npm run build
EOF
            ;;
        "pip"|"poetry"|"pipenv")
            cat << EOF
# Install dependencies
$PACKAGE_MANAGER install

# Run development server
python manage.py runserver  # Django
python app.py               # Flask/FastAPI

# Run tests
pytest

# Format code
black .
EOF
            ;;
        "cargo")
            cat << EOF
# Build project
cargo build

# Run project
cargo run

# Run tests
cargo test

# Build for release
cargo build --release
EOF
            ;;
        *)
            cat << EOF
# Project-specific commands
# Update based on your project needs
EOF
            ;;
    esac
}

# Function to generate project-specific rules
generate_project_rules() {
    case "$PROJECT_TYPE" in
        "react-app"|"vue-app"|"angular-app"|"nextjs-app")
            echo "<rule id=\"proj-1\" priority=\"critical\">Components must be functional with hooks, not class-based</rule>\\n  <rule id=\"proj-2\" priority=\"mandatory\">Use TypeScript for all new files</rule>\\n  <rule id=\"proj-3\" priority=\"critical\">All API calls must use the services layer</rule>\\n  <rule id=\"proj-4\" priority=\"mandatory\">CSS modules or styled-components for styling</rule>"
            ;;
        "django-app"|"flask-app"|"fastapi-app")
            echo "<rule id=\"proj-1\" priority=\"critical\">All views must have proper authentication</rule>\\n  <rule id=\"proj-2\" priority=\"mandatory\">Use type hints for all functions</rule>\\n  <rule id=\"proj-3\" priority=\"critical\">Database migrations must be reversible</rule>\\n  <rule id=\"proj-4\" priority=\"mandatory\">API endpoints must have OpenAPI documentation</rule>"
            ;;
        *)
            echo "<rule id=\"proj-1\" priority=\"normal\">Follow language-specific best practices</rule>"
            ;;
    esac
}

# Function to adapt hook scripts
adapt_hook_scripts() {
    print_color "$BLUE" "🔧 Adapting hook scripts..."
    
    # Copy templates
    cp ./docs/templates/pre_task_review_template.sh ./pre_task_review.sh
    cp ./docs/templates/post_task_review_template.sh ./post_task_review.sh
    
    # Make executable
    chmod +x ./pre_task_review.sh ./post_task_review.sh
    
    # Add project-specific checks to post_task_review.sh
    PROJECT_CHECKS=$(generate_project_checks)
    
    # Insert project-specific checks
    sed -i "s/# {{PROJECT_SPECIFIC_CHECKS}}/$PROJECT_CHECKS/g" ./post_task_review.sh
    
    print_color "$GREEN" "✅ Hook scripts adapted"
}

# Function to generate project-specific checks
generate_project_checks() {
    case "$PRIMARY_LANGUAGE" in
        "javascript"|"typescript")
            cat << 'EOF'
# Check 4: ESLint/Prettier compliance
js_files=$(echo "$RECENT_FILES" | grep -E "\.(js|jsx|ts|tsx)$" || true)
if [ -n "$js_files" ] && [ -f ".eslintrc.json" ]; then
    for file in $js_files; do
        if ! npx eslint "$file" --quiet 2>/dev/null; then
            add_warning "proj-lint" "ESLint issues in: $file"
        fi
    done
fi

# Check 5: Import organization
if [ -n "$js_files" ]; then
    for file in $js_files; do
        # Check for absolute imports from src
        if grep -E "^import.*from ['\"][^./]" "$file" | grep -v "^import.*from ['\"]@" 2>/dev/null; then
            add_warning "proj-imports" "Non-relative imports should use @ alias: $file"
        fi
    done
fi
EOF
            ;;
        "python")
            cat << 'EOF'
# Check 4: Python linting (black/flake8)
python_files=$(echo "$RECENT_FILES" | grep "\.py$" || true)
if [ -n "$python_files" ]; then
    for file in $python_files; do
        # Check if file would be reformatted by black
        if command -v black >/dev/null 2>&1; then
            if ! black --check "$file" 2>/dev/null; then
                add_warning "proj-format" "File needs black formatting: $file"
            fi
        fi
        
        # Check for type hints
        if ! grep -q "def.*->.*:" "$file" 2>/dev/null && grep -q "^def " "$file" 2>/dev/null; then
            add_warning "proj-types" "Missing type hints in: $file"
        fi
    done
fi
EOF
            ;;
        *)
            echo "# No language-specific checks for $PRIMARY_LANGUAGE yet"
            ;;
    esac
}

# Function to create initial tracking files
create_tracking_files() {
    print_color "$BLUE" "📋 Creating tracking files..."
    
    # Create PROJECT_INDEX.md
    cat > ./PROJECT_INDEX.md << EOF
# PROJECT INDEX - $PROJECT_NAME

**Last Updated**: $(date +"%Y-%m-%d %H:%M:%S")
**Project Type**: $PROJECT_TYPE
**Primary Language**: $PRIMARY_LANGUAGE

## 📁 Project Structure

### Core Files
- \`/CLAUDE.md\` - Claude AI integration configuration and rules
- \`/README.md\` - Project documentation and setup instructions
- \`/PROJECT_INDEX.md\` - This file - complete project file map
- \`/.gitignore\` - Git ignore configuration

### Hook Scripts
- \`/pre_task_review.sh\` - Pre-task compliance checking
- \`/post_task_review.sh\` - Post-task compliance verification

### Planning & Management
- \`/planning/MASTER_TODO.md\` - Task tracking and management
- \`/planning/PROJECT_JOURNAL.md\` - Development history and decisions

### Source Code
- \`/src/\` - Main source code directory

### Tests
- \`/tests/\` - Test files and test utilities

### Documentation
- \`/docs/\` - Project documentation
- \`/docs/templates/\` - Reusable templates

## 🔄 Update History

- $(date +"%Y-%m-%d %H:%M:%S") - Initial project structure created
EOF

    # Create MASTER_TODO.md
    cat > ./planning/MASTER_TODO.md << EOF
# MASTER TODO - $PROJECT_NAME

**Last Updated**: $(date +"%Y-%m-%d %H:%M:%S")
**Total Tasks**: 1
**Completed**: 0
**In Progress**: 1

## 🎯 High Priority

### ✅ Completed

### 🔄 In Progress
- [ ] Initial project setup and Claude integration

### 📋 Pending
- [ ] Implement core functionality
- [ ] Set up testing framework
- [ ] Create documentation

## 🎯 Medium Priority

### 📋 Pending
- [ ] Add CI/CD pipeline
- [ ] Configure linting and formatting

## 🎯 Low Priority

### 📋 Pending
- [ ] Add advanced features
- [ ] Performance optimization
EOF

    # Create PROJECT_JOURNAL.md
    cat > ./planning/PROJECT_JOURNAL.md << EOF
# PROJECT JOURNAL - $PROJECT_NAME

## $(date +%Y-%m-%d) - Project Initialization

### Session Summary
**Duration**: Initial setup
**Developer**: Claude Integration Script

### What Was Accomplished
- ✅ Detected project type: $PROJECT_TYPE
- ✅ Set up Claude AI integration
- ✅ Created directory structure
- ✅ Configured pre/post task review hooks
- ✅ Generated initial documentation

### Key Decisions
- Using $PRIMARY_LANGUAGE as primary language
- Package management with $PACKAGE_MANAGER
- Test framework: $TEST_FRAMEWORK
- Build tool: $BUILD_TOOL

### Technical Details
- Adapted CLAUDE.md template for $PROJECT_TYPE
- Created project-specific hook checks
- Set up tracking files

### Next Session Focus
1. Begin implementing core functionality
2. Set up development environment
3. Configure testing framework
4. Create initial components/modules

### Specific Next Steps
- Review project requirements
- Create development roadmap
- Set up version control
- Begin coding core features
EOF

    print_color "$GREEN" "✅ Tracking files created"
}

# Function to create appropriate .gitignore
create_gitignore() {
    print_color "$BLUE" "📝 Creating .gitignore..."
    
    # Start with common ignores
    cat > .gitignore << EOF
# Claude Integration
.claude/
*.log

# OS Files
.DS_Store
Thumbs.db

# IDE
.idea/
.vscode/
*.swp
*.swo

# Environment
.env
.env.local
.env.*.local

EOF

    # Add language-specific ignores
    case "$PRIMARY_LANGUAGE" in
        "javascript"|"typescript")
            cat >> .gitignore << EOF
# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

# Build
dist/
build/
.next/
out/
*.tsbuildinfo

# Testing
coverage/
.nyc_output/

# Misc
*.local
EOF
            ;;
        "python")
            cat >> .gitignore << EOF
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/
ENV/
.venv/

# Distribution
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Testing
.coverage
.pytest_cache/
htmlcov/
.tox/
.nox/

# Django
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal
media/

# Flask
instance/
.webassets-cache
EOF
            ;;
        "rust")
            cat >> .gitignore << EOF
# Rust
target/
Cargo.lock
**/*.rs.bk
*.pdb
EOF
            ;;
        "go")
            cat >> .gitignore << EOF
# Go
*.exe
*.exe~
*.dll
*.so
*.dylib
*.test
*.out
go.work

# Dependency directories
vendor/
EOF
            ;;
    esac
    
    print_color "$GREEN" "✅ .gitignore created"
}

# Function to create README from template
create_readme() {
    print_color "$BLUE" "📚 Creating README.md..."
    
    if [ -f "./docs/README_TEMPLATE.md" ]; then
        cp ./docs/README_TEMPLATE.md ./README.md
        
        # Replace placeholders
        sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" ./README.md
        sed -i "s/{{PROJECT_DESCRIPTION}}/$PROJECT_PURPOSE/g" ./README.md
        sed -i "s|{{TECHNOLOGIES}}|$PRIMARY_LANGUAGE, $PACKAGE_MANAGER, $TEST_FRAMEWORK|g" ./README.md
    else
        # Create basic README if template not found
        cat > ./README.md << EOF
# 🏗️ $PROJECT_NAME

> $PROJECT_PURPOSE

## 🚀 About The Project

This project uses Claude AI integration for enhanced development workflow.

- **Project Type**: $PROJECT_TYPE
- **Primary Language**: $PRIMARY_LANGUAGE
- **Package Manager**: $PACKAGE_MANAGER
- **Test Framework**: $TEST_FRAMEWORK

## 🛠️ Built With

- $PRIMARY_LANGUAGE
- Claude AI Integration
- Automated compliance checking

## 🏁 Getting Started

### Prerequisites

- $PACKAGE_MANAGER
- Claude Code CLI

### Installation

1. Clone the repository
2. Install dependencies based on your package manager
3. Run the development server

## 📖 Documentation

See the \`/docs\` directory for detailed documentation.

## 🤝 Contributing

Contributions are welcome! Please read the contributing guidelines first.

## 📬 Contact

The Grand Digital Architect - [@devi.nws](https://instagram.com/devi.nws)

---

*"In the intersection of consciousness and code, we forge the future."*
- The Grand Digital Architect
EOF
    fi
    
    print_color "$GREEN" "✅ README.md created"
}

# Main execution function
main() {
    print_color "$BLUE" "🚀 Claude Integration Setup Script"
    print_color "$BLUE" "=================================="
    
    # Check if already initialized
    if [ -f "./CLAUDE.md" ] && [ -f "./pre_task_review.sh" ] && [ -f "./post_task_review.sh" ]; then
        print_color "$YELLOW" "⚠️  Claude integration already exists in this project."
        read -p "Do you want to reinitialize? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_color "$RED" "❌ Initialization cancelled"
            exit 0
        fi
    fi
    
    # Get project information
    print_color "$BLUE" "📝 Please provide project information:"
    read -p "Project Name: " PROJECT_NAME
    read -p "Project Purpose (brief description): " PROJECT_PURPOSE
    
    # Detect project type
    detect_project_type
    
    # Confirm detection
    print_color "$YELLOW" "\n📋 Detected Configuration:"
    echo "   Project: $PROJECT_NAME"
    echo "   Purpose: $PROJECT_PURPOSE"
    echo "   Type: $PROJECT_TYPE"
    echo "   Language: $PRIMARY_LANGUAGE"
    read -p "\nIs this correct? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_color "$YELLOW" "Please manually configure the project type in CLAUDE.md after setup."
    fi
    
    # Create directory structure
    create_directory_structure
    
    # Create tracking files first (required by hooks)
    create_tracking_files
    
    # Adapt and create files
    adapt_claude_template
    adapt_hook_scripts
    create_gitignore
    create_readme
    
    # Final summary
    print_color "$GREEN" "\n✅ Claude Integration Setup Complete!"
    print_color "$GREEN" "===================================="
    echo
    echo "Created files:"
    echo "  ✓ CLAUDE.md - Configured for $PROJECT_TYPE"
    echo "  ✓ pre_task_review.sh - Pre-task compliance checking"
    echo "  ✓ post_task_review.sh - Post-task verification"
    echo "  ✓ PROJECT_INDEX.md - File tracking"
    echo "  ✓ planning/MASTER_TODO.md - Task management"
    echo "  ✓ planning/PROJECT_JOURNAL.md - Development history"
    echo "  ✓ .gitignore - Appropriate ignores for $PRIMARY_LANGUAGE"
    echo "  ✓ README.md - Project documentation"
    echo
    print_color "$YELLOW" "📌 Next Steps:"
    echo "  1. Review CLAUDE.md and customize project-specific rules"
    echo "  2. Update README.md with specific project details"
    echo "  3. Begin development with Claude Code"
    echo
    print_color "$BLUE" "🤖 Happy coding with Claude!"
}

# Run main function
main