local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u10 = v1.import(script, script.Parent, "ui", "pregame-countdown").PregameCountdownWrapper
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "PregameController"
    end,
    ["__index"] = u5
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p14)
    p14.Name = "PregameController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u4
        [4] = u2
        [5] = u9
    --]]
    u7.changed:connect(function(p16, p17) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u15
        --]]
        if p16.Game ~= p17.Game and p16.Game.matchState ~= u8.PRE then
            u15:unmount()
        end
    end)
    u4.MatchStateChange:connect(function(p18) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u9
            [4] = u15
        --]]
        if p18.customMatch then
            return nil
        elseif p18.matchState == u8.PRE then
            u2.Controllers.MatchController:getQueueTypeAsync():andThen(function(p19) --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u15
                --]]
                if p19 ~= u9.activeRankMeta.queueType then
                    u15:mount()
                end
            end)
        else
            u15:unmount()
        end
    end)
end
function u11.mount(p20) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
    --]]
    p20:unmount()
    p20.tree = u6("PregameCountdown", u10)
end
function u11.unmount(p21) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p21.tree then
        u3.unmount(p21.tree)
        p21.tree = nil
    end
end
u2.CreateController(u11.new())
return nil