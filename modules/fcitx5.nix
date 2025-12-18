{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  fcitx5
  kdePackages.fcitx5-with-addons
  fcitx5-skk
  fcitx5-lua
  fcitx5-gtk
  fcitx5-rime
  fcitx5-nord
  fcitx5-material-color
  fcitx5-pinyin-minecraft
];
}
