local composer = require ("composer")
local scene = composer.newScene( )


function gotoMenu()
  composer.removeScene("gameOver")
  composer.gotoScene( "menu", { time = 800, effect = "crossFade" } )
end

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect ( sceneGroup, "menu/GAMEOVER.png", 330, 580 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	

    timer.performWithDelay(2000, gotoMenu)
end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		-- Start the music!
		--audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then
--		audio.stop( 1 )
	end
end

function scene:destroy( event )

	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene