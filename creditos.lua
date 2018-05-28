local composer = require ("composer")
local scene = composer.newScene( )


local json = require( "json" )
local scoresTable = {}
local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )

local function loadScores()

	local file = io.open( filePath, "r" )

	if file then
		local contents = file:read( "*a" )
		io.close( file )
		scoresTable = json.decode( contents )
	end

	if ( scoresTable == nil or #scoresTable == 0 ) then
		scoresTable = { 0, 0, 0, 0, 0 }
	end
end
local function saveScores()

	for i = #scoresTable, 11, -1 do
		table.remove( scoresTable, i )
	end

	local file = io.open( filePath, "w" )

	if file then
		file:write( json.encode( scoresTable ) )
		io.close( file )
	end
end

function gotoMenu()
  composer.removeScene("ranking")
  composer.gotoScene( "menu", { time = 100, effect = "zoomInOut" } )
end

function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect ( sceneGroup, "menu/CREDITOS.png", 330, 580 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local botaoMenu = display.newImageRect( sceneGroup, "menu/BOTAOMENU.png", 102,70 )
	botaoMenu.x = display.contentCenterX+10
	botaoMenu.y = display.contentCenterY+200

	botaoMenu:addEventListener( "tap", gotoMenu )
	
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