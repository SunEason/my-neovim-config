--==========基础配置==========--
-- leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true,silent = true}
-- 取消 s 默认功能
map("n", "s", "", opt)
-- ctrl n p f b esc
map("i",",.","<Esc>",opt)
map("n","<C-g>","<Esc>",opt)
map("v","<C-g>","<Esc>",opt)
map("i","<C-n>","<Down>",opt)
map("i","<C-p>","<Up>",opt)
map("i","<C-f>","<Right>",opt)
map("i","<C-b>","<Left>",opt)
map("n","J","5j",opt)
map("n","K","5k",opt)
--==========基础配置==========--

--==========window==========--
-- windows 分屏快捷键
map("n", "<M-w>r", ":vsp<CR>", opt)
map("n", "<M-w>b", ":sp<CR>", opt)
-- 关闭当前
map("n", "<C-x>", "<C-w>c", opt)
-- 关闭其他
map("n", "<C-c>", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -20<CR>", opt)
map("n", "<C-Right>", ":vertical resize +20<CR>", opt)
map("n", "<C-r><C-l>", ":vertical resize -2<CR>", opt)
map("n", "<C-r><C-h>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-r><C-k>", ":resize +2<CR>", opt)
map("n", "<C-r><C-j>", ":resize -2<CR>", opt)
map("n", "<C-Down>", ":resize +20<CR>", opt)
map("n", "<C-Up>", ":resize -20<CR>", opt)
-- 等比例
map("n", "<M-w>e", "<C-w>=", opt)
--==========window==========--

--==========terminal==========--
-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
--==========terminal==========--

--==========代码移动==========--
-- visual模式下缩进代码
map("v", "H", "<gv", opt)
map("v", "L", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
--==========代码移动==========--

--==========退出保存快捷键==========--
-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
-- 保存
map("n", "qj",":w<CR>",opt)
map("n", "qk",":x<CR>",opt)
--==========退出保存快捷键==========--

--==========插件快捷键==========--
-- 插件快捷键
local pluginKeys = {}
------ nvim-tree ------
map("n", "<M-e>", ":NvimTreeToggle<CR>", opt)
pluginKeys.on_attach = function (bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- my_key_map 
  vim.keymap.set('n','<C-t>',api.tree.change_root_to_parent,opts('Up'))
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
end

------ nvim-tree ------

------ bufferline ------
-- 左右Tab切换
map("n", "H", ":BufferLineCyclePrev<CR>", opt)
map("n", "L", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "X", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
------ bufferline ------

------ telescope ------
map('n', '<leader>ff', ":Telescope find_files<CR>", opt)
map('n', '<leader>fg', ":Telescope live_grep<CR>", opt)
map('n', '<leader>fb', ":Telescope buffers<CR>", opt)
map('n', '<leader>fh', ":Telescope help_tags<CR>", opt)
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<C-j>"] = "cycle_history_next",
    ["<C-k>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-\\>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  }
}
------ telescope ------

------ toggleterm------
local execs = {
  {cmd=nil,keymap="<M-t>f",direction="float",size=nil,label = "float term"},
  {cmd=nil,keymap="<M-t>b",direction="horizontal",size=0.3,label = "horizontal term"},
  {cmd=nil,keymap="<M-t>r",direction="vertical",size=0.4,label = "vertical term"},
  {cmd="lazygit",keymap="<M-t>g",direction="float",size=nil,label = "lazygit term"},
}
--- Get current buffer size
---@return {width: number, height: number}
local function get_buf_size()
  local cbuf = vim.api.nvim_get_current_buf()
  local bufinfo = vim.tbl_filter(function(buf)
    return buf.bufnr == cbuf
  end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
  if bufinfo == nil then
    return { width = -1, height = -1 }
  end
  return { width = bufinfo.width, height = bufinfo.height }
end
--- Get the dynamic terminal size in cells
---@param direction string
---@param size number
---@return integer
local function get_dynamic_terminal_size(direction, size)
  size = size or 20
  if direction ~= "float" and tostring(size):find(".", 1, true) then
    size = math.min(size, 1.0)
    local buf_sizes = get_buf_size()
    local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
    return buf_size * size
  else
    return size
  end
end
-- create terminal
local function exec_toggle(opts)
  local Terminal = require("toggleterm.terminal").Terminal
  if opts.cmd == "lazygit" then
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      count = opts.count,
      direction = opts.direction,
      float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
      -- function to run on closing the terminal
      on_close = function(_) end,
    })
    lazygit:toggle(opts.direction)
  else
    local term = Terminal:new {cmd = opt.cmd,count = opts.count,direction = opts.direction}
    term:toggle(opts.size,opts.direction)
  end
end
for i,exec in pairs(execs) do
  local opts = {
    cmd = exec.cmd,
    keymap = exec.keymap,
    count = i + 100,
    label = exec.label,
    direction = exec.direction,
    size = function ()
      return get_dynamic_terminal_size(exec.direction,exec.size)
    end
  }
  vim.keymap.set({"n","t"},opts.keymap,function()
    exec_toggle{cmd = opts.cmd,count = opts.count,direction = opts.direction,size = opts.size()}
  end,{desc = opts.label,noremap = true,silent = true})
end
------ toggleterm------

------ lsp ------
-- lsp 回调函数快捷键设置
vim.api.nvim_buf_set_keymap(0,"n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "go", "<cmd>Lspsaga goto_definition<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
vim.api.nvim_buf_set_keymap(0,"n", "<leader>=", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
  mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end
------ lsp ------
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        -- 自定义代码段跳转到下一个参数
        ["<C-l>"] = cmp.mapping(function(_)
          if vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          end
        end, {"i", "s"}),

        -- 自定义代码段跳转到上一个参数
        ["<C-h>"] = cmp.mapping(function()
          if vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, {"i", "s"}),

        -- Super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, {"i", "s"})
        -- end of super Tab
    }
end
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}


return pluginKeys
--==========插件快捷键==========--
