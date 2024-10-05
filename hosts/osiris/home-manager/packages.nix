{pkgs, inputs, ...}:

{

home.packages = with pkgs; [
	htop
	lm_sensors
	];

}
