# 在 fonts.nix 或 configuration.nix 中
{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # 或者 hack, fira-code 等
    noto-fonts-cjk-sans       # 中文支持
    noto-fonts-color-emoji    # 表情符号支持
  ];
}
