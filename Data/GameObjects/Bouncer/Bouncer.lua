local LEFT, RIGHT, UP, DOWN = 1, 2, 3, 4
local COLL_WIDTH = 0.05

function Local.Init(size)
    This.SceneNode:setPosition(obe.Transform.UnitVector(0, 0, obe.Transform.Units.SceneUnits), obe.Transform.Referential.Center)
    Object.pos = This.SceneNode:getPosition()
    Object.colliders, Object.sprites = {}, {}
    Object.colliders[LEFT] = createBoxCollider("wallLeft", {x = Object.pos.x - size.x/2 - COLL_WIDTH, y = Object.pos.y - size.y/2}, {x = COLL_WIDTH, y = size.y})
    Object.sprites[LEFT] = createSprite("", "#828282", {x = Object.pos.x - size.x/2 - COLL_WIDTH, y = Object.pos.y - size.y/2}, {x = COLL_WIDTH, y = size.y}, 1)
    Object.colliders[RIGHT] = createBoxCollider("wallRight", {x = Object.pos.x + size.x/2, y = Object.pos.y - size.y/2}, {x = COLL_WIDTH, y = size.y})
    Object.sprites[RIGHT] = createSprite("", "#828282", {x = Object.pos.x + size.x/2, y = Object.pos.y - size.y/2}, {x = COLL_WIDTH, y = size.y}, 1)
    Object.colliders[UP] = createBoxCollider("wallUp", {x = Object.pos.x - size.x/2, y = Object.pos.y - size.y/2 - COLL_WIDTH}, {x = size.x, y = COLL_WIDTH})
    Object.sprites[UP] = createSprite("", "#828282", {x = Object.pos.x - size.x/2, y = Object.pos.y - size.y/2 - COLL_WIDTH}, {x = size.x, y = COLL_WIDTH}, 1)
    Object.colliders[DOWN] = createBoxCollider("wallDown", {x = Object.pos.x - size.x/2, y = Object.pos.y + size.y/2}, {x = size.x, y = COLL_WIDTH})
    Object.sprites[DOWN] = createSprite("", "#828282", {x = Object.pos.x - size.x/2, y = Object.pos.y + size.y/2}, {x = size.x, y = COLL_WIDTH}, 1)

    for i = 1, #Object.colliders do
        Object.colliders[i]:setParentId(This:getId())
        This.SceneNode:addChild(Object.colliders[i])
    end

    Engine.Scene:createGameObject("Square_collider", "Blue"){pos = {x=0, y=-0.1}, size = {x=0.2, y=0.2}, color = "0000FF", angle = -90, speed = 0}
    Engine.Scene:createGameObject("Square_collider", "Red"){pos = {x=-0.1, y=-0.1}, size = {x=0.2, y=0.2}, color = "FF0000", angle = 0, speed = 0.05}
    
    Engine.Scene:createGameObject("Square_collider", "Yellow"){pos = {x=-0.5, y=0}, size = {x=0.2, y=0.2}, color = "FFFF00", angle = -90, speed = 0.2}

end
