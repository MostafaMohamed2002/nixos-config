# Git configuration
{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mostafa";
        email = "Mostafa0Mohamed2002@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
