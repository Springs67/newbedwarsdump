local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "snake-shrine-upgrade-description").SnakeShrineUpgradeDescription
return {
    ["SnakeShrineUpgradeDescriptions"] = v10.new(u9)(function(u23, p24) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u15
            [3] = u5
            [4] = u14
            [5] = u17
            [6] = u12
            [7] = u18
            [8] = u4
            [9] = u19
            [10] = u9
            [11] = u16
            [12] = u6
            [13] = u22
            [14] = u13
            [15] = u7
            [16] = u20
            [17] = u21
            [18] = u3
        --]]
        local v25 = p24.useState
        local v26 = p24.useEffect
        local u27 = u8.new()
        local u28 = u15[u23.SelectedTeamBuff]
        local v29 = u5.isSmallScreen()
        local _ = (v29 and 12 or 14) * 0.6 * #u28.displayName
        local u30, u31 = v25(0)
        local v32, u33 = v25(false)
        local v34 = u28.baseCost
        local v35 = math
        local v36 = u14:getState().SnakeShrine.costMultipliers[u23.SelectedTeamBuff]
        local v37 = v34 * (v36 == nil and 1 or v36)
        local v38, u39 = v25((v35.ceil(v37)))
        local u40, u41 = v25(u5.isHoarceKat() and true or u17.hasEnough(u12.LocalPlayer, u18.DIAMOND, v38))
        local v42
        if u40 then
            v42 = Color3.fromRGB(138, 242, 245)
        else
            v42 = u4.darken(Color3.fromRGB(138, 242, 245), 0.2)
        end
        local v43, u44 = v25(v42)
        local function u53() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u14
                [3] = u23
            --]]
            local v45 = u28.purchaseLimit
            if v45 ~= nil then
                v45 = v45.activeCountLimit
            end
            local v46 = v45 ~= nil
            if v46 then
                local v47 = u28.purchaseLimit.activeCountLimit
                local v48 = u14:getState().SnakeShrine.activeBuffCounts[u23.SelectedTeamBuff]
                v46 = v47 <= (v48 == nil and 0 or v48)
            end
            local v49 = u28.purchaseLimit
            if v49 ~= nil then
                v49 = v49.totalCountLimit
            end
            local v50 = v49 ~= nil
            if v50 then
                local v51 = u28.purchaseLimit.totalCountLimit
                local v52 = u14:getState().SnakeShrine.buffCounts[u23.SelectedTeamBuff]
                v50 = v51 <= (v52 == nil and 0 or v52)
            end
            return v46 or v50
        end
        v26(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u14
                [3] = u23
                [4] = u15
                [5] = u5
                [6] = u17
                [7] = u12
                [8] = u18
                [9] = u4
                [10] = u53
                [11] = u39
                [12] = u41
                [13] = u44
                [14] = u33
            --]]
            u27:DoCleaning()
            local u64 = u14.changed:connect(function(p54, p55) --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u15
                    [3] = u14
                    [4] = u5
                    [5] = u17
                    [6] = u12
                    [7] = u18
                    [8] = u4
                    [9] = u53
                    [10] = u39
                    [11] = u41
                    [12] = u44
                    [13] = u33
                --]]
                if p54.SnakeShrine.costMultipliers[u23.SelectedTeamBuff] ~= p55.SnakeShrine.costMultipliers[u23.SelectedTeamBuff] then
                    local v56 = u15[u23.SelectedTeamBuff].baseCost
                    local v57 = math
                    local v58 = u14:getState().SnakeShrine.costMultipliers[u23.SelectedTeamBuff]
                    local v59 = v56 * (v58 == nil and 1 or v58)
                    local v60 = v57.ceil(v59)
                    local v61 = u5.isHoarceKat() and true or u17.hasEnough(u12.LocalPlayer, u18.DIAMOND, v60)
                    local v62
                    if v61 then
                        v62 = Color3.fromRGB(138, 242, 245)
                    else
                        v62 = u4.darken(Color3.fromRGB(138, 242, 245), 0.2)
                    end
                    local v63 = u53()
                    u39(v60)
                    u41(v61)
                    u44(v62)
                    u33(v63)
                end
            end)
            u27:GiveTask(function() --[[ Line: 123 ]]
                --[[
                Upvalues:
                    [1] = u64
                --]]
                return u64:disconnect()
            end)
            local v65 = u15[u23.SelectedTeamBuff].baseCost
            local v66 = math
            local v67 = u14:getState().SnakeShrine.costMultipliers[u23.SelectedTeamBuff]
            local v68 = v65 * (v67 == nil and 1 or v67)
            local v69 = v66.ceil(v68)
            local v70 = u5.isHoarceKat() and true or u17.hasEnough(u12.LocalPlayer, u18.DIAMOND, v69)
            local v71
            if v70 then
                v71 = Color3.fromRGB(138, 242, 245)
            else
                v71 = u4.darken(Color3.fromRGB(138, 242, 245), 0.2)
            end
            local v72 = u53()
            u39(v69)
            u41(v70)
            u44(v71)
            u33(v72)
            return function() --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                return u27:DoCleaning()
            end
        end, { u23.SelectedTeamBuff })
        local v73
        if v29 then
            v73 = UDim2.fromOffset(300, 135)
        else
            v73 = UDim2.fromOffset(400, 180)
        end
        local v74 = {
            ["BackgroundTransparency"] = 0.3,
            ["AnchorPoint"] = Vector2.new(0, 0)
        }
        local v75
        if v29 then
            v75 = UDim2.fromScale(0.5, 0.6)
        else
            v75 = UDim2.fromScale(0.5, 0.65)
        end
        v74.Position = v75
        v74.Size = v73
        v74.BackgroundColor3 = u4.BLACK
        for v76, v77 in u23.FrameProps do
            v74[v76] = v77
        end
        local v78 = { u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u9.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromHex("#89f692")
            }) }
        local v79 = #v78
        local v80 = {
            ["Position"] = UDim2.fromScale(-0.05, -0.28)
        }
        local v81 = u28.image
        if v81 == nil then
            v81 = u16.SNAKE_ICON
        end
        v80.Image = v81
        v80.BackgroundTransparency = 1
        v80.BackgroundColor3 = u4.BLACK
        v80.BorderSizePixel = 0
        v80.Size = UDim2.fromScale(0.35, 0.35)
        v80.SizeConstraint = Enum.SizeConstraint.RelativeXY
        v80.ScaleType = Enum.ScaleType.Fit
        v80.LayoutOrder = 1
        v78.BlessingIcon = u9.createElement("ImageLabel", v80, { u9.createElement("UIScale", {
                ["Scale"] = 1
            }) })
        local v82 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.925, 0.925)
        }
        local v83 = {}
        local v84 = u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        })
        local v85 = u9.createElement
        local v86 = u6
        local v87 = {
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v88 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v89 = u9.createElement
        local v90 = "TextLabel"
        local v91 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextColor3"] = Color3.fromHex("#89f692")
        }
        local v92 = u28.displayName
        local v93 = u14:getState().SnakeShrine.activeBuffCounts[u23.SelectedTeamBuff]
        local v94 = v93 == nil and 0 or v93
        if v94 >= 1 then
            local v95 = v94 + 1
            v92 = v92 .. " (Lv. " .. tostring(v95) .. ")"
        end
        v91.Text = v92
        v91.TextXAlignment = Enum.TextXAlignment.Left
        v91.TextYAlignment = Enum.TextYAlignment.Center
        v91.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v88.TeamBuffName = v89(v90, v91, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = v29 and 18 or 24
            }) })
        __set_list(v83, 1, {v84, v85(v86, v87, v88)})
        local v96 = #v83
        local v97 = {}
        local v98 = u28.description
        v97.Description = v98 == nil and "" or v98
        v97.LayoutOrder = 4
        v83[v96 + 1] = u9.createElement(u22, v97)
        v78.UseableArea = u9.createElement("Frame", v82, v83)
        local v101 = {
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Size"] = UDim2.fromScale(0.45, 0.167),
            ["Position"] = UDim2.fromScale(0.965, 0.9),
            ["Text"] = "<b>" .. (v32 and "Limit Reached" or tostring(v38) .. " DIAMONDS") .. "</b>",
            ["OnClick"] = function() --[[ Name: OnClick, Line 247 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u30
                    [3] = u31
                    [4] = u40
                    [5] = u19
                    [6] = u23
                    [7] = u7
                    [8] = u20
                    [9] = u21
                --]]
                if u13:GetServerTimeNow() > u30 + 0.5 then
                    u31(u13:GetServerTimeNow())
                    if u40 then
                        u19.Client:Get("PurchaseSnakeShrineBuff"):SendToServer({
                            ["teamBuff"] = u23.SelectedTeamBuff
                        })
                    end
                    local v99 = u7
                    local v100
                    if u40 then
                        v100 = u20.UI_CLICK
                    else
                        v100 = u21.sound.uiDisabled
                    end
                    v99:playSound(v100)
                end
            end,
            ["BackgroundColor3"] = v43
        }
        local v102 = {}
        local v103 = #v102
        if u40 then
            u40 = u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(v43, 0.9)), ColorSequenceKeypoint.new(1, u4.darken(v43, 0.9)) }),
                ["Transparency"] = NumberSequence.new(0.15)
            })
        end
        if u40 then
            v102[v103 + 1] = u40
        end
        v102[#v102 + 1] = u9.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u4.brighten(v43, 0.1)
        })
        v78[v79 + 1] = u9.createElement(u3, v101, v102)
        return u9.createFragment({
            ["TeamBuffDescription"] = u9.createElement("Frame", v74, v78)
        })
    end)
}