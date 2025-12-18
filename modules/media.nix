{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  yt-dlp
  vlc
  ffmpeg
];
}
