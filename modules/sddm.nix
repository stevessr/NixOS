{ config, pkgs, ... }:

{
# --- 图形界面 (KDE Plasma 6 示例，适合你的高刷屏) ---
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
