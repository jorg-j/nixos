{
  inputs,
  pkgs,
  lib,
  ...
}: {
  home-manager.users.jack.programs.kitty = {
    enable = true;

    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };

    # theme was Flatland
    extraConfig = ''
      include /etc/nixos/modules/apps/terminal/kitty_themes/gruvbox_dark.conf
      font_size 12.0
      #foreground #E3E3EA
      #background #08052B
      cursor #EEEEEE
      cursor_text_color #DDDDDD
      cursor_blink_interval 0.5
      scrollback_lines -1
      url_color #FFFF00
      url_style curly
      mouse_hide_wait 3.0
      enable_audio_bell no
      window_alert_on_bell yes
      bell_on_tab yes
      clipboard_control write-primary write-clipboard no-append
      window_margin_width 5.0
      window_padding_width 5.0
      inactive_text_alpha 0.9
      tab_bar_min_tabs 1
      background_opacity 1
      dynamic_background_opacity yes
      dim_opacity 0.75
      allow_remote_control yes
      confirm_os_window_close 2
    '';

    keybindings = {
      "kitty_mod+c" = "copy_to_clipboard";
      "ctrl+c" = "copy_or_interrupt";

      "kitty_mod+v" = "paste_from_clipboard";
      "kitty_mod+s" = "paste_from_selection";
      "shift+insert" = "paste_from_selection";
      "kitty_mod+o" = "pass_selection_to_program firefox";

      "kitty_mod+k" = "scroll_line_up";
      "kitty_mod+j" = "scroll_line_down";

      "kitty_mod+enter" = "new_window";

      "kitty_mod+right" = "next_tab";
      "kitty_mod+alt+l" = "next_tab";

      "kitty_mod+left" = "previous_tab";
      "kitty_mod+alt+h" = "previous_tab";

      "kitty_mod+t" = "new_tab";
      "kitty_mod+q" = "close_tab";

      "kitty_mod+." = "move_tab_forward";
      "kitty_mod+," = "move_tab_backward";

      "kitty_mod+alt+t" = "set_tab_title";

      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";

      "kitty_mod+e" = "kitten hints";

      "ctrl+alt+equal" = "set_background_opacity +0.1";
      "ctrl+alt+minus" = "set_background_opacity -0.1";
    };
  };
}
