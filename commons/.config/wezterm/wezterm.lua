local wezterm = require 'wezterm'
local act = wezterm.action

return {
  -- 見た目関連
  font = wezterm.font("Cica", { weight="Regular", stretch="Normal", style="Normal" }),
  font_with_fallback = wezterm.font("Cica", { weight="Regular", stretch="Normal", style="Normal" }),
  font_size = 17.0,
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
    { mods = "LEADER", key = "z",     action = act.TogglePaneZoomState                       },
    { mods = 'LEADER', key = 'H',     action = act.AdjustPaneSize { 'Left', 2 }              },
    { mods = 'LEADER', key = 'J',     action = act.AdjustPaneSize { 'Down', 2 }              },
    { mods = 'LEADER', key = 'K',     action = act.AdjustPaneSize { 'Up', 2 }                },
    { mods = 'LEADER', key = 'L',     action = act.AdjustPaneSize { 'Right', 2 }             },

    -- tab managements
    { mods = "LEADER", key = "c",     action = act.SpawnTab("CurrentPaneDomain")             },
  },
}
