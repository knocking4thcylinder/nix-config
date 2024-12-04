{
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
    inputs.zig.overlays.default
    (final: prev: {
      zig-dev = pkgs.zigpkgs.master;
    })
  ];
}
