local composer = require ("composer")
local scene = composer.newScene( )

local chao10
local player



local sheetOptions = {
  width = 35,
  height = 41,
  numFrames = 56,
  sheetContentWidth = 1960,
  sheetContentHeigth = 41
}

local sheet = graphics.newImageSheet( "spriteCompleta.png", sheetOptions)

function gotoMenu()
  composer.removeScene("proxFase")
  composer.gotoScene( "menu", { time = 100, effect = "zoomInOut" } )
end

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect ( sceneGroup, "construcao.png", 330, 580 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	chao10 = display.newImageRect ( "chao1.png", 350, 20)--chão
  chao10.x = display.contentCenterX
  chao10.y = display.contentCenterY+275
  chao10.myName = "chao"

  player = display.newSprite( sheet, sequenceSprite)
  player.x = display.contentCenterX-100
  player.y = display.contentCenterY+200
  player.myName = "player1"

	

  physics.addBody(player, "dynamic", {radius = 15, bounce = 0})
  physics.addBody(chao10, "static", { bounce = 0})
   -- timer.performWithDelay(5000, gotoMenu)
end


timer.performWithDelay( 3000, gotoMenu )

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
  display.remove( player )
  display.remove( chao10 )
  display.remove( background )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene