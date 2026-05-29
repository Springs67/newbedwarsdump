local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u6 = {
    u4.NONE,
    u4.BUILDER,
    u4.FISHERMAN,
    u4.OIL_MAN,
    u4.YETI,
    u4.SHIELDER,
    u4.WARRIOR,
    u4.DISRUPTOR,
    u4.INFECTED,
    u4.SUPER_INFECTED,
    u4.INFECTED_TANK,
    u4.INFECTED_RUSH,
    u4.INFECTED_DISRUPTOR,
    u4.INFECTED_PROWLER
}
local v7 = 0
local u8 = {}
local v9 = {
    ["pickInterval"] = 3600
}
for v10, v11 in v2.values(u4) do
    local _ = v10 - 1
    local v12
    if table.find(u6, v11) == nil then
        v12 = v5[v11].battlepassSeason ~= v3.BATTLE_PASS_SEASON
    else
        v12 = false
    end
    if v12 == true then
        v7 = v7 + 1
        u8[v7] = v11
    end
end
local u13 = {}
function v9.getCurrTimestamp() --[[ Line: 44 ]]
    return os.time() - os.time() % 3600
end
local function u34(p14, p15) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u6
        [4] = u13
    --]]
    local v16 = os.time() - os.time() % 3600 - 86400
    local v17 = math.max(v16, p14)
    local v18 = v17 - v17 % 3600 + 3600
    local v19 = (p15 - v17) / 3600
    local v20 = math.floor(v19)
    local v21 = false
    local v22 = 0
    ::l27::
    if true then
        if v21 then
            v22 = v22 + 1
        else
            v21 = true
        end
    end
    if v22 >= v20 then
        return
    end
    local _ = u4.NONE
    local v23 = false
    local v24 = 0
    local v25 = {}
    while true do
        if true then
            if v23 then
                v24 = v24 + 1
            else
                v23 = true
            end
        end
        if v24 >= 3 then
            break
        end
        local v26 = v18 - v24 * 3600
        table.insert(v25, v26)
    end
    local v27 = Random.new(v18)
    while true do
        local v28 = u8[v27:NextInteger(0, #u8 - #u6) + 1]
        local v29 = v28
        local v30 = true
        for v31, v32 in v25 do
            local _ = v31 - 1
            local v33 = u13[v32]
            if v33 ~= nil then
                v33 = v33.kit
            end
            if v33 and v33 == v29 then
                v30 = false
                break
            end
        end
        if v30 then
            u13[v18] = {
                ["kit"] = v29
            }
            v18 = v18 + 3600
            goto l27
        end
    end
end
function v9.pickRandomKit(p35) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u34
        [3] = u4
        [4] = u8
        [5] = u6
    --]]
    if next(u13) == nil then
        u34(os.time() - 86400, os.time())
    end
    if p35 == 0 or (p35 ~= p35 or not p35) then
        p35 = os.time() - os.time() % 3600
    end
    local v36 = u13[p35]
    if v36 then
        return v36.kit
    end
    local v37 = false
    local v38 = 0
    local v39 = {}
    while true do
        if true then
            if v37 then
                v38 = v38 + 1
            else
                v37 = true
            end
        end
        if v38 >= 3 then
            local _ = u4.NONE
            local v40 = Random.new(p35)
            local v41 = 0
            while true do
                local v42 = u8[v40:NextInteger(0, #u8 - #u6) + 1]
                local v43 = v42
                local v44 = true
                for v45, v46 in v39 do
                    local _ = v45 - 1
                    local v47 = u13[v46]
                    if v47 ~= nil then
                        v47 = v47.kit
                    end
                    if v47 == v43 then
                        v44 = false
                    end
                end
                v41 = v41 + 1
                if v41 >= 10 or v44 then
                    u13[p35] = {
                        ["kit"] = v43
                    }
                    return v43
                end
            end
        end
        local v48 = p35 - v38 * 3600
        table.insert(v39, v48)
    end
end
return {
    ["OneForAllUtil"] = v9
}