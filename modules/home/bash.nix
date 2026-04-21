# Bash configuration
{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -lh";

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
    '';
  };
}
