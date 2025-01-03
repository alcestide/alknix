{pkgs, ...}:
{
  virtualisation.virtualbox.host.enable = false;
users.extraGroups.vboxusers.members = [ "alcestide" ];
virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ (pkgs.OVMF.override {
          secureBoot = true;
          httpSupport = true;
          tpmSupport = true;
        }).fd ];
      };
    };
  };

  virtualisation.oci-containers = {
  backend = "docker";
  };
}


