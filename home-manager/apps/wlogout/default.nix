{ ... }:
let
  hibernate = builtins.path {
    path = ./icons/hibernate.png;
  };
  hibernate-hover = builtins.path {
    path = ./icons/hibernate-hover.png;
  };
  lock = builtins.path {
    path = ./icons/lock.png;
  };
  lock-hover = builtins.path {
    path = ./icons/lock-hover.png;
  };
  logout = builtins.path {
    path = ./icons/logout.png;
  };
  logout-hover = builtins.path {
    path = ./icons/logout-hover.png;
  };
  power = builtins.path {
    path = ./icons/power.png;
  };
  power-hover = builtins.path {
    path = ./icons/power-hover.png;
  };
  restart = builtins.path {
    path = ./icons/restart.png;
  };
  restart-hover = builtins.path {
    path = ./icons/restart-hover.png;
  };
  sleep = builtins.path {
    path = ./icons/sleep.png;
  };
  sleep-hover = builtins.path {
    path = ./icons/sleep-hover.png;
  };

in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "pidof hyprlock || hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];

    style = ''
      window {
        font-family: JetBrainsMono Nerd Font;
        font-size: 14pt;
        color: #cdd6f4; /* text */
        background-color: rgba(30,
        30,
        46,
        0.5);
      }
    
      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border: none;
        background-color: rgba(30,
        30,
        46,
        0);
        margin: 5px;
        transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }
    
      button:hover {
        background-color: rgba(49,
        50,
        68,
        0.1);
      }
    
      button:focus {
        background-color: #cba6f7;
        color: #1e1e2e;
      }
    
      #lock {
        background-image: image(url("${lock}"));
      }
      #lock:focus {
        background-image: image(url("${lock-hover}"));
      }
    
      #logout {
        background-image: image(url("${logout}"));
      }
      #logout:focus {
        background-image: image(url("${logout-hover}"));
      }
    
      #suspend {
        background-image: image(url("${sleep}"));
      }
      #suspend:focus {
        background-image: image(url("${sleep-hover}"));
      }
    
      #shutdown {
        background-image: image(url("${power}"));
      }
      #shutdown:focus {
        background-image: image(url("${power-hover}"));
      }
    
      #reboot {
        background-image: image(url("${restart}"));
      }
      #reboot:focus {
        background-image: image(url("${restart-hover}"));
      }
      #hibernate {
        background-image: image(url("${hibernate}"));
      }
      #hibernate:focus {
        background-image: image(url("${hibernate-hover}"));
      }
    '';
  };
}
