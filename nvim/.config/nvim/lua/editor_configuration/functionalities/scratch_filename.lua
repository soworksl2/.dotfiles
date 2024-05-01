-- set the filename to the scratch buffer

local FULL_SCRATCH_FILENAME = '~/documents/nvim-scratch'

local normalized_scratch_filename = vim.fs.normalize(FULL_SCRATCH_FILENAME)

local buf_name = vim.api.nvim_buf_get_name(0)

if buf_name == '' then
    vim.api.nvim_buf_set_name(0, normalized_scratch_filename)
end
