{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      # 1. 强制使用 Qt6 版本的 SDDM
      package = pkgs.kdePackages.sddm; 
      
      # 2. 关键修复：不要手动设置 systemd 变量
      # 将所有需要的组件放入 extraPackages，NixOS 会自动处理路径合并
      extraPackages = with pkgs.kdePackages; [
        qtvirtualkeyboard
        plasma-workspace # 必须：Breeze 主题的实际资源在这个包里
        qtmultimedia
        qtsvg
      ];

      theme = "breeze";
      
      settings = {
        General = {
          # 指定输入法模块
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

  # --- 彻底删除之前添加的 systemd.services.display-manager.environment 整个代码块 ---
  # 不要使用环境变量手动覆盖，否则会破坏主题！

  # 系统全局包保持不变
  environment.systemPackages = with pkgs; [
    kdePackages.qtvirtualkeyboard
  ];
}
