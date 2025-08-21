return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
        enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in same line
        ignored_next_char = "[%w%.]",      -- Will ignore alphanumeric and `.` symbol
    }
}
