#!/usr/bin/env bash

source test_common_lib.sh
source test_format_lib.sh
source test_localization_lib.sh

################################################################################
# Init
################################################################################


################################################################################
# Header
################################################################################

echo_test_title "$0"; echo
printf_local "This test checks:"; echo
printf_local "  - performance without jobs"; echo

################################################################################
# Subtests
################################################################################

cat << EOF > simplecron.conf
EOF

# Subtest 1
print_subtest_title "brez poslov"
actual_output=$(${VALGRIND} "${EXEC}" simplecron.conf)
result="$?"
expected_output=""
check "$result" 0 "$actual_output" "$expected_output"

################################################################################
# Footer
################################################################################

print_footer

################################################################################
# Deinit
################################################################################

exit "$TEST_RESULT"
