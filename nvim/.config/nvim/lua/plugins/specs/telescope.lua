-- installation and configuration of telescope and some of their extensions
-- specifically the file_browser extension and the built int Help


local function _config_telescope(_, _)
    local telescope = require('telescope')
    local builtin   = require('telescope.builtin')


    local telescope_file_browser_configuration = {
        initial_mode = 'normal',
        dir_icon = '📁',
        grouped = true,
    }

    telescope.setup({
        defaults = {
            color_devicons = false,
        },

        extensions={
            file_browser = telescope_file_browser_configuration,
        },
    })


    -- create autocommand to change the type of buffer of telescope when it opens
    -- this because, currently telescope want to save changes when exits with :q
    vim.cmd('augroup telescope')
    vim.cmd('au!')
    vim.cmd('au FileType TelescopePrompt setlocal buftype=nowrite bufhidden=delete noswapfile')
    vim.cmd('augroup END')


    -- method to open telescope help_picker builtin
    vim.api.nvim_create_user_command('H', builtin.help_tags, {
        desc = "Open telescope help_picker",
    })


    -- method to open telescope_file_browser 
    telescope.load_extension('file_browser') -- load file_browser extension to telescope

    local function open_telescope_file_browser()
        local path_to_open = vim.fn.expand('%:p:h')

        telescope.extensions.file_browser.file_browser({
            path = path_to_open
        })
    end

    vim.api.nvim_create_user_command('E', open_telescope_file_browser, {
        desc = "Open telescope_file_explorer"
    })

end


return {
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch='0.1.x',
        dependencies={
            'nvim-lua/plenary.nvim',
            --Extensions
            'nvim-telescope/telescope-file-browser.nvim', --file-browser extension
        },
        config=_config_telescope
    },
}
