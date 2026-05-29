local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v12 = v1.import(script, script.Parent.Parent.Parent, "lobby-hud", "lobby-play-menu", "lobby-play-menu-pages")
local u13 = v12.LobbyPlayMenuPage
local u14 = v12.LobbyPlayMenuPageMeta
return {
    ["QueueSelectionQueueButton"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u5
            [4] = u6
            [5] = u14
            [6] = u13
            [7] = u3
            [8] = u11
            [9] = u10
            [10] = u4
        --]]
        local _ = p16.useState
        local v17 = p16.useEffect
        local u18 = u7.createRef()
        v17(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u18
            --]]
            if u9.GamepadEnabled then
                u5:selectGui(u18:getValue())
            end
        end, {})
        local v19 = u6.entries(u14)
        local function v26(p20) --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u13
            --]]
            local v21 = p20[1]
            local v22 = nil
            for v23, v24 in p20[2].queueCardVariants do
                local _ = v23 - 1
                if v24.queueType == u15.QueueType == true then
                    v22 = v24
                    break
                end
            end
            local v25 = v22 ~= nil
            if v25 then
                v25 = v21 ~= u13.WELCOME
            end
            return v25
        end
        local v27 = nil
        for v28, v29 in v19 do
            if v26(v29, v28 - 1, v19) == true then
                v27 = v29
                break
            end
        end
        local v30
        if v27 then
            local _ = v27[1]
            v30 = nil
            for v31, v32 in v27[2].queueCardVariants do
                local _ = v31 - 1
                if v32.queueType == u15.QueueType == true then
                    v30 = v32
                    break
                end
            end
            if v30 ~= nil then
                v30 = v30.cardProps
                if v30 ~= nil then
                    v30 = v30.CardData
                    if v30 ~= nil then
                        v30 = v30.title
                    end
                end
            end
        else
            v30 = nil
        end
        local v33 = {
            [u7.Ref] = u18,
            ["Size"] = UDim2.new(0.9, 0, 0, 50),
            ["BackgroundColor3"] = u3.WHITE,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = true,
            [u7.Event.Activated] = function() --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.OnClick(u15.QueueType)
            end
        }
        local v34 = { u7.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = u11.textPrimary
            }, { u7.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }), u7.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromRGB(107, 112, 185), u3.darken(Color3.fromRGB(107, 112, 185), 0.8))
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v35 = #v34
        local v36 = {
            ["SizeConstraint"] = "RelativeXX",
            ["AutomaticSize"] = "Y",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.4),
            ["TextColor3"] = u3.WHITE
        }
        if v30 == nil then
            v30 = u10(u15.QueueType).title
        end
        v36.Text = v30
        v34[v35 + 1] = u7.createElement("TextLabel", v36, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u4.isSmallScreen() and 12 or 14
            }) })
        v34[v35 + 2] = u7.createElement("TextLabel", {
            ["SizeConstraint"] = "RelativeXX",
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Text"] = "[Click to play]",
            ["Size"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.7),
            ["TextColor3"] = Color3.fromRGB(206, 206, 206)
        }, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u4.isSmallScreen() and 8 or 10
            }) })
        return u7.createElement("ImageButton", v33, v34)
    end)
}