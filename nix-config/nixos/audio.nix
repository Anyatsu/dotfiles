{ inputs, pkgs, ... }:
{
  # imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    pulseaudio
  ];

  services.udev.extraRules = ''
    KERNEL=="rtc0", GROUP="audio"
    KERNEL=="hpet", GROUP="audio"
  '';

  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber.enable = true;

    # extraConfig = {
    #   pipewire."92-low-latency" = {
    #     context.properties = {
    #       default.clock.rate = 48000;
    #       default.clock.quantum = 32;
    #       default.clock.min-quantum = 32;
    #       default.clock.max-quantum = 32;
    #     };
    #   };
    #
    #   pipewire-pulse."92-low-latency" = {
    #     context.modules = [
    #       {
    #         name = "libpipewire-module-protocol-pulse";
    #         args = {
    #           pulse.min.req = "32/48000";
    #           pulse.default.req = "32/48000";
    #           pulse.max.req = "32/48000";
    #           pulse.min.quantum = "32/48000";
    #           pulse.max.quantum = "32/48000";
    #         };
    #       }
    #     ];
    #     stream.properties = {
    #       node.latency = "32/48000";
    #       resample.quality = 1;
    #     };
    #   };
    #
    #   jack."92-low-latency" = {
    #     jack.properties = {
    #       node.latency = "32/48000";
    #     };
    #   };
    # };
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  environment.sessionVariables = {
    PIPEWIRE_LATENCY = "256/48000";
  };
}
