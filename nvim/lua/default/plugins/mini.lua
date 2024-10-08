return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    local mini_surround = require("mini.surround")
    local mini_pairs = require("mini.pairs")
    local mini_move = require("mini.move")
    local mini_cursorword = require("mini.cursorword")

    mini_surround.setup()
    mini_pairs.setup()
    mini_cursorword.setup()

    mini_move.setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<M-Left>",
        right = "<M-Right>",
        down = "<M-Down>",
        up = "<M-Up>",

        -- Move current line in Normal mode
        line_left = "<M-Left>",
        line_right = "<M-Right>",
        line_down = "<M-Down>",
        line_up = "<M-Up>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })
  end,
}
