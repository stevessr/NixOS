{ config, pkgs, ... }:

{
  # 网络
  networking.hostName = "nixos2go"; 
  networking.networkmanager.enable = true;

  # 时区与语言
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  # 用户配置 (记得修改这里！)
  users.users.stevessr = {
    isNormalUser = true;
    description = "Master";
    extraGroups = [ "networkmanager" "wheel" "video" ]; 
    shell = pkgs.fish; # 你之前用的是 fish
    hashedPassword = "$6$.gpZezCTCvbezXuy$e8U1hL9FzH07NvNl34QNGkgYlBO5DXqYFKcVeAI46q10ql8E9BAfpeK4uu7bf13xECAHiV3hsCkacjKeIdge//";
  };

  # 启用 Fish Shell
  programs.fish.enable = true;
  # programs.nushell.enable = true;
  programs.bash.enable = true;
  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  # 启用 Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 系统包 (通用工具)
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    fastfetch
    bottom
    whois
    btop
    bash
  ];
  
}
