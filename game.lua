local composer = require ("composer")
local scene = composer.newScene( )

local vidas = 3
local pontos = 0
local player
local livesText
local background
local parede
local parede2
local fundo
local chao1
local chao2
local chao3
local chao4
local chao5
local chao6
local chao7
local chao8
local chao9

local proxima
local borrachas
local borrachas2

local tutorial

local pt

local died

local singleJump, doubleJump = false, false

local sheetOptions = {
  width = 35,
  height = 41,
  numFrames = 56,
  sheetContentWidth = 1960,
  sheetContentHeigth = 41
}

--===============================================================
local physics =  require ("physics")
physics.start()

physics.setGravity (0,6)

local function borracha()
  local borracha = display.newImageRect("borracha.png", 15, 20 )
  borracha.x = display.contentCenterX-100
  borracha.y = display.contentCenterY-270
  borracha.myName = "borracha"
  physics.addBody( borracha, "dynamic",{bounce = 0.5, filter={ groupIndex=-2 } } )
  borracha:setLinearVelocity(-40,0)
end

borrachas = timer.performWithDelay( 10000, borracha, 0 ) --timer.cancel( )


local function lapis()
  local lapis = display.newImageRect("lapis.png", 30, 30 )
  lapis.x = display.contentCenterX
  lapis.y = display.contentCenterY-200
  lapis.myName = "lapis"
  physics.addBody( lapis, "dynamic",{bounce = 0.2, filter={ groupIndex=-2 } } )
  lapis:setLinearVelocity(40,0)
end
lapis = timer.performWithDelay( 6000, lapis, 0 ) --timer.cancel( )
-----======================================================================================================================
local function borracha2()
  local borracha2 = display.newImageRect("borracha.png", 15, 20 )
  borracha2.x = display.contentCenterX
  borracha2.y = display.contentCenterY
  borracha2.myName = "borracha"
  physics.addBody( borracha2, "dynamic",{bounce = 0.5, filter={ groupIndex=-2 } } )
  borracha2:setLinearVelocity(-40,0)
end
borrachas2 = timer.performWithDelay( 5000, borracha2, 1 ) --timer.cancel( )


local function lapis2()
  local lapis2 = display.newImageRect("lapis.png", 30, 30 )
  lapis2.x = display.contentCenterX
  lapis2.y = display.contentCenterY
  lapis2.myName = "lapis"
  physics.addBody( lapis2, "dynamic",{bounce = 0.2, filter={ groupIndex=-2 } } )
  lapis2:setLinearVelocity(40,0)
end
lapis2 = timer.performWithDelay( 5000, lapis2, 2 )
--[[
local function lapis()
  local lapis = display.newImageRect("lapis.png", 30, 30 )
  lapis.x = display.contentCenterX
  lapis.y = display.contentCenterY-200
  lapis.myName = "lapis"
  physics.addBody( lapis, "dynamic",{bounce = 0.2, filter={ groupIndex=-2 } } )
  lapis:setLinearVelocity(40,0)
end
lapis = timer.performWithDelay( 5000, lapis, 0 ) --timer.cancel( )
]]
--====================================================================================================================



function removeButtons()
  display.remove( buttons[1] )
  display.remove( buttons[2] )
  display.remove( buttons[3] )
end


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




local sheet = graphics.newImageSheet( "spriteCompleta.png", sheetOptions)

sequenceSprite = {
	{name = "paradoDireita", frames = {1}, time = 500, loopCount = 0},
	{name = "correndoDireita", frames = {3,4,5,6,7,8,9,10}, time = 500, loopCount = 0 },
	{name = "pulandoDireita", frames = {12,13,14,16,16,16,12}, time = 1000, loopCount = 1 },
	{name = "caindoDireita", frames = {46,47,48,49,50,50,50,51,52,52,53,53,54,54,55,55,56,56}, time = 1000, loopCount = 1},
	{name = "correndoEsquerda", frames = {19,20,22,23,24,25,26}, time = 500, loopCount = 0 },
	{name = "pulandoEsquerda", frames = {27,28,29,30,28}, time = 1000, loopCount = 1},
	{name = "caindoEsquerda", frames = {36,37,38,39,39,39,39,40,40,41,41,42,42,43,43,44,44,45,45}, time = 1000, loopCount = 1},
}

local directJump = "direita"


local function updateText()
  livesText.text = "Vidas: " .. vidas 
  pontostText.text = "pontos" .. pontos
end


local function jump()
   --[[ if event.phase == "ended" then
    if doubleJump == false then 
      player:setLinearVelocity( 0, 0 )
      player:applyForce( 0, -2300, player.x, player.y )
      player:setSequence("pulandoDireita")
    end
    if singleJump == false then singleJump = true 
    else doubleJump = true end
  end]]
  player:applyLinearImpulse( 0, -0.030, player.x, player.y )
  print( "jump" )
  	if directJump == "direita" then
  	player:setSequence("pulandoDireita")
  	player:play( )
	  elseif directJump == "esquerda" then
		player:setSequence( "pulandoEsquerda" )
		player:play()
	end
end


local touchFunction = function(e)
  if (not died) then
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
end

function gotoMenu()
  composer.removeScene("game")
	composer.gotoScene( "menu", { time = 800, effect = "crossFade" } )
end

function gotoGameOver()
  composer.setVariable( "finalScore", pontos)
  print("gameOver")
  composer.removeScene("game")
  composer.gotoScene("gameOver", {time = 300, effect = "zoomInOut"})
end

function gotoProxFase()
  composer.removeScene( "game" )
  composer.gotoScene( "proxFase", {time = 700, effect = "slideDown"} )
end
--====================================================================

local function onCollision( event )
if (not died) then 
    if ( event.phase == "began" ) then
 
        local obj1 = event.object1
        local obj2 = event.object2

        if ( obj1.myName == "player" and obj2.myName == "borracha" ) then

           	if (directJump == "direita") then
           	player:setSequence( "caindoEsquerda" )
            vidas = vidas-1
            livesText.text = vidas 

           else
           	player:setSequence( "caindoDireita" )
           	vidas = vidas-1
          	livesText.text = vidas 

           	end
           	player:play( )
        
            --=======erro====
        elseif ( obj1.myName == "borracha" and obj2.myName == "player" ) then       	
            
            if (directJump == "direita") then
           	player:setSequence( "caindoEsquerda" )
          	player:play()
           	vidas = vidas-1
           	livesText.text = vidas 
           else
          	player:setSequence( "caindoDireita" )
           	player:play()
           	vidas = vidas-1
           	livesText.text = vidas 
           end
            ---======^^^^^^========
        if (vidas <= 0) then
          died = true
          display.remove( player )
          display.remove( buttons[1] )
          display.remove( buttons[2] )
          display.remove( buttons[3] )
          
          pt = display.newText( pontos, display.contentCenterX+20, 100, native.systemFont, 36 )
          pt:setFillColor( 0, 0, 0)
          pt.anchorX = 1

          timer.performWithDelay(1000, gotoGameOver)
      

        -- gameOver = display.newText( "GAME OVER " , 180, 200, native.systemFont, 40 )
        --gameOver:setFillColor( 1, 0, 0, 1 )
        -- gameOver:addEventListener( "tap", gotoGameOver )
  
        end    
--====================================colisões com o cenário========================================
        elseif
          (obj1.myName == "lapis" and obj2.myName == "player") then
          display.remove( obj1 )
          pontos = pontos + 1
          pontosText.text =  pontos
        elseif
          (obj1.myName == "player" and obj2.myName == "lapis") then
          display.remove( obj2 )
          pontos = pontos + 1
          pontosText.text =  pontos
        
        elseif
          (obj1.myName == "player" and obj2.myName == "prox") then
          timer.performWithDelay( 0, gotoProxFase)

        elseif
          (obj2.myName == "player" and obj1.myName == "prox") then
           timer.performWithDelay( 0, gotoProxFase) 

        elseif		
        	(obj1.myName == "borracha" and obj2.myName == "blocoDireito")	then
        	 obj1:setLinearVelocity ( -30, 0 )
        elseif						
        	(obj1.myName == "blocoDireito" and obj2.myName == "borracha")	then	
        	 obj2:setLinearVelocity ( -30, 0 )	
        elseif
        	(obj1.myName == "borracha" and obj2.myName == "parede1" )	then
        	 obj1:setLinearVelocity ( 30, 0 )
        elseif
        	(obj1.myName == "parede1" and obj2.myName == "borracha")	then	
        	 obj2:setLinearVelocity ( 30, 0 )	
        elseif
          (obj1.myName == "borracha" and obj2.myName == "parede2" ) then
           obj1:setLinearVelocity ( -30, 0 )
        elseif
          (obj1.myName == "parede2" and obj2.myName == "borracha")  then  
           obj2:setLinearVelocity ( -30, 0 ) 

        end

    end
end
end

local j

for j = 1, #buttons do
	buttons[j]:addEventListener( "touch", touchFunction)

end

Runtime:addEventListener( "collision", onCollision )
--==============================================================================================
function scene:create( event )
  local sceneGroup = self.view
  background = display.newImageRect("fundo.jpg", 330, 580)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  local paredes = display.newGroup()

  parede = display.newImageRect (paredes,"parede.png", 10, 570)
  parede.x = display.contentCenterX-155
  parede.y = display.contentCenterY
  parede.myName = "parede1"

  parede2 = display.newImageRect (paredes,"parede.png", 10, 570)
  parede2.x = display.contentCenterX+155
  parede2.y = display.contentCenterY
  parede2.myName = "parede2"

  chao1 = display.newImageRect (paredes, "chao1.png", 350, 20)--chão
  chao1.x = display.contentCenterX
  chao1.y = display.contentCenterY+275

  chao2 = display.newImageRect (paredes, "chao2.png", 200, 120)--bloco direito
  chao2.x = display.contentCenterX+150
  chao2.y = display.contentCenterY+280

  chao3 = display.newImageRect (paredes, "parede.png", 10,250)--chão 2
  chao3.x = display.contentCenterX-35
  chao3.y = display.contentCenterY+125
  chao3.rotation = 90

  chao4 = display.newImageRect (paredes, "chao2.png", 150, 150)--bloco direito2
  chao4.x = display.contentCenterX+100
  chao4.y = display.contentCenterY-30
  chao4.myName = "blocoDireito"

  chao5 = display.newImageRect (paredes, "parede.png", 10,200)--chão 3
  chao5.x = display.contentCenterX+10
  chao5.y = display.contentCenterY+40
  chao5.rotation = 90

  chao6 = display.newImageRect (paredes, "parede.png", 10,100)--chão 4
  chao6.x = display.contentCenterX-100
  chao6.y = display.contentCenterY-25
  chao6.rotation = 90

  chao7 = display.newImageRect (paredes, "parede.png", 10,200)--chão 5
  chao7.x = display.contentCenterX
  chao7.y = display.contentCenterY-99
  chao7.rotation = 90

  chao8 = display.newImageRect (paredes, "parede.png", 10,250)--chão 6
  chao8.x = display.contentCenterX-50
  chao8.y = display.contentCenterY-179
  chao8.rotation = 90


  chao9 = display.newImageRect (paredes, "parede.png", 10,280)--chão 7
  chao9.x = display.contentCenterX+40
  chao9.y = display.contentCenterY-249
  chao9.rotation = 90
--================================================================
  proxima = display.newImageRect( paredes, "proxFase.png", 280, 5)
  proxima.x = display.contentCenterX-20
  proxima.y = display.contentCenterY-290
  proxima.myName = "prox"

  fundoVidas = display.newImageRect("menu/fundoVidas.png", 100, 70) --fundo das vidas
  fundoVidas.x = display.contentCenterX+100
  fundoVidas.y = display.contentCenterY-260

  livesText = display.newText( vidas, 55, 0, native.systemFont, 19 )--vidas
  livesText:setFillColor( 0 )
  livesText.x = display.contentCenterX+100
  livesText.y = display.contentCenterY-268

  fundoPontos = display.newImageRect("menu/fundoPontos.png", 100, 70) --fundo das vidas
  fundoPontos.x = display.contentCenterX
  fundoPontos.y = display.contentCenterY-260

  pontosText = display.newText( pontos, 55, 0, native.systemFont, 19 )--pontos
  pontosText:setFillColor( 0 )
  pontosText.x = display.contentCenterX
  pontosText.y = display.contentCenterY-268

  player = display.newSprite( sheet, sequenceSprite)
  player.x = display.contentCenterX-100
  player.y = display.contentCenterY+200
  player.myName = "player"


  tutorial = display.newImageRect("tutorial.png", 330, 580)
  tutorial.x = display.contentCenterX
  tutorial.y = display.contentCenterY


local function removeTuto()
  display.remove( tutorial )
end

timer.performWithDelay( 5000, removeTuto )

  physics.addBody(player, "dynamic", {radius = 15, bounce = 0})

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

  physics.addBody( proxima, "static", {bounce = 0})
end


function scene:show( event )

  local sceneGroup = self.view
  local phase = event.phase
  died = false

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

  end
end

function scene:destroy( event )
  local sceneGroup = self.view
  display.remove( background )
  display.remove(chao1)
  display.remove(chao2)
  display.remove(chao3)
  display.remove(chao4)
  display.remove(chao5)
  display.remove(chao6)
  display.remove(chao7)
  display.remove(chao8)
  display.remove(chao9)
  display.remove(parede)
  display.remove(parede2)
  display.remove(fundoVidas)
  display.remove(livesText)
  display.remove(fundoPontos)
  display.remove(pontosText)
  display.remove(player)
  display.remove(sequenceSprite)
  vidas = 3
  died = true
  timer.cancel(borrachas)
  timer.cancel( borrachas2 )
  timer.cancel(lapis)
  timer.cancel( lapis2 )
  display.remove( pt )



  print( "destroy" )

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene