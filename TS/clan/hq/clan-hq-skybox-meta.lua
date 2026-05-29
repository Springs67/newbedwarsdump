local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqSkyboxType
local u2 = {
    [v1.DEFAULT] = {
        ["title"] = "Clear Skies Skybox (Default)",
        ["iconId"] = "rbxassetid://9122143459"
    },
    [v1.VOID_SKYBOX] = {
        ["title"] = "Void Skybox",
        ["iconId"] = "rbxassetid://9851144466"
    }
}
return {
    ["getClanHqSkyboxMeta"] = function(p3) --[[ Name: getClanHqSkyboxMeta, Line 14 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2[p3]
    end,
    ["ClanHqSkyboxMeta"] = u2
}