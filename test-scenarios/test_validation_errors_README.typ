// test-scenarios/test_validation_errors.typ
// Tests: invalid lang: and heading-depth: produce clear error messages
// Expected: each variant should FAIL with a specific panic message
//
// Run manually:
//   typst compile --root . test-scenarios/test_validation_lang_invalid.typ
//   typst compile --root . test-scenarios/test_validation_depth_invalid.typ
//   typst compile --root . test-scenarios/test_validation_depth_zero.typ
//
// These are NOT compiled in the normal test run (they are expected to fail).
// This file is a comment-only reference — see individual files below.
