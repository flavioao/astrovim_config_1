return {
  {
    "skywind3000/asyncrun.vim",
    config = function()

      -- Tried these as well but they do not work.
      -- vim.g.VM_maps['Find Subword Under'] = "<C-x>"
      -- vim.g.VM_maps["Select Cursor Down"] = '<M-u>'
      -- vim.g.VM_maps["Select Cursor Up"]   = '<M-d>'
    end,

    name = "asyncrun",
    opts = {
      lazy = false,
    },
  },
}
