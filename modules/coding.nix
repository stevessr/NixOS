{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # golang
  go
  
  # gcc
  gcc
  gdb

  # llvm
  llvm
  lldb

  # 虚拟机
  qemu

  clang-analyzer

  # rust
  rustup
  cargo

  # python
  uv
  python312

  # java
  jdk8_headless
  jetbrains.jdk

  podman # 容器
  
  gh # github cli
];
}
