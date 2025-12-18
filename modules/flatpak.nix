{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    flatpak
    obs-studio
    bilibili
  ];
}
