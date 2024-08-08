return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {

        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map

          -- navigate buffer tabs with `H` and `L`
          -- L = {
          --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          --   desc = "Next buffer",
          -- },
          -- H = {
          --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          --   desc = "Previous buffer",
          -- },

          -- mappings seen under group name "Buffer"
          ["<leader>bD"] = {
            function()
              require("astronvim.utils.status").heirline.buffer_picker(
                function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<leader>b"] = { name = "Buffers" },
          -- ["<F9>"] = { ":OverseerRun CppBuild<CR>", desc = "Compile the C++ file with clang++" }, -- change description but the same command
          -- ["<F8>"] = { ":OverseerRun make<CR><CR>", desc = "Execute make on the Makefile of the directory" }, -- change description but the same command
          -- ["<F5>"] = { ":WatchRun<CR>", desc = "Run the executable File" }, -- change description but the same command
          ["<leader>db"] = { "<cmd> DapToggleBreakpoint<CR>", desc = "Add breakpoint at line" }, -- change description but the same command
          ["<leader>dr"] = { "<cmd> DapContinue <CR>", desc = "Start or continue the debugger" }, -- change description but the same command
          ["<leader>di"] = { "<cmd> DapStepInto <CR>", desc = "Step into next instruction" }, -- change description but the same command
          ["<leader>do"] = { "<cmd> DapStepOver <CR>", desc = "Step over next instruction" }, -- change description but the same command

          -- AsyncRun command key mappings
          --
          ["<F10>"] = {
            "<cmd> :AsyncRun -mode=term -pos=TAB cargo run <CR>",
            desc = "Execute Rust command Cargo run",
          },

          ["<F9>"] = {
            '<cmd> :AsyncRun -mode=term -pos=TAB clang++ -g -std=c++2b -Wall -Werror -Wpedantic -fexperimental-library -O3 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lpthread  <CR>',
            desc = "Compile C++ code with Clang++ and AsyncRun",
          },
          -- ["<F8>"] = {
          --   "<cmd> :AsyncRun -cwd=<root> make",
          --   desc = "Execute make on the directory",
          -- },
          --
          ["<F8>"] = {
            '<cmd> :AsyncRun -mode=term -pos=TAB g++ -g -std=c++23 -Wall -Werror  "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lpthread  <CR>',
            desc = "Compile C++ code with g++ and AsyncRun without -Wpedantic option",
          },

          ["<F5>"] = {
            '<cmd> :AsyncRun -mode=term -pos=TAB "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>',
            desc = "Execute compiled binary",
          },

          ["<F6>"] = {
            '<cmd> :AsyncRun -mode=term -pos=TAB -cwd=$(VIM_FILEDIR) python "$(VIM_FILEPATH)" <CR>',
            desc = "Run python file",
          },

          -- Move current line / block with Alt-j/k a la vscode.
          ["<A-j>"] = ":m .+1<CR>==",
          ["<A-k>"] = ":m .-2<CR>==",

          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
        i = {
          ["<C-h>"] = { "<left>", desc = "Go left in insert mode" }, -- change description but the same command
          ["<C-j>"] = { "<down>", desc = "Go down in insert mode" }, -- change description but the same command
          ["<C-k>"] = { "<up>", desc = "Go up in insert mode" }, -- change description but the same command
          ["<C-l>"] = { "<right>", desc = "Go right in insert mode" }, -- change description but the same command
          ["çç"] = { "<esc>", desc = "Go to normal mode" }, -- change description but the same command
          -- Move current line / block with Alt-j/k ala vscode.
          ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move current line down" },
          -- Move current line / block with Alt-j/k ala vscode.
          ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move current line up" },
        },
        v = {
          -- Move current line / block with Alt-j/k ala vscode.
          ["<A-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move selected block down" },
          ["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move selected block up" },
        },
        -- x = {
        --   ["<A-k>"] = { "<cmd>'<,'>m '<-2<CR>gv-gv", desc = "Move block up" },
        --   ["<A-j>"] = { "<cmd>'<,'>m '>+1<CR>gv-gv", desc = "Move block down" },
        -- },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
