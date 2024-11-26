return {
  -- Colorschemes
  -- the colorscheme should be available when starting Neovim
  { 'williamboman/mason.nvim' },
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  'dracula/vim',
  'bluz71/vim-moonfly-colors',
  'catppuccin/nvim',
  {
    'metalelf0/jellybeans-nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    enabled = false,
  },
  'tpope/vim-vinegar',
  'tpope/vim-fugitive',
  'sjl/gundo.vim',

  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat'
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      pre_hook = function ()
        require('ts_context_commentstring.internal').update_commentstring()
      end
    },
    -- config = function()
    --   require('Comment').setup({
    --     pre_hook = function ()
    --       require('ts_context_commentstring.internal').update_commentstring()
    --     end
    --   })
    -- end,
    dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },

  {
    'levouh/tint.nvim',
    opts = {
      tint = -45,  -- Darken colors, use a positive value to brighten
      saturation = 0.6,  -- Sat
    },
  },

  -- {
  --   'sunjon/Shade.nvim',
  --   config = function()
  --     require'shade'.setup({
  --       overlay_opacity = 55,
  --       opacity_step = 1,
  --       keys = {
  --         --brightness_up    = '<C-Up>',
  --         --brightness_down  = '<C-Down>',
  --         toggle           = '<Leader>s',
  --       }
  --     })
  --   end,
  -- },

  {
    'vim-scripts/kwbdi.vim',
    keys = {
      { "<C-W>!", "<Plug>Kwbd", mode = "n" },
    },
    -- config = function()
    --   vim.api.nvim_set_keymap('n', '<C-W>!', '<Plug>Kwbd', {})
    -- end,
  },

  {
    "folke/trouble.nvim",
    cmd = 'Trouble',
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },

    },
    -- config = function()
    --   require("trouble").setup {}
    --   vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
    --     {silent = true, noremap = true}
    --   )
    --   vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
    --     {silent = true, noremap = true}
    --   )
    --   vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
    --     {silent = true, noremap = true}
    --   )
    --   vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    --     {silent = true, noremap = true}
    --   )
    --   vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    --     {silent = true, noremap = true}
    --   )
    --   vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
    --     {silent = true, noremap = true}
    --   )
    -- end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- ensure_installed = "all",
        highlight = {
          enable = true
        },
        context_commentrstring = {
          enable = true,
          -- disable CursorHold autocmd for this plugin
          enable_autocmd = false,
        }
      }
    end,
    dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'}
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- -- Next, you can provide a dedicated handler for specific servers.
        -- -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function ()
        --     require("rust-tools").setup {}
        -- end
        ["lua_ls"] = function ()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    "vim",
                  }
                }
              }
            }
          }
        end
      }
    end,
  },

  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
      'hrsh7th/cmp-nvim-lua', -- source for neovim's runtime API
      'onsails/lspkind-nvim',
      'L3MON4D3/LuaSnip', -- Snippets plugin
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    },
    config = function()
      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menu,menuone,noselect'
      local luasnip = require 'luasnip'
      local cmp = require 'cmp'
      cmp.setup {
        completion = {
          -- completeopt = 'menu,menuone,noinsert',
          completeopt = 'menu,menuone,noselect',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Esc>'] = cmp.mapping.abort(),
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = {
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          -- { name = 'neorg' },
        },
        formatting = {
          format = require('lspkind').cmp_format({
            with_text = true,
            maxwidth = 50,
          })
        }
      }
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    -- dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      vim.cmd([[
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      ]])

    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "folke/tokyonight.nvim",
      'kyazdani42/nvim-web-devicons',
    },
    opts = {
      options = {theme = 'tokyonight'},
      extensions = {'fugitive','nvim-tree'}
    },
    -- config = function()
    --   require'lualine'.setup {
    --     options = {theme = 'tokyonight'},
    --     extensions = {'fugitive','nvim-tree'}
    --   }
    -- end
  },

  {
    "ray-x/go.nvim",
    ft = {"go"},
    config = function()
      require("go").setup()
      -- Import on save
      vim.api.nvim_exec([[
        autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
      ]], false)

      vim.cmd([[
          autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)
      ]])
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  }
}
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
-- gopls eslint vuels vimls bashls pyright jsonls tsserver yamlls html dockerls diagnosticls
