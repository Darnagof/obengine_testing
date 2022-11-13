local SceneSelector = GameObject();

function SceneSelector:init(pScenes)
    canvas = obe.canvas.Canvas(SceneSelector.components.Sprite:get_size():to(obe.transform.Units.ScenePixels).x, SceneSelector.components.Sprite:get_size():to(obe.transform.Units.ScenePixels).y);
    scenes = pScenes
    selectedScene = 1
    selectedSceneTxt = canvas:Text("selectedScene")({
        unit = obe.transform.Units.ViewPercentage,
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
        unit = obe.transform.Units.ViewPercentage,
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
    Engine.Scene:load_from_file("Data/Scenes/" .. scenes[selectedScene] .. ".map.vili")
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
    canvas:render(SceneSelector.components.Sprite)
end