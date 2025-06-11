
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

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
    love.window.setTitle("Mythomagic") -- A reference to Percy Jackson

    smallFont = love.graphics.newFont("assets/MinecraftStandard.otf", 6, "mono")
    love.graphics.setFont(smallFont)

    -- create cardTables, a table of tables. Every single card object will always be inside one of these.
    cardTables = {
        P1 = {
            LOCATION_1 = {},
            LOCATION_2 = {},
            LOCATION_3 = {},
            HAND = {},
            DECK = {},
            DISCARD = {},
        },
        P2 = {
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
    p1_deck = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas" }
    p2_deck = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }

    -- create 2 player objects
    player1 = PlayerClass:new(1, p1_deck, cardTables.P1.HAND, cardTables.P1.DISCARD)
    player2 = PlayerClass:new(2, p2_deck, cardTables.P2.HAND, cardTables.P2.DISCARD)
    
    -- create 3 location objects
    location1 = LocationClass:new(1, cardTables.P1.LOCATION_1, cardTables.P2.LOCATION_1)
    location2 = LocationClass:new(1, cardTables.P1.LOCATION_2, cardTables.P2.LOCATION_2)
    location3 = LocationClass:new(1, cardTables.P1.LOCATION_3, cardTables.P2.LOCATION_3)

    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()

    player2:takeCardFromDeck()
    player2:takeCardFromDeck()
    player2:takeCardFromDeck()

    gameManager:reposition("P1", "HAND")
    gameManager:reposition("P2", "HAND")

    grabber = GrabberClass:new()
end

function love.update()
    grabber:update()
end

function love.draw()
    -- Color palette:
    -- setColor(0, 0, 0, 1) - #000000 - Black
    -- setColor(0.5, 0, 0, 1) - #800000 - Maroon
    -- setColor(0.82, 0.41, 0.12, 1) - #D2691E - Chocolate
    -- setColor(1, 0.97, 0.86, 1) - #FFF8DC - Cornsilk

    love.graphics.setColor(0.82, 0.41, 0.12, 1)
    love.graphics.rectangle("fill", SCREEN_WIDTH * 1/4, 0, SCREEN_WIDTH * 1/2, SCREEN_HEIGHT)

    love.graphics.setColor(0.5, 0, 0, 1)
    for _, playerZones in pairs(POSITIONS) do
        for _, zone in pairs(playerZones) do
            for _, pos in ipairs(zone) do
                love.graphics.rectangle("line", pos.x, pos.y, CARD_WIDTH, CARD_HEIGHT)
            end
        end 
    end

    for _, playerZones in pairs(cardTables) do
        for _, zone in pairs(playerZones) do
            for _, card in ipairs(zone) do
                card:draw()
            end
        end 
    end

    grabber:draw()
end
