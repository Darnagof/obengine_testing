function Local.Init(colliderId)
    Object.collider = Engine.Scene:getGameObject(colliderId)
    Object.collInitPos = Object.collider:getPos()
    canvas = obe.Canvas.Canvas(This.Sprite:getSize():to(obe.Transform.Units.ScenePixels).x, This.Sprite:getSize():to(obe.Transform.Units.ScenePixels).y);
    instructionsTxt = canvas:Text("instructionsTxt")({
        unit = obe.Transform.Units.ViewPercentage,
        x = 0.01, y = 0.01,
        text =  Engine.Input:getAction("HUp"):getInvolvedButtons()[1]:getName() .. ": speed+\n" ..
                Engine.Input:getAction("HDown"):getInvolvedButtons()[1]:getName() .. ": speed-\n" ..
                Engine.Input:getAction("Space"):getInvolvedButtons()[1]:getName() .. ": launch cube\n" ..
                Engine.Input:getAction("Reset"):getInvolvedButtons()[1]:getName() .. ": reset",
        size = 20,
        font = "Data/Fonts/NotoSans.ttf",
        layer = 0
    });
    canvas:Text("speedTxt")({
        unit = obe.Transform.Units.ViewPercentage,
        x = 0.1, y = 0.1,
        text = "Speed : ", size = 25,
        font = "Data/Fonts/NotoSans.ttf",
        layer = 0
    });
    speedAmountTxt = canvas:Text("speedAmountTxt")({
        unit = obe.Transform.Units.ViewPercentage,
        x = 0.15, y = 0.1,
        text = "0", size = 25,
        font = "Data/Fonts/NotoSans.ttf",
        layer = 0
    });
    -- Print width of walls
    local walls = Engine.Scene:getAllGameObjects("Wall")
    for _, wall in pairs(walls) do
        local width = wall:getSize().x
        local pos = wall:getSprite():getPosition(obe.Transform.Referential.Top)
        canvas:Text(wall.id.."Txt")({
            unit = obe.Transform.Units.SceneUnits,
            x = pos.x, y = pos.y,
            align = {
                h = "Center",
                v = "Bottom"
            },
            text = tostring(width), size = 22,
            font = "Data/Fonts/NotoSans.ttf",
            layer = 0
        });
    end
    canvas:render(This.Sprite)
end

function Event.Actions.HUp()
    Object.collider:getTrajectory():setSpeed(Object.collider:getTrajectory():getSpeed() + 0.1)
    speedAmountTxt.text = tostring(Object.collider:getTrajectory():getSpeed())
    canvas:render(This.Sprite)
end

function Event.Actions.HDown()
    Object.collider:getTrajectory():setSpeed(Object.collider:getTrajectory():getSpeed() - 0.1)
    speedAmountTxt.text = tostring(Object.collider:getTrajectory():getSpeed())
    canvas:render(This.Sprite)
end

function Event.Actions.Space()
    Object.collider:stop(false)
end

function Event.Actions.Reset()
    Object.collider:stop(true)
    Object.collider:getTrajectory():setSpeed(0.0)
    Object.collider:setPos(Object.collInitPos)
    speedAmountTxt.text = tostring(Object.collider:getTrajectory():getSpeed())
    canvas:render(This.Sprite)
end