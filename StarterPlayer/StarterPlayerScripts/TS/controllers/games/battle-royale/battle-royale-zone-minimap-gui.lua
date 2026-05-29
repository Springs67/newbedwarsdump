local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["BattleRoyaleZoneMinimapGUI"] = v6.new(u5)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u9
            [4] = u10
            [5] = u12
            [6] = u5
            [7] = u11
            [8] = u3
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(UDim2.fromScale(0.5, 0.5))
        local v19, u20 = v15(UDim2.fromScale(0.5, 0.5))
        local v21, u22 = v15(UDim2.fromScale(0.5, 0.5))
        local v23, u24 = v15(UDim2.fromScale(0.5, 0.5))
        local v25, u26 = v15(UDim2.fromScale(0.5, 0.5))
        local v27, u28 = v15(0)
        local v29, u30 = v15(false)
        local v31, u32 = v15("")
        local u33, u34 = v15({})
        local u35, u36 = v15({})
        local u37 = nil
        v16(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u33
                [4] = u34
                [5] = u9
                [6] = u26
                [7] = u37
                [8] = u10
                [9] = u28
                [10] = u36
                [11] = u13
                [12] = u22
                [13] = u24
                [14] = u12
                [15] = u18
                [16] = u20
                [17] = u30
                [18] = u32
            --]]
            local v38 = u8.LocalPlayer:GetAttribute("Team")
            if v38 ~= nil then
                u4("TEAM_" .. tostring(v38), function(u39) --[[ Line: 32 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u33
                        [3] = u34
                    --]]
                    if not u39 then
                        return nil
                    end
                    if u39 == u8.LocalPlayer.Character then
                        return nil
                    end
                    if table.find(u33, u39) ~= nil then
                        return nil
                    end
                    u34(function(p40) --[[ Line: 44 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        local v41 = u39
                        table.insert(p40, v41)
                        return p40
                    end)
                end)
            end
            u9.Heartbeat:Connect(function(_) --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u26
                    [3] = u37
                    [4] = u10
                    [5] = u28
                    [6] = u34
                    [7] = u36
                    [8] = u33
                    [9] = u13
                    [10] = u22
                    [11] = u24
                --]]
                local v42 = u8.LocalPlayer
                if v42 ~= nil then
                    v42 = v42.Character
                    if v42 ~= nil then
                        v42 = v42.PrimaryPart
                        if v42 ~= nil then
                            v42 = v42.Position
                        end
                    end
                end
                if v42 then
                    u26(u37(v42))
                    local v43 = u10.CurrentCamera
                    if v43 ~= nil then
                        v43 = v43.CFrame
                        if v43 ~= nil then
                            v43 = v43.LookVector
                        end
                    end
                    if v43 then
                        local v44 = v43.X
                        local v45 = -v43.Z
                        local v46 = math.atan2(v44, v45)
                        u28((math.deg(v46)))
                    end
                end
                local function v61(u47) --[[ Line: 80 ]]
                    --[[
                    Upvalues:
                        [1] = u34
                        [2] = u37
                        [3] = u36
                    --]]
                    local v48
                    if u47 == nil then
                        v48 = u47
                    else
                        v48 = u47.PrimaryPart
                        if v48 ~= nil then
                            v48 = v48.Position
                        end
                    end
                    if not v48 then
                        u34(function(p49) --[[ Line: 91 ]]
                            --[[
                            Upvalues:
                                [1] = u47
                            --]]
                            local v50 = 0
                            local v51 = {}
                            for v52, v53 in p49 do
                                local _ = v52 - 1
                                if v53 ~= u47 == true then
                                    v50 = v50 + 1
                                    v51[v50] = v53
                                end
                            end
                            return v51
                        end)
                        return nil
                    end
                    local u54 = u37(v48)
                    local v55
                    if u47 == nil then
                        v55 = u47
                    else
                        v55 = u47.PrimaryPart
                        if v55 ~= nil then
                            v55 = v55.CFrame
                            if v55 ~= nil then
                                v55 = v55.LookVector
                            end
                        end
                    end
                    if not v55 then
                        return nil
                    end
                    local v56 = v55.X
                    local v57 = -v55.Z
                    local v58 = math.atan2(v56, v57)
                    local u59 = math.deg(v58)
                    u36(function(p60) --[[ Line: 130 ]]
                        --[[
                        Upvalues:
                            [1] = u47
                            [2] = u54
                            [3] = u59
                        --]]
                        p60[u47] = {
                            ["position"] = u54,
                            ["rotation"] = u59
                        }
                        return p60
                    end)
                end
                for v62, v63 in u33 do
                    v61(v63, v62 - 1, u33)
                end
                if u13.Zone then
                    local v64 = u13.Zone.Size.X / u13.WorldSize.X
                    local v65 = math.clamp(v64, 0, 1)
                    local v66 = u13.Zone.Size.Z / u13.WorldSize.Z
                    local v67 = math.clamp(v66, 0, 1)
                    u22(UDim2.fromScale(v65, v67))
                    u24(u37(u13.Zone.Position))
                end
            end)
            local u68 = nil
            u12.Client:Get("BattleRoyaleNextZoneFromServer"):Connect(function(u69) --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u18
                    [3] = u20
                    [4] = u37
                    [5] = u30
                    [6] = u68
                    [7] = u9
                    [8] = u10
                    [9] = u32
                --]]
                local v70 = u69.nextZoneSize.X / u13.WorldSize.X
                local v71 = math.clamp(v70, 0, 1)
                local v72 = u69.nextZoneSize.Z / u13.WorldSize.Z
                local v73 = math.clamp(v72, 0, 1)
                u18(UDim2.fromScale(v71, v73))
                u20(u37(u69.nextZonePosition))
                u30(true)
                if u68 then
                    u68:Disconnect()
                end
                u68 = u9.Heartbeat:Connect(function(_) --[[ Line: 174 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                        [2] = u10
                        [3] = u32
                        [4] = u68
                    --]]
                    local v74 = u69.moveWorkspaceTime - u10:GetServerTimeNow()
                    local v75 = v74 / 60
                    local v76 = math.floor(v75)
                    local v77 = v74 % 60
                    local v78 = math.floor(v77)
                    u32(tostring(v76) .. ":" .. (v78 < 10 and "0" or "") .. tostring(v78))
                    if v74 <= 0 then
                        if u68 then
                            u68:Disconnect()
                        end
                        u32("Void closing!")
                    end
                end)
            end)
        end, {})
        u37 = function(p79) --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            local v80 = u13.CenterWorldPosition
            local v81 = -u13.WorldSize.X / 2
            local v82 = -u13.WorldSize.Z / 2
            local v83 = v80 + Vector3.new(v81, 0, v82)
            local v84 = (p79.X - v83.X) / u13.WorldSize.X
            local v85 = math.clamp(v84, 0, 1)
            local v86 = (p79.Z - v83.Z) / u13.WorldSize.Z
            local v87 = math.clamp(v86, 0, 1)
            return UDim2.fromScale(v85, v87)
        end
        local v88 = {}
        local _ = #v88
        local function v96(p89) --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u5
            --]]
            local v90 = u35[p89]
            if not v90 then
                return u5.createElement("Frame")
            end
            local v91 = u5.createFragment
            local v92 = {}
            local v93 = u5.createElement
            local v94 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 150,
                ["Position"] = v90.position,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(224, 209, 43),
                ["Size"] = UDim2.fromScale(0.2, 0.2)
            }
            local v95 = {
                ["PlayerPositionIndicatorImage"] = u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://84853125356744",
                    ["ImageTransparency"] = 0.1,
                    ["ZIndex"] = 151,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["ImageColor3"] = Color3.fromRGB(224, 209, 43),
                    ["Rotation"] = v90.rotation
                })
            }
            v92.PartyMemberPositionIndicator = v93("Frame", v94, v95)
            return v91(v92)
        end
        local v97 = table.create(#u33)
        local v98 = {
            ["DisplayOrder"] = 20,
            ["ResetOnSpawn"] = false
        }
        for v99, v100 in u33 do
            v97[v99] = v96(v100, v99 - 1, u33)
        end
        local v101 = {
            ["BackgroundTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["Size"] = UDim2.fromOffset(u13.MinimapWidth, u13.MinimapWidth)
        }
        local v102 = {
            u5.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = 0.5,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["ZoneBox1"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 99,
                ["Position"] = v19,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = v17,
                ["Visible"] = v29
            }, { u5.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Transparency"] = 0.1,
                    ["Color"] = Color3.fromRGB(255, 255, 255)
                }) }),
            ["ZoneBox2"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 100,
                ["Position"] = v23,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(82, 212, 61),
                ["Size"] = v21,
                ["Visible"] = v29
            }, { u5.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.1,
                    ["Color"] = Color3.fromRGB(227, 61, 61)
                }) })
        }
        local v103 = u5.createElement
        local v104 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 155,
            ["Position"] = v25,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(87, 209, 64),
            ["Size"] = UDim2.fromScale(0.2, 0.2)
        }
        local v105 = {
            ["PlayerPositionIndicatorImage"] = u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://84853125356744",
                ["ImageTransparency"] = 0.1,
                ["ZIndex"] = 156,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ImageColor3"] = Color3.fromRGB(87, 209, 64),
                ["Rotation"] = v27
            })
        }
        v102.PlayerPositionIndicator = v103("Frame", v104, v105)
        local v106 = #v102
        for v107, v108 in v97 do
            v102[v106 + v107] = v108
        end
        v102[#v102 + 1] = u5.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 0.2,
            ["TextScaled"] = true,
            ["SizeConstraint"] = "RelativeYY",
            ["ZIndex"] = 200,
            ["Text"] = v31,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 1.1),
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = u11.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextColor3"] = u3.WHITE
        })
        v88.Background = u5.createElement("Frame", v101, v102)
        return u5.createElement("ScreenGui", v98, v88)
    end)
}