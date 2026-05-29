local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").BedwarsClassMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").BloodAssassinUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade-meta").BloodUpgradeMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
return {
    ["ContractCard"] = v8.new(u7)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u12
            [4] = u5
            [5] = u14
            [6] = u11
            [7] = u13
            [8] = u6
            [9] = u10
            [10] = u3
            [11] = u7
            [12] = u17
            [13] = u4
        --]]
        local v20 = p19.useEffect
        local v21 = p19.useState
        local v22 = u15(u16.WOOD_SWORD).image
        local v23 = v22 == nil and "" or v22
        if u18.ContractInfo.rewardExplanation.assassin then
            v23 = "rbxassetid://12518331579"
        else
            local v24 = u18.ContractInfo.rewardExplanation.kitClass
            if v24 == 0 or (v24 ~= v24 or not v24) then
                if u18.ContractInfo.rewardExplanation.gear then
                    local v25 = u15(u18.ContractInfo.rewardExplanation.gear).image
                    v23 = v25 == nil and "" or v25
                end
            else
                v23 = u12[u18.ContractInfo.rewardExplanation.kitClass].imageId
            end
        end
        local v26
        if u18.ContractInfo.target == nil then
            v26 = nil
        else
            v26 = u5.Controllers.TeamController:getPlayerTeam(u18.ContractInfo.target)
        end
        local v27 = u14[u18.ContractInfo.rewardUpgrade]
        local v28, u29 = v21("0 blocks away")
        local v30 = math
        local v31 = u18.ContractInfo.activationTime
        if v31 == nil then
            v31 = u11:GetServerTimeNow()
        end
        local v32 = v31 + u13.ABANDON_TIME_SEC - u11:GetServerTimeNow()
        local u33, u34 = v21((v30.round(v32)))
        v20(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u18
                [3] = u11
                [4] = u34
                [5] = u13
                [6] = u10
                [7] = u29
            --]]
            local u35 = u6.new()
            local u36 = true
            task.spawn(function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u18
                    [3] = u11
                    [4] = u34
                    [5] = u13
                    [6] = u10
                    [7] = u29
                --]]
                while true do
                    local v37 = task.wait(0.1)
                    if v37 ~= 0 and (v37 == v37 and v37) then
                        v37 = u36
                    end
                    if v37 == 0 or (v37 ~= v37 or not v37) then
                        return
                    end
                    local v38 = math
                    local v39 = math
                    local v40 = u18.ContractInfo.activationTime
                    if v40 == nil then
                        v40 = u11:GetServerTimeNow()
                    end
                    local v41 = u34
                    local v42 = v40 + u13.ABANDON_TIME_SEC - u11:GetServerTimeNow()
                    local v43 = v39.round(v42)
                    v41((v38.max(0, v43)))
                    if u18.ContractInfo.target then
                        if u18.ContractInfo.target.Parent == u10 then
                            local v44 = u18.ContractInfo.target.Character
                            local v45 = u10.LocalPlayer
                            if v45 ~= nil then
                                v45 = v45.Character
                            end
                            local v46
                            if v44 == nil then
                                v46 = v44
                            else
                                v46 = v44.PrimaryPart
                            end
                            local v47 = not v46
                            if not v47 then
                                local v48
                                if v45 == nil then
                                    v48 = v45
                                else
                                    v48 = v45.PrimaryPart
                                end
                                v47 = not v48
                            end
                            if v47 then
                                u29("respawning")
                            else
                                local v49 = math
                                local v50 = u29
                                local v51 = (v45.PrimaryPart.Position - v44.PrimaryPart.Position).Magnitude / 3
                                local v52 = v49.floor(v51)
                                v50(tostring(v52) .. " blocks away")
                            end
                        else
                            u29("0 blocks away")
                        end
                    end
                end
            end)
            return function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u35
                --]]
                u36 = false
                u35:DoCleaning()
            end
        end, {})
        local v53 = {
            ["BackgroundTransparency"] = 0.4,
            ["Size"] = u18.Size,
            ["BackgroundColor3"] = u3.BLACK,
            ["LayoutOrder"] = u18.LayoutOrder
        }
        local v54 = {}
        local v55 = #v54
        local v56
        if v27.perk == true then
            v56 = u7.createElement("UIStroke", {
                ["Color"] = u3.WHITE
            }, { u7.createElement("UIGradient", {
                    ["Rotation"] = -88,
                    ["Color"] = ColorSequence.new(u3.hexColor(15360512), u3.hexColor(16766464))
                }) })
        else
            v56 = false
        end
        if v56 then
            v54[v55 + 1] = v56
        end
        local v57 = #v54
        v54[v57 + 1] = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.01592356687898089, 0)
        })
        v54[v57 + 2] = u7.createElement("ImageLabel", {
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.09554140127388536, 0.7605633802816901),
            ["Image"] = v23
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v58 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.2760084925690021, 0.7605633802816901)
        }
        local v59 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.035211267605633804, 0)
            }), u7.createElement("TextLabel", {
                ["LayoutOrder"] = 0,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AutoLocalize"] = false,
                ["Text"] = not u18.ContractInfo.target and "spleenhook" or u17.getGamePlayer(u18.ContractInfo.target):getDisplayName(),
                ["Size"] = UDim2.fromScale(1, 0.37037037037037035),
                ["Font"] = Enum.Font.ArialBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u3.WHITE
            }) }
        local v60 = #v59
        if v26 then
            v26 = u7.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = string.upper(v26.name) .. " TEAM",
                ["Size"] = UDim2.fromScale(1, 0.23148148148148148),
                ["Font"] = Enum.Font.ArialBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = v26.color
            })
        end
        if v26 then
            v59[v60 + 1] = v26
        end
        v59[#v59 + 1] = u7.createElement("TextLabel", {
            ["LayoutOrder"] = 2,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Text"] = v28,
            ["Size"] = UDim2.fromScale(1, 0.23148148148148148),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u3.hexColor(9408399)
        })
        v54[v57 + 3] = u7.createElement(u4, v58, v59)
        local v61 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.3184713375796178, 0.7605633802816901)
        }
        local v62 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.035211267605633804, 0)
            }) }
        local v63 = #v62
        local v64 = {
            ["LayoutOrder"] = 0,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Text"] = string.upper(v27.display),
            ["Size"] = UDim2.fromScale(1, 0.37037037037037035),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        }
        local v65
        if v27.perk then
            v65 = u3.WHITE
        else
            v65 = u3.hexColor(13158600)
        end
        v64.TextColor3 = v65
        local v66 = {}
        local v67 = #v66
        local v68
        if v27.perk == true then
            v68 = u7.createElement("UIGradient", {
                ["Rotation"] = -88,
                ["Color"] = ColorSequence.new(u3.hexColor(15360512), u3.hexColor(16766464))
            })
        else
            v68 = false
        end
        if v68 then
            v66[v67 + 1] = v68
        end
        v62[v63 + 1] = u7.createElement("TextLabel", v64, v66)
        v62[v63 + 2] = u7.createElement("TextLabel", {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["TextWrap"] = true,
            ["Text"] = v27.description(u18.ContractInfo.rewardValue),
            ["Size"] = UDim2.fromScale(1, 0.7037037037037037),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["TextColor3"] = u3.WHITE,
            ["TextSize"] = u18.DescriptionTextSize
        })
        v54[v57 + 4] = u7.createElement(u4, v61, v62)
        v54[v57 + 5] = u7.createElement(u4, {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0, 1)
        })
        local v69 = v57 + 6
        local v70 = u7.createElement
        local v71 = "ImageButton"
        local v72 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0.22823779193205945, 0.5),
            ["BackgroundColor3"] = u3.WHITE,
            [u7.Event.MouseButton1Click] = function() --[[ Line: 250 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u33
                    [3] = u5
                --]]
                if u18.ActiveContract then
                    if u33 == 0 then
                        u5.Controllers.BloodAssassinController:updateActiveContract(nil, true)
                    end
                    return nil
                end
                u5.Controllers.BloodAssassinController:updateActiveContract(u18.ContractInfo, true)
            end
        }
        local v73 = {}
        local v74 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v75 = u7.createElement
        local v76 = "UIGradient"
        local v77 = {
            ["Rotation"] = -45
        }
        local v78
        if u18.ActiveContract and u33 > 0 then
            v78 = ColorSequence.new(u3.hexColor(2105636))
        else
            v78 = ColorSequence.new(u3.hexColor(16727614), u3.hexColor(15278112))
        end
        v77.Color = v78
        __set_list(v73, 1, {v74, v75(v76, v77), u7.createElement("TextLabel", {
    ["RichText"] = true,
    ["TextScaled"] = true,
    ["BackgroundTransparency"] = 1,
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Size"] = UDim2.fromScale(1, 0.45),
    ["Text"] = "<b>" .. (not u18.ActiveContract and "ACCEPT" or (u33 == 0 and "DROP" or "DROP " .. tostring(u33) .. "s")) .. "</b>",
    ["Font"] = Enum.Font.JosefinSans,
    ["TextColor3"] = u3.WHITE
})})
        v54[v69] = v70(v71, v72, v73)
        return u7.createElement("Frame", v53, v54)
    end)
}