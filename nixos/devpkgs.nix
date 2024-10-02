{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cargo
    go
    gcc
    python3
    pyenv
  ];
}
