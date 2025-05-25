if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2025-05-22 05:25:03
set PATH $PATH /home/arun/.local/bin


if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    exec Hyprland
end
