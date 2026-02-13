---
name: <skill-name>
description: <what this skill does>. Use when Codex needs to <task group 1>, <task group 2>, or <task group 3>. Triggers include requests like "<example request 1>" or "<example request 2>".
---

# Workflow

1. Clarify objective and constraints.
2. Select the matching procedure.
3. Execute using bundled resources.
4. Validate output against acceptance checks.
5. Return result with assumptions and next actions.

# Procedure

## Inputs

- Required inputs:
- Optional inputs:

## Steps

1. Collect required context from the user request.
2. If needed, read `references/` files listed below.
3. Execute deterministic operations via `scripts/` when available.
4. Produce final output in requested format.

# Resources

## References

- `references/domain.md`: domain knowledge, rules, and edge cases.
- `references/checklist.md`: quality checklist before return.

## Scripts

- `scripts/main.sh`: repeatable operation entrypoint.

## Assets

- `assets/template.*`: reusable output template.

# Output Standard

- Correctness first; state assumptions explicitly.
- Keep response concise and actionable.
- If blocked by missing input, ask the smallest possible follow-up.

