-- =====================================================================
-- FORMULA 1 MASTER COCKPIT: CORE DEPLOYMENT (F1)
-- =====================================================================

hl.bind("F1", function()
    -- Switch to workspace 1 natively
    hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch workspace 1"))
    
    -- Launch core study tools to their dedicated workspaces
    hl.dispatch(hl.dsp.exec_cmd("[workspace 1] kitty"))
    hl.dispatch(hl.dsp.exec_cmd("[workspace 2 silent] vivaldi --new-window https://cs50.harvard.edu/python/"))
    hl.dispatch(hl.dsp.exec_cmd("[workspace 3 silent] code"))
end)
