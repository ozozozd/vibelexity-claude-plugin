---
name: vibelexity
description: Vibelexity guides agents to produce good code.
---

Cognitive complexity metrics for code health assessment.

## Metrics

| Metric | Definition | Good | Concern | Critical |
|--------|------------|------|---------|----------|
| Cognitive Complexity | Code difficulty, accounting for nesting and control flow breaks | ≤8 | 9-15 | >15 |
| Halstead Volume | Vocabulary size × log2(program length) | <500 | 500-1000 | >1000 |
| Cyclomatic Complexity | Number of linearly independent paths | ≤5 | 6-10 | >10 |
| NPath Complexity | Number of acyclic execution paths | ≤50 | 51-200 | >200 |
| MI (Maintainability Index) | Composite measure 0-100 (higher is better) | ≥70 | 40-69 | <40 |
| LDI (Logical Depth Index) | Average nesting depth | ≤20 | 21-40 | >40 |

These metrics identify code that is difficult to understand, test, and maintain.
