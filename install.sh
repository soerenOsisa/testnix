sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount disk.nix
mount | grep /mnt
nixos-generate-config --no-filesystems --root /mnt
cp disk.nix /etc/nixos/
cp flake.nix /etc/nixos/nixos-install --flake /mnt/etc/nixos/.#zmask
echo "" > /tmp/secret.key
