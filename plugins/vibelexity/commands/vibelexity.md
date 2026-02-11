# Vibelexity Cognitive Complexity Analysis

Analyze codebase for cognitive complexity, maintainability issues, and code health.

## Instructions

First, check if `uvx` is available and run the analysis. If uvx is not available, download and install vibelexity using the shell installer.

```bash
# Try uvx first
if command -v uvx &> /dev/null; then
    uvx vibelexity "${ARGUMENTS:-.}"
else
    # Install using shell script
    curl -fsSL https://raw.githubusercontent.com/ozozozd/vibelexity-claude-plugin/main/scripts/install-vibelexity.sh | bash
    ~/.local/bin/vibelexity "${ARGUMENTS:-.}"
fi
```

## Summary Output

After running the analysis, present a concise summary:

1. **Project Health** - Modules, functions, total LOC
2. **Complexity Issues** - Top 3-5 functions by cognitive complexity
3. **Maintainability** - Functions with MI < 50 (if any)
4. **Dependencies** - Circular import cycles
5. **Dead Code** - Count of unused functions/variables
6. **Duplication** - Percentage of duplicated code

Use grep to extract key sections:
- `grep -E "(Analyzed|Total lines:)"` - Summary stats
- `grep -A 6 "Statistics"` - Metrics table
- `grep -A 5 "Circular import cycles:"` - Dependency cycles
- `grep -A 10 "Top 10 Refactor Candidates"` - Worst functions

Highlight priority issues:
- Cognitive complexity > 15
- Maintainability Index < 40
- NPath > 200