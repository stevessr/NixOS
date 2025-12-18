{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  microsoft-edge
  vscode
  lmstudio
  cherry-studio
  chromium
];
}
