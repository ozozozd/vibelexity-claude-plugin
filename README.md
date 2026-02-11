# Vibelexity Claude Plugin

Claude Code plugin for the Vibelexity cognitive complexity analyzer.

## Installation

### Option 1: Install from source
```bash
git clone https://github.com/ozozozd/vibelexity-claude-plugin.git
mkdir -p ~/.claude/plugins
cp -r vibelexity-claude-plugin/plugins/vibelexity ~/.claude/plugins/
```

### Option 2: Configure in project
```bash
mkdir -p .claude/plugins
cp -r vibelexity-claude-plugin/plugins/vibelexity .claude/plugins/
```

## Usage

In Claude Code, run:
```
/vibelexity
```

Or analyze a specific directory:
```
/vibelexity path/to/directory
```

## Dependencies

The plugin automatically installs vibelexity on first use:
- Prefers `uvx vibelexity` if uv is available
- Falls back to shell installer that installs vibelexity as a uv tool

## Metrics

The plugin analyzes:
- Cognitive complexity
- Halstead metrics
- NPath complexity
- Cyclomatic complexity
- Maintainability Index (MI)
- Logic Density Index (LDI)
- Circular import cycles
- Dead code
- Code duplication

## License

ISC