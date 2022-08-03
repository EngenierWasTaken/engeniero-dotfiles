-- Just an example, supposed to be placed in /lua/custom/

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onedark",
}

M.plugins = {
  user = {
    ["goolord/alpha-nvim"] = {
      disable = false,
    },

    ["akinsho/toggleterm.nvim"] = {
      config = function()
        require "toggleterm".setup{
          direction = "float",
          float_opts = {
            border = "curved",
            winblend = 3,
          },
        }
      end
    },

    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
  },

  -- To change the Packer `config` of a plugin that comes with NvChad,
  -- add a table entry below matching the plugin github name
  --              '-' -> '_', remove any '.lua', '.nvim' extensions
  -- this string will be called in a `require`
  --              use "(custom.configs).my_func()" to call a function
  --              use "custom.blankline" to call a file
}

return M
