{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  claude-code
  claude-code-router
  codex
  qwen-code
  copilot-cli
];
}
