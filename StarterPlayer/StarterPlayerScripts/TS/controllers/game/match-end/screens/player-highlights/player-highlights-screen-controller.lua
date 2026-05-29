local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u7 = v1.import(script, script.Parent, "ui", "player-highlights").PlayerHighlightsWrapper
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "PlayerHighlightsScreenController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11, 2)
    p11.Name = "PlayerHighlightsScreenController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.KnitStart(u12)
    u5.Client:OnEvent("PostGameStatCardsGenerated", function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12.statCardsEvent = p13
    end)
end
function u8.renderScreen(p14) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    if not p14.statCardsEvent then
        return nil
    end
    p14.tree = u4("MatchEndControls", u7, {
        ["cards"] = p14.statCardsEvent.cards
    })
end
function u8.unmountScreen(p15) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not p15.tree then
        return nil
    end
    u3.unmount(p15.tree)
end
v2.CreateController(u8.new())
return nil