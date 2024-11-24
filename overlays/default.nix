{
  inputs,
  ...
}:

{
  nixpkgs.overlays = [
    inputs.zig.overlays.default
  ];
}
