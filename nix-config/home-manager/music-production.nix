{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.unstableFull
    winetricks

    yabridge
    yabridgectl

    # Effects
    lsp-plugins
    aether-lv2
    CHOWTapeModel
    gxmatcheq-lv2
    fire
    # distrho

    vital
    geonkick
    sfizz

    tuxguitar

    # Drums
    hydrogen
    drumgizmo
    x42-avldrums

    # Guitar
    neural-amp-modeler-lv2

    carla
    reaper
  ];

  # home.file."Music/Production/VST3/MT-PowerDrumKit".source = pkgs.fetchzip {
  #   url = "https://downloads.manda-audio.com/download76187/mtpdk2_free/2.1.2/MTPDK-2.1.2-VST3-64bit-Linux-with-Wine-FULL.zip";
  #   hash = "sha256-i/twUOPah08x7CC5ZbrnAM0U6UL630h4NXixim6Mpu0=";
  #   stripRoot = false;
  # };
}
