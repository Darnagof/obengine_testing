function Local.Init(pos, size, color, angle, speed)
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

function Object:setRot(angle, origin)
    Object.collider:setRotation(angle, origin or Object.collider:getCentroid())
    Object.sprite:setRotation(angle)
end

function Object:getRot()
    return Object.collider:getRotation()
end

function Object.onCollide(self, baseOffset, collData)
    --print("CollDestroyer collide !")
    for _, coll in pairs(collData.colliders) do
        --print("CollDestroyer destroy other collider")
        Engine.Scene:getGameObject(coll:getParentId()):destroy()
    end
end

function Event.Game.Update(event)
    Object.tNode:update(event.dt)
end