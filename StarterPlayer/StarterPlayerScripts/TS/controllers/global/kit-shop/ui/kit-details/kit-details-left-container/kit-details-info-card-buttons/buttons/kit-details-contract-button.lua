local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u13 = v1.import(script, script.Parent.Parent, "kit-details-button").KitDetailsButton
return {
    ["KitDetailsContractButton"] = v8.new(u7)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u5
            [4] = u6
            [5] = u2
            [6] = u9
            [7] = u7
            [8] = u13
            [9] = u4
            [10] = u10
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18 = p15.useMemo
        local u19 = u11[u14.SelectedKit]
        if u19 ~= nil then
            u19 = u19.rewards
        end
        local v20 = u14.store.Lobby.kitStatsProfiles[u14.SelectedKit]
        local u21, u22 = v16(v20 == nil and {
            ["wins"] = 0,
            ["kills"] = 0
        } or v20)
        local v27 = v18(function() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u12
                [3] = u14
                [4] = u21
            --]]
            if not u19 then
                return nil
            end
            local v23 = false
            local v24 = 0
            local v25 = 1
            while true do
                if v23 then
                    v24 = v24 + 1
                else
                    v23 = true
                end
                if v24 >= #u19 then
                    break
                end
                local v26 = u12.getProgressBarPercentage(u19[v24 + 1].tier, u14.SelectedKit, u21)
                v25 = u19[v24 + 1].tier
                if v26 < 1 then
                    break
                end
            end
            return v25
        end, {})
        v17(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u5
                [3] = u6
                [4] = u22
            --]]
            local v28 = u14.store.Lobby.kitStatsProfiles[u14.SelectedKit]
            if v28 == nil then
                local v29
                if u5.isHoarceKat() then
                    v29 = nil
                else
                    v29 = u6.Controllers.KitContractController:getKitStats(u14.SelectedKit):expect()
                end
                v28 = v29 or {
                    ["wins"] = 0,
                    ["kills"] = 0
                }
            end
            u22(v28)
        end, {})
        local v30 = {}
        for v31, v32 in u14 do
            v30[v31] = v32
        end
        v30.SelectedKit = nil
        v30.store = nil
        local v33 = {}
        for v34, v35 in v30 do
            v33[v34] = v35
        end
        v33.Title = "CONTRACT"
        v33.Subtitle = "VIEW"
        function v33.OnClick() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u9
                [3] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u9.KIT_CONTRACT_APP, {
                ["SelectedKit"] = u14.SelectedKit
            })
        end
        local v36 = u12
        local v37 = v27 == nil and 1 or v27
        v33.Progress = v36.getProgressBarPercentage(v37, u14.SelectedKit, u21)
        return u7.createElement(u13, v33, { u7.createElement("Frame", {
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(87, 87, 87)
            }, {
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextStrokeTransparency"] = 0,
                    ["TextTransparency"] = 0.25,
                    ["ZIndex"] = 100,
                    ["Size"] = UDim2.fromScale(1, 0.35),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.8),
                    ["Text"] = "LV." .. tostring(v27),
                    ["TextColor3"] = u4.WHITE,
                    ["TextStrokeColor3"] = u4.BLACK,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }),
                u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.75, 0.75),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u10.SCROLL_SOLID,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            }) })
    end)
}