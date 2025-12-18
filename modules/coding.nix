{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  go
  
  gcc
  gdb

  llvm
  lldb

  qemu

  clang-analyzer

  rustup
  cargo

  uv
  python312

  jdk8_headless
  jetbrains.jdk

  podman
];
}
