function Local.Init(pos, size, color, angle, speed)
    local angle = angle or 0
    local speed = speed or 0
    -- SceneNode
    This.SceneNode:setPosition(obe.Transform.UnitVector(pos.x, pos.y, obe.Transform.Units.SceneUnits), obe.Transform.Referential.Center)
    -- Sprite
    Object.sprite = createSprite("", color, pos, size, 1)
    Object.sprite:setParentId(This:getId())
    This.SceneNode:addChild(Object.sprite)
    -- Collider + trajectory
    Object.collider = createBoxCollider(This:getId().."_coll", pos, size)
    Object.collider:setParentId(This:getId())
    This.SceneNode:addChild(Object.collider)
    Object.tNode = obe.Collision.TrajectoryNode(This.SceneNode)
    Object.tNode:addTrajectory("Linear")
        :setAngle(angle)
        :setSpeed(speed)
        :setAcceleration(0)
        :onCollide(Object.onCollide)
    Object.trajectory = Object.tNode:getTrajectory("Linear")
    if speed == 0 then
        Object.trajectory:setStatic(true)
    end
    Object.tNode:setProbe(Object.collider)
    
end

function Object:stop(doStop)
    Object.trajectory:setStatic(doStop)
end

function Object:getTrajectory()
    return Object.trajectory
end

function Object:setPos(pos)
    This.SceneNode:setPosition(pos, obe.Transform.Referential.Center)
end

function Object:getPos()
    return This.SceneNode:getPosition()
end

function Object:destroy()
    Engine.Scene:removeSprite(Object.sprite:getId())
    Engine.Scene:removeCollider(Object.collider:getId())
    This:deleteObject()
end

function Object.onCollide(self, baseOffset, collData)
    collsStr = ""
    for _, coll in pairs(collData.colliders) do
        collsStr = collsStr ..  " " .. coll:getId()
    end
    print(This:getId(), "ouch, onCollide ! baseOffset: ", baseOffset, "offset", collData.offset, "touchedColliders", collsStr)
end

function Event.Game.Update(event)
    Object.tNode:update(event.dt)
end