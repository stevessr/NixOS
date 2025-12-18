{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;

      extraPackages = with pkgs.kdePackages; [
        qtvirtualkeyboard
        # --- 关键包 ---
        plasma-desktop     # Breeze 主题实际在这个包里
        plasma5support     # Plasma 6 主题兼容层，缺少它会导致加载失败回退
        qtmultimedia
        qtsvg
        # --------------
      ];

      # 使用这个属性，NixOS 模块会自动处理路径
      theme = "breeze";
    };

    defaultSession = "niri";
    autoLogin = {
      enable = false;
      user = "stevessr";
    };
  };

  # 建议在系统全局也加上这几个，确保环境路径正确
  environment.systemPackages = with pkgs.kdePackages; [
    qtvirtualkeyboard
    plasma-desktop
  ];

  # Enable Qt Virtual Keyboard for SDDM by setting environment variables
  environment.variables = {
    QT_IM_MODULE = lib.mkForce "qtvirtualkeyboard";
    QT_VIRTUAL_KEYBOARD_SHOW_ON_STARTUP = "1";
    QT_QUICK_CONTROLS_STYLE = "org.kde.breeze";
  };

  # Also create a dedicated SDDM configuration file for virtual keyboard support
  environment.etc."sddm.conf.d/virtualkeyboard.conf".text = ''
    [X11]
    InputMethod=qtvirtualkeyboard

    [Wayland]
    InputMethod=qtvirtualkeyboard

    [Theme]
    EnableVirtualKeyboard=true
  '';
}
