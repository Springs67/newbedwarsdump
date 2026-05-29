local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
local v4 = {
    u2.SUMMONER_CLAW_1,
    u2.SUMMONER_CLAW_2,
    u2.SUMMONER_CLAW_3,
    u2.SUMMONER_CLAW_4
}
local u5 = nil
local function v7(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return p6 < u5(1) and 1 or (p6 < u5(2) and 2 or (p6 < u5(3) and 3 or (p6 < u5(4) and 4 or 1)))
end
u5 = function(p8) --[[ Name: summoner_getTotalCastTimeRequired, Line 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p8 == 1 then
        return u3.SPELL_TIER_1_DATA.castTime
    elseif p8 == 2 then
        return u3.SPELL_TIER_1_DATA.castTime + u3.SPELL_TIER_2_DATA.castTime
    elseif p8 == 3 then
        return u3.SPELL_TIER_1_DATA.castTime + u3.SPELL_TIER_2_DATA.castTime + u3.SPELL_TIER_3_DATA.castTime
    else
        return p8 ~= 4 and 0 or u3.SPELL_TIER_1_DATA.castTime + u3.SPELL_TIER_2_DATA.castTime + u3.SPELL_TIER_3_DATA.castTime + u3.SPELL_TIER_4_DATA.castTime
    end
end
return {
    ["summoner_getSpellTierFromCastTime"] = v7,
    ["summoner_getTotalCastTimeRequired"] = u5,
    ["summoner_getPlayerSpellLevel"] = function(p9) --[[ Name: summoner_getPlayerSpellLevel, Line 37 ]]
        return p9:GetAttribute("Summoner_SpellLevel")
    end,
    ["summoner_getProgressToNextSpellLevel"] = function(p10) --[[ Name: summoner_getProgressToNextSpellLevel, Line 40 ]]
        return p10:GetAttribute("Summoner_LevelUpProgress")
    end,
    ["summoner_getPlayerSpellData"] = function(p11) --[[ Name: summoner_getPlayerSpellData, Line 43 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        local v12 = p11:GetAttribute("Summoner_SpellLevel")
        local v13 = v12 == nil and 1 or v12
        if v13 == 1 then
            return u3.SPELL_TIER_1_DATA
        elseif v13 == 2 then
            return u3.SPELL_TIER_2_DATA
        elseif v13 == 3 then
            return u3.SPELL_TIER_3_DATA
        elseif v13 == 4 then
            return u3.SPELL_TIER_4_DATA
        else
            return u3.SPELL_TIER_1_DATA
        end
    end,
    ["summoner_getClawData"] = function(p14) --[[ Name: summoner_getClawData, Line 65 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        if p14 == u2.SUMMONER_CLAW_1 then
            return u3.CLAW_TIER_1_DATA
        elseif p14 == u2.SUMMONER_CLAW_2 then
            return u3.CLAW_TIER_2_DATA
        elseif p14 == u2.SUMMONER_CLAW_3 then
            return u3.CLAW_TIER_3_DATA
        elseif p14 == u2.SUMMONER_CLAW_4 then
            return u3.CLAW_TIER_4_DATA
        else
            return u3.CLAW_TIER_1_DATA
        end
    end,
    ["summoner_getPlayerClawLevel"] = function(p15) --[[ Name: summoner_getPlayerClawLevel, Line 82 ]]
        return p15:GetAttribute("Summoner_ClawLevel")
    end,
    ["summoner_isItemClaw"] = function(p16) --[[ Name: summoner_isItemClaw, Line 85 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return p16 == u2.SUMMONER_CLAW_1 and true or (p16 == u2.SUMMONER_CLAW_2 and true or (p16 == u2.SUMMONER_CLAW_3 and true or p16 == u2.SUMMONER_CLAW_4))
    end,
    ["summoner_getClawForLevel"] = function(p17) --[[ Name: summoner_getClawForLevel, Line 100 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p17 == 1 then
            return u2.SUMMONER_CLAW_1
        elseif p17 == 2 then
            return u2.SUMMONER_CLAW_2
        elseif p17 == 3 then
            return u2.SUMMONER_CLAW_3
        elseif p17 == 4 then
            return u2.SUMMONER_CLAW_4
        else
            return u2.SUMMONER_CLAW_1
        end
    end,
    ["SUMMONER_CLAWS"] = v4
}