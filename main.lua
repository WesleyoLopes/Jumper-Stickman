-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local background = display.newImageRect("fundo.png", 330, 580)
background.x = display.contentCenterX
background.y = display.contentCenterY


-----------------------------------------------------------
local paredes = display.newGroup()

local parede = display.newImageRect (paredes,"parede.png", 10, 570)
parede.x = display.contentCenterX-155
parede.y = display.contentCenterY

local parede2 = display.newImageRect (paredes,"parede.png", 10, 570)
parede2.x = display.contentCenterX+155
parede2.y = display.contentCenterY

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
chao7.y = display.contentCenterY-105
chao7.rotation = 90


local chao8 = display.newImageRect (paredes, "parede.png", 10,250)--chão 6
chao8.x = display.contentCenterX-50
chao8.y = display.contentCenterY-179
chao8.rotation = 90


local chao9 = display.newImageRect (paredes, "parede.png", 10,280)--chão 7
chao9.x = display.contentCenterX+40
chao9.y = display.contentCenterY-249
chao9.rotation = 90



local armadilha01 = display.newImageRect ("armadilha1.png", 20, 20)
armadilha01.x = display.contentCenterX
armadilha01.y = display.contentCenterY+115

local armadilha02 = display.newImageRect ("armadilha2.png", 25, 25 )
armadilha02.x = display.contentCenterX-90
armadilha02.y = display.contentCenterY-33


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

physics.addBody( armadilha01, "static",{bounce = 0} )
physics.addBody( armadilha02, "static",{bounce = 0} )


--****************************************************
--local man = display.newImageRect ("man.png", 40, 50)
--man.x = display.contentCenterX-110
--man.y = display.contentCenterY+250

--*****************************************************
local buttons = {}

buttons[1] = display.newImage("botao.png")
buttons[1].x = 250
buttons[1].y = 380
buttons[1].myName = "direita"
buttons[1].rotation = 90

buttons[2] = display.newImage("botao.png")
buttons[2].x = 150
buttons[2].y = 380
buttons[2].myName = "esquerda"
buttons[2].rotation = 270

buttons[3] = display.newImage("botao.png")
buttons[3].x = 200
buttons[3].y = 380
buttons[3].myName = "pular"





--physics.addBody(man, "dynamic", {radius = 15, bounce = 0})	
--man:setLinearVelocity (80, 0)


--local function jump()
--  man:applyLinearImpulse( 0, -0.050, man.x, man.y )
--end

--man:addEventListener("tap", jump

--***********************************************************
--[[
spritePlayer = {
	frames = {
	{--1	
		x = 0,
		y = 0,
		width = 54.5,
		height = 50,
	},
	{--2
		x = 54.6,
		y = 0,
		width = 54.5,
		height = 50,
	},
	{--3
		x = 109.1,
		y = 0,
		width = 54.5,
		height = 50,
	},
	{--4
		x = 163.6,
		y = 0,
		width = 54.5,
		height = 50,
	},
	{--5
		x = 0,
		y = 51,
		width = 54.5,
		height = 50,
	},
	{--6
		x = 54.6,
		y = 51,
		width = 54.5,
		height = 50,
	},
	{--7
		x = 109.1,
		y = 51,
		width = 54.5,
		height = 50,
	},
	{--8
		x = 163.6,
		y = 51,
		width = 54.5,
		height = 50,
	},
 	}
}
-]]

local sheetOptions = {
	width = 44,
	height = 52,
	numFrames = 34,
	sheetContentWidth = 1496,
	sheetContentHeigth = 52
}
local sheet = graphics.newImageSheet( "spriteSheets.png", sheetOptions)

local sequenceSprite = {
	{name = "paradoDireita", frames = {11}, time = 500, loopCount = 0},
	{name = "correndoDireita", frames = {2,3,4,5,6,7,8,9,10}, time = 500, loopCount = 0 },
	{name = "pulandoDireita", frames = {12,13,14,16,16,16,16,16,11}, time = 1000, loopCount = 1 },
	{name = "correndoEsquerda", frames = {18,20,21,22,23,24,25,26}, time = 500, loopCount = 0 },
	{name = "pulandoESquerda", frames = {27,28,29,30,27}, time = 1000, loopCount = 1},

}

local player = display.newSprite( sheet, sequenceSprite)
player.x = display.contentCenterX-100
player.y = display.contentCenterY+200


physics.addBody(player, "dynamic", {radius = 25, bounce = 0})

local directJump

local function jump()
  player:applyLinearImpulse( 0, -0.090, player.x, player.y )
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

local passos = 0

local update = function()
	player.x = player.x + passos
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


local j

for j = 1, #buttons do
	buttons[j]:addEventListener( "touch", touchFunction)

end
---------

