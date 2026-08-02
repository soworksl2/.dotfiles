-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=
-- Programs
-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=

local launcher = 'wofi --show drun'
local terminal = 'alacritty'


hl.env('XCURSOR_SIZE', '24')


-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=
-- Config variables
-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=

hl.config({
    input = {
        kb_layout='us, es',
        kb_options='grp:win_space_toggle',
        follow_mouse=2,
        touchpad = {
            natural_scroll=true
        },
        sensitivity=0
    },

    misc = {
        disable_hyprland_logo = true
    },

    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = 'rgb(ebdbb2)',
            inactive_border = 'rgb(282828)'
        },
        layout='dwindle'
    },

    decoration = {
        blur = {
            enabled = false
        }
    },

    animations = {
        enabled = false
    },

    xwayland = {
        force_zero_scaling = true
    }
})


hl.monitor({
    output='desc:BOE 0x06E2',
    mode='1920x1080@48.01',
    position='0x0',
    scale='1.33'
})


-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=
-- binds
-- -+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=

hl.on('hyprland.start', function()
    hl.exec_cmd('waybar --bar "main"')
    hl.exec_cmd('~/.config/hypr/scripts/setwallpaper.sh')
end)


local SUPER = 'SUPER'

-- killing and closing
hl.bind(SUPER..' + CTRL + Q', hl.dsp.exit())
hl.bind(SUPER..' + Q', hl.dsp.window.close())
hl.bind('ALT + F4', hl.dsp.window.close())

-- volume control

hl.bind(
    'xf86audioraisevolume',
    hl.dsp.exec_cmd('pactl set-sink-volume @DEFAULT_SINK@ +1%'),
    {repeating=true})
hl.bind(
    'xf86audiolowervolume',
    hl.dsp.exec_cmd('pactl set-sink-volume @DEFAULT_SINK@ -1%'),
    {repeating=true})
hl.bind(
    'xf86audiomute',
    hl.dsp.exec_cmd('pactl set-sink-mute @DEFAULT_SINK@ toggle'))

-- Opening tools

hl.bind(SUPER..' + RETURN', hl.dsp.exec_cmd(launcher))
hl.bind(SUPER..' + CTRL + RETURN', hl.dsp.exec_cmd(terminal))
hl.bind(SUPER..' + SHIFT + S', hl.dsp.exec_cmd('$XDG_BIN_HOME/screenshot_menu.sh'))

-- windows manipulation

hl.bind(SUPER .. " + W", hl.dsp.window.float({ action = "toggle" }))

-- Move through windows
hl.bind(SUPER .. " + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind(SUPER .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(SUPER .. " + DOWN",  hl.dsp.focus({ direction = "d" }))
hl.bind(SUPER .. " + LEFT",  hl.dsp.focus({ direction = "l" }))

-- Move and resize windows
hl.bind(SUPER .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(SUPER .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Workspaces manipulation

-- Switch workspaces
hl.bind(SUPER .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(SUPER .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(SUPER .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(SUPER .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(SUPER .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(SUPER .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(SUPER .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(SUPER .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(SUPER .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(SUPER .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Scroll through workspaces
hl.bind(SUPER .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move active windows to another workspace
hl.bind(SUPER .. " + CTRL + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(SUPER .. " + CTRL + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(SUPER .. " + CTRL + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(SUPER .. " + CTRL + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(SUPER .. " + CTRL + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(SUPER .. " + CTRL + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(SUPER .. " + CTRL + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(SUPER .. " + CTRL + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(SUPER .. " + CTRL + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(SUPER .. " + CTRL + 0", hl.dsp.window.move({ workspace = 10 }))
