local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta
local v7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "MatchEndScreenController"
    end,
    ["__index"] = u4
})
v7.__index = v7
function v7.constructor(p8, p9) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p8)
    p8.matchEndScreenType = p9
    p8.Name = "MatchEndScreenController"
    p8.Client = {}
    p8.displaying = false
    p8.matchEndScreenMeta = u6[p9]
end
function v7.KnitStart(u10) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.Client:OnEvent("MatchEndEvent", function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10.matchEndEvent = p11
        u10:initializeMatchEndScreen(u10.matchEndScreenType)
    end)
end
function v7.initializeMatchEndScreen(u12, u13) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    task.spawn(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
            [3] = u12
            [4] = u3
        --]]
        if u2.Controllers.MatchEndController:waitUntilDisplay(u13) then
            u12.displaying = true
            u12:renderScreen()
        end
        u3.MatchEndScreenEnd:connect(function(p14) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            if p14.matchEndScreenType ~= u13 then
                return nil
            end
            if not u12.displaying then
                return nil
            end
            u12:unmountScreen()
            u12.displaying = false
        end)
        u3.MatchEndScreenStart:connect(function(p15) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            if p15.matchEndScreenType ~= u13 then
                return nil
            end
            if u12.displaying then
                return nil
            end
            u12:renderScreen()
            u12.displaying = true
        end)
    end)
end
return {
    ["MatchEndScreenController"] = v7
}