local main = require("ftag.nvim.main")
local config = require("ftag.nvim.config")

local Ftag.nvim = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function Ftag.nvim.toggle()
    if _G.Ftag.nvim.config == nil then
        _G.Ftag.nvim.config = config.options
    end

    main.toggle("public_api_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function Ftag.nvim.enable(scope)
    if _G.Ftag.nvim.config == nil then
        _G.Ftag.nvim.config = config.options
    end

    main.toggle(scope or "public_api_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function Ftag.nvim.disable()
    main.toggle("public_api_disable")
end

-- setup Ftag.nvim options and merge them with user provided ones.
function Ftag.nvim.setup(opts)
    _G.Ftag.nvim.config = config.setup(opts)
end

_G.Ftag.nvim = Ftag.nvim

return _G.Ftag.nvim
