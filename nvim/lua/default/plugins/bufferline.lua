return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        show_buffer_close_icons = false,
        indicator = { style = "none" },
        separator_style = { "", "" },
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>q", bufferline.close_others)
    -- stylua: ignore
    vim.keymap.set("n", "L", function() bufferline.cycle(1) end)
    -- stylua: ignore
    vim.keymap.set("n", "H", function() bufferline.cycle(-1) end)
  end,
}

