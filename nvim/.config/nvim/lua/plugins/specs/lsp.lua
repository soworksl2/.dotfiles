-- install plugins to use LSP


local function _lspconfig_config(_, _)
    local lspconfig = require('lspconfig')
    local cmp_lsp = require('cmp_nvim_lsp')


    local LSP_SERVERS_CONFIGURATIONS = {
        require('plugins.specs.lsp_server_configurations.pyright'),
        require('plugins.specs.lsp_server_configurations.omnisharp'),
        require('plugins.specs.lsp_server_configurations.lua_ls'),
    }


    local cmp_lsp_capabilities = cmp_lsp.default_capabilities()
    local default_lsp_config = {
        capabilities = cmp_lsp_capabilities,
        single_file_support = false,
        root_dir = function (filename, _)
            local cwd = vim.fn.getcwd()
            cwd = vim.fs.normalize(cwd)
            filename = vim.fs.normalize(filename)

            for parent_dir in vim.fs.parents(filename) do
                if parent_dir == cwd then
                    return cwd
                end
            end

            return nil
        end,
        on_attach = function (client, bufferid)
            -- simulate that any lsp server have not semanticTokensProvider capabilities
            -- because some lsp server don't follow the standard with the legend and 
            -- it could cause neovim to bug
            client.server_capabilities.semanticTokensProvider = nil

            -- create keymap to rename a symbol using lsp
            vim.keymap.set('n', '<F2>', '', {
                desc = 'rename a symbol using lsp',
                callback = function ()
                    vim.lsp.buf.rename()
                end,
                buffer = bufferid
            })
        end
    }

    for _, default_lsp in ipairs(LSP_SERVERS_CONFIGURATIONS) do
        local server_id = default_lsp.server_id
        local server_configuration = default_lsp.configuration or {}

        server_configuration = vim.tbl_extend('force', default_lsp_config, server_configuration)

        lspconfig[server_id].setup(server_configuration)
    end
end

local function _mason_config(_, _)
    require('mason').setup({
        ui={
            icons={
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end


return {
    -- Mason to download and install LSP for different languages
    {
        'williamboman/mason.nvim',
        build = function()
            vim.cmd(':MasonUpdate')
        end,
        config = _mason_config
    },
    -- lsp_config
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp'
        },
        config = _lspconfig_config,
    }
}
