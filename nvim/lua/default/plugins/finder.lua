return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        preview = {
          layout = "vertial",
          vertical = "down:60%",

          -- layout = "horizontal",
          -- horizontal = "right:60%",
        },
      },

      oldfiles = { cwd_only = true },
    })

    -- vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = "asas" })

    local fzf = require("fzf-lua")

    vim.keymap.set("n", "<leader>ht", fzf.help_tags, { noremap = true, silent = true, desc = "fzf help tags" })
    vim.keymap.set("n", "<leader>hk", fzf.keymaps, { noremap = true, silent = true, desc = "fzf keymaps" })

    vim.keymap.set("n", "<leader>ff", fzf.files, { noremap = true, silent = true, desc = "fzf files" })
    vim.keymap.set("n", "<leader>fc", fzf.commands, { noremap = true, silent = true, desc = "fzf commands" })
    vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { noremap = true, silent = true, desc = "fzf oldfiles" })
    vim.keymap.set("n", "<leader>fr", fzf.grep_project, { noremap = true, silent = true, desc = "fzf in project lines" })
    vim.keymap.set("n", "<leader>fa", fzf.grep_curbuf, { noremap = true, silent = true, desc = "fzf in current buffer" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { noremap = true, silent = true, desc = "fzf buffers" })
    vim.keymap.set("n", "<leader>ft", fzf.tabs, { noremap = true, silent = true, desc = "fzf tabs" })

    vim.keymap.set("n", "<leader>cw", fzf.grep_cword, { noremap = true, silent = true, desc = "fzf current word" })
    vim.keymap.set("n", "<leader>ccw", function()
      fzf.lgrep_curbuf({ search = vim.fn.expand("<cword>") })
    end, { noremap = true, silent = true, desc = "fzf current word in current buffer" })
  end,
}
