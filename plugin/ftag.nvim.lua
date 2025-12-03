-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.Ftag.nvimLoaded then
    return
end

_G.Ftag.nvimLoaded = true

vim.api.nvim_create_user_command("Ftag.nvim", function()
    require("ftag.nvim").toggle()
end, {})
