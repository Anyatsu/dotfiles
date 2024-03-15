{pkgs, ...}: {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      push.autoSetupRemote = true;
    };
  };

  home.packages = with pkgs; [
    github-desktop
    gh
  ];
}
