local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u4 = v1.import(script, script.Parent, "skull-leaderboard-core").SkullLeaderboardCore
local v5 = u2.PureComponent:extend("SkullLeaderBoardAppBase")
function v5.init(_) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v7 = {
        ["LightInfluence"] = 0.25,
        ["Face"] = Enum.NormalId.Front,
        ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
    }
    local v8 = {}
    local v9 = #v8
    local v10 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.new(1, -30, 1, -30)
    }
    local v11 = {}
    local v12 = #v11
    local v13 = {}
    for v14, v15 in p6.props do
        v13[v14] = v15
    end
    v11[v12 + 1] = u2.createElement(u4, v13)
    v8[v9 + 1] = u2.createElement("Frame", v10, v11)
    return u2.createElement("SurfaceGui", v7, v8)
end
return {
    ["SkullLeaderboardApp"] = v3.connect(function(p16, p17) --[[ Line: 36 ]]
        local v18 = {
            ["store"] = p16
        }
        for v19, v20 in p17 do
            v18[v19] = v20
        end
        return v18
    end)(v5)
}