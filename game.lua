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

local chao = display.newImageRect (paredes,"chao.png", 20, 200)
chao.x = display.contentCenterX-150
chao.y = display.contentCenterY+200

local chao1 = display.newImageRect (paredes, "chao1.png", 350, 20)
chao1.x = display.contentCenterX
chao1.y = display.contentCenterY+275

local chao2 = display.newImageRect (paredes, "chao2.png", 200, 120)
chao2.x = display.contentCenterX+150
chao2.y = display.contentCenterY+280


--****************************************************
--local man = display.newImageRect ("man.png", 40, 50)
--man.x = display.contentCenterX-110
--man.y = display.contentCenterY+250

--*****************************************************

local physics =  require ("physics")
physics.start()
physics.addBody (chao, "static")
physics.addBody (chao1, "static")
physics.addBody (chao2, "static")



local sheetData = { width = 45, heigth = 63, numFrames = 12 }

local sheet = graphics.newImageSheet("gaara.png", sheetData)


--local sequenceData ={
--	{name = "runRigth", start = 8, count = 1, time = 300, loopCount = 0},
--}




local player = display.newSprite( sheet, sequenceData)
player.x = contentCenterX
player.y = contentCenterY

--man:setLinearVelocity (80, 0)


--local function jump()
--  man:applyLinearImpulse( 0, -0.050, man.x, man.y )
--end

--man:addEventListener("tap", jump

--***********************************************************

