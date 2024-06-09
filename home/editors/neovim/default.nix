{inputs, pkgs, ...}: let
	toLua = raw: "lua << EOF\n${raw}\nEOF\n";

	plugins = { 
		codeshot-src = pkgs.fetchFromGitHub {
		  owner = "sergioribera";
		  repo = "codeshot.nvim";
		  rev = "7e418c2b6e8b7aaa75d41c5c91d96a837251a18d";
		  hash = "sha256-xMyn64uLZ0Gpnpt5ZGSPm/6F8bHdVezqlmvCAjwXmeA=";
		};

		cord-nvim-src = pkgs.fetchFromGitHub {
  		owner = "vyfor";
		  repo = "cord.nvim";
		  rev = "cf0af0fc9b8e218afd8c4928ae2e711ce455181b";
		  hash = "sha256-Ev44plJGhZ8wY3hcWg6BOV2T3g38JhctJ8KozDnAkUM=";
		};
	};

	codeshot = pkgs.vimUtils.buildVimPlugin {
		name = "codeshot";
		src = plugins.codeshot-src;
	};
	
	cord-nvim = pkgs.vimUtils.buildVimPlugin {
		name = "cord.nvim";
		src = plugins.cord-nvim-src;
	};

in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = false;

    viAlias = true;
    vimAlias = true;

    opts = import ./opts.nix;
    plugins = import ./plugins;
    colorschemes = import ./colorscheme.nix;

		extraPlugins = [
			{
				plugin = codeshot;
				config = toLua ''
          require("codeshot").setup({
						author = "@Thenat",
            background = "#F1D3DE",
            author_color = '#000',
            output = "raw",

            silent = true,
						copy = "%c | wl-copy",
            window_controls = false,
            show_line_numbers = false,
            use_current_theme = false,
            theme = 'Catppuccin Mocha',
          })
				'';
			}
#			{
#				plugin = cord-nvim;
#				config = toLua "require(\"cord\").setup()";
#			}
		];
	};
}
