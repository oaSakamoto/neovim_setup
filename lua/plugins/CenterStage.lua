return {
    {
    'oaSakamoto/CenterStage.nvim',
    opts = {
        disable_for_ft = {} 
    },
    config = function (_, opts)
        require('CenterStage').setup(opts)
    end
    }
}
