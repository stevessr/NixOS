{ config, pkgs, ... }:

{
  # 自动垃圾回收
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # 自动优化存储（每当有新文件写入 Store 时自动去重）
  nix.settings.auto-optimise-store = true;
}
