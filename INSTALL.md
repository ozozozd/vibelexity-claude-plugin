# Installation Guide

## Quick Installation

### Option 1: Global Installation (recommended)
```bash
mkdir -p ~/.claude/plugins
curl -sL https://raw.githubusercontent.com/ozozozd/vibelexity-claude-plugin/main/plugins/vibelexity/.claude-plugin/plugin.json -o /dev/null 2>&1 || \
    git clone https://github.com/ozozozd/vibelexity-claude-plugin.git
cp -r vibelexity-claude-plugin/plugins/vibelexity ~/.claude/plugins/
```

### Option 2: Project-Specific Installation
```bash
cd your-project
mkdir -p .claude/plugins
cp -r vibelexity-claude-plugin/plugins/vibelexity .claude/plugins/
```

## Dependencies

The plugin will automatically install vibelexity when needed:

1. **Tries uvx first**: `uvx vibelexity <path>` (requires vibelexity on PyPI)
2. **Falls back to installer**: Downloads and installs vibelexity using `uv tool install`

### Manual Installation of vibelexity (if needed)

If uvx fails or for offline use:

```bash
# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install vibelexity
uv tool install vibelexity

# Verify
uvx vibelexity --version
```

## Usage

```bash
# In Claude Code
/vibelexity                    # Analyze current directory
/vibelexity ./src             # Analyze specific directory
/vibelexity path/to/code      # Analyze any directory
```

## Output Interpretation

### Health Overview
- **Analyzed**: Number of modules and functions checked
- **Total LOC**: Lines of code across all modules

### Metrics Table
Shows Average, Median, P95, P99 for cognitive complexity, NPath, cycles, MI, and LDI.

### Key Sections
- **Circular Dependencies**: Import cycles to fix
- **Pattern Violations**: Code smells detected
- **Code Duplication**: Percentage of duplicated code
- **Dead Code**: Count of unused code
- **Fat Functions**: High-complexity functions to refactor
- **Top 10 Refactor Candidates**: Worst functions by complexity

### Thresholds

| Metric | Critical | What to Do |
|--------|----------|------------|
| Cognitive Complexity > 15 | Immediate refactoring focus |
| MI (Maintainability) < 40 | Simplify logic, reduce nesting |
| NPath > 200 | Break down into smaller functions |
| LDI > 40 | Reduce nesting depth |
| Circular Dependencies | Eliminate to fix coupling |

## Troubleshooting

### "uvx: command not found"
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
# Reload shell: source ~/.zshrc or restart terminal
```

### "vibelexity: No such file or directory"
```bash
# Manual install
uv tool install vibelexity
# Or reinstall plugin
rm -rf ~/.claude/plugins/vibelexity
# Re-follow installation steps
```

### PATH issues
```bash
# Add to ~/.zshrc or ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"
```

## Development

### Running tests
```bash
test-vibelexity-plugin/test-plugin.sh
```

### Local testing without PyPI
```bash
cd vibelexity
uv pip install -e .
cd ../test-vibelexity-plugin
/vibelexity
```