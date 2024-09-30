{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fastfetch
    discord
    bat
  ];
}
