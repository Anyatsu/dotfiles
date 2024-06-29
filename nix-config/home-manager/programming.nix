{
  pkgs,
  config,
  inputs,
  ...
}:
{
  #  xdg.desktopEntries = {
  # "lf" = {
  #      name = "lf";
  #      noDisplay = true;
  #    };
  #  };

  home.packages = with pkgs; [ docker ];

}
