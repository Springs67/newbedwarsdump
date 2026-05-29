local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomMatchStartButton"] = v8.new(u7)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u3
            [4] = u4
            [5] = u11
            [6] = u6
            [7] = u10
            [8] = u9
        --]]
        local u14, u15 = p13.useState(false)
        local v16 = u7.createElement
        local v17 = u5
        local v18 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["LayoutOrder"] = p12.LayoutOrder
        }
        local v19 = {}
        local v20 = u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4,
            ["DominantAxis"] = "Height"
        })
        local v21 = u7.createElement
        local v22 = u3
        local v23 = {
            ["Text"] = "<b>START MATCH</b>",
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v24
        if u14 then
            v24 = u4.brighten(u11.Gray, 0.5)
        else
            v24 = u11.backgroundSuccess
        end
        v23.BackgroundColor3 = v24
        function v23.OnClick() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u15
                [3] = u6
                [4] = u10
                [5] = u9
                [6] = u11
            --]]
            if u14 then
                u6:playSound(u11.sound.uiDisabled)
            else
                u15(true)
                u6:playSound(u10.UI_CLICK)
                u9.Client:GetNamespace("CustomMatches"):Get("StartGame"):CallServerAsync():andThen(function(_) --[[ Line: 33 ]] end)
            end
        end
        __set_list(v19, 1, {v20, v21(v22, v23)})
        return v16(v17, v18, v19)
    end)
}