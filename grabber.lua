
GrabberClass = {}

function GrabberClass:new()
    local grabber = {}
    local metadata = {__index = GrabberClass}
    setmetatable(grabber, metadata)

    grabber.selectedCard = nil
    grabber.grabbedCard = nil
    grabber.grabPos = Vector()
    grabber.grabOffset = Vector()

    return grabber
end

-- call checkForMouseOver on each card on the board, set the last one as selected.
function GrabberClass:update()
    
end

-- re-draw the grabbed card so it appears on top of all the other cards.
function GrabberClass:draw()
    
end

function GrabberClass:grab()
    
end

function GrabberClass:release()
    
end
