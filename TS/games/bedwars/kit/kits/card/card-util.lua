local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = {
    ["BASE_DAMAGE"] = 4,
    ["BASE_CARD_COUNT"] = 4,
    ["BASE_RANGE"] = 50,
    ["BASE_COOLDOWN"] = 12,
    ["BASE_DAMAGE_INCREASE"] = 1,
    ["MAX_TIER"] = 5,
    ["PROGRESS_PER_TIER"] = 100,
    ["KILL_PROGRESS"] = 60,
    ["PROGRESS_MULTIPLIER"] = 0.4,
    ["NPC_PROGRESS_MULTIPLIER"] = 0.03,
    ["KNOCKBACK"] = 0.4,
    ["CARD_COUNT_INCREASE_1"] = 1,
    ["CARD_COUNT_INCREASE_2"] = 2,
    ["DAMAGE_INCREASE_1"] = 2,
    ["DAMAGE_INCREASE_2"] = 4,
    ["LIFE_STEAL_STRENGTH"] = 2,
    ["FIRE_STRENGTH"] = 4
}
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.COMMON = 100
v6[100] = "COMMON"
v7.UNCOMMON = 58
v6[58] = "UNCOMMON"
v7.RARE = 30
v6[30] = "RARE"
v7.EPIC = 10
v6[10] = "EPIC"
v7.LEGENDARY = 3
v6[3] = "LEGENDARY"
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.CARD_COUNT_INCREASE_I = "card_count_increase_1"
v8.card_count_increase_1 = "CARD_COUNT_INCREASE_I"
v9.CARD_COUNT_INCREASE_II = "card_count_increase_2"
v8.card_count_increase_2 = "CARD_COUNT_INCREASE_II"
v9.DAMAGE_INCREASE_I = "damage_increase_1"
v8.damage_increase_1 = "DAMAGE_INCREASE_I"
v9.DAMAGE_INCREASE_II = "damage_increase_2"
v8.damage_increase_2 = "DAMAGE_INCREASE_II"
v9.SPEED_INCREASE = "speed_increase"
v8.speed_increase = "SPEED_INCREASE"
v9.FIRE = "fire"
v8.fire = "FIRE"
v9.CRITICAL_HIT = "critical_hit"
v8.critical_hit = "CRITICAL_HIT"
v9.LIFE_STEAL = "life_steal"
v8.life_steal = "LIFE_STEAL"
v9.KNOCKBACK = "knockback"
v8.knockback = "KNOCKBACK"
v9.EXPLOSION = "explosion"
v8.explosion = "EXPLOSION"
v9.OVERSIZED = "oversized"
v8.oversized = "OVERSIZED"
v9.MINISIZED = "minisized"
v8.minisized = "MINISIZED"
local u10 = {
    [v9.CARD_COUNT_INCREASE_I] = {
        ["title"] = "Greater Draw I",
        ["description"] = "Increase the amount of cards thrown by 1.",
        ["image"] = v4.CARD_MORE,
        ["color"] = Color3.fromHex("ffaf00"),
        ["weight"] = v7.COMMON
    },
    [v9.CARD_COUNT_INCREASE_II] = {
        ["title"] = "Greater Draw II",
        ["description"] = "Increase the amount of cards thrown by an additional 2.",
        ["image"] = v4.CARD_MORE,
        ["color"] = Color3.fromHex("ffaf00"),
        ["weight"] = v7.RARE,
        ["prevUpgrade"] = v9.CARD_COUNT_INCREASE_I
    },
    [v9.DAMAGE_INCREASE_I] = {
        ["title"] = "Sharper Cards I",
        ["description"] = "Increases the damage of each card.",
        ["color"] = Color3.fromHex("ffaf00"),
        ["image"] = v4.CARD_DAMAGE,
        ["weight"] = v7.COMMON
    },
    [v9.DAMAGE_INCREASE_II] = {
        ["title"] = "Sharper Cards II",
        ["description"] = "Further increases the damage of each card.",
        ["tierRequired"] = 4,
        ["color"] = Color3.fromHex("ffaf00"),
        ["image"] = v4.CARD_DAMAGE,
        ["weight"] = v7.RARE,
        ["prevUpgrade"] = v9.DAMAGE_INCREASE_I
    },
    [v9.SPEED_INCREASE] = {
        ["title"] = "Quick Draw",
        ["description"] = "Increase speed and reduce cooldown for card attack.",
        ["color"] = Color3.fromHex("ffaf00"),
        ["image"] = v4.CARD_SPEED,
        ["weight"] = v7.COMMON
    },
    [v9.FIRE] = {
        ["title"] = "Scorched",
        ["description"] = "Cards burn enemies upon hit.",
        ["image"] = v4.CARD_FIRE,
        ["color"] = Color3.fromHex("ff9633"),
        ["weight"] = v7.RARE
    },
    [v9.CRITICAL_HIT] = {
        ["title"] = "Critical Strike",
        ["description"] = "Cards have a chance to deal critical damage.",
        ["image"] = v4.CARD_CRITICAL_HIT,
        ["color"] = Color3.fromHex("ff6c00"),
        ["weight"] = v7.COMMON
    },
    [v9.LIFE_STEAL] = {
        ["title"] = "Energy Drain",
        ["description"] = "Cards heal you upon based on damage dealt.",
        ["image"] = v4.CARD_LIFE_STEAL,
        ["color"] = Color3.fromHex("60bf00"),
        ["weight"] = v7.UNCOMMON
    },
    [v9.KNOCKBACK] = {
        ["title"] = "Aerodynamic",
        ["description"] = "Cards do knockback upon hit.",
        ["image"] = v4.CARD_KNOCKBACK,
        ["color"] = Color3.fromHex("00dcd8"),
        ["weight"] = v7.EPIC
    },
    [v9.EXPLOSION] = {
        ["title"] = "Explosive",
        ["description"] = "The last card in the attack causes an explosion!",
        ["image"] = v4.CARD_EXPLOSIVE,
        ["color"] = Color3.fromHex("ffaf00"),
        ["weight"] = v7.COMMON
    },
    [v9.OVERSIZED] = {
        ["title"] = "Oversized",
        ["description"] = "More damage, less cards!",
        ["image"] = v4.CARD_BIG,
        ["color"] = Color3.fromHex("ffaf00"),
        ["locks"] = { v9.MINISIZED },
        ["weight"] = v7.COMMON
    },
    [v9.MINISIZED] = {
        ["title"] = "Minisized",
        ["description"] = "Less damage, more cards!",
        ["image"] = v4.CARD_MINI,
        ["color"] = Color3.fromHex("ffaf00"),
        ["locks"] = { v9.OVERSIZED },
        ["weight"] = v7.COMMON
    }
}
local v12 = {
    ["createNewDeck"] = function() --[[ Name: createNewDeck, Line 192 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v11 = {
            ["progress"] = 0,
            ["throw"] = {
                ["damageMultiplier"] = 1,
                ["speedMultiplier"] = 1,
                ["damage"] = u5.BASE_DAMAGE,
                ["cardCount"] = u5.BASE_CARD_COUNT,
                ["cooldown"] = u5.BASE_COOLDOWN
            },
            ["upgrades"] = {},
            ["availableUpgrades"] = {}
        }
        return v11
    end
}
local u13 = nil
function v12.getDeckTier(p14) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return u13(p14.progress)
end
u13 = function(p15) --[[ Name: getTierFromProgress, Line 214 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v16 = p15 / u5.PROGRESS_PER_TIER
    local v17 = math.floor(v16)
    local v18 = u5.MAX_TIER
    return math.min(v17, v18)
end
v12.getTierFromProgress = u13
function v12.getProgressPercent(p19) --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return p19 % u5.PROGRESS_PER_TIER / u5.PROGRESS_PER_TIER
end
local function u25(p20) --[[ Line: 224 ]]
    local v21 = p20.throw.cardCount
    local v22 = p20.throw.speedMultiplier
    local v23 = {
        ["delay"] = 0.45,
        ["throwDuration"] = 0.6,
        ["raiseDuration"] = 0.1
    }
    local v24 = 0.1 / (v21 / 5)
    v23.interval = math.min(0.1, v24)
    v23.delay = v23.delay / v22
    v23.interval = v23.interval / v22
    v23.throwDuration = v23.throwDuration / v22
    v23.raiseDuration = v23.raiseDuration / v22
    return v23
end
v12.getThrowValues = u25
function v12.getCooldown(p26) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v27 = u25(p26)
    local v28 = v27.delay + v27.interval * (p26.throw.cardCount - 1) + v27.throwDuration + v27.raiseDuration
    local v29 = p26.throw.cooldown
    return math.max(v28, v29)
end
function v12.getUpgradesToChoose(p30, p31, p32) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u2
    --]]
    local v33 = 0
    local v34 = {}
    for v35, v36 in u3.keys(u10) do
        local _ = v35 - 1
        if not u10[v36].disabled == true then
            v33 = v33 + 1
            v34[v33] = v36
        end
    end
    local v37 = 0
    local v38 = {}
    for v39, v40 in v34 do
        local _ = v39 - 1
        if table.find(p30, v40) == nil == true then
            v37 = v37 + 1
            v38[v37] = v40
        end
    end
    local u41 = {}
    local function v49(p42) --[[ Line: 287 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u41
        --]]
        local v43 = u10[p42]
        if v43.locks then
            local v44 = {}
            local v45 = #v44
            local v46 = #u41
            table.move(u41, 1, v46, v45 + 1, v44)
            local v47 = v45 + v46
            local v48 = v43.locks
            table.move(v48, 1, #v48, v47 + 1, v44)
            u41 = v44
        end
    end
    local v50 = u41
    for v51, v52 in p30 do
        v49(v52, v51 - 1, p30)
    end
    local v53 = 0
    local v54 = {}
    for v55, v56 in v38 do
        local _ = v55 - 1
        if table.find(v50, v56) == nil == true then
            v53 = v53 + 1
            v54[v53] = v56
        end
    end
    local v57 = 0
    local v58 = {}
    for v59, v60 in v54 do
        local _ = v59 - 1
        local v61 = u10[v60].tierRequired
        if (v61 == nil and 0 or v61) <= p31 == true then
            v57 = v57 + 1
            v58[v57] = v60
        end
    end
    local v62 = 0
    local v63 = {}
    for v64, v65 in v58 do
        local _ = v64 - 1
        local v66 = u10[v65].prevUpgrade
        if (not v66 and true or table.find(p30, v66) ~= nil) == true then
            v62 = v62 + 1
            v63[v62] = v65
        end
    end
    local v67 = {}
    local v68 = u2.new(v67)
    local v69 = false
    local v70 = 0
    local v71 = {}
    while true do
        if v69 then
            v70 = v70 + 1
        else
            v69 = true
        end
        if v70 >= (p32 == nil and 3 or p32) then
            return v71
        end
        for v72, v73 in v63 do
            local _ = v72 - 1
            local v74 = {
                ["type"] = v73,
                ["weight"] = u10[v73].weight
            }
            table.insert(v67, v74)
        end
        v68:setObjects(v67)
        local v75 = v68:selectRandom().type
        table.insert(v71, v75)
        local v76 = 0
        v63 = {}
        for v77, v78 in v63 do
            local _ = v77 - 1
            if table.find(v71, v78) == nil == true then
                v76 = v76 + 1
                v63[v76] = v78
            end
        end
        table.clear(v67)
    end
end
return {
    ["CardConstants"] = u5,
    ["CardUpgradeRarity"] = v7,
    ["CardUpgradeType"] = v9,
    ["CardUpgrades"] = u10,
    ["CardUtil"] = v12
}