require("auto-session").setup {
  log_level = "error",
  auto_session_allow_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  auto_save_enabled = true,
  auto_restore_enabled = true,
}
