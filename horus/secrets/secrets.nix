let
  alcestide = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ7lnjhIbY964S97QcDXecvxFZsb1EBcNYFdR3+A0+1G angpanariti@gmail.com";
  users = [ alcestide ];

  horus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+ZRpY8RVEu0+zAV2W+lbdEU5vaP6EcoZQrYjly3AiH root@horus";
  systems = [ horus ];
in
{
  "nextcloud.age".publicKeys = [ alcestide horus ];
}
