local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/usr/bin/zsh' , '-l' }

config.color_scheme = 'Tokyo_Night'

config.colors = {
  background = '#141414'
}

config.keys = {-- Dev utilities
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key="Enter", 
    mods="SHIFT", 
    action=wezterm.action.SendString "\x1b\r"
  },
  {
    key = 'D',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ReloadConfiguration
  },

  -- Pane lifecycle
  {
    key = 'N',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal
  },
  {
    key = 'M',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical
  },
  {
    key = 'U',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false }
  },

  -- Pane traversal
  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'J',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down'
  },  
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'L',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right'
  },

  -- Copy/paste
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CopyTo 'Clipboard'
  },
  {
    key = 'V',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard'
  },

  -- Edit current command in external editor (Ctrl+X Ctrl+E)
  {
    key = 'I',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SendString '\x18\x05'
  }
}

config.disable_default_key_bindings = true

config.mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- Make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.Nop,
  },
}

-- Disable ligatures
config.harfbuzz_features = { 'calt=0' }

return config
