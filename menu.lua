local composer = require ("composer")

local scene = composer.newScene( )

local menuSound

local function iniciarJogo()
	composer.removeScene( "game" )
	composer.gotoScene("game", { time=800, effect="crossFade" } )
end


function scene:create(event)
	local sceneGroup = self.view

	local background = display.newImageRect(sceneGroup, "menu/MENUBACKGROUND.png", 330, 580)
	background.x = display.contentCenterX
    background.y = display.contentCenterY

    local jogar = display.newImageRect( sceneGroup, "menu/MENUJOGAR.png", 122, 85 )
    jogar.x = display.contentCenterX-80
    jogar.y = display.contentCenterY-20

    local fases = display.newImageRect( sceneGroup, "menu/MENUFASES.png", 130, 101 )
    fases.x = display.contentCenterX +90
    fases.y = display.contentCenterY -60

    local creditos = display.newImageRect( sceneGroup, "menu/MENUCREDITOS.png", 115, 86)
    creditos.x = display.contentCenterX+80
    creditos.y = display.contentCenterY+230

    local sair = display.newImageRect( sceneGroup, "menu/MENUSAIR.png", 102, 70)
    sair.x = display.contentCenterX -90
    sair.y = display.contentCenterY +240

    jogar:addEventListener( "tap", iniciarJogo)

--adicionando audio
    menuSound = audio.loadStream("audio/audioMenu.mp3")
    audio.reserveChannels( 1 )
    audio.play( menuSound, {chanel = 1, loops = -1})
--fim audio
end

scene:addEventListener("create", create)	
return scene