# Knowledge to Skill Factory

Objective: turn personal knowledge into reusable, triggerable Codex skills.

## 1) Build the Skill Backlog

List knowledge domains and score each with:

- Reuse frequency (how often you repeat this work)
- Value density (time or money impact)
- Fragility (easy to make mistakes)

Prioritize highest total score first.

## 2) One Knowledge Unit = One Skill

For each top domain, define:

- Input: what user request triggers the skill
- Output: what a good result looks like
- Workflow: repeatable steps
- Reusable resources: scripts, references, assets

## 3) Create Skill Folder Fast

Use:

```bash
./scripts/new_skill.sh "<skill-name>" .
```

Example:

```bash
./scripts/new_skill.sh "product-prd-writer" .
```

Then fill:

- `SKILL.md` (trigger-oriented description + concise workflow)
- `references/*.md` (domain rules, checklists, examples)
- `scripts/*` (deterministic or repetitive operations)
- `assets/*` (templates, boilerplate, files used in output)

## 4) Validation Gate

Before using a skill in production, check:

- Trigger quality: does description clearly say when to use
- Workflow clarity: can another agent execute without guessing
- Token efficiency: keep SKILL body lean, move details to references
- Reliability: run scripts once with sample input

## 5) 7-Day Sprint (Recommended)

Day 1:

- Build backlog from all current notes/docs/chats
- Select top 5 skills

Day 2-3:

- Build skill #1 and #2 completely

Day 4-5:

- Build skill #3 and #4

Day 6:

- Build skill #5

Day 7:

- Use all five on real tasks
- Patch weak prompts, missing references, and flaky scripts

## 6) Definition of Done

A knowledge item is fully productized only when:

- It is in a skill folder with valid `SKILL.md`
- At least one real task was completed using that skill
- At least one iteration update was made based on real usage

