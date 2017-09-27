require("scene.lua");

SceneLib.registerPlugin(
	function (scene, attachment)			
				
		scene.viewport:setupToolCategory("help", lang("scene.help.category"), 50);
		scene.viewport:addToolButton("help", 
		                             lang("scene.help.howTo"), 
									 "/icos/help.png",
									 -5,
									 {},
									function()
										require("gui.lua");
										gui.openInBrowser("http://wiki.rrpg.com.br/index.php?title=Tabuleiro_de_Combate");
									end);		
				
	end);
	
	
_scene3_setInternImages("/images/loadingAnim.gif", 
						"/images/error.png",
						"/images/invisible.png",
						"/images/botonFrame.png");	