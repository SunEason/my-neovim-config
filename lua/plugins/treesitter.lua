return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", 
          "javascript","vue","json",
          "html" ,"typescript","tsx",
          "css","rust","cpp","go",
        },
        sync_install = false,
        highlight = { 
          enable = true ,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },  
        -- 启用增量选择模块
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
      })
    -- 开启 Folding 模块
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99
  end
}