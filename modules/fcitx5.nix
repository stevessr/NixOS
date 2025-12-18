{ config, pkgs, ... }:

{
  # 建议将所有插件统一放在 i18n.inputMethod.fcitx5.addons 中管理，
  # 而不是散落在 environment.systemPackages 里。
  environment.systemPackages = with pkgs; [
    # 这里只放一些独立的辅助工具（如果需要的话）
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      # --- 关键修改：删除了 plasma6Support = true; ---
      
      # 针对 Wayland 的优化
      waylandFrontend = true;
      
      addons = with pkgs; [
        fcitx5-chinese-addons   # 拼音、五笔等基础插件
        fcitx5-rime             # Rime 输入法引擎
        fcitx5-lua              # Lua 脚本支持
        fcitx5-skk              # SKK 支持
        kdePackages.fcitx5-qt   # 关键：确保 Plasma 6 下的 Qt 应用支持
        fcitx5-gtk              # 确保 GTK 应用支持
        rime-data               # Rime 基础数据
        fcitx5-configtool       # 图形化配置界面
        # 主题
        fcitx5-nord
        fcitx5-material-color
        fcitx5-pinyin-minecraft
      ];
    };
  };

  # 环境变量配置通常保持不变，但 Fcitx5 在 Wayland/Plasma 下通常能自动识别
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
}
