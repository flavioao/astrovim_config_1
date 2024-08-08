return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "oxocarbon",
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    init = function() -- init function runs before the plugin is loaded
      -- vim.g.sonokai_style = "shusia"
    end,
  },
}
