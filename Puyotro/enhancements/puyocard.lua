
SMODS.Enhancement {
    key = 'puyocard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            PuyoChipAmount = 10
        }
    },
    loc_txt = {
        name = 'Puyo Card',
        text = {
            [1] = '{C:blue}+10{} Extra Chips every time',
            [2] = 'this card is scored',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1# {}{C:inactive}Chips){}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.PuyoChipAmount}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local PuyoChipAmount_value = card.ability.extra.PuyoChipAmount
            card.ability.extra.PuyoChipAmount = (card.ability.extra.PuyoChipAmount) + 10
            return {
                chips = PuyoChipAmount_value,
                extra = {
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}