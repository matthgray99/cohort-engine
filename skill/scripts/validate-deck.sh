#!/bin/bash
# Validate curriculum deck HTML files
# Usage: ./validate-deck.sh <directory-or-file>

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
PASS=0
FAIL=0

validate_file() {
  local f="$1"
  local name=$(basename "$f")
  local errors=""

  # DOCTYPE
  if ! head -1 "$f" | grep -q "<!DOCTYPE html>"; then
    errors+="  FAIL: Missing DOCTYPE\n"
  fi

  # Helvetica Neue
  if ! grep -q "Helvetica Neue" "$f"; then
    errors+="  FAIL: Missing Helvetica Neue font\n"
  fi

  # No Poppins
  if grep -qi "poppins" "$f"; then
    errors+="  FAIL: Contains Poppins font\n"
  fi

  # No Playfair (in content, OK in CSS comments)
  if grep -q "Playfair" "$f"; then
    errors+="  WARN: Contains Playfair Display reference\n"
  fi

  # Scroll-snap
  if ! grep -q "scroll-snap" "$f"; then
    errors+="  FAIL: Missing scroll-snap CSS\n"
  fi

  # Favicon
  if ! grep -q "favicon" "$f"; then
    errors+="  FAIL: Missing founderos.com favicon\n"
  fi

  # No em dashes
  if python3 -c "print(open('$f').read().count('\u2014'))" 2>/dev/null | grep -qv "^0$"; then
    errors+="  FAIL: Contains em dashes\n"
  fi

  # IntersectionObserver
  if ! grep -q "IntersectionObserver" "$f"; then
    errors+="  FAIL: Missing IntersectionObserver\n"
  fi

  # Billboard slides
  if ! grep -q "billboard-text" "$f"; then
    errors+="  FAIL: Missing billboard slides\n"
  fi

  # Squiggly underlines
  if ! grep -q "squiggly-underline" "$f"; then
    errors+="  FAIL: Missing squiggly underlines\n"
  fi

  # Hover effects
  if ! grep -q ":hover" "$f"; then
    errors+="  FAIL: Missing hover effects\n"
  fi

  # Section count
  local sections=$(grep -c "<section" "$f")
  if [ "$sections" -lt 20 ]; then
    errors+="  WARN: Only $sections sections (expected 20+)\n"
  fi

  if [ -z "$errors" ]; then
    echo -e "${GREEN}PASS${NC} $name ($sections slides)"
    PASS=$((PASS + 1))
  else
    echo -e "${RED}ISSUES${NC} $name ($sections slides)"
    echo -e "$errors"
    FAIL=$((FAIL + 1))
  fi
}

# Main
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-or-file>"
  exit 1
fi

if [ -d "$1" ]; then
  for f in "$1"/*.html; do
    [ "$(basename "$f")" = "index.html" ] && continue
    validate_file "$f"
  done
else
  validate_file "$1"
fi

echo ""
echo "Results: $PASS passed, $FAIL with issues"
exit $FAIL
