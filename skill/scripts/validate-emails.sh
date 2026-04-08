#!/bin/bash
# Validate email sequence markdown files
# Usage: ./validate-emails.sh <directory>

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
PASS=0
FAIL=0

validate_file() {
  local f="$1"
  local name=$(basename "$f")
  local errors=""

  # Has subject lines
  if ! grep -qi "subject" "$f"; then
    errors+="  FAIL: No subject lines found\n"
  fi

  # Has send dates
  if ! grep -qi "send" "$f"; then
    errors+="  FAIL: No send dates found\n"
  fi

  # No em dashes
  if python3 -c "print(open('$f').read().count('\u2014'))" 2>/dev/null | grep -qv "^0$"; then
    errors+="  FAIL: Contains em dashes\n"
  fi

  # Has EMAIL sections
  local emails=$(grep -c "^## EMAIL\|^# EMAIL" "$f")

  if [ -z "$errors" ]; then
    echo -e "${GREEN}PASS${NC} $name ($emails emails)"
    PASS=$((PASS + 1))
  else
    echo -e "${RED}ISSUES${NC} $name ($emails emails)"
    echo -e "$errors"
    FAIL=$((FAIL + 1))
  fi
}

if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

for f in "$1"/*.md; do
  validate_file "$f"
done

echo ""
echo "Results: $PASS passed, $FAIL with issues"
exit $FAIL
