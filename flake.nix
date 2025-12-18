{
  description = "Steve's NixOS Flake Configuration";

  inputs = {
    # 你选择了 unstable 分支
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };    

    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # ⚠️ 这个名字 "nixos-mach" 是 Flake 的入口点
      "nixos2go" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        # 关键：这行让你的 modules (比如 dms.nix) 能访问到 inputs.dms
        specialArgs = { inherit inputs; };
        
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
