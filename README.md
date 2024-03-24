# homebrew-mactex-historic

Hombrew Casks for historic MacTeX versions.

MacTeX will be downloaded from the [historic mirror](https://pi.kwarc.info/historic/systems/mactex/) of the [KWARC reasarch group of the Friedrich-Alexander-Universität Erlangen-Nürnberg](https://kwarc.info).

The casks are directly based on the [mactex-no-gui cask](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/m/mactex-no-gui.rb) from the official [homebrew-cask repository](https://github.com/Homebrew/homebrew-cask/tree/master), just the version and mirror is adapted.

## Usage
```
brew tap afkjanus/mactex-historic
brew install mactex-no-gui-YYYYMMDD
```
Please adapt `YYYYMMDD` to the desired version of MacTeX.
