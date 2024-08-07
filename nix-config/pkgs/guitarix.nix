{
  lib,
  stdenv,
  fetchgit,
  avahi,
  bluez,
  boost,
  curl,
  eigen,
  faust,
  adwaita-icon-theme,
  fftw,
  fftwFloat,
  gettext,
  glib,
  glib-networking,
  glibmm,
  gsettings-desktop-schemas,
  gtk3,
  gtkmm3,
  hicolor-icon-theme,
  intltool,
  ladspaH,
  libjack2,
  libsndfile,
  lilv,
  lrdf,
  lv2,
  pkg-config,
  python3,
  sassc,
  serd,
  sord,
  sratom,
  wafHook,
  wrapGAppsHook,
  zita-convolver,
  zita-resampler,
}:
stdenv.mkDerivation rec {
  pname = "guitarix";
  version = "0.46.0";

  # src = fetchFromGitHub {
  #   owner = "brummer10";
  #   repo = "guitarix";
  #   rev = "V${version}";
  #   fetchSubmodules = true;
  #   deepClone = true;
  #   leaveDotGit = true;
  #   sha256 = "sha256-2vcYtiS54SdQFgS8EZkibw962ML7PWsr+53EpSjvOXI=";
  # };

  src = fetchgit {
    url = "https://github.com/brummer10/guitarix.git";
    rev = "V${version}";
    sha256 = "sha256-AftC6fQEDzG/3C/83YbK/++bRgP7vPD0E2X6KEWpowc=";
  };

  nativeBuildInputs = [
    gettext
    hicolor-icon-theme
    intltool
    pkg-config
    python3
    wafHook
    wrapGAppsHook
  ];

  buildInputs = [
    avahi
    bluez
    boost
    curl
    eigen
    faust
    fftw
    fftwFloat
    glib
    glib-networking.out
    glibmm
    adwaita-icon-theme
    gsettings-desktop-schemas
    gtk3
    gtkmm3
    ladspaH
    libjack2
    libsndfile
    lilv
    lrdf
    lv2
    sassc
    serd
    sord
    sratom
    zita-convolver
    zita-resampler
  ];

  preConfigure = ''
    cd trunk
  '';

  wafConfigureFlags = [
    # "--no-font-cache-update"
    # "--shared-lib"
    # "--no-desktop-update"
    # "--enable-nls"
    # "--install-roboto-font"
    "--includeresampler"
    "--includeconvolver"
    "--optimization"
  ];

  # env.NIX_CFLAGS_COMPILE = toString [ "-fpermissive" ];

  meta = with lib; {
    description = "A virtual guitar amplifier for Linux running with JACK";
    longDescription = ''
        guitarix is a virtual guitar amplifier for Linux running with
      JACK (Jack Audio Connection Kit). It is free as in speech and
      free as in beer. Its free sourcecode allows to build it for
      other UNIX-like systems also, namely for BSD and for MacOSX.

        It takes the signal from your guitar as any real amp would do:
      as a mono-signal from your sound card. Your tone is processed by
      a main amp and a rack-section. Both can be routed separately and
      deliver a processed stereo-signal via JACK. You may fill the
      rack with effects from more than 25 built-in modules spanning
      from a simple noise-gate to brain-slashing modulation-fx like
      flanger, phaser or auto-wah. Your signal is processed with
      minimum latency. On any properly set-up Linux-system you do not
      need to wait for more than 10 milli-seconds for your playing to
      be delivered, processed by guitarix.

        guitarix offers the range of sounds you would expect from a
      full-featured universal guitar-amp. You can get crisp
      clean-sounds, nice overdrive, fat distortion and a diversity of
      crazy sounds never heard before.
    '';
    homepage = "http://guitarix.sourceforge.net/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [
      astsmtl
      goibhniu
    ];
    platforms = platforms.linux;
  };
}
