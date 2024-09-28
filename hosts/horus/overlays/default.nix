{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};
  modifications = final: prev: {
    neovim = inputs.nixvim.packages.${prev.system}.default;
  };
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}

