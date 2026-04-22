# Bash configuration
{lib, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -lah --icons --git --group";
      la = "eza -a --icons --git --group";
      l = "eza -lh --icons --git --group";
      lt = "eza --tree --level=2 --icons --git --group";
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
      palette = "catppuccin_macchiato";
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
        catppuccin_macchiato = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
          yellow = "#eed49f";
          green = "#a6da95";
          teal = "#8bd5ca";
          sky = "#91d7e3";
          sapphire = "#7dc4e4";
          blue = "#8aadf4";
          lavender = "#b7bdf8";
          text = "#cad3f5";
          subtext1 = "#b8c0e0";
          subtext0 = "#a5adcb";
          overlay2 = "#939ab7";
          overlay1 = "#8087a2";
          overlay0 = "#6e738d";
          surface2 = "#5b6078";
          surface1 = "#494d64";
          surface0 = "#363a4f";
          base = "#24273a";
          mantle = "#1e2030";
          crust = "#181926";
        };
      };
    };
  };
}
