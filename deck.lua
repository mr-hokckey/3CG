
DeckClass = {}

CARD_NAMES = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas", "Aphrodite", "Athena", "Apollo", "Hephaestus", "Persephone", "Prometheus", "Pandora", "Icarus", "Iris", "Nyx", "Atlas", "Daedalus", "Helios", "Mnemosyne" }

function DeckClass:new(cards, owner)
    local deck = {}
    local metadata = {__index = DeckClass}
    setmetatable(deck, metadata)

    deck.cards = cards
    deck.owner = owner

    return deck
end

-- check if the deck is legal - that is, it has exactly 20 cards,
-- it has no more than 2 duplicate cards, and all of the cards actually exist.
function DeckClass:checkLegal()
    
end

function DeckClass:shuffle()
    
end
