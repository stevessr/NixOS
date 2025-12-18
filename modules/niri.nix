{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri; 
  };

  # 图形界面权限管理
  security.polkit.enable = true;
  
# 登录管理器 (SDDM)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";
    autoLogin = {
      enable = true;
      user = "stevessr";
    };
  };

  # XDG Portals (屏幕共享、文件选择)
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gnome 
    ];
    config.niri.default = [ "gnome" "gtk" ]; # 强制 Niri 使用 gnome/gtk portal
  };

  # Niri 常用工具包
  environment.systemPackages = with pkgs; [
    kitty           # 终端
    starship
    waybar          # 状态栏
    fuzzel          # 启动器
    mako            # 通知
    libnotify       # 通知发送工具
    swww            # 壁纸
    wl-clipboard    # 剪贴板
    grim            # 截图
    slurp           # 截图选区
    polkit_gnome    # 认证弹窗
    nautilus        # 文件管理器
    yazi
    niri
  ];
  
  # 认证代理自动启动 (Systemd 方式)
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
    };
  };
}
