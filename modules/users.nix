# User accounts, groups, and shell configuration
{ ... }:

{
  # Define a user account. Don't forget to set a password with passwd.
  users.users.mostafa = {
    isNormalUser = true;
    description = "mostafa";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
