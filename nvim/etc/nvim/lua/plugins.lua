vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup({
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  },
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'dracula/vim'
    use 'bluz71/vim-moonfly-colors'
    use 'catppuccin/nvim'
    use { 'metalelf0/jellybeans-nvim', requires = 'rktjmp/lush.nvim' }

    use 'tpope/vim-vinegar'
    use 'tpope/vim-fugitive'
    use {
      'ggandor/lightspeed.nvim',
      requires = {
        'tpope/vim-repeat'
      }
    }
    use 'sjl/gundo.vim'
    use 'b0o/mapx.nvim'

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          pre_hook = function ()
            require('ts_context_commentstring.internal').update_commentstring()
          end
        })
      end,
      requires = { {'JoosepAlviste/nvim-ts-context-commentstring'} }
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }

    use {
      'sunjon/Shade.nvim',
      config = function()
        require'shade'.setup({
          overlay_opacity = 55,
          opacity_step = 1,
          keys = {
            --brightness_up    = '<C-Up>',
            --brightness_down  = '<C-Down>',
            toggle           = '<Leader>s',
          }
        })
      end
    }

    use {
      'vim-scripts/kwbdi.vim',
      config = function()
        vim.api.nvim_set_keymap('n', '<C-W>!', '<Plug>Kwbd', {})
      end
    }

    use {
      "folke/trouble.nvim",
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function()
        require("trouble").setup {}
        vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
          {silent = true, noremap = true}
        )
        vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
          {silent = true, noremap = true}
        )
        vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
          {silent = true, noremap = true}
        )
        vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
          {silent = true, noremap = true}
        )
        vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
          {silent = true, noremap = true}
        )
        vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
          {silent = true, noremap = true}
        )
      end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
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
      requires = { {'JoosepAlviste/nvim-ts-context-commentstring'} }
    }

    use {
      'neovim/nvim-lspconfig',
      requires = {
        {'williamboman/nvim-lsp-installer'},
        { 'hrsh7th/cmp-nvim-lsp' }, -- LSP source for nvim-cmp
      },
      config = function()
        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

          -- Enable completion triggered by <c-x><c-o>
          buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Mappings.
          local opts = { noremap=true, silent=true }

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          buf_set_keymap('n', '[Space]wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          buf_set_keymap('n', '[Space]wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
          buf_set_keymap('n', '[Space]wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
          buf_set_keymap('n', '[Space]D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          buf_set_keymap('n', '[Space]rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
          buf_set_keymap('n', '[Space]ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap('n', '[Space]e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
          buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
          buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
          buf_set_keymap('n', '[Space]q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) --
          buf_set_keymap('n', '[Space]f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
          --
          -- Set some keybinds conditional on server capabilities
          if client.resolved_capabilities.document_formatting then
            buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
          elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
          end

          -- Set autocommands conditional on server_capabilities
          if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec([[
              hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
              hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
              hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]], false)
          end

        end

        -- Add additional capabilities supported by nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local lsp_installer = require("nvim-lsp-installer")
        lsp_installer.on_server_ready(function(server)
          local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
             flags = {
               debounce_text_changes = 150,
             }
          }

          if server.name == "diagnosticls" then
              opts.filetypes = {"sh", "json", "yaml", "yaml.cloudformation"}
              opts.init_options = {
                 filetypes = {
                   sh = "shellcheck",
                   ["yaml.cloudformation"] = "cfnlint",
                 },
                 linters = {
                   cfnlint = {
                     command = "cfn-lint",
                     args = {"--format", "json", "-"},
                     sourceName = "cfnlint",
                     parseJson = {
                       line = "Location.Start.LineNumber",
                       column = "Location.Start.ColumnNumber",
                       endLine = "Location.End.LineNumber",
                       endColumn = "Location.End.ColumnNumber",
                       message = "${Message} [${Rule.Id}]",
                       security = "Level"
                     },
                     securities = {
                       error = "Error",
                       warning = "Warning",
                       info = "Informational",
                       unknown = "Unknown",
                       -- style = "Hint"
                     }
                   },
                   shellcheck = {
                     command = "shellcheck",
                     debounce = 100,
                     args = {"--format", "json", "-"},
                     sourceName = "shellcheck",
                     parseJson = {
                       line = "line",
                       column = "column",
                       endLine = "endLine",
                       endColumn = "endColumn",
                       message = "${message} [${code}]",
                       security = "level"
                     },
                     securities = {
                       error = "error",
                       warning = "warning",
                       info = "info",
                       style = "hint"
                     }
                   },
                 }
              }
           elseif server.name == 'yamlls' then
             opts.settings = {
               format = {
                 enable = true,
               },
               hover = true,
               completion = true,
               yaml = {
                 customTags = {
                   "!And sequence",
                   "!Base64 mapping",
                   "!Cidr scalar",
                   "!Cidr sequence",
                   "!Condition scalar",
                   "!Condition",
                   "!Equals sequence",
                   "!FindInMap sequence",
                   "!Fn",
                   "!GetAZs scalar",
                   "!GetAZs",
                   "!GetAtt scalar",
                   "!GetAtt sequence",
                   "!GetAtt",
                   "!If sequence",
                   "!If",
                   "!ImportValue mapping",
                   "!ImportValue scalar",
                   "!ImportValue",
                   "!Join sequence",
                   "!Not sequence",
                   "!Or sequence",
                   "!Ref Scalar",
                   "!Ref scalar",
                   "!Ref",
                   "!Select",
                   "!Split sequence",
                   "!Split",
                   "!Sub scalar",
                   "!Sub sequence",
                   "!Sub",
                   "!Transform mapping",
                 }
               }
             }
          end
          -- This setup() function is exactly the same as lspconfig's setup function
          -- (:help lspconfig-quickstart)
          server:setup(opts)
          vim.cmd [[ do User LspAttachBuffers ]]
        end)

        -- Enable diagnostics
        vim.g.diagnostics_visible = true
        vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
              underline = true,
              virtual_text = true,
              signs = true,
              update_in_insert = true
            }
          )
      end,
    }

    use {
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      requires = {
        { 'L3MON4D3/LuaSnip' }, -- Snippets plugin
        {'hrsh7th/cmp-nvim-lua'}, -- source for neovim's runtime API
        { 'hrsh7th/cmp-nvim-lsp' }, -- LSP source for nvim-cmp
        { 'hrsh7th/cmp-buffer' }, -- Buffer source for nvim-cmp
        { 'saadparwaiz1/cmp_luasnip' }, -- Snippets source for nvim-cmp
        { 'onsails/lspkind-nvim' },
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
            { name = 'neorg' },
          },
          formatting = {
            format = require('lspkind').cmp_format({
              with_text = true,
              maxwidth = 50,
            })
          }
        }
      end
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        vim.cmd([[
          nnoremap <leader>ff <cmd>Telescope find_files<cr>
          nnoremap <leader>fg <cmd>Telescope live_grep<cr>
          nnoremap <leader>fb <cmd>Telescope buffers<cr>
          nnoremap <leader>fh <cmd>Telescope help_tags<cr>
        ]])

      end
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = {
        {"folke/tokyonight.nvim"},
        {'kyazdani42/nvim-web-devicons'},
      },
      config = function()
        require'lualine'.setup {
          options = {theme = 'tokyonight'},
          extensions = {'fugitive','nvim-tree'}
        }
      end
    }

    use {
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
      requires = {
        {'nvim-treesitter/nvim-treesitter'},
        {'nvim-treesitter/nvim-treesitter-textobjects'},
      },
    }

    use {
      "nvim-neorg/neorg",
      config = function()
        require('neorg').setup {
          -- Tell Neorg what modules to load
          load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
              config = {
                workspaces = {
                  my_workspace = "~/neorg"
                }
              }
            },
            ["core.norg.completion"] = {
              config = {
                engine = "nvim-cmp"
              }
            },
          },
        }
      end,
      requires = "nvim-lua/plenary.nvim"
    }

    -- Post-install/update hook with call of vimscript function with argument
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  end,
})
-- gopls eslint vuels vimls bashls pyright jsonls tsserver yamlls html dockerls diagnosticls
