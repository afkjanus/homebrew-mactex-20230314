cask "mactex-no-gui-20200407" do
  version "2020.0407"
  sha256 "a33af89de36c7c84a76050c9704d50d23892e9c2070f04f6a53e1c6d5a332f67"

  url "https://pi.kwarc.info/historic/systems/mactex/2020/mactex-#{version.no_dots}.pkg",
      verified: "pi.kwarc.info/historic/systems/mactex/2020/"
  name "MacTeX"
  desc "Full TeX Live distribution without GUI applications"
  homepage "https://www.tug.org/mactex/"

  livecheck do
    cask "mactex"
  end

  conflicts_with cask: [
    "mactex-no-gui",
    "basictex",
    "mactex",
  ]
  depends_on formula: "ghostscript"
  depends_on macos: ">= :mojave"

  pkg "mactex-#{version.no_dots}.pkg",
      choices: [
        {
          # Ghostscript
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.03.0",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # Ghostscript Dynamic Library
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.03.0-libgs",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # Ghostscript Mutool
          "choiceIdentifier" => "org.tug.mactex.ghostscript10.03.0-mutool",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # GUI Applications
          "choiceIdentifier" => "org.tug.mactex.gui#{version.major}",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
        {
          # TeX Live
          "choiceIdentifier" => "org.tug.mactex.texlive#{version.major}",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
      ]

  uninstall pkgutil: "org.tug.mactex.texlive#{version.major}",
            delete:  [
              "/etc/manpaths.d/TeX",
              "/etc/paths.d/TeX",
              "/Library/TeX",
              "/usr/local/texlive/#{version.major}",
            ]

  zap trash: "/usr/local/texlive/texmf-local",
      rmdir: "/usr/local/texlive"

  caveats <<~EOS
    You must restart your terminal window for the installation of MacTeX CLI
    tools to take effect.

    Alternatively, Bash and Zsh users can run the command:

      eval "$(/usr/libexec/path_helper)"
  EOS
end
