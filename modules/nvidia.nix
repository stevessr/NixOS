{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.graphics.enable = true;

  hardware.nvidia = {
    # 必须开启 Modesetting
    modesetting.enable = true;
    
    # 电源管理 (笔记本建议开启，如果不稳定可改为 false)
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # 使用闭源驱动
    open = false;

    # 安装设置工具
    nvidiaSettings = true;

    # 选择驱动版本 (Stable 通常最稳，Production 也可以)
    package = config.boot.kernelPackages.nvidiaPackages.stable;    
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # 如果你知道 BusID，也可以写在这里
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  
  # 环境变量也可以放这里
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };
}
