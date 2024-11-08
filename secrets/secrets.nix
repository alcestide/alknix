let
  alcestide = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO2cO5Za2NRZCs7S6vXeFR7D3LDoguQlnJukMAQ576km angpanariti@gmail.com";
  users = [ alcestide ];

  osiris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJWnX17sYDtGz/Ok6IOyUjhmvXNF+0QYPFr3is1E904t root@nixos";
  systems = [ osiris ];
in
{
  "cloudflare.age".publicKeys = [ alcestide osiris ];
}
