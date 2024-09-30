{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cargo
    go
    gcc
  ];
}
