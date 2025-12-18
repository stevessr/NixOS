{ config, pkgs, ... }:

{
  imports = [
    ./app.nix
    ./btrfs.nix
    ./chrom.nix
    ./coding.nix
    ./dms.nix
    ./fcitx5.nix
    ./font.nix
    ./homo.nix
    ./js.nix
    ./media.nix
    ./niri.nix
    ./nvidia.nix
    ./recommand.nix
    ./sddm.nix
    ./sh.nix
    ./starship.nix
    ./user.nix
    ./wayvnc.nix
    ./zerotier.nix
  ];
}
