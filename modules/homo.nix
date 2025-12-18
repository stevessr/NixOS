{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  sparkle
  mihomo
  clashmi
];
}
