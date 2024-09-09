{inputs, ...}: {
  home.packages = [
    inputs.godot.packages.x86_64-linux.godot
  ];
}
