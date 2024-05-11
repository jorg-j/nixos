https://www.haskellforall.com/2018/08/nixos-in-production.html

# Make Binary
nix-build --attr system ./nixos.nix

# Deploy Binary
sudo ./result/bin/switch-to-configuration switch

# Create
pre-commit hook to run `nix eval` against the changed files



## Notes

can likely remove packages/common.nix as no references
