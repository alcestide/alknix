{
age.secrets = {
      nextcloud = {
  file = ../secrets/nextcloud.age;
  };

      cloudflare_token = {
        file = ../secrets/cloudflare_token.age;
        owner = "alcestide";
        group = "users";
      };
};
}
