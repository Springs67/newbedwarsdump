-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local u1 = {
    [StatefulEntityTag.DIAMOND_GUARDIAN] = BedwarsImageId.DIAMOND_GUARD_HEADSHOT,
    [StatefulEntityTag.GOLEM_BOSS] = BedwarsImageId.TITANS_BLESSING,
    [StatefulEntityTag.BHAA] = BedwarsImageId.BHAA_HEADSHOT,
    [StatefulEntityTag.GOOSE_BOSS] = "rbxassetid://15361547782",
    [StatefulEntityTag.VOID_CRATE] = "rbxassetid://9867800971",
    ["Diamond Guardian"] = BedwarsImageId.DIAMOND_GUARD_HEADSHOT,
    ["Golem Boss"] = BedwarsImageId.TITANS_BLESSING,
    Titan = BedwarsImageId.TITANS_BLESSING,
    Monarch = "rbxassetid://15361547782",
    ["Void Crate"] = "rbxassetid://9867800971"
};

return {
    MonsterIcons = u1,
    MonsterIconUtil = {
        getIconFromTag = function(p2) -- Line: 20
            -- upvalues: u1 (copy)
            return u1[p2];
        end,

        getIconFromName = function(p3) -- Line: 24
            -- upvalues: u1 (copy)
            return u1[p3];
        end
    }
};