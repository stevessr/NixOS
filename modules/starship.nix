{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    
    settings = {
      # --- 全局设置 ---
      add_newline = false;
      
      # 修复：在 format 中加入了 $git_status，否则你的图标配置不会显示
      format = "$cmd_duration 󰜥 $directory $git_branch $git_status $nodejs\n$character";

      # --- 字符符号 ---
      character = {
        success_symbol = "[   ](bold fg:blue)";
        error_symbol = "[   ](bold fg:red)";
      };

      package.disabled = true;

      # --- 模块样式配置 (胶囊风格) ---

      # 命令执行时间 (黄色)
      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:yellow)[󰪢 $duration](bold bg:yellow fg:black)[](bold fg:yellow)";
      };

      # 目录 (绿色)
      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 6;
        truncation_symbol = " ••/";
        format = "[](bold fg:green)[󰉋 $path]($style)[](bold fg:green)";
        
        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = " 󰊤 ";
          "桌面" = "  ";
          "文档" = "  ";
          "下载" = "  ";
          "音乐" = " 󰎈 ";
          "图片" = "  ";
          "视频" = "  ";
        };
      };

      # Git 分支 (青色)
      git_branch = {
        style = "bg:cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = "󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
      };

      # Git 状态 (图标)
      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\($count\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };
      
      # (可选) 既然你在用 Bun/Node，建议加上 Node 显示
      # 保持你的胶囊风格 (蓝色)
      nodejs = {
        format = "󰜥 [](bold fg:blue)[ $version](fg:black bg:blue)[](bold fg:blue)";
      };

      # 你的其他配置
      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      memory_usage.disabled = true;
      time.disabled = true;
      
      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };
    };
  };
}
