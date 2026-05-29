local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.IconButton
local u11 = v3.Padding
local u12 = v3.ResetTime
local u13 = v3.ScaleComponent
local u14 = v3.SlideIn
local u15 = v3.SoundManager
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-meta").KeyMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v70 = v17.new(u16)(function(u24, p25) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u15
        [4] = u22
        [5] = u8
        [6] = u16
        [7] = u7
        [8] = u13
        [9] = u11
        [10] = u9
        [11] = u4
        [12] = u5
        [13] = u10
        [14] = u20
        [15] = u21
        [16] = u12
        [17] = u6
        [18] = u23
        [19] = u14
    --]]
    local _ = p25.useState
    local v26 = p25.useEffect
    local v27 = UDim2.fromOffset(820, 400)
    local v28 = u19[u24.QueueType]
    v26(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u22
        --]]
        u15:playSound(u22.UI_OPEN_2)
    end, {})
    local v29 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v30 = {}
    local v31 = {
        ["AppId"] = "MissingKeyModal",
        ["ImageButtonProps"] = {
            ["ZIndex"] = 0
        },
        ["OnClick"] = function() --[[ Name: OnClick, Line 47 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u22
                [3] = u2
            --]]
            u15:playSound(u22.UI_CLOSE_2)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MissingKeyModal")
            return true
        end
    }
    __set_list(v30, 1, {u16.createElement(u7, v31)})
    local v32 = #v30
    local v33 = {}
    local v34 = #v33
    local v35 = {
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Size"] = v27,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#333333")
    }
    local v36 = {
        u16.createElement(u13, {
            ["PowerRelationshipPastMaximum"] = 0.6,
            ["MaximumSize"] = Vector2.new(v27.X.Offset * 1.2, v27.Y.Offset * 1.2),
            ["ScreenPadding"] = Vector2.new(45, 45)
        }),
        u16.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }),
        u16.createElement(u11, {
            ["Padding"] = UDim.new(0, 28)
        }),
        u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["Padding"] = UDim.new(0, 16)
        }),
        u16.createElement(u9, {
            ["Size"] = UDim2.new(1, 0, 0, 28)
        }, { u16.createElement(u4, {
                ["Text"] = "MISSING KEYS ",
                ["TextSize"] = 28,
                ["TextColor3"] = u5.WHITE,
                ["Font"] = Enum.Font.SourceSansBold
            }), u16.createElement(u10, {
                ["Size"] = UDim2.new(0, 28, 0, 28),
                ["Image"] = u20.X,
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["OnClick"] = function() --[[ Name: OnClick, Line 97 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u15
                        [3] = u22
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MissingKeyModal")
                    u15:playSound(u22.UI_CLOSE_2)
                end
            }) })
    }
    local v37 = #v36
    local v38 = u24.MissingKeys
    local function v61(p39) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u24
            [3] = u12
            [4] = u16
            [5] = u6
            [6] = u4
            [7] = u5
            [8] = u23
            [9] = u9
        --]]
        local v40 = u21[p39.keyType]
        local v41 = u24.KeysData[p39.keyType]
        local v42
        if v41 == nil then
            v42 = v41
        else
            v42 = v41.amount
        end
        local v43 = v42 == nil and 0 or v42
        local v44 = p39.amount <= v43
        if v41 ~= nil then
            v41 = v41.keyRegenStartTime
        end
        local v45 = nil
        local v46
        if v41 == 0 or (v41 ~= v41 or not v41) then
            v46 = v41
        else
            v46 = v40.keyRegen
        end
        if v46 ~= 0 and (v46 == v46 and v46) then
            v45 = u12.new(v41):getNextResetTime(v40.keyRegen.cooldown)
        end
        local v47 = v45 ~= nil
        if v47 then
            local v48 = {
                ["EndTime"] = v45
            }
            local v49 = v40.keyRegen
            if v49 ~= nil then
                v49 = v49.amountPerRegen
            end
            v48.PreText = "<b>(+" .. tostring(v49) .. " Key In: </b>"
            v48.PostText = "<b>)</b>"
            v48.TextLabel = {
                ["Size"] = UDim2.fromScale(0.45, 0.9),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextColor3"] = Color3.fromRGB(250, 254, 16)
            }
            v48.CountdownConfig = {
                ["days"] = false
            }
            v47 = u16.createElement(u6, v48)
        end
        local v50 = {
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v51 = {}
        local v52 = u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center"
        })
        local v53 = u16.createElement(u4, {
            ["TextSize"] = 20,
            ["Text"] = "\240\159\148\145  " .. v40.name .. ": ",
            ["TextColor3"] = u5.WHITE,
            ["Font"] = Enum.Font.SourceSansBold
        })
        local v54 = u16.createElement
        local v55 = u4
        local v56 = {
            ["TextSize"] = 20
        }
        local v57 = tostring(v43)
        local v58 = p39.amount
        v56.Text = v57 .. " / " .. tostring(v58) .. "    "
        v56.Font = Enum.Font.SourceSansBold
        local v59
        if v44 then
            v59 = u23.mcGreen
        else
            v59 = u23.mcRed
        end
        v56.TextColor3 = v59
        __set_list(v51, 1, {v52, v53, v54(v55, v56)})
        local v60 = #v51
        if v47 then
            v51[v60 + 1] = v47
        end
        return u16.createElement(u9, v50, v51)
    end
    local v62 = table.create(#v38)
    for v63, v64 in v38 do
        v62[v63] = v61(v64, v63 - 1, v38)
    end
    local v65 = {
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v66 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["Padding"] = UDim.new(0, 6)
        }), u16.createElement(u9, {
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }, { u16.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal"
            }), u16.createElement(u4, {
                ["Text"] = "You don\'t have enough keys to queue for: ",
                ["TextSize"] = 20,
                ["Font"] = Enum.Font.SourceSans
            }), u16.createElement(u4, {
                ["TextSize"] = 20,
                ["Text"] = v28.title .. " ",
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = Color3.fromHex("89FFD4")
            }) }) }
    local v67 = #v66
    for v68, v69 in v62 do
        v66[v67 + v68] = v69
    end
    v36[v37 + 1] = u16.createElement(u9, v65, v66)
    v33[v34 + 1] = u16.createElement("ImageButton", v35, v36)
    v30[v32 + 1] = u16.createElement(u14, {}, v33)
    return u16.createElement("ScreenGui", v29, v30)
end)
return {
    ["MissingKeysModal"] = v18.connect(function(p71, p72) --[[ Line: 226 ]]
        local v73 = {}
        for v74, v75 in p72 do
            v73[v74] = v75
        end
        v73.KeysData = p71.Keys.keysData
        return v73
    end)(v70)
}