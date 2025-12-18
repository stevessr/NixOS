{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  telegram-desktop
  vicinae
  fluffychat
  texstudio
  miktex
  wechat
  qq
  curl
  chezmoi
  zed-editor
  ];

  services.openssh = {
    enable = true;
  };
}
