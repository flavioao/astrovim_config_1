return {
  {
    "mg978/vim-visual-multi",

    config = function()
      vim.g.VM_default_mappings = 0
      -- vim.keymap.set("n", "-", "<Plug>(VM-Find-Under)")
      vim.keymap.set("n", "-", "<Plug>(VM-Add-Cursor-At-Pos)")
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "_",
        ["Add Cursor Up"] = "+",
        ["Find Under"] = "<C-x>",
        ["Find Subword Under"] = "<C-x>",
      }
    end,

    name = "vim-visual-multi",
    opts = {
      branch = "master",
      lazy = false,
    },
  },
}
