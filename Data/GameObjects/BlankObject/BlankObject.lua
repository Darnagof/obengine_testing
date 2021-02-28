function Local.Init()
    log.info(This:getType(), This:getId(), "created !")
end

function Event.Actions.IdleSpace()
    log.info("idle space")
end

function Event.Actions.ReleasedSpace()
    log.info("released space")
end

function Event.Actions.HUp()
    log.info("hold up")
end

function Event.Actions.PUp()
    log.info("pressed up")
end

function Event.Game.Update(event)

end