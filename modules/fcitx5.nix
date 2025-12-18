{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fcitx5
    kdePackages.fcitx5-with-addons
    fcitx5-skk
    fcitx5-lua
    fcitx5-gtk
    fcitx5-rime
    fcitx5-nord
    fcitx5-material-color
    fcitx5-pinyin-minecraft
  ];

  i18n.inputMethod = {
    # 开启 fcitx5
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      # 开启 KDE Plasma 6 专用支持（自动处理托盘、UI 等）
      plasma6Support = true; 
      # 针对 Wayland 的优化，减少环境变量冲突警告
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-chinese-addons # 拼音
        fcitx5-rime           # Rime
        # 注意：KDE 环境建议使用 kdePackages.fcitx5-qt 以获得更好的原生支持
        kdePackages.fcitx5-qt 
        fcitx5-gtk            # 让 GTK 应用（如浏览器）也正常运行
        rime-data             # 确保 Rime 词库数据完整
	fcitx5-configtool     # 图形化配置工具
        fcitx5-nord         # 可选：美观的 Nord 主题
      ];
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus"; # 有些软件在 Wayland 下需要这个
  };
}
