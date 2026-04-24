# Bash configuration
{lib, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -lah --icons --git --group";
      la = "eza -a --icons --git --group";
      l = "eza -lh --icons --git --group";
      lt = "eza --icons --tree --group-directories-first";
      lg = "eza --tree --level=3 --icons --git --group";

      g = "git";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gca = "git commit -am";
      gco = "git checkout";
      gd = "git diff";
      gl = "git log --oneline --decorate --graph";
      gp = "git push";
      gpl = "git pull";
      gs = "git status -sb";

      nrs = "sudo nixos-rebuild switch";
      nrb = "nixos-rebuild build";
      nfu = "nix flake update";
      nfc = "nix flake check";

      dfh = "df -h";
      duh = "du -h";
      freeh = "free -h";
      top10 = "ps aux --sort=-%mem | head -n 11";

      code = "codium";
      config = "cd /home/mostafa/nixos-config/ && code .";
    };
    bashrcExtra = ''
      export EDITOR=nvim
      export MANPAGER="less -R"
      export EZA_ICONS_AUTO=1
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_latte";
      format = lib.concatStrings [
        "$directory"
        " $git_branch"
        "$git_status"
        "\n"
        "$character"
      ];
      character = {
        success_symbol = "[❯](bold green) ";
        error_symbol = "[❯](bold red) ";
        vimcmd_symbol = "[❮](subtext1) ";
      };
      directory = {
        truncation_length = 3;
        format = "[$path]($style)[$read_only]($read_only_style) ";
        style = "bold lavender";
        read_only = " 󰌾";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
        style = "bold mauve";
      };
      git_status = {
        format = "$all_status$ahead_behind ";
        style = "bold red";
      };
      python = {
        symbol = " ";
        style = "yellow";
      };
      nodejs = {
        symbol = "℻ ";
        style = "green";
      };
      rust = {
        symbol = "󱘗 ";
        style = "maroon";
      };
      golang = {
        symbol = " ";
        style = "sky";
      };
      nix_shell = {
        symbol = " ";
        style = "sky";
      };
      docker_context = {
        symbol = " ";
        style = "sky";
      };
      bun = {
        symbol = " ";
        style = "pink";
      };
      ruby = {
        symbol = " ";
        style = "red";
      };
      java = {
        symbol = " ";
        style = "peach";
      };
      kotlin = {
        symbol = " ";
        style = "yellow";
      };
      helm = {
        symbol = " ";
        style = "sky";
      };
      kubernetes = {
        symbol = "󱃾 ";
        style = "blue";
      };
      terraform = {
        symbol = "�.terraform ";
        style = "lavender";
      };
      aws = {
        symbol = "󰘦 ";
        style = "yellow";
      };
      cmake = {
        symbol = "󰌾 ";
        style = "blue";
      };
      elixir = {
        symbol = " ";
        style = "mauve";
      };
      erlang = {
        symbol = "󱟡 ";
        style = "red";
      };
      crystal = {
        symbol = "󍡕 ";
        style = "white";
      };
      lua = {
        symbol = "󰢱 ";
        style = "blue";
      };
      c = {
        symbol = "󰙱 ";
        style = "blue";
      };
      scala = {
        symbol = "󜚩 ";
        style = "red";
      };
      swift = {
        symbol = "󰛥 ";
        style = "peach";
      };

      palettes = {
        catppuccin_latte = {
          rosewater = "#dc8a78";
          flamingo = "#dd7878";
          pink = "#ea76cb";
          mauve = "#8839ef";
          red = "#d20f39";
          maroon = "#e64553";
          peach = "#fe640b";
          yellow = "#df8e1d";
          green = "#40a02b";
          teal = "#179299";
          sky = "#04a5e5";
          sapphire = "#209fb5";
          blue = "#1e66f5";
          lavender = "#7287fd";
          text = "#000000";
          subtext1 = "#000000";
          subtext0 = "#6c6f85";
          overlay2 = "#7c7f93";
          overlay1 = "#8c8fa1";
          overlay0 = "#9ca0b0";
          surface2 = "#acb0be";
          surface1 = "#bcc0cc";
          surface0 = "#ccd0da";
          base = "#eff1f5";
          mantle = "#e6e9ef";
          crust = "#dce0e8";
        };
      };
    };
  };
}
