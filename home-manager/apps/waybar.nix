{
  config,
  pkgs,
  ...
}:
let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
in
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "margin" = "5";
        "spacing" = 14;
        modules-left = [
          "temperature"
          "cpu"
          "memory"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "idle_inhibitor"
          "bluetooth"
          "backlight"
          "pulseaudio"
          "battery"
          "clock"
        ];

        "temperature" = {
          "critical-threshold" = 90;
          "thermal-zone" = 4;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [
            ""
            ""
            ""
          ];
          "tooltip" = true;
          "interval" = 1;
        };

        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
        };

        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 90;
          };
        };

        "hyprland/window" = {
          "format" = "{initialTitle}";
          "rewrite" = {
            "Zen Twilight" = " Browser";
            "wezterm" = " Term";
          };
        };

        "hyprland/workspaces" = {
          "show-special" = true;
          "persistent-workspaces" = {
            "*" = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              10
            ];
          };
          "format" = "{icon}";
          "format-icons" = {
            "active" = "";
            "empty" = "";
            "default" = "";
            "urgent" = "";
            "special" = "󰠱";
          };
        };

        "tray" = {
          "spacing" = "10";
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "󰛊";
            "deactivated" = "󰾫";
          };
        };

        "bluetooth" = {
          "format-on" = "󰂯";
          "format-off" = "󰂲";
          "format-connected" = "󰂰 {device_alias}";
        };

        "backlight" = {
          "interval" = 2;
          "format" = "󰖨 {percent}%";
          "on-scroll-up" = "${brightnessctl} set +5%";
          "on-scroll-down" = "${brightnessctl} set 5%-";
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
          "tooltip" = false;
        };

        "battery" = {
          "format" = "{icon} {capacity}%";
          "format-full" = " {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "interval" = 30;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "tooltip" = false;
        };

        "clock" = {
          "format-alt" = "{:%Y-%m-%d}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      }
    ];

    style = ''
      window#waybar {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 1.1rem;
        border-radius: 0.5rem;
        background-color: rgba(36, 39, 58, 0.75);
        color: #cad3f5;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background: transparent;
        padding: 6px 12px;
      }

      #workspaces button {
        font-size: 1rem;
        padding: 0 0.3rem 0 0;
      }

      #clock {
        font-weight: bolder;
      }

      #battery {
        color: #a6da95;
      }

      #backlight {
        color: #eed49f;
      }

      #bluetooth {
        color: #8aadf4;
        font-size: 1.3rem;
      }

      #bluetooth.connected {
        font-size: 1.1rem;
      }

      #idle_inhibitor {
        color: #f4dbd6;
        font-size: 1.3rem;
        padding-right: 4px;
      }

      #window {
        font-weight: 500;
        margin-left: 12px;
      }

      #memory {
        color: #f5bde6;
      }

      #cpu {
        color: #91d7e3;
      }

      #temperature {
        color: #c6a0f6;
      }
    '';
  };
}
