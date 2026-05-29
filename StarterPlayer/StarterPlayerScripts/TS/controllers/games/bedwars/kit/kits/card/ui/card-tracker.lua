local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.UILayers
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util")
local u11 = v10.CardConstants
local u12 = v10.CardUpgrades
local u13 = v10.CardUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, script.Parent, "card-selection").CardSelectionApp
local u16 = Color3.fromHex("fcfbf8")
local u17 = nil
local function v99(p18, p19) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u13
        [4] = u5
        [5] = u14
        [6] = u9
        [7] = u11
        [8] = u12
        [9] = u4
        [10] = u16
        [11] = u17
    --]]
    local v20 = p19.useState
    local v21 = p19.useEffect
    local u22 = u7.createRef()
    local u23 = u7.createRef()
    local v24 = (u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitSecondary") or {})[1]
    if v24 ~= nil then
        v24 = v24.Name
    end
    local v25 = v24 == nil and "" or v24
    local u26 = false
    local u27 = 0
    local u28 = {}
    local v29, u30 = v20(u26)
    local v31, u32 = v20(u27)
    local v33, u34 = v20(u28)
    local v35 = u13
    local v36 = p18.cardProgress
    if v36 == nil then
        v36 = v31
    end
    local v37 = v35.getProgressPercent(v36)
    local v38 = u13
    local v39 = p18.cardProgress
    if v39 ~= nil then
        v31 = v39
    end
    local u40 = v38.getTierFromProgress(v31)
    local u41 = p18.cardUpgrades or v33
    v21(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
            [3] = u5
            [4] = u14
            [5] = u26
            [6] = u30
            [7] = u27
            [8] = u32
            [9] = u28
            [10] = u34
            [11] = u9
        --]]
        local v42 = u22:getValue()
        if not v42 then
            return nil
        end
        local v43 = u23:getValue()
        if not v43 then
            return nil
        end
        local u44, u45, u46
        if u5.isHoarceKat() then
            u44 = nil
            u45 = nil
            u46 = nil
        else
            u45 = u14.Client:WaitFor("CardUpgradeUpdate"):expect():Connect(function(p47) --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u30
                --]]
                u26 = p47.upgradeAvailable
                u30(u26)
            end)
            u44 = u14.Client:WaitFor("CardProgressUpdate"):expect():Connect(function(p48) --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u32
                --]]
                u27 = p48.progress
                u32(u27)
            end)
            u46 = u14.Client:WaitFor("CardUpgradeUpdate"):expect():Connect(function(p49) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u34
                --]]
                u28 = p49.upgrades
                u34(u28)
            end)
        end
        local v50 = 0
        local v51 = {}
        local u52 = {}
        for v53, v54 in v42:GetDescendants() do
            local _ = v53 - 1
            if v54.Name == "CardIcon" == true then
                v50 = v50 + 1
                v51[v50] = v54
            end
        end
        local function v58(p55) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u52
            --]]
            local v56 = u9:Create(p55, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                ["Rotation"] = 360
            })
            local v57 = u52
            table.insert(v57, v56)
            v56:Play()
        end
        for v59, v60 in v51 do
            v58(v60, v59 - 1, v51)
        end
        local v61 = u9:Create(v43, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
            ["Rotation"] = 360
        })
        table.insert(u52, v61)
        v61:Play()
        return function() --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u44
                [3] = u45
                [4] = u46
                [5] = u52
            --]]
            if not u5.isHoarceKat() then
                u44:Disconnect()
                u45:Disconnect()
                u46:Disconnect()
            end
            for v62, v63 in u52 do
                local _ = v62 - 1
                v63:Destroy()
            end
        end
    end, {})
    local v64 = {}
    local v65 = #v64
    local v66 = {
        ["Transparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.2, 0.34),
        ["Position"] = UDim2.fromScale(0.025, u5.isMobileControls() and 0.25 or 0.3)
    }
    local v67 = {
        ["ContainerGlow"] = u7.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://13835817025",
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 0.7,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(-0.025, -0.04)
        }, { u7.createElement("UIScale", {
                ["Scale"] = 1.05
            }), u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.3541666666666667
            }) })
    }
    local v68 = #v67
    local v69 = {
        ["Image"] = "rbxassetid://13835816889",
        ["BorderSizePixel"] = 0,
        ["ImageTransparency"] = 0.7,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v70 = {}
    local v71 = #v70
    local v72 = {
        [u7.Ref] = u22,
        ["Size"] = UDim2.fromScale(0.5, 0.9),
        ["Position"] = UDim2.fromScale(0.37, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true
    }
    local v73 = {}
    local v74 = #v73
    local v75 = {
        ["ResetOnSpawn"] = false
    }
    for v97, v98 in (function() --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u41
            [4] = u7
            [5] = u4
            [6] = u16
            [7] = u40
        --]]
        local v76 = false
        local v77 = 1
        local v78 = {}
        while true do
            if v76 then
                v77 = v77 + 1
            else
                v76 = true
            end
            if v77 > u11.MAX_TIER then
                return v78
            end
            local v79 = u12[u41[v77 - 1 + 1]]
            local v80 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.75, 0.19),
                ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
            }
            local v81 = { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }
            local _ = #v81
            local v82 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v83 = {}
            local v84 = #v83
            local v85 = v79 ~= nil
            if v85 then
                local v86 = {}
                local v87 = v79.image
                v86.Image = v87 == nil and "" or v87
                v86.ImageColor3 = v79.color or u4.WHITE
                v86.ScaleType = Enum.ScaleType.Fit
                v86.AnchorPoint = Vector2.new(0.5, 0.5)
                v86.Position = UDim2.fromScale(0.5, 0.5)
                v86.Size = UDim2.fromScale(0.9, 0.9)
                v86.BorderSizePixel = 0
                v86.BackgroundTransparency = 1
                v86.ZIndex = 11
                v85 = u7.createFragment({
                    ["CardImage"] = u7.createElement("ImageLabel", v86)
                })
            end
            local v88 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1
            }
            local v89
            if v79 then
                v89 = u16
            else
                v89 = u4.WHITE
            end
            v88.ImageColor3 = v89
            v88.Image = v79 and "rbxassetid://13840759492" or "rbxassetid://13618318240"
            v88.ScaleType = Enum.ScaleType.Fit
            v88.AnchorPoint = Vector2.new(0.5, 0.5)
            v88.Position = UDim2.fromScale(0.5, 0.5)
            v88.Size = UDim2.fromScale(0.9, 0.9)
            v88.Visible = v77 <= u40
            local v90 = {
                ["CardIcon"] = u7.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://13618323195",
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 10,
                    ["ImageTransparency"] = v79 and 1 or 0,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.9, 0.9)
                })
            }
            local v91 = #v90
            if v85 then
                v90[v91 + 1] = v85
            end
            v83.CardBackground = u7.createElement("ImageLabel", v88, v90)
            v83[v84 + 1] = u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            })
            local v92 = u11.MAX_TIER - v77
            v81["ActiveCardSlot" .. tostring(v92)] = u7.createElement("Frame", v82, v83)
            local v93 = u7.createFragment
            local v94 = {}
            local v95 = u11.MAX_TIER - v77
            v94["InactiveCardSlot" .. tostring(v95)] = u7.createElement("Frame", v80, v81)
            local v96 = v93(v94)
            table.insert(v78, v96)
        end
    end)() do
        v73[v74 + v97] = v98
    end
    v73[#v73 + 1] = u7.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Vertical,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["Padding"] = UDim.new(0.01)
    })
    v70.CardContainer = u7.createElement("Frame", v72, v73)
    v70.OuterProgressBar = u7.createElement("Frame", {
        ["Transparency"] = 0.2,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.175, 0.875),
        ["Position"] = UDim2.fromScale(0.8, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
    }, {
        ["InnerProgressBar"] = u7.createElement("Frame", {
            ["Transparency"] = 0.1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.5, 0.97 * (u11.MAX_TIER <= u40 and 1 or v37)),
            ["Position"] = UDim2.fromScale(0.25, 0.985),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 122, 0)
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        })
    })
    v70[v71 + 1] = u7.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 0.3333333333333333
    })
    v70[v71 + 2] = u7.createElement("UIStroke", {
        ["Thickness"] = 1,
        ["Transparency"] = 0.5,
        ["Color"] = Color3.fromRGB(255, 255, 0)
    })
    v70[v71 + 3] = u7.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 4)
    })
    v67.OuterContainer = u7.createElement("ImageLabel", v69, v70)
    v67[v68 + 1] = u7.createElement("ImageButton", {
        ["Image"] = "rbxassetid://13817404630",
        ["Size"] = UDim2.fromScale(1, 0.25),
        ["Position"] = UDim2.fromScale(-0.04, 1.0250000000000001),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        [u7.Event.Activated] = function() --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17()
        end,
        ["Visible"] = v29
    }, { u7.createElement("UIScale", {
            ["Scale"] = 1.05
        }), u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4.8
        }) })
    v67[v68 + 2] = u7.createElement("ImageLabel", {
        ["Image"] = "rbxassetid://13817364372",
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.25),
        ["Position"] = UDim2.fromScale(0, 1.05),
        ["Visible"] = v29
    }, {
        ["CardIcon"] = u7.createElement("ImageLabel", {
            [u7.Ref] = u23,
            ["Image"] = "rbxassetid://13618323195",
            ["Size"] = UDim2.fromScale(0.1, 0.5),
            ["Position"] = UDim2.fromScale(0.12, 0.49),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 10
        }, { u7.createElement("UIScale", {
                ["Scale"] = 4
            }) }),
        u7.createElement("TextLabel", {
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(0.1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.12, 0.49),
            ["Text"] = "<b>" .. v25 .. "</b>",
            ["TextColor3"] = Color3.fromRGB(255, 217, 115),
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 20)
            }) }),
        u7.createElement("TextLabel", {
            ["Text"] = "<b>CHOOSE UPGRADE</b>",
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 2,
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(0.8, u5.isMobileControls() and 0.5 or 0.4),
            ["Position"] = UDim2.fromScale(0.2, 0.35),
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        }),
        u7.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Transparency"] = 0.5,
            ["Color"] = Color3.fromRGB(255, 255, 0)
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        }),
        u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4.8
        })
    })
    v67[v68 + 3] = u7.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 0.75
    })
    v64[v65 + 1] = u7.createElement("Frame", v66, v67)
    return u7.createFragment({
        ["CardScreenGUI"] = u7.createElement("ScreenGui", v75, v64)
    })
end
u17 = function() --[[ Name: openCardMenu, Line 423 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u6
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "CardSelection",
        ["app"] = u15,
        ["layer"] = u6.MAIN
    }, {
        ["AppId"] = "CardSelection"
    })
end
return {
    ["openCardMenu"] = u17,
    ["CardKit"] = v8.new(u7)(v99)
}