local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.GetTarmacAsset
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u14 = v13.BWPlayerRender
local u15 = v13.PlayerRenderFallbackMode
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
return {
    ["MatchDraftPlayerCard"] = v10.new(u9)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u11
            [4] = u17
            [5] = u12
            [6] = u7
            [7] = u8
            [8] = u6
            [9] = u18
            [10] = u5
            [11] = u3
            [12] = u14
            [13] = u15
            [14] = u16
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local v23, u24 = v21(nil)
        local u25 = u9.createRef()
        local v26 = u4.isHoarceKat() and true or u19.CardData.Player.userId == u11.LocalPlayer.UserId
        local v27 = u11:GetPlayerByUserId(u19.CardData.Player.userId)
        local v28
        if u4.isHoarceKat() then
            v28 = u19.CardData.Player.displayName
        elseif v27 then
            v28 = u17.getGamePlayer(v27):getDisplayName()
        else
            v28 = nil
        end
        v22(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u12
                [3] = u7
            --]]
            local u29 = u25:getValue()
            if u29 then
                u12(0.2, u7, function(p30) --[[ Line: 31 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.Position = p30
                end, UDim2.fromScale(1.05, 0.1), UDim2.fromScale(1.05, 0.5))
            end
        end, { u19.CardData.Kit })
        v22(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u11
                [3] = u19
                [4] = u6
                [5] = u18
                [6] = u5
                [7] = u24
            --]]
            local u31 = u8.new()
            u31:GiveTask(task.spawn(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u19
                    [3] = u6
                    [4] = u18
                    [5] = u5
                    [6] = u24
                --]]
                if not u11:GetPlayerByUserId(u19.CardData.Player.userId) then
                    return nil
                end
                u6.Controllers.RankController:getRanks({ u19.CardData.Player.userId }):andThen(function(p32) --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u18
                        [3] = u5
                        [4] = u24
                    --]]
                    local v33 = nil
                    for v34, v35 in p32 do
                        local _ = v34 - 1
                        if v35.userId == u19.CardData.Player.userId == true then
                            v33 = v35
                            break
                        end
                    end
                    if not v33 then
                        return nil
                    end
                    local v36
                    if v33.rankDivision == nil then
                        v36 = u5("NoImage").Image
                    else
                        v36 = u18[v33.rankDivision].image
                    end
                    u24(v36)
                end)
            end))
            return function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31:DoCleaning()
            end
        end, { u19.CardData.Player.userId })
        local v37 = {
            ["ClipsDescendants"] = true,
            ["BorderSizePixel"] = 0,
            ["Size"] = u19.Size or UDim2.fromScale(1, 0.2),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v38 = {}
        local v39 = u9.createElement
        local v40 = "UIGradient"
        local v41 = {
            ["Rotation"] = 0
        }
        local v42 = ColorSequence.new
        local v43
        if u19.CardData.KitLockedIn then
            v43 = {}
            local v44 = ColorSequenceKeypoint.new(0, u19.CardData.TeamColor or Color3.fromRGB(62, 174, 255))
            local v45 = ColorSequenceKeypoint.new
            local v46 = 1
            local v47
            if u19.CardData.TeamColor then
                v47 = u3.darken(u19.CardData.TeamColor, 0.6)
            else
                v47 = Color3.fromRGB(42, 113, 165)
            end
            __set_list(v43, 1, {v44, v45(v46, v47)})
        else
            v43 = {}
            local v48 = ColorSequenceKeypoint.new
            local v49 = 0
            local v50
            if u19.CardData.TeamColor then
                v50 = u3.darken(u19.CardData.TeamColor, 0.3)
            else
                v50 = Color3.fromRGB(42, 113, 165)
            end
            __set_list(v43, 1, {v48(v49, v50), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))})
        end
        v41.Color = v42(v43)
        __set_list(v38, 1, {v39(v40, v41), u9.createElement(u14, {
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["LayoutOrder"] = 1,
    ["FallbackMode"] = u15.NONE,
    ["Size"] = UDim2.fromScale(1, 1),
    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
    ["PlayerUserId"] = u19.CardData.Player.userId
})})
        local v51 = #v38
        local v52
        if u19.CardData.Kit == nil then
            v52 = false
        else
            v52 = u9.createFragment({
                ["KitImage"] = u9.createElement("ImageLabel", {
                    ["Image"] = u16[u19.CardData.Kit].renderImage,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = Enum.ScaleType.Crop,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1.5, 1.5),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1.05, 0.5),
                    ["ImageTransparency"] = u19.CardData.KitLockedIn and 0 or 0.4,
                    ["ZIndex"] = 1,
                    [u9.Ref] = u25
                }, { u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v52 then
            v38[v51 + 1] = v52
        end
        local v53 = #v38
        local v54
        if v23 == nil then
            v54 = false
        else
            v54 = u9.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = v23,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v54 then
            v38[v53 + 1] = v54
        end
        local _ = #v38
        local v55 = {
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v56 = {}
        local v57 = u9.createElement
        local v58 = "TextLabel"
        local v59 = {
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.48, 1),
            ["Position"] = UDim2.fromScale(0.02, 0),
            ["Text"] = v28
        }
        local v60
        if v26 then
            v60 = Color3.fromRGB(255, 204, 92)
        else
            v60 = Color3.fromRGB(255, 255, 255)
        end
        v59.TextColor3 = v60
        v59.TextXAlignment = Enum.TextXAlignment.Left
        v59.Font = Enum.Font.SourceSansBold
        v56.PlayerName = v57(v58, v59, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        local _ = #v56
        local v61 = {
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.98, 0),
            ["Size"] = UDim2.fromScale(0.48, 1)
        }
        local v62 = u19.CardData.ActionText
        v61.Text = v62 == nil and "" or v62
        v61.TextColor3 = Color3.fromRGB(255, 255, 255)
        v61.TextXAlignment = Enum.TextXAlignment.Right
        v61.TextScaled = true
        v61.TextTransparency = u19.CardData.KitLockedIn and 0 or 0.25
        v61.Font = Enum.Font.SourceSansBold
        v61.AutoLocalize = false
        v61.BorderSizePixel = 0
        v61.BackgroundTransparency = 1
        v61.ZIndex = 2
        v56.KitOrActionName = u9.createElement("TextLabel", v61, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v38.TextBackgroundBar = u9.createElement("Frame", v55, v56)
        return u9.createFragment({
            ["MatchDraftPlayerCard"] = u9.createElement("Frame", v37, v38)
        })
    end)
}