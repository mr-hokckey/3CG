


function love.load()

    require "vector"
    require "positions"

    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.window.setTitle("Mythomagic")

    -- create cardTables, a table of tables. Every single card object will always be inside one of these.

    -- create a gameManager object

    -- create 2 player objects
        -- also create 2 deck objects - a list of 20 card names for each player
    
    -- create 3 location objects
    
end

function love.update()
    
end

function love.draw()
    love.graphics.setColor(0.82, 0.41, 0.12, 1)
    love.graphics.rectangle("fill", SCREEN_WIDTH * 1/4, 0, SCREEN_WIDTH * 1/2, SCREEN_HEIGHT)

    love.graphics.setColor(0.5, 0, 0, 1)
    for l, loc in pairs(POSITIONS) do
        for p, pla in pairs(loc) do
            for _, vec in ipairs(pla) do
                love.graphics.rectangle("fill", vec.x, vec.y, CARD_WIDTH, CARD_HEIGHT)
            end
        end 
    end
end
