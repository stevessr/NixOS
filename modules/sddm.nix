{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      
      # 恢复 Breeze 主题
      theme = "breeze";

      # NixOS 会自动把这些包的路径拼接给 SDDM，不要手动覆盖路径变量
      extraPackages = with pkgs.kdePackages; [
        qtvirtualkeyboard # 键盘核心
        plasma-desktop    # Breeze 主题核心
        plasma5support    # 兼容层
        qtmultimedia
        qtsvg
        qtdeclarative
        kirigami
        # --- 新增关键包 ---
        plasma-workspace  # 真正的 Breeze SDDM 主题定义文件在这里！
        breeze            # Breeze 的 Qt 样式插件
        layer-shell-qt    # Wayland 下窗口层级支持
        # ----------------
      ];

      settings = {
        General = {
          # 告诉 SDDM 启用虚拟键盘插件
          InputMethod = "qtvirtualkeyboard";
        };
      };
    };

    defaultSession = "niri";
    
    autoLogin = {
      enable = false;
      user = "stevessr";
    };
  };

  # 环境变量只需开启功能，不要碰路径
  systemd.services.sddm.environment = {
    # 启用键盘输入法
    QT_IM_MODULE = "qtvirtualkeyboard";
    
    # 强制让 Qt 认为有物理键盘未连接，从而显示虚拟键盘（部分触屏设备需要这个）
    QT_VIRTUAL_KEYBOARD_SHOW_ON_STARTUP = "1";
    
    # 设置键盘风格，防止全黑
    QT_VIRTUAL_KEYBOARD_STYLE = "default";
    
    # 确保 Wayland 下也能弹出
    QT_WAYLAND_SHELL_INTEGRATION = "layer-shell";
  };
}
