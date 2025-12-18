{ config, pkgs, ... }:

{
  # 1. 启用 ZeroTierOne 服务
  services.zerotierone = {
    enable = true;
    
    # 2. (可选) 自动加入网络
    # 如果你有固定的网络 ID，可以填在这里，启动时会自动加入
    joinNetworks = [ 
      "8d1c312afade0177" 
    ];
  };

  # 3. 安装客户端工具 (zerotier-cli)
  environment.systemPackages = [ pkgs.zerotierone ];

  # 4. 配置防火墙
  # ZeroTier 需要 UDP 9993 端口进行 P2P 通信
  networking.firewall.allowedUDPPorts = [ 9993 ];
  
  # (高级) 如果你需要完全信任 ZeroTier 网络中的流量（允许所有端口），
  # 可以取消下面的注释。注意：接口名通常以 zt 开头，但也可能是随机的。
  # networking.firewall.trustedInterfaces = [ "zt+" ]; 
}
