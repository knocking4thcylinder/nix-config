{
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
    inputs.zig.overlays.default
    (final: prev: {
      zig = pkgs.zigpkgs.master;
    })
  ];
}
