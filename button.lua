local Button = {}
Button.__index = Button

function Button.new(x, y, w, h, text)
    return setmetatable({
        x = x,
        y = y,
        w = w,
        h = h,
        text = text or "Button"
    }, Button)
end

function Button:draw()
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)

    love.graphics.printf(
        self.text,
        self.x,
        self.y + self.h / 2 - 6,
        self.w,
        "center"
    )
end

function Button:isClicked(mx, my, button)
    button = button or 1

    return button == 1
        and mx >= self.x
        and mx <= self.x + self.w
        and my >= self.y
        and my <= self.y + self.h
end

function Button:destroy()
    self = nil
end

return Button