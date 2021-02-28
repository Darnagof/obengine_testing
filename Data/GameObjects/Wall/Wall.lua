function Local.Init(pos, size, color)
    -- SceneNode
    This.SceneNode:setPosition(obe.Transform.UnitVector(pos.x or 0, pos.y or 0, obe.Transform.stringToUnits(pos.unit or "SceneUnits")))
    -- Sprite
    Object.sprite = createSprite("", color, pos, size, 1)
    Object.sprite:setParentId(This:getId())
    This.SceneNode:addChild(Object.sprite)
    -- Collider + trajectory
    Object.collider = createBoxCollider(This:getId().."_coll", pos, size)
    Object.collider:setParentId(This:getId())
    This.SceneNode:addChild(Object.collider)
end

function Object:getId()
    return This:getId()
end

function Object:getSize()
    return Object.sprite:getSize()
end

function Object:getPos()
    return This.SceneNode:getPosition()
end

function Object:getSprite()
    return Object.sprite
end