
SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 720

CARD_WIDTH = 64
CARD_HEIGHT = 96

POSITIONS = {
    P1 = {
        LOCATION_1 = {
            Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 3/8,                SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT ),
            Vector(SCREEN_WIDTH * 3/8,                SCREEN_HEIGHT * 5/9 + CARD_HEIGHT )
        },
        LOCATION_2 = {
            Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 4/8,                SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT ),
            Vector(SCREEN_WIDTH * 4/8,                SCREEN_HEIGHT * 5/9 + CARD_HEIGHT )
        },
        LOCATION_3 = {
            Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 5/8,                SCREEN_HEIGHT * 5/9               ),
            Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT ),
            Vector(SCREEN_WIDTH * 5/8,                SCREEN_HEIGHT * 5/9 + CARD_HEIGHT )
        },
        HAND = { 
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 7/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 5/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 3/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 1/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 1/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 3/2, SCREEN_HEIGHT - CARD_HEIGHT),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 5/2, SCREEN_HEIGHT - CARD_HEIGHT),
        },
        DECK =      { Vector(SCREEN_WIDTH * 3/4 - CARD_WIDTH,   SCREEN_HEIGHT - CARD_HEIGHT) },
        DISCARD =   { Vector(SCREEN_WIDTH * 1/4,                SCREEN_HEIGHT - CARD_HEIGHT) }
    },
    P2 = {
        LOCATION_1 = {
            Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 3/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   ),
            Vector(SCREEN_WIDTH * 3/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   )
        },
        LOCATION_2 = {
            Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 4/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   ),
            Vector(SCREEN_WIDTH * 4/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   )
        },
        LOCATION_3 = {
            Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 5/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT     ),
            Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH,   SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   ),
            Vector(SCREEN_WIDTH * 5/8,                SCREEN_HEIGHT * 4/9 - CARD_HEIGHT*2   )
        },
        HAND = { 
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 7/2, 0),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 5/2, 0),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 3/2, 0),
            Vector(SCREEN_WIDTH * 1/2 - CARD_WIDTH * 1/2, 0),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 1/2, 0),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 3/2, 0),
            Vector(SCREEN_WIDTH * 1/2 + CARD_WIDTH * 5/2, 0),
        },
        DECK =      { Vector(SCREEN_WIDTH * 3/4 - CARD_WIDTH,   0) },
        DISCARD =   { Vector(SCREEN_WIDTH * 1/4,                0) }
    },
}

SELECTED_POSITION = {
    CARD = Vector(SCREEN_WIDTH * 1/8 - CARD_WIDTH, SCREEN_HEIGHT * 1/3 - CARD_HEIGHT),
    TEXT = Vector(SCREEN_WIDTH * 1/16, SCREEN_HEIGHT * 5/9),
    TEXT_WIDTH = SCREEN_WIDTH * 1/8
}

DROP_ZONES = {
    P1 = {
        LOCATION_1 = {
            MIN = Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9),
            MAX = Vector(SCREEN_WIDTH * 3/8 + CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT * 2)
        },
        LOCATION_2 = {
            MIN = Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9),
            MAX = Vector(SCREEN_WIDTH * 4/8 + CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT * 2)
        },
        LOCATION_3 = {
            MIN = Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH,   SCREEN_HEIGHT * 5/9),
            MAX = Vector(SCREEN_WIDTH * 5/8 + CARD_WIDTH,   SCREEN_HEIGHT * 5/9 + CARD_HEIGHT * 2)
        },
    }
}

LOCATION_NUMBERS = {
    [1] = Vector(SCREEN_WIDTH * 3/8 - CARD_WIDTH, SCREEN_HEIGHT * 1/2),
    [2] = Vector(SCREEN_WIDTH * 4/8 - CARD_WIDTH, SCREEN_HEIGHT * 1/2),
    [3] = Vector(SCREEN_WIDTH * 5/8 - CARD_WIDTH, SCREEN_HEIGHT * 1/2),
}

PLAYER_NUMBERS = {
    [1] = Vector(SCREEN_WIDTH * 12/16, SCREEN_HEIGHT * 2/3),
    [2] = Vector(SCREEN_WIDTH * 12/16, SCREEN_HEIGHT * 1/3 - 96),
}

GAME_STATUS = Vector(SCREEN_WIDTH * 13/16, SCREEN_HEIGHT * 1/2)
