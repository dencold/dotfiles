{
  description = "macos nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    # temporary pin for espanso build failure see: github.com/NixOS/nixpkgs/issues/368673
    nixpkgs-espanso-pinned.url = "nixpkgs/3f316d2a50699a78afe5e77ca486ad553169061e";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nixpkgs-espanso-pinned }:
  let
    configuration = { pkgs, config, ... }: {

      # allow non-free/non-opensource apps to be installed by nix
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.aerospace
          pkgs.alacritty
          pkgs.git
          pkgs.neovim
          pkgs.zsh-powerlevel10k
          inputs.nixpkgs-espanso-pinned.legacyPackages.aarch64-darwin.espanso
        ];

      # setup macos system configuration
      system.defaults = {
        dock.autohide = true;
        dock.expose-group-apps = true;
	finder.FXPreferredViewStyle = "clmv";
      };

      # install fonts
      fonts.packages = with pkgs; [
        meslo-lgs-nf
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;
      programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macos
    darwinConfigurations."macos" = nix-darwin.lib.darwinSystem {
      modules = 
        [ 
          configuration
	  mac-app-util.darwinModules.default
	];
    };
  };
}
