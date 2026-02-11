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

## Development

### Publishing vibelexity to PyPI

```bash
cd vibelexity
uv build
uv publish
```

First, create a PyPI account and API token, then save credentials in `~/.config/pypirc`.

### Publishing this plugin to GitHub

```bash
cd vibelexity-claude-plugin
git clone https://github.com/ozozozd/vibelexity-claude-plugin.git
```

## Testing

The plugin has been tested with:
- `test-vibelexity-plugin/` sample project
- Shell installer script
- uvx execution fallback

Run the included test:
```bash
test-vibelexity-plugin/test-plugin.sh
```

## Dependencies

The plugin automatically installs vibelexity on first use:
- Prefers `uvx vibelexity` if uv is available and vibelexity is on PyPI
- Falls back to shell installer that installs vibelexity as a uv tool

**Note for development**: If vibelexity is not on PyPI yet, install it locally:
```bash
cd vibelexity
uv pip install -e ~/.local/share/uv/tools/vibelexity
```

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