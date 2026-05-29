local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin").StatefulEntitySkin
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-meta").getEntitySkinMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme").StatefulEntitySkinTheme
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local u6 = u4.DEFAULT
local u7 = {
    [u4.DEFAULT] = {
        [v5.DIAMOND_GUARDIAN] = v3(v2.DIAMOND_GUARDIAN),
        [v5.GOLEM_BOSS] = v3(v2.GOLEM_BOSS),
        [v5.SPIRIT_GOLEM_BOSS] = v3(v2.SPIRIT_GOLEM_BOSS),
        [v5.VOID_GOLEM_BOSS] = v3(v2.VOID_GOLEM_BOSS)
    },
    [u4.CHRISTMAS] = {
        [v5.DIAMOND_GUARDIAN] = v3(v2.CHRISTMAS_DIAMOND_GUARDIAN),
        [v5.GOLEM_BOSS] = v3(v2.CHRISTMAS_GOLEM_BOSS)
    }
}
local u8 = nil
local function v10(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
    --]]
    return u8(u6, p9)
end
u8 = function(p11, p12) --[[ Name: getStatefulEntitySkinMetaByTheme, Line 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    local v13 = u7[p11]
    if v13 ~= nil then
        v13 = v13[p12]
    end
    if not v13 then
        warn("Stateful entity skin meta by theme " .. p11 .. " and entity type " .. p12 .. " not found, using default")
        v13 = u7[u4.DEFAULT]
        if v13 ~= nil then
            v13 = v13[p12]
        end
    end
    if not v13 then
        error("Stateful entity skin meta by theme " .. p11 .. " and entity type " .. p12 .. " not found")
    end
    return v13
end
return {
    ["getCurrentStatefulEntitySkinMeta"] = v10,
    ["getStatefulEntitySkinMetaByTheme"] = u8,
    ["CURRENT_THEME"] = u6,
    ["StatefulEntitySkinMetaByTheme"] = u7
}