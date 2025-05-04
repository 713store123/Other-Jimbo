-----------------------------------------------------
-------------MOD CODE--------------------------------
-- Define the custom atlas for the Jokers
SMODS.Atlas {
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95,
}

-- Define the custom Joker card
SMODS.Joker {
    key = 'Other_Jimbo',
    atlas = 'Jokers',
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = 'Other Jimbo',
        text = {
            '{C:blue}+20{} Chips',   -- this shows on the card *and* pops once
        },
    },

    config = {
        extra = {
            chips = 20,
        }
    },

    loc_vars = function(self, info_queue, center)
        return { vars = { self.config.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- only return 'chips', so the engine awards them
            return {
                card  = card,
                chips = self.config.extra.chips,
            }
        end

        if context.setting_blind and card.key == self.key then
            local new_card = create_card(
                'Joker',
                G.jokers,
                nil, nil, nil, nil,
                'j_joker'
            )
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
        end
    end,
}



-----------------------------------------------------
-------------MOD CODE END----------------------------