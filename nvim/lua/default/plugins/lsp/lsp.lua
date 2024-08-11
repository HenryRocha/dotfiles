return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "L3MON4D3/LuaSnip", branch = "v2.3.0" },
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local luasnip = require("luasnip")

    mason.setup()
    mason_lspconfig.setup({})

    -- Enable features that only work if there is a language server active in the current file.
    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })

      local opts = { buffer = bufnr }
      vim.keymap.set({ 'n', 'i' }, '<A-S-F>', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = cmp_nvim_lsp.default_capabilities(),
    })

    -- Configuration for specific LSP's goes here.
    lspconfig.ruff_lsp.setup({
      on_attach = function(client, bufnr)
        if client.name == "ruff_lsp" then
          -- Disable hover in favor of Pyright.
          client.server_capabilities.hoverProvider = false
        end
      end,
    })
    lspconfig.pyright.setup({})
    lspconfig.lua_ls.setup({
      on_init = function(client)
        lsp_zero.nvim_lua_settings(client, {})
      end,
    })

    -- Configuring autocompletion.
    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
      },
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.vim_snippet_jump_forward(),
        ["<C-b>"] = cmp_action.vim_snippet_jump_backward(),

        -- Scroll up and down in the completion documentation
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        -- Use Tab for cycling through available completion options.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Use Shift+Tab for cycling backwards through available completion options.
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    })
  end,
}
