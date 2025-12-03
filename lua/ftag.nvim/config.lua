local log = require("ftag.nvim.util.log")

local Ftag.nvim = {}

--- Ftag.nvim configuration with its default values.
---
---@type table
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Ftag.nvim.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(Ftag.nvim.options)

--- Defaults Ftag.nvim options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |Ftag.nvim.options|.
---
---@private
function Ftag.nvim.defaults(options)
    Ftag.nvim.options =
        vim.deepcopy(vim.tbl_deep_extend("keep", options or {}, defaults or {}))

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(Ftag.nvim.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return Ftag.nvim.options
end

--- Define your ftag.nvim setup.
---
---@param options table Module config table. See |Ftag.nvim.options|.
---
---@usage `require("ftag.nvim").setup()` (add `{}` with your |Ftag.nvim.options| table)
function Ftag.nvim.setup(options)
    Ftag.nvim.options = Ftag.nvim.defaults(options or {})

    log.warn_deprecation(Ftag.nvim.options)

    return Ftag.nvim.options
end

return Ftag.nvim
