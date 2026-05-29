local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u9 = v1.import(script, script.Parent.Parent.Parent, "controllers", "global", "reward", "ui", "reward-showcase").RewardShowcase
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u13 = v1.import(script, script.Parent.Parent, "types", "app-config").BedwarsAppIds
return {
    ["RewardTile"] = v7.new(u6)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u6
            [3] = u11
            [4] = u5
            [5] = u8
            [6] = u2
            [7] = u13
            [8] = u4
            [9] = u10
            [10] = u3
            [11] = u9
        --]]
        local _ = p15.useState
        local v16 = p15.useEffect
        local v17 = u12.getRewardColors(u14.Reward)
        local v18 = u14.Reward.consumable
        if not v18 then
            v18 = u14.Reward.bedCoins
            if v18 == 0 or (v18 ~= v18 or not v18) then
                v18 = u14.Reward.crate or (u14.Reward.eventCurrency or u14.Reward.clanShopContribution)
            end
        end
        local u19 = u6.createRef()
        local u20 = not u14.DisablePreview
        if u20 then
            u20 = u11.canPreview(u14.Reward)
        end
        v16(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u19
                [3] = u8
            --]]
            local u21 = u5.new()
            local u22 = u19:getValue()
            if u22 then
                u21:GiveTask(u8.Heartbeat:Connect(function(p23) --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                    --]]
                    u22.Rotation = (u22.Rotation + 45 * p23) % 360
                end))
            end
            return function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, {})
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            [u6.Event.Activated] = function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u11
                    [3] = u14
                    [4] = u2
                    [5] = u13
                    [6] = u4
                --]]
                if not u20 then
                    return nil
                end
                local v24 = u11.rewardToPreviewItem(u14.Reward)
                local u25 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u13.STORE_MENU_APP)
                local u26 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u13.BATTLEPASS)
                local v27 = {
                    ["onOpen"] = function() --[[ Name: onOpen, Line 57 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                        --]]
                        u4.Controllers.LobbyHudController:unmountLobbyHud()
                        u4.Controllers.HotbarController:unmountHotbar()
                    end,
                    ["onClose"] = function() --[[ Name: onClose, Line 61 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                            [2] = u2
                            [3] = u13
                            [4] = u4
                            [5] = u26
                        --]]
                        if u25 then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.STORE_MENU_APP, {
                                ["AppId"] = u13.STORE_MENU_APP
                            })
                            u4.Controllers.LobbyHudController:unmountLobbyHud()
                            u4.Controllers.HotbarController:unmountHotbar()
                        elseif u26 then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.BATTLEPASS, {})
                        end
                        u4.Controllers.LockerPreviewController:closePreview()
                    end
                }
                u4.Controllers.LockerPreviewController:openFullscreenPreview(v24, v27)
            end,
            ["ZIndex"] = u14.ZIndex
        }
        local v29 = u14.ImageButtonProps
        if v29 then
            for v30, v31 in v29 do
                v28[v30] = v31
            end
        end
        local v32 = {}
        local v33 = #v32
        local v34 = not u14.IgnoreAspectRatio
        if v34 then
            v34 = u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })
        end
        if v34 then
            v32[v33 + 1] = v34
        end
        local _ = #v32
        local v35 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["Transparency"] = u14.Transparency
        }
        local v36 = {}
        local v37 = #v36
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 0.2),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.97, 0.01),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Image"] = u10.EYE_SOLID,
            ["Visible"] = u20
        }
        local v39 = u14.ZIndex
        v38.ZIndex = (v39 == nil and 1 or v39) + 1
        v36.PreviewIcon = u6.createElement("ImageLabel", v38)
        local v40 = not u14.IgnoreAspectRatio
        if v40 then
            v40 = u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })
        end
        if v40 then
            v36[v37 + 1] = v40
        end
        local v41 = #v36
        v36[v41 + 1] = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        })
        local v42 = v41 + 2
        local v43 = u6.createElement
        local v44 = "UIGradient"
        local v45 = {
            ["Rotation"] = 90
        }
        local v46
        if v17 then
            v46 = ColorSequence.new({ ColorSequenceKeypoint.new(0, u3.darken(v17.backgroundColor, 0.6)), ColorSequenceKeypoint.new(1, u3.brighten(v17.backgroundColor, 0.1)) })
        else
            v46 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) })
        end
        v45.Color = v46
        v36[v42] = v43(v44, v45)
        v36[v41 + 3] = u6.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u3.brighten(v17.backgroundColor, 0.25),
            ["Transparency"] = u14.Transparency
        }, { u6.createElement("UIGradient", {
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0), NumberSequenceKeypoint.new(1, 1) }),
                [u6.Ref] = u19
            }) })
        local v47 = {
            ["Reward"] = u14.Reward
        }
        local v48
        if v18 == 0 or (v18 ~= v18 or not v18) then
            v48 = u14.Simple
        else
            v48 = v18
        end
        local v49
        if v48 == 0 or (v48 ~= v48 or not v48) then
            v49 = UDim2.fromScale(0.8, 0.775)
        else
            v49 = UDim2.fromScale(0.8, 0.8)
        end
        v47.Size = v49
        local v50 = UDim2
        local v51
        if v18 == 0 or (v18 ~= v18 or not v18) then
            v51 = u14.Simple
        else
            v51 = v18
        end
        v47.Position = v50.fromScale(0.5, (v51 == 0 or (v51 ~= v51 or not v51)) and 0.4 or 0.5)
        v47.AnchorPoint = Vector2.new(0.5, 0.5)
        v47.GroupTransparency = u14.Transparency
        local v52 = u14.ZIndex
        v47.ZIndex = (v52 == nil and 1 or v52) + 1
        v36[v41 + 4] = u6.createElement(u9, v47)
        if v18 == 0 then
            v18 = false
        elseif v18 ~= v18 then
            v18 = false
        end
        local v53 = not v18
        if v53 then
            local v54 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.225),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["BackgroundColor3"] = u3.WHITE
            }
            local v55 = u14.ZIndex
            v54.ZIndex = (v55 == nil and 11 or v55) + 1
            v54.Transparency = u14.Transparency
            v54.Visible = not u14.Simple
            local v56 = { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }
            local v57 = #v56
            local v58 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.85, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = u12.getRewardName(u14.Reward),
                ["TextColor3"] = Color3.fromRGB(39, 39, 39),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextTransparency"] = u14.Transparency
            }
            local v59 = u14.ZIndex
            v58.ZIndex = (v59 == nil and 11 or v59) + 1
            v56[v57 + 1] = u6.createElement("TextLabel", v58)
            v53 = u6.createFragment({
                ["RewardNameContainer"] = u6.createElement("Frame", v54, v56)
            })
        end
        if v53 then
            v36[v41 + 5] = v53
        end
        v32.RewardTile = u6.createElement("Frame", v35, v36)
        return u6.createFragment({
            ["RewardTilePreviewButton"] = u6.createElement("ImageButton", v28, v32)
        })
    end)
}