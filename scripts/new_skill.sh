#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 \"<skill-name>\" <output-dir>"
  exit 1
fi

RAW_NAME="$1"
OUT_DIR="$2"

slugify() {
  local s
  s="$(echo "$1" | tr '[:upper:]' '[:lower:]')"
  s="$(echo "$s" | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-{2,}/-/g')"
  echo "$s"
}

SKILL_NAME="$(slugify "$RAW_NAME")"

if [[ -z "$SKILL_NAME" ]]; then
  echo "Error: invalid skill name after normalization."
  exit 1
fi

SKILL_DIR="${OUT_DIR%/}/$SKILL_NAME"

if [[ -e "$SKILL_DIR" ]]; then
  echo "Error: target already exists: $SKILL_DIR"
  exit 1
fi

mkdir -p "$SKILL_DIR"/{references,scripts,assets,agents}

cat > "$SKILL_DIR/SKILL.md" <<EOF
---
name: $SKILL_NAME
description: TODO - describe what this skill does and when to use it, including concrete trigger phrases.
---

# Workflow

1. Clarify objective and constraints.
2. Pick the matching procedure.
3. Use references/scripts/assets when needed.
4. Validate result before returning.

# Resources

## References

- references/domain.md
- references/checklist.md

## Scripts

- scripts/main.sh
EOF

cat > "$SKILL_DIR/references/domain.md" <<'EOF'
# Domain Notes

Put domain-specific concepts, rules, and edge cases here.
EOF

cat > "$SKILL_DIR/references/checklist.md" <<'EOF'
# Quality Checklist

- Trigger is clear in SKILL.md description.
- Steps are executable without guessing.
- Assumptions and edge cases are handled.
EOF

cat > "$SKILL_DIR/scripts/main.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "Replace with deterministic logic for this skill."
EOF
chmod +x "$SKILL_DIR/scripts/main.sh"

cat > "$SKILL_DIR/agents/openai.yaml" <<EOF
version: 1
interface:
  display_name: "${RAW_NAME}"
  short_description: "TODO: one-line summary"
  default_prompt: "Use ${SKILL_NAME} to complete this task."
EOF

echo "Created skill scaffold: $SKILL_DIR"

