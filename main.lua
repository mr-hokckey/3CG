


function love.load()

    require "vector"
    require "positions"

    gameManager = require("gameManager")
    require "card"
    require "deck"
    require "player"
    require "location"
    require "grabber"

    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.window.setTitle("Mythomagic")

    -- create cardTables, a table of tables. Every single card object will always be inside one of these.
    cardTables = {
        {
            LOCATION_1 = {},
            LOCATION_2 = {},
            LOCATION_3 = {},
            HAND = {},
            DECK = {},
            DISCARD = {},
        },
        {
            LOCATION_1 = {},
            LOCATION_2 = {},
            LOCATION_3 = {},
            HAND = {},
            DECK = {},
            DISCARD = {},
        },
    }

    -- create a gameManager object
    gameManager:init(25, cardTables)

    -- create 2 decks - a list of 20 card names for each player
    p1_deck = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }
    p2_deck = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }

    -- create 2 player objects
    player1 = PlayerClass:new(1, p1_deck, cardTables[1].HAND, cardTables[1].DISCARD)
    player2 = PlayerClass:new(2, p2_deck, cardTables[2].HAND, cardTables[2].DISCARD)
    
    -- create 3 location objects
    location1 = LocationClass:new(1, cardTables[1].LOCATION_1, cardTables[2].LOCATION_1)
    location2 = LocationClass:new(1, cardTables[1].LOCATION_2, cardTables[2].LOCATION_2)
    location3 = LocationClass:new(1, cardTables[1].LOCATION_3, cardTables[2].LOCATION_3)

    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()

    player2:takeCardFromDeck()
    player2:takeCardFromDeck()
    player2:takeCardFromDeck()

    gameManager:reposition(1, "HAND")
    gameManager:reposition(2, "HAND")
end

function love.update()
    
end

function love.draw()
    -- Color palette:
    -- #000000 - Black
    -- #800000 - Maroon
    -- #D2691E - Chocolate
    -- #FFF8DC - Cornsilk

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

    for _, p in pairs(cardTables) do
        for _, l in pairs(p) do
            for _, card in ipairs(l) do
                card:draw()
            end
        end 
    end
end
