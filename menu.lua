local composer = require ("composer")

local scene = composer.newScene( )

local menuSound

local function iniciarJogo()
    audio.setVolume(0 , {chanel =1})
    audio.stop(  )
	composer.removeScene( "menu" )
	composer.gotoScene("game", {time = 10} )
end

local function goRanking()
    composer.removeScene("menu")
    composer.gotoScene( "ranking", {time = 100, effect = "zoomInOut"} )
end

local function exitGame()
    timer.performWithDelay( 1000,
    function()
      if( system.getInfo("platformName")=="Android" ) then
        native.requestExit()
      else
        os.exit()
      end
end )
end



function scene:create(event)
	local sceneGroup = self.view

	local background = display.newImageRect(sceneGroup, "menu/MENUBACKGROUND.png", 330, 580)
	background.x = display.contentCenterX
    background.y = display.contentCenterY

    local jogar = display.newImageRect( sceneGroup, "menu/MENUJOGAR.png", 122, 85 )
    jogar.x = display.contentCenterX-80
    jogar.y = display.contentCenterY-20

    local ranking = display.newImageRect( sceneGroup, "menu/MENURANKING.png", 120, 84 )
    ranking.x = display.contentCenterX +90
    ranking.y = display.contentCenterY -60

    local creditos = display.newImageRect( sceneGroup, "menu/MENUCREDITOS.png", 115, 86)
    creditos.x = display.contentCenterX+80
    creditos.y = display.contentCenterY+230

    local sair = display.newImageRect( sceneGroup, "menu/MENUSAIR.png", 102, 70)
    sair.x = display.contentCenterX -90
    sair.y = display.contentCenterY +240

    jogar:addEventListener( "tap", iniciarJogo)
    sair:addEventListener("tap", exitGame)
    ranking:addEventListener( "tap", goRanking )

--adicionando audio
    menuSound = audio.loadStream("audio/audioMenu.mp3")
    audio.reserveChannels( 1 )
    audio.setVolume( 0.4 , {chanel = 1} )
    audio.play( menuSound, {chanel = 1, loops = -1})
--fim audio
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
--      audio.stop( 1 )
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