function Local.Init(pScenes)
    canvas = obe.Canvas.Canvas(This.Sprite:getSize():to(obe.Transform.Units.ScenePixels).x, This.Sprite:getSize():to(obe.Transform.Units.ScenePixels).y);
    scenes = pScenes
    selectedScene = 1
    selectedSceneTxt = canvas:Text("selectedScene")({
        unit = obe.Transform.Units.ViewPercentage,
        x = 0.5, y = 0.5,
        align = {
            h = "Center",
            v = "Center"
        },
        text = scenes[selectedScene], size = 72,
        font = "Data/Fonts/NotoSans.ttf",
        layer = 0,
    });
    arrowsTxt = canvas:Text("arrows")({
        unit = obe.Transform.Units.ViewPercentage,
        x = 0.5, y = 0.55,
        align = {
            h = "Center",
            v = "Center"
        },
        text = "←   →", size = 60,
        font = "Data/Fonts/NotoSans.ttf",
        layer = 0,
    });
    render()
end

function Event.Actions.Return()
    Engine.Scene:loadFromFile("Data/Scenes/" .. scenes[selectedScene] .. ".map.vili")
end

function Event.Actions.PLeft()
    if selectedScene == 1 then
        selectedScene = #scenes
    else
        selectedScene = selectedScene - 1
    end
    render()
end

function Event.Actions.PRight()
    if selectedScene == #scenes then
        selectedScene = 1
    else
        selectedScene = selectedScene + 1
    end
    render()
end

function render()
    selectedSceneTxt.text = scenes[selectedScene]
    canvas:render(This.Sprite)
end