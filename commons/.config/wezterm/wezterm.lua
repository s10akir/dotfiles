local wezterm = require 'wezterm'
local act = wezterm.action

return {
  default_domain = "unix",

  window_background_opacity = 0.6,
  background = {
    {
      source = {
        Color = "242936",
      },
      width = "100%",
      height = "100%",
    },
    {
      source = {
        File = {
          -- https://twitter.com/kaynimatic/status/1294982862710611968
          path = wezterm.config_dir .. "/pekora.gif",
        }
      },
      vertical_align = "Bottom",
      horizontal_align = "Right",
      height = "540",
      width = "1012",
      repeat_x = "NoRepeat",
    },
  },

  -- 見た目関連
  font = wezterm.font_with_fallback({
    -- primary font
    { family = "Cica", weight = "Regular" },

    -- emoji fallback font
    -- NOTE: テキスト用とは別で assume_emoji_presentation を明示的に指定しないと
    --       Cicaの持っているNerdFontが使われずに後続fallback（weztermデフォルトのNoto Color Emoji）が使われてしまう
    { family = "Cica", weight = "Regular", assume_emoji_presentation = true },

    -- secondary emoji fallback font
    -- NOTE: Cicaがもっていない絵文字用
    { family = "Twemoji Mozilla"},
  }),
  font_size = 17,
  color_scheme = "Ayu Mirage",
  window_background_opacity = 1,
  window_padding = {
    left   = 50,
    right  = 50,
    top    = 50,
    bottom = 50,
  },

  -- 下tab
  tab_bar_at_bottom = true,

  -- tab表示を無機質にする
  use_fancy_tab_bar = false,

  -- window borderの無効化
  window_decorations = "RESIZE",

  -- font_size変更に連動してウィンドウサイズを変更させない
  adjust_window_size_when_changing_font_size = false,

  leader = { key = "s", mods = "CTRL" },
  keys = {
    -- global
    { mods = "SUPER",  key = "Enter", action = act.ToggleFullScreen                          },
    { mods = "SUPER",  key = "n",     action = act.SpawnCommandInNewWindow { cwd = "$HOME" } },
    { mods = "LEADER", key = "[",     action = act.ActivateCopyMode                          },
    { mods = "LEADER", key = "]",     action = act.PasteFrom 'Clipboard'                     },
    { mods = "SUPER",  key = "+",     action = act.IncreaseFontSize                          },
    { mods = "SUPER",  key = "-",     action = act.DecreaseFontSize                          },
    { mods = "SUPER",  key = "0",     action = act.ResetFontSize                             },

    -- workspaces
    { mods = "LEADER", key = "s",     action = act.ShowLauncherArgs {flags = "WORKSPACES" }  },

    -- travels
    { mods = "LEADER", key = "h",     action = act.ActivatePaneDirection("Left")             },
    { mods = "LEADER", key = "j",     action = act.ActivatePaneDirection("Down")             },
    { mods = "LEADER", key = "k",     action = act.ActivatePaneDirection("Up")               },
    { mods = "LEADER", key = "l",     action = act.ActivatePaneDirection("Right")            },
    { mods = "LEADER", key = "p",     action = act.ActivateTabRelative(-1)                   },
    { mods = "LEADER", key = "n",     action = act.ActivateTabRelative(1)                    },

    -- pane managements
    { mods = "LEADER", key = "-",     action = act.SplitVertical                             },
    { mods = "LEADER", key = "|",     action = act.SplitHorizontal                           },
    -- { mods = "LEADER", key = "z",     action = act.TogglePaneZoomState                       },
    { mods = 'LEADER', key = 'H',     action = act.AdjustPaneSize { 'Left', 2 }              },
    { mods = 'LEADER', key = 'J',     action = act.AdjustPaneSize { 'Down', 2 }              },
    { mods = 'LEADER', key = 'K',     action = act.AdjustPaneSize { 'Up', 2 }                },
    { mods = 'LEADER', key = 'L',     action = act.AdjustPaneSize { 'Right', 2 }             },

    -- tab managements
    { mods = "LEADER", key = "c",     action = act.SpawnTab("CurrentPaneDomain")             },
  },
}
