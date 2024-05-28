{
  ...
}: {
  wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";

      "$terminal" = "kitty";
      "$fileManager" = "kitty yazi";
      "$appLauncher" = "anyrun";

      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
      ];

      exec-once = [
        "hypridle"
        "swww-daemon"
      ];
    
      general = {
        monitor = "eDP-1,1440x900@60.01,0x0,1";
        border_size = 2;
        no_border_on_floating = true;
        gaps_in = 5;
        gaps_out = 10;

        "col.inactive_border" = "#101010";
        "col.active_border" = "#DD33DD";

        layout = "dwindle";
        resize_corner = 1;
      };

      master = {
        new_is_master = true;
      };

      decoration = {
        rounding = 10;

        active_opacity = 0.8;
        inactive_opacity = 0.6;
        fullscreen_opacity = 1.0;

        drop_shadow = false;

        
        blur = {
          enabled = true;
          size = 10;
          pases = 20;
          new_optimizations = true;
        };
      };

      input = {
        kb_layout = "us";
        sensitivity = 1.0;
      };

      misc = {
        disable_hyprland_logo = false;
        font_family = "ComicSans";
      };

      bind = [
        # Apps
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, M, exec, $appLauncher"

        # Misc
        "$mainMod SHIFT, E, exit"

        # Layout
        "$mainMod, V, togglefloating,"
        "$mainMod, J, togglesplit,"
        "$mainMod, P, pseudo,"

        # Windows
        "$mainMod, W, killactive,"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, F, fullscreen"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Special misc
        ", XF86AudioMute, exec, pamixer --toggle-mute"
        ", XF86AudioRaiseVolume, exec, pamixer --increase 5"
        ", XF86AudioLowerVolume, exec, pamixer -decrease 5"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioStop, exec, playerctl pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      animations = {
        enabled = true;
      };

      animation = {
        bezier = [
          "inout,0.7,0.36,0.7,0.38"
          "linearMove,0.45,0.45,.0.45,0.45"
          "specialMove,0.43,1,0.80,-0.45"
        ];
        animation = [
          "windows,1,2.5,inout"
          "windowsMove,1,1.0,linearMove"
          "workspaces,1,2.0,linearMove"
          "specialWorkspace,1,5.0,specialMove"
        ];
    };
  };
}