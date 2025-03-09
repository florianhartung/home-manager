lib: {
  # Stolen from  https://discourse.nixos.org/t/flatten-nested-set-to-name-value-pairs-named-after-the-old-path/59713
  flatten = set:
      let
        recurse =
          path:
          lib.concatMapAttrs (
            name: value:
            if builtins.isAttrs value then
              recurse (path ++ [ name ]) value
            else
              { ${builtins.concatStringsSep "." (path ++ [ name ])} = value; }
          );
      in
      recurse [ ] set;
}
