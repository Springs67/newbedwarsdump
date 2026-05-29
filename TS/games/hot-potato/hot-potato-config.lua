return {
    ["HotPotatoConfig"] = {
        ["ROUND_INTERVAL_SECONDS"] = 30,
        ["ROUND_PRE_BREAK_SECONDS"] = 5,
        ["ROUND_POST_BREAK_SECONDS"] = 5,
        ["MAX_NUM_WINNERS"] = 2,
        ["AMOUNT_OF_PLAYERS_TO_BE_TAGGED_PER_ROUND"] = function(p1) --[[ Line: 13 ]]
            local v2 = p1 / 4
            local v3 = math.round(v2)
            return v3 < 1 and 1 or v3
        end,
        ["TRIGGER__EXPLOSION_WARNING_THRESOLD_SECONDS"] = 30,
        ["MAX_FLASHING_RATE_SECONDS"] = 0.1
    }
}