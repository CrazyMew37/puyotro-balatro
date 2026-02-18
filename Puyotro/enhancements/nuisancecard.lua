
SMODS.Enhancement {
    key = 'nuisancecard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            PuyoMultAmount = 1
        }
    },
    loc_txt = {
        name = 'Nuisance Card',
        text = {
            [1] = '{C:red}+2{} Extra Mult every time',
            [2] = 'this card is scored',
            [3] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}{}'
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
    weight = 4,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.PuyoMultAmount}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local PuyoMultAmount_value = card.ability.extra.PuyoMultAmount
            card.ability.extra.PuyoMultAmount = (card.ability.extra.PuyoMultAmount) + 2
            return {
                mult = PuyoMultAmount_value,
                extra = {
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}