{ config, pkgs, ... }:

{
  # --- 图形界面 (KDE Plasma 6 示例) ---
  services.xserver.enable = true;

  # 登录管理器配置
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
    }; # <--- 修复：这里必须关闭 sddm 代码块

    defaultSession = "niri"; # <--- 现在它正确地属于 displayManager
    
    autoLogin = {
      enable = false;
      user = "stevessr";
    };
  };

  # 桌面环境配置 (Plasma 6 属于 desktopManager)
  services.desktopManager.plasma6.enable = true;
  
  environment.systemPackages = with pkgs; [
    kdePackages.qtvirtualkeyboard
    libsForQt5.qtvirtualkeyboard    # Qt5
  ];
}
