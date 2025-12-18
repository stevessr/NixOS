{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  bun
  deno
  nodejs_24
  pnpm
  fnm
  
];
}
