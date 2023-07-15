return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = {{"nvim-tree/nvim-web-devicons"}},
  config = function ()
    local status,dashboard = pcall(require,"dashboard")
    if not status then
      vim.notify("没有找到 dashboard")
      return
    end
    dashboard.setup({
      theme = "doom",
      config={
        header = {
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
            [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
            [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
            [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
            [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
            [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
            [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
            [[                                                   ]],
            [[                [ version : 1.0.0 ]                ]],
          [[]],
          [[]],
          [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
          -- [[]],
        },
        footer = {
          "",
          "",
          "https://github.com/sunday217551/my-neovim-config",
        },
        center = {
          {
            icon = "  ",
            desc = "Projects                            ",
            action = "Telescope projects",
            key = "<leader>p"
          },
          {
            icon = "  ",
            desc = "Recently files                      ",
            action = "Telescope oldfiles",
            key = "<leader>r"
          },
          {
            icon = "󰥻  ",
            desc = "Edit keybindings                    ",
            action = "edit ~/.config/nvim/lua/keybindings.lua",
            key = "<leader>k"
          },
          {
            icon = "  ",
            desc = "Edit Projects                       ",
            action = "edit ~/.local/share/nvim/project_nvim/project_history",
            key = "<leader>e"
          },
          -- {
          --   icon = "  ",
          --   desc = "Edit .bashrc                        ",
          --   action = "edit ~/.bashrc",
          -- },
          -- {
          --   icon = "  ",
          --   desc = "Change colorscheme                  ",
          --   action = "ChangeColorScheme",
          -- },
          {
            icon = "  ",
            desc = "Find file                           ",
            action = "Telescope find_files",
            key = "<leader>f"
          },
          {
            icon = "  ",
            desc = "Find text                           ",
            action = "Telescope live_grep",
            key = "<leader>g"
          },
        }
      }
    })
  end
}
