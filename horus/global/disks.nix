{
  fileSystems."/mnt/disk1" =
{ device = "/dev/disk/by-uuid/a60c5ccc-53a4-4e63-9768-2f6a211b283a";
  fsType = "ext4";
  options = ["nofail" "rw"];
};

  fileSystems."/mnt/disk2" =
    { device = "/dev/disk/by-uuid/30d5784c-5b1d-4112-87b2-654c1b8ab5e0";
      fsType = "ext4"; 
      options = [ "rw" "nofail" ];
    };

}
