local composer = require ("composer")

local scene = composer.newScene( )

local background = display.newImageRect("fundo.jpg", 330, 580)
background.x = display.contentCenterX
background.y = display.contentCenterY

local vidas = 3

-----------------------------------------------------------
local paredes = display.newGroup()

local parede = display.newImageRect (paredes,"parede.png", 10, 570)
parede.x = display.contentCenterX-155
parede.y = display.contentCenterY
parede.myName = "parade1"

local parede2 = display.newImageRect (paredes,"parede.png", 10, 570)
parede2.x = display.contentCenterX+155
parede2.y = display.contentCenterY
parede2.myName = "parede2"

local chao1 = display.newImageRect (paredes, "chao1.png", 350, 20)--chão
chao1.x = display.contentCenterX
chao1.y = display.contentCenterY+275

local chao2 = display.newImageRect (paredes, "chao2.png", 200, 120)--bloco direito
chao2.x = display.contentCenterX+150
chao2.y = display.contentCenterY+280

local chao3 = display.newImageRect (paredes, "parede.png", 10,250)--chão 2
chao3.x = display.contentCenterX-35
chao3.y = display.contentCenterY+125
chao3.rotation = 90

local chao4 = display.newImageRect (paredes, "chao2.png", 150, 150)--bloco direito2
chao4.x = display.contentCenterX+100
chao4.y = display.contentCenterY-30
chao4.myName = "blocoDireito"

local chao5 = display.newImageRect (paredes, "parede.png", 10,200)--chão 3
chao5.x = display.contentCenterX+10
chao5.y = display.contentCenterY+40
chao5.rotation = 90

local chao6 = display.newImageRect (paredes, "parede.png", 10,100)--chão 4
chao6.x = display.contentCenterX-100
chao6.y = display.contentCenterY-25
chao6.rotation = 90

local chao7 = display.newImageRect (paredes, "parede.png", 10,200)--chão 5
chao7.x = display.contentCenterX
chao7.y = display.contentCenterY-99
chao7.rotation = 90


local chao8 = display.newImageRect (paredes, "parede.png", 10,250)--chão 6
chao8.x = display.contentCenterX-50
chao8.y = display.contentCenterY-179
chao8.rotation = 90


local chao9 = display.newImageRect (paredes, "parede.png", 10,280)--chão 7
chao9.x = display.contentCenterX+40
chao9.y = display.contentCenterY-249
chao9.rotation = 90


--[[local borracha01 = display.newImageRect ("borracha.png", 40, 30)
borracha01.x = display.contentCenterX-100
borracha01.y = display.contentCenterY-200
borracha01.myName = "borracha01"
]]



local livesText = display.newText( "Vidas: " .. vidas, 60, 0, native.systemFont, 20 )
livesText:setFillColor( 0 )

--===============================================================
local physics =  require ("physics")
physics.start()

physics.setGravity (0,6)

physics.addBody (parede, "static",{bounce = 0})
physics.addBody (parede2, "static",{bounce = 0})
physics.addBody (chao1, "static",{bounce = 0})
physics.addBody (chao2, "static",{bounce = 0})
physics.addBody(chao3, "static",{bounce = 0})
physics.addBody(chao4, "static",{bounce = 0})
physics.addBody( chao5, "static",{bounce = 0})
physics.addBody( chao6, "static",{bounce = 0})
physics.addBody( chao7, "static",{bounce = 0})
physics.addBody( chao8, "static",{bounce = 0})
physics.addBody( chao9, "static" ,{bounce = 0})

local function borracha()
  local borracha = display.newImageRect("borracha.png", 15, 20 )
  borracha.x = display.contentCenterX
  borracha.y = display.contentCenterY-270
  physics.addBody( borracha, "dynamic",{bounce = 0,5} )
  borracha:setLinearVelocity(-40,0)
--  transition.to (borracha, {x = display.contentCenterX, y = display.contentCenterY, timer = 500})
end
timer.performWithDelay( 5000, borracha, 100 )



--physics.addBody( borracha01, "dynamic",{bounce = 0,5} )

--borracha01:setLinearVelocity ( 30, 0 )




local buttons = {}

buttons[1] = display.newImage("botao.png")
buttons[1].x = 265
buttons[1].y = 240
buttons[1].myName = "direita"

buttons[2] = display.newImage("botao.png")
buttons[2].x = 55
buttons[2].y = 240
buttons[2].myName = "esquerda"

buttons[3] = display.newImage("botao.png")
buttons[3].x = 160
buttons[3].y = 240
buttons[3].myName = "pular"


local sheetOptions = {
	width = 35,
	height = 41,
	numFrames = 56,
	sheetContentWidth = 1960,
	sheetContentHeigth = 41
}

local sheet = graphics.newImageSheet( "spriteCompleta.png", sheetOptions)

local sequenceSprite = {
	{name = "paradoDireita", frames = {1}, time = 500, loopCount = 0},
	{name = "correndoDireita", frames = {3,4,5,6,7,8,9,10}, time = 500, loopCount = 0 },
	{name = "pulandoDireita", frames = {12,13,14,16,16,16,12}, time = 1000, loopCount = 1 },
	{name = "caindoDireita", frames = {46,47,48,49,50,50,50,51,52,52,53,53,54,54,55,55,56,56}, time = 1000, loopCount = 1},
	{name = "correndoEsquerda", frames = {19,20,22,23,24,25,26}, time = 500, loopCount = 0 },
	{name = "pulandoEsquerda", frames = {27,28,29,30,28}, time = 1000, loopCount = 1},
	{name = "caindoEsquerda", frames = {36,37,38,39,39,39,39,40,40,41,41,42,42,43,43,44,44,45,45}, time = 1000, loopCount = 1},


}



local player = display.newSprite( sheet, sequenceSprite)
player.x = display.contentCenterX-100
player.y = display.contentCenterY+200
player.myName = "player"

physics.addBody(player, "dynamic", {radius = 15, bounce = 0})

local directJump


local function updateText()

  livesText.text = "Vidas: " .. vidas 

end

local function jump()
  player:applyLinearImpulse( 0, -0.030, player.x, player.y )
  	if directJump == "direita" then
  		player:setSequence("pulandoDireita")
  		player:play( )
	elseif directJump == "esquerda" then
		player:setSequence( "pulandoEsquerda" )
		player:play()
	else
		player:setSequence("pulandoDireita")
		player:play()
	end

end


local touchFunction = function(e)
	if e.phase == "began" then
		if e.target.myName == "direita" then
			player:setLinearVelocity (80,0)
			player:setSequence("correndoDireita")
			directJump = "direita"
			player: play()
		elseif e.target.myName == "esquerda" then
			player:setLinearVelocity (-80,0)
			player:setSequence("correndoEsquerda")
			directJump = "esquerda"
			player: play()
		elseif e.target.myName == "pular" then
			jump()
		end	
	end
end

local function gotoMenu()
	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end

--====================================================================

local function onCollision( event )
 
    if ( event.phase == "began" ) then
 
        local obj1 = event.object1
        local obj2 = event.object2

        if ( obj1.myName == "player" and obj2.myName == "borracha" ) then

           	if (directJump == "direita") then
           	player:setSequence( "caindoEsquerda" )
            vidas = vidas-1
            livesText.text = "Vidas: " .. vidas 

           else
           	player:setSequence( "caindoDireita" )
           	vidas = vidas-1
          	livesText.text = "Vidas: " .. vidas 

           	end
           	player:play( )

        elseif
            ( obj1.myName == "borracha" and obj2.myName == "player" ) then       	
            if (directJump == "direita") then
           	player:setSequence( "caindoEsquerda" )
           	player:play()
           	vidas = vidas-1
           	livesText.text = "Vidas: " .. vidas 
           else
           	player:setSequence( "caindoDireita" )
           	player:play()
           	vidas = vidas-1
           	livesText.text = "Vidas: " .. vidas 
           	end
        if (vidas <= 0) then
          display.remove( player )
          gameOver = display.newText( "GAME OVER " , 180, 200, native.systemFont, 40 )
          gameOver:setFillColor( 1, 0, 0, 1 )
          gameOver:addEventListener( "tap", gotoMenu )
        end    
--======================================colisões com o cenário
        elseif						
        	(obj1.myName == "borracha" and obj2.myName == "blocoDireito")	then
        	borracha:setLinearVelocity ( -30, 0 )
        elseif						
        	(obj1.myName == "blocoDireito" and obj2.myName == "borracha")	then	
        	borracha:setLinearVelocity ( -30, 0 )	


        elseif
        	(obj1.myName == "borracha" and obj2.myName == "parede1" )	then
        	 borracha01:setLinearVelocity ( 30, 0 )
        elseif
        	(obj1.myName == "parede1" and obj2.myName == "borracha")	then	
        	 borracha01:setLinearVelocity ( 30, 0 )	
        elseif
          (obj1.myName == "borracha" and obj2.myName == "parede2" ) then
           borracha01:setLinearVelocity ( -30, 0 )
        elseif
          (obj1.myName == "parede2" and obj2.myName == "borracha")  then  
           borracha01:setLinearVelocity ( -30, 0 ) 
--==========================================================================================================

        end

    end
end

local j

for j = 1, #buttons do
	buttons[j]:addEventListener( "touch", touchFunction)

end

Runtime:addEventListener( "collision", onCollision )




return scene
---------
