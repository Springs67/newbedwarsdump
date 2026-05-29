local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u10 = v1.import(script, script.Parent, "ui", "lobby-controls").LobbyControlsWrapper
local u11 = v1.import(script, script.Parent, "ui", "match-end-background").MatchEndBackgroundWrapper
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "LobbyControlsScreenController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15, 0)
    p15.Name = "LobbyControlsScreenController"
    p15.disableViewSummary = false
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u7
        [4] = u8
    --]]
    u9.KnitStart(u16)
    local v17, v18 = u4.Controllers.MatchController:getQueueTypeAsync():await()
    if v17 then
        local v19 = u7(v18).disabledMatchEndScreens
        if v19 ~= nil then
            v19 = table.find(v19, 6) ~= nil
        end
        if v19 then
            u16.disableViewSummary = true
        end
    end
    u8.Client:OnEvent("MatchEndEvent", function(p20) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        if p20.cancelled then
            u16.disableViewSummary = true
        end
    end)
end
function u12.renderScreen(p21) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u11
    --]]
    p21.tree = u6("MatchEndControls", u10, {
        ["DisableViewSummary"] = p21.disableViewSummary
    })
    p21.backgroundTree = u6("MatchEndBackground", u11, {})
end
function u12.unmountScreen(p22) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p22.tree then
        u5.unmount(p22.tree)
    end
    if p22.backgroundTree then
        u5.unmount(p22.backgroundTree)
    end
end
v3.CreateController(u12.new())
return nil