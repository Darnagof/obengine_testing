-- Create a sprite with solid color
-- @param name 
-- @param colorHex color string in format "#XXXXXX"
-- @param pos {x, y, unit, ref}
-- @param size {x, y, unit}
-- @param zDepth
-- @param invisible sprite spawn hidden
-- @return created sprite
function createSprite(name, colorHex, pos, size, zDepth, invisible)
    local sprite = Engine.Scene:createSprite(name)
    local _pos = obe.Transform.UnitVector(pos.x or 0, pos.y or 0, obe.Transform.stringToUnits(pos.unit or "SceneUnits")):to(obe.Transform.Units.SceneUnits)
    local _size = obe.Transform.UnitVector(size.x or 0, size.y or 0, obe.Transform.stringToUnits(size.unit or "SceneUnits")):to(obe.Transform.Units.SceneUnits)
    sprite:loadTexture("Data/Sprites/pixel.png")
    sprite:setColor(obe.Graphics.Color(colorHex or "#FFFFFF"))
    sprite:setZDepth(zDepth or 1)
    sprite:setPosition(_pos, obe.Transform.Referential.FromString(pos.ref or "TopLeft"))
    sprite:setSize(_size, obe.Transform.Referential.FromString(pos.ref or "TopLeft"))
    sprite:setVisible(not invisible or true)
    return sprite
end

-- Create a rect collider
-- @param name
-- @param pos {x, y, unit, ref}
-- @param size {x, y, unit}
-- @return created collider
function createBoxCollider(name, pos, size)
    local collider = Engine.Scene:createCollider(name)
    local _pos = obe.Transform.UnitVector(pos.x or 0, pos.y or 0, obe.Transform.stringToUnits(pos.unit or "SceneUnits")):to(obe.Transform.Units.SceneUnits)
    local _size = obe.Transform.UnitVector(size.x or 0, size.y or 0, obe.Transform.stringToUnits(size.unit or "SceneUnits")):to(obe.Transform.Units.SceneUnits)
    local _rect = obe.Transform.Rect(_pos, _size)
    _rect:setPosition(_pos, obe.Transform.Referential.FromString(pos.ref or "TopLeft"))
    _pos = _rect:getPosition(obe.Transform.Referential.TopLeft)
    collider:addPoint(_pos)
    collider:addPoint(obe.Transform.UnitVector(_pos.x+_size.x, _pos.y, obe.Transform.Units.SceneUnits))
    collider:addPoint(obe.Transform.UnitVector(_pos.x+_size.x, _pos.y+_size.y, obe.Transform.Units.SceneUnits))
    collider:addPoint(obe.Transform.UnitVector(_pos.x, _pos.y+_size.y, obe.Transform.Units.SceneUnits))
    return collider
end

-- Return gameObject(s) matching the id
-- @param scene to search in
-- @param searchId of gameObject
-- @return list of found gameObjects
function getGameObjects(scene, searchId)
    --
end