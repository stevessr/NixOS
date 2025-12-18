{ config, pkgs, ... }:

{
  imports = [
    ./app.nix
    ./autoclean.nix
    ./btrfs.nix
    ./chrom.nix
    ./coding.nix
    ./dms.nix
    ./fcitx5.nix
    ./flatpak.nix
    ./font.nix
    ./homo.nix
    ./js.nix
    ./kde6.nix
    ./media.nix
    ./network.nix
    ./niri.nix
    ./nvidia.nix
    ./recommand.nix
    ./sddm.nix
    ./sh.nix
    ./starship.nix
    ./user.nix
    ./vibe.nix
    ./wayvnc.nix
    ./zerotier.nix
  ];
}
