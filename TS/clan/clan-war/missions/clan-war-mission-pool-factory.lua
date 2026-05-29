local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "TableUtil").EncodeJSON
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission").ClanWarMission
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-missions").CLAN_WAR_MISSIONS
local u8 = {
    ["TWO_MEMBER_MISSION_COUNT"] = 2,
    ["MANY_MEMBER_MISSION_COUNT"] = 1
}
local u9 = {}
function u8.getFullClanWarMissionPool(p10, p11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u8
        [4] = u2
    --]]
    local v12 = u9[p10]
    if v12 ~= nil then
        v12 = v12[p11]
    end
    if v12 then
        return v12
    end
    local v13 = 0
    local v14 = {}
    for v15, v16 in u7 do
        local _ = v15 - 1
        if v16.clanMembersRequired == 2 == true then
            v13 = v13 + 1
            v14[v13] = v16
        end
    end
    local v17 = 0
    local v18 = {}
    for v19, v20 in u7 do
        local _ = v19 - 1
        if v20.clanMembersRequired > 2 == true then
            v17 = v17 + 1
            v18[v17] = v20
        end
    end
    local v21 = u8.getClanWarMissionPool(p10, p11, 2, v14)
    local v22 = u8.getClanWarMissionPool(p10, p11, 1, v18)
    local v23 = {}
    local v24 = #v23
    local v25 = #v21
    table.move(v21, 1, v25, v24 + 1, v23)
    local v26 = v24 + v25
    table.move(v22, 1, #v22, v26 + 1, v23)
    local v27 = u2.getOrCreate(u9, p10, {})
    v27[p11] = v23
    u9[p10] = v27
    return v23
end
local u28 = nil
function u8.getClanWarMissionPool(p29, p30, p31, p32) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u28
        [3] = u3
        [4] = u6
    --]]
    local v33 = {}
    if u5.areClanWarsDisabled() or (p29 == "" or not p29) then
        return v33
    end
    local v34 = u28(p29, p30, p32)
    local v35 = Random.new(v34)
    local v36 = u3.shuffleArray(p32, v35)
    local v37 = false
    local v38 = 0
    while true do
        if v37 then
            v38 = v38 + 1
        else
            v37 = true
        end
        if v38 >= p31 or v38 >= #v36 then
            return v33
        end
        local v39 = v36[v38 + 1]
        local v40 = u6.new(v39)
        table.insert(v33, v40)
    end
end
u28 = function(p41, p42, p43) --[[ Name: missionPoolSeedHash, Line 137 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v44 = p43[1]
    local v45 = p41 .. tostring(p42) .. u4(v44)
    local v46 = #v45
    local v47 = { string.byte(v45, 0, v46) }
    local v48 = 0
    for v49 = 1, #v47 do
        local v50 = v47[v49]
        local _ = v49 - 1
        v48 = v48 + v50
    end
    return v48 % 2147483648
end
return {
    ["ClanWarMissionPoolFactory"] = u8
}