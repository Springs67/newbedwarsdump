local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").BasicCountdownCard
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = u3.Component:extend("PregameCountdown")
function u5.init(_) --[[ Line: 9 ]] end
function u5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
    --]]
    return u3.createElement(u2, {
        ["Text"] = "Match starting in {0}",
        ["EndOSTime"] = p6.props.store.Game.startTime,
        ["Size"] = u4.centerTopAnnouncementCardSize,
        ["Position"] = UDim2.new(0.5, 0, 0, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    })
end
return {
    ["PregameCountdownWrapper"] = function(p7) --[[ Name: PregameCountdownWrapper, Line 21 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
        --]]
        return u3.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u3.createElement(u5, {
                ["store"] = p7.store
            }) })
    end,
    ["PregameCountdown"] = u5
}