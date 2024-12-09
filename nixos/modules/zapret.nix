{ pkgs, config, ... }:
{
  options.services.zapret = {
    enable = false;
    whitelist = [
      "youtube.com"
      "youtu.be"
      "www.youtube.com"
      "discord.gg"
      "discord.com"
      "discordapp.com"
      "www.discord.gg"
      "www.discord.com"
      "www.discordapp.com"
    ];
    params = [
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-autottl=2"
    ];
  };
}
