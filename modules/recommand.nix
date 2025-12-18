{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # --- System Tools ---
    wget
    curl
    git
    htop
    btop        # 更漂亮的资源监控
    fastfetch   # 显示系统信息 (neofetch 的替代品)

    # --- Modern CLI ---
    starship    # 漂亮的 Shell 提示符
    eza         # ls 替代品
    bat         # cat 替代品
    ripgrep     # grep 替代品
    fd          # find 替代品
    zoxide      # cd 替代品
    fzf         # 模糊搜索
    jq          # JSON 处理工具

    # --- Productivity ---
    lazygit     # 终端 Git UI (强烈推荐)
    yazi        # 终端文件管理器
    tmux        # 或者 zellij

    # --- Wayland / Niri Utils ---
    wl-clipboard # 剪贴板支持
    fuzzel       # 应用启动器
    grim         # 截图
    slurp        # 截图选区
    libnotify    # 通知发送工具
    mako         # 通知守护进程
  ];

  # 启用一些程序的集成配置
  programs.fish.enable = true; # 假设你在用 fish
  
  # 启用 starship
  programs.starship = {
    enable = true;
    # 自动集成到 fish
    settings = {
      # 你可以在这里加自定义配置
    };
  };
  
  # 启用 direnv (Nix 开发神器)
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
