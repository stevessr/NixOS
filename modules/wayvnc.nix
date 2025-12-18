{ config, pkgs, ... }:

{
  # 1. 安装 wayvnc
  environment.systemPackages = with pkgs; [
    wayvnc
  ];

  # 2. 打开防火墙端口
  networking.firewall.allowedTCPPorts = [ 5900 ];

  # 3. 定义 Systemd 用户服务
  systemd.user.services.wayvnc = {
    description = "WayVNC Server";
    
    # 修改：更精确的依赖关系
    # 只有当 graphcial-session 真正活跃时才尝试运行
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    
    # 新增：关键修复
    # 只有当环境变量中有 WAYLAND_DISPLAY 时才启动服务
    # 这可以防止它在 SDDM 阶段或环境未同步时盲目启动导致报错
    unitConfig = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    serviceConfig = {
      ExecStart = "${pkgs.wayvnc}/bin/wayvnc 0.0.0.0 --log-level=info";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };
}
