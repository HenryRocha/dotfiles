return {
  "EdenEast/nightfox.nvim",
  priority = 1000, -- make sure this plugin loads before any others
  config = function()
    require("nightfox").setup({})

    vim.cmd("colorscheme duskfox")
  end,
}
