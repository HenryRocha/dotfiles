{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  home.username = "henryrocha";
  home.homeDirectory = "/home/henryrocha";
  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;
  home.packages = [
    # Useful developer programs.
    pkgs.lazygit
    pkgs.lazydocker
    pkgs.yazi # terminal file explorer
    pkgs.zellij # terminal multiplexer

    # Language specific tools.
    # nix
    pkgs.nil
    pkgs.alejandra

    # python
    (pkgs.python312.withPackages (ppkgs:
      with ppkgs; [
        pip
      ]))

    # lua
    (pkgs.lua5.withPackages (lpkgs:
      with lpkgs; [
        luarocks
      ]))

    # node
    pkgs.nodejs_22

    # Misc
    pkgs.starship
    pkgs.carapace
    pkgs.helix
    pkgs.direnv
    pkgs.oh-my-zsh
    pkgs.ripgrep
    pkgs.fd
    pkgs.shellcheck
    pkgs.fontconfig
    pkgs.cmake
    pkgs-unstable.neovim
    pkgs.bat
    pkgs.tree
    pkgs.unzip
  ];

  home.file = {
  };

  home.sessionPath = [
    "$HOME/.emacs.d/bin/"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      dotDir = ".config/zsh";

      initExtraFirst = "
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
      ";

      shellAliases = {
        hms = "home-manager switch";
        hme = "home-manager edit";
        nvim-config = "nvim $HOME/.config/nvim/";

        lg = "lazygit";
        lzd = "sudo lazydocker";
        yz = "yazi";
        zl = "zellij";
        nd = "nix develop -c $SHELL";
        ".." = "cd ..";
      };

      syntaxHighlighting = {
        enable = true;
      };

      oh-my-zsh = {
        enable = true;

        plugins = [
          "direnv"
        ];
      };
    };

    git = {
      enable = true;
      userName = "henryrocha";
      userEmail = "henryrocha@protonmail.com";
    };

    ssh = {
      enable = true;
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          identityFile = "${config.home.homeDirectory}/.ssh/gth";
          user = "git";
        };
      };
    };

    yazi = {
      enable = true;
    };

    carapace = {
      enable = true;
      enableBashIntegration = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = true;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
