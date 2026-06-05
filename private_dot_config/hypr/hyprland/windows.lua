-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Bitwarden
hl.window_rule({ match = { class = "^(Bitwarden)$" }, no_screen_share = true })
hl.window_rule({ match = { class = "^(Bitwarden)$" }, tag = "+floating-window" })

-- Bitwarden Chrome Extension
hl.window_rule({ match = { class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default" }, no_screen_share = true })
hl.window_rule({ match = { class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default" }, tag = "+floating-window" })

-- Jetbrains - Disable mouse focus
-- see https://github.com/basecamp/omarchy/pull/5183#issuecomment-4189299971
hl.window_rule({
    name = "jetbrains-focus",
    match = { class = "^(jetbrains-.*)$" },
    no_follow_mouse = true,
})
