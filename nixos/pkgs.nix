{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fastfetch
    discord
    bat
    vim
    wget
    neovim
    vscode
    alacritty
    xournalpp
    git
    tmux
    alejandra
    stow
    eza
    file
    btop
    spotify
    obsidian
    libnotify

    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    jetbrains.jdk
    jetbrains.goland
    jetbrains.datagrip
    jetbrains-mono
    jetbrains-toolbox
    jetbrains.webstorm
  ];
}
