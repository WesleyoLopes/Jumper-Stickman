local composer = require ("composer")
local scene = composer.newScene( )


function gotoMenu()
  composer.removeScene("ranking")
  composer.gotoScene( "menu", { time = 100, effect = "zoomInOut" } )
end

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect ( sceneGroup, "menu/RANKING.png", 330, 580 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local botaoMenu = display.newImageRect( sceneGroup, "menu/BOTAOMENU.png", 102,70 )
	botaoMenu.x = display.contentCenterX+10
	botaoMenu.y = display.contentCenterY+200

	botaoMenu:addEventListener( "tap", gotoMenu )

	local rank1 = display.newText( sceneGroup, "1º - 50 pts ", display.contentCenterX+100, display.contentCenterY-90, native.systemFont, 36 )
			rank1:setFillColor( 0, 0, 0)
			rank1.anchorX = 1

	local rank2 = display.newText( sceneGroup, "2º - 45 pts ", display.contentCenterX+100, display.contentCenterY-30, native.systemFont, 36 )
			rank2:setFillColor( 0, 0, 0)
			rank2.anchorX = 1

	local rank3 = display.newText( sceneGroup, "3º - 10 pts ", display.contentCenterX+100, display.contentCenterY+30, native.systemFont, 36 )
			rank3:setFillColor( 0, 0, 0)
			rank3.anchorX = 1
	
--    timer.performWithDelay(5000, gotoMenu)
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