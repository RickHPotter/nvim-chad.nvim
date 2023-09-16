local M = {}

--[[ keys.lua ]]
local mapper = function(mode, key, result) vim.keymap.set(mode, key, result,
  { noremap = true, silent = true }
) end

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- while typing
mapper("i", "jj", "<Esc>") -- leave insert mode
mapper("i", "<Esc>", "<Esc>") -- leave insert mode

mapper("i", "<A-n><A-m>", "<Esc>o") -- new line next line
mapper("i", "<A-m><A-n>", "<Esc>O") -- new line previous line

mapper("i", "<A-c><A-m>", "<Esc>yypi") -- duplicate current line down
mapper("i", "<A-c><A-n>", "<Esc>yyPi") -- duplicate current line up

mapper("i", "<C-j>", "<Esc>ddpI") -- move line down
mapper("i", "<C-k>", "<Esc>ddkPi") -- move line up

mapper("i", "<C-[>", "<Esc>><CR>I") -- ident right
mapper("i", "<C-]>", "<Esc><<CR>I") -- ident left

-- while commanding
mapper("n", "<C-j>", "ddp") -- move line down
mapper("n", "<C-k>", "ddkP") -- move line up

mapper("n", "<A-n><A-m>", "o<Esc>") -- new line next line
mapper("n", "<A-m><A-n>", "O<Esc>") -- new line previous line

mapper("n", "<A-c><A-m>", "<Esc>yyp") -- duplicate current line down
mapper("n", "<A-c><A-n>", "<Esc>yyP") -- duplicate current line up

-- encapsulators
mapper("x", "'", "di'<Esc>pa'")
mapper("x", '"', "di'<Esc>pa'")
mapper("x", "`", "di`<Esc>pa`")
mapper("x", "[", "di[<Esc>pa]")
mapper("x", "{", "di{<Esc>pa}")
mapper("x", "<", "di<<Esc>pa>")

-- navigation
mapper("n", "<C-Up>", ":resize -2<CR>")
mapper("n", "<C-Down>", ":resize +2<CR>")
mapper("n", "<C-Left>", ":vertical resize -2<CR>")
mapper("n", "<C-Right>", ":vertical resize +2<CR>")

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}
--
-- GO
-- 
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}
--
-- RUST
-- 
M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}
return M
