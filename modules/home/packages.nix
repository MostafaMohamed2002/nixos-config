# User-level packages (empty for now)
{ pkgs, ... }:

{
  home.packages = with pkgs;[ 
    nixd
    nixfmt-rfc-style
  ];
}
