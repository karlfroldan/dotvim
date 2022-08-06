vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself.
    use 'wbthomason/packer.nvim'
    use { 'ellisonleao/gruvbox.nvim' }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }
    use{'akinsho/toggleterm.nvim', tag = 'v2.*', config = function()
        require('toggleterm').setup()
    end}
end)

--require('nvim-tree').setup()
