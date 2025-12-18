{ config, pkgs, ... }:

{
# --- 图形界面 (KDE Plasma 6 示例，适合你的高刷屏) ---
  services.xserver.enable = true;
  # 登录管理器 (SDDM)
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "breeze";
      settings = {
        General = {
        InputMethod = "qtvirtualkeyboard";
        };
      };
    };
    defaultSession = "niri"; # <--- 添加这一行，强制默认进入 niri
    autoLogin = {
        enable = false;
        user = "stevessr";
    };
    plasma6 = {
      enable = true;
    };
  };
  
  environment.systemPackages = with pkgs [
    kdePackages.qtvirtualkeyboard  # 针对 Qt6 (Plasma 6 环境)
    # 如果你的系统较老，或者 SDDM 还在用 Qt5，则使用:
    # libsForQt5.qtvirtualkeyboard 
  ];

}
