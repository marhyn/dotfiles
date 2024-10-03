--[[
return {
  {
    "williamboman/mason.nvim",
    lazy=false,
      opts = {
        ensure_installed= {"tsserver", "volar"},
      }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy=false,
    dependencies = {
      "mason.nvim",
    },
    opts = {
      ensure_installed= {"tsserver", "volar"},
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy=false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts= function()
      return {
        setup = {
          tsserver = {
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "/Users/marhyn/.nvm/versions/node/v20.9.0/lib/node_modules/@vue/typescript-plugin",
                  languages = { "javascript", "typescript", "vue" },
                },
              },
            },
            filetypes = {
              "javascript",
              "typescript",
              "vue",
            },
          }
        }
      }
    end,
  }
}
]]

return {
  -- Mason.nvim setup
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "typescript-language-server", "vue-language-server" },
    },
  },
  -- Mason-lspconfig.nvim setup
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "tsserver", "volar" },
    },
  },
  -- Nvim-lspconfig setup
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      LazyVim.lsp.on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- Setup tsserver with custom options
      lspconfig.tsserver.setup {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/Users/marhyn/.nvm/versions/node/v20.9.0/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = { "javascript", "typescript", "vue" },
      }

      -- Setup volar if needed
      lspconfig.volar.setup {}

      lspconfig.lua_ls.setup {}
    end,
  },
}

