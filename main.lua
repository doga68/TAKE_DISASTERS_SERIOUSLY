local Button = require("button")

function imagedraw(img, x, y)
    if y % 2 == 1 then
        newx = TILESIZEW/2
    else
        newx = 0
    end
    
    pos = {
        basepoint[1]-TILESIZEW/2+TILESIZEW*x+newx,
        basepoint[2]-TILESIZEH/2+TILESIZEH*y
    }
    
    love.graphics.draw(img, pos[1], pos[2])
end

function love.load()
    start = false
    game = true
    camera_speed = 20
    basepoint = {love.graphics.getWidth()/2, love.graphics.getHeight()/2}
    TILESIZEH = 15
    TILESIZEW = 64
    img_grass = love.graphics.newImage("grass.png")
    img_housef = love.graphics.newImage("house.png")
    img_water = love.graphics.newImage("water.png")
    houses = {{-2,-2}, {2, -2}, {-2, 2}, {2,2}}
    pbutton = Button.new(basepoint[1], basepoint[2], 50, 30, "PLAY")
    sbutton = Button.new(basepoint[1]-40, basepoint[2]+200, 160, 40, "DISASTER OCCURS")
end

function love.draw()
    if game and not start then
        pbutton:draw()
    elseif game and start then
		for y = -7, 8 do
			for x = -5, 5 do
				imagedraw(img_water, x, y)
			end
		end
		
        for y = -6, 6 do
            for x = -4, 4 do
                imagedraw(img_grass, x, y)
            end
        end
        for i, n in pairs(houses) do
            imagedraw(img_housef, n[1], n[2])
        end
        sbutton:draw()
    elseif start then
        love.graphics.printf(
            "THIS GAME SHOULD HAVE BEEN DEVELOPED WITH MORE CARE TO REACH A HAPPY END\n\nBU OYUNUN MUTLU BIR SONA ULAŞABİLMESİ İÇİN DAHA DİKKATLİ GELİŞTİRİLMELİYDİ",
            0,
            love.graphics.getHeight() / 2 - 10,
            love.graphics.getWidth(),
            "center"
        )
    end
end

function love.mousepressed(x, y, mouseButton)
    if sbutton:isClicked(x, y, mouseButton) then
        if #houses > 1 then
            table.remove(houses, 1)
        else
            game = false
        end
    end
    if pbutton:isClicked(x, y, mouseButton) then
        start = true
        pbutton:destroy()
    end
end