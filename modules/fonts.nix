{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts # includes Noto Naskh Arabic + Noto Sans Arabic
      nerd-fonts.jetbrains-mono
      font-arabic-misc
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        # Latin first, Arabic as fallback — fontconfig picks by codepoint coverage.
        # Putting Arabic first here would hijack Latin glyphs on some sites.
        serif = [
          "Noto Serif"
          "Noto Naskh Arabic"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans Arabic"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Sans Mono"
        ];
      };

      localConf = ''
        <?xml version='1.0'?>
        <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
        <fontconfig>
          <!-- Replace Arial/Helvetica's broken Arabic glyphs with Noto -->
          <match>
            <test name="family"><string>Arial</string></test>
            <edit name="family" mode="assign" binding="strong">
              <string>Noto Sans Arabic</string>
            </edit>
          </match>
          <match>
            <test name="family"><string>Helvetica</string></test>
            <edit name="family" mode="assign" binding="strong">
              <string>Noto Sans Arabic</string>
            </edit>
          </match>
          <!-- Improve rendering quality -->
          <match target="font">
            <edit name="hinting" mode="assign"><bool>true</bool></edit>
            <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
            <edit name="antialias" mode="assign"><bool>true</bool></edit>
            <edit name="rgba" mode="assign"><const>rgb</const></edit>
            <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
          </match>
        </fontconfig>
      '';
    };
  };
}
