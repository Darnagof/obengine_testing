function Local.Init()
    for i = 0, 20, 0.4 do
        for j = 0, 10, 0.4 do
            Engine.Scene:createGameObject("Square_collider"){pos = {x=i, y=j}, size = {x=0.2, y=0.2}}
        end
    end
    collDest = Engine.Scene:createGameObject("CollDestroyer"){pos = {x=-1, y=11}, color="#FF0000", speed=1, angle=45, size = {x=2, y=2}}

    -- Test
    chrono_test = obe.Time.Chronometer();
    chrono_test:start();
    Engine.Events:schedule():after(3):run(function()
        collDest:setRot(45)
    end);
    Engine.Events:schedule():after(3):run(function()
        collDest:setRot(45)
    end);
end
