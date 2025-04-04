# Example overlay:
/*
importName: inputs: let
  overlay = self: super: {
    ${importName} = SOME_DRV;
    # or
    ${importName} = {
      # define your overlay derivations here
    };
  };
in
overlay
*/
inputs: let
  inherit (inputs.nixCats) utils;
  overlaySet = {
    # example = import ./example.nix;
  };
  extra = [
    (utils.sanitizedPluginOverlay inputs)
  ];
in
  builtins.attrValues (builtins.mapAttrs (name: value: (value name inputs)) overlaySet) ++ extra
