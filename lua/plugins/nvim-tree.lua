return{
  "kyazdani42/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree") 
    -- 列表操作快捷键
    nvim_tree.setup{
        respect_buf_cwd = false,
        on_attach = function (bufnr)
          local api = require('nvim-tree.api')

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)
          -- my_key_map 
          vim.keymap.set('n','C',api.tree.change_root_to_parent,opts('CD'))
          vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
          vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
          vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
          vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
          vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
          vim.keymap.set('n', 'i', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
          vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
          vim.keymap.set('n', '<F5>', api.tree.reload, opts('Refresh'))
          vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
          vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
          vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
          vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
          vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
          vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
          vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
        end,
        -- 不显示 git 状态图标
        git = {
            enable = false,
        },
        -- 隐藏 .文件 和 node_modules 文件夹
        filters = {
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = { "node_modules","\\.cache" },
            exclude = {},
        },
        view = {
            -- 宽度
            width = 30,
            -- 也可以 'right'
            side = 'left',
            -- 隐藏根目录
            hide_root_folder = false,
            -- 自定义列表中快捷键
            mappings = {
                custom_only = false,
            },
            -- 不显示行数
            number = false,
            relativenumber = false,
            -- 显示图标
            signcolumn = 'yes',
        },
        actions = {
            open_file = {
                -- 首次打开大小适配
                resize_window = true,
                -- 打开文件时关闭
                quit_on_open = true,
            },
        },
        -- wsl install -g wsl-open
        -- https://github.com/4U6U57/wsl-open/
        system_open = {
            cmd = 'wsl-open', -- mac 直接设置为 open
        },
          -- project plugin 需要这样设置
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
    }
    -- 自动关闭
    vim.cmd([[
      autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ]])

  end,
}