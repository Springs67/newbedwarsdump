local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u4 = {
    [v3.DIAMOND_GUARDIAN] = v2.DIAMOND_GUARD_HEADSHOT,
    [v3.GOLEM_BOSS] = v2.TITANS_BLESSING,
    [v3.BHAA] = v2.BHAA_HEADSHOT,
    [v3.GOOSE_BOSS] = "rbxassetid://15361547782",
    [v3.VOID_CRATE] = "rbxassetid://9867800971",
    ["Diamond Guardian"] = v2.DIAMOND_GUARD_HEADSHOT,
    ["Golem Boss"] = v2.TITANS_BLESSING,
    ["Titan"] = v2.TITANS_BLESSING,
    ["Monarch"] = "rbxassetid://15361547782",
    ["Void Crate"] = "rbxassetid://9867800971"
}
return {
    ["MonsterIcons"] = u4,
    ["MonsterIconUtil"] = {
        ["getIconFromTag"] = function(p5) --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            return u4[p5]
        end,
        ["getIconFromName"] = function(p6) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            return u4[p6]
        end
    }
}