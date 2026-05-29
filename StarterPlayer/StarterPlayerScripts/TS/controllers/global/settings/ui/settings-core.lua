local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ButtonComponent
local u6 = v3.DeviceUtil
local u7 = v3.TabsComponent
local u8 = v3.UIUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.RunService
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u18 = v17.CustomMatchRole
local u19 = v17.CustomMatchRoleAttribute
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-meta").SettingMeta
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types")
local u22 = v21.SettingSection
local u23 = v21.SettingsTab
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = v1.import(script, script.Parent, "keyboard-controls", "settings-keyboard-controls-page").SettingsKeyboardControlPage
local u26 = v1.import(script, script.Parent, "mobile-controls", "mobile-layout-customization-app").MobileLayoutCustomizationApp
local u27 = v1.import(script, script.Parent, "settings-tab-page").SettingsTabPage
return {
    ["SettingsCore"] = v13.new(u12)(function(u28, p29) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u23
            [3] = u16
            [4] = u11
            [5] = u6
            [6] = u9
            [7] = u15
            [8] = u19
            [9] = u18
            [10] = u8
            [11] = u10
            [12] = u7
            [13] = u20
            [14] = u27
            [15] = u22
            [16] = u25
            [17] = u5
            [18] = u24
            [19] = u2
            [20] = u26
            [21] = u4
        --]]
        local v30 = p29.useState
        local v31 = p29.useEffect
        local u32 = u12.createRef()
        local u33, u34 = v30(u23.GENERAL)
        local u35, u36 = v30(u16:IsStudio() and true or false)
        local u37 = u11.new()
        local u38 = u16:IsStudio() and true or u6.isMobileControls()
        v31(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u9
                [3] = u15
                [4] = u19
                [5] = u18
                [6] = u36
            --]]
            if u6.isHoarceKat() then
                return nil
            end
            if u9.Controllers.PermissionController:hasPermission("freecam") or u15.LocalPlayer:GetAttribute(u19) == u18.COHOST then
                u36(true)
            end
        end, {})
        v31(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u32
                [3] = u8
            --]]
            if u6.isHoarceKat() then
                return nil
            end
            if u6.isGamepadControls() then
                u8:selectGui((u32:getValue()))
            end
        end, {})
        local v39 = {
            ["AdditionalSpace"] = 10,
            ["ScrollingFrameProps"] = {
                ["ScrollBarThickness"] = 6,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            },
            ["ScrollingFrameRef"] = u32
        }
        local v40 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v41 = #v40
        local v42 = 0
        local v43 = {}
        local v44 = {
            ["Value"] = u33
        }
        for v45, v46 in u10.values(u23) do
            local _ = v45 - 1
            if true == true then
                v42 = v42 + 1
                v43[v42] = v46
            end
        end
        local v47 = 0
        local v48 = {}
        for v49, v50 in v43 do
            local _ = v49 - 1
            local v51 = {
                ["value"] = v50,
                ["text"] = v50
            }
            if v51 ~= nil then
                v47 = v47 + 1
                v48[v47] = v51
            end
        end
        v44.Tabs = v48
        function v44.OnChange(p52) --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34(p52.value)
        end
        v44.UIListLayout = {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
        }
        v44.FrameProps = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0, 1, 0, (u6.isSmallScreen() and 1.9 or 1.8) * 24)
        }
        v44.ButtonUIConfig = {
            ["Padding"] = {
                ["PaddingTop"] = UDim.new(0, 4),
                ["PaddingBottom"] = UDim.new(0, 4),
                ["PaddingLeft"] = UDim.new(0, 14),
                ["PaddingRight"] = UDim.new(0, 14)
            }
        }
        v40[v41 + 1] = u12.createElement(u7, v44)
        local v53 = u10.values(u23)
        local function v68(u54) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u23
                [3] = u38
                [4] = u10
                [5] = u20
                [6] = u12
                [7] = u27
                [8] = u28
                [9] = u22
                [10] = u35
                [11] = u9
            --]]
            if u33 == u23.PC and u38 then
                return nil
            elseif u33 == u23.MOBILE and not u38 then
                return nil
            elseif u54 == u23.MOBILE_CONTROLS then
                return nil
            else
                local v55 = u10.entries(u20)
                table.sort(v55, function(p56, p57) --[[ Line: 148 ]]
                    local _ = p56[1]
                    local v58 = p56[2]
                    local _ = p57[1]
                    local v59 = p57[2]
                    return v58.name < v59.name
                end)
                local v60 = 0
                local v61 = {}
                for v62, v63 in v55 do
                    local _ = v62 - 1
                    local v64 = v63[1]
                    if v63[2].tab ~= u54 then
                        v64 = nil
                    end
                    if v64 ~= nil then
                        v60 = v60 + 1
                        v61[v60] = v64
                    end
                end
                if #v61 == 0 then
                    return nil
                elseif u33 == u54 then
                    return u12.createFragment({
                        [u54] = u12.createElement(u27, {
                            ["Tab"] = u54,
                            ["Settings"] = v61,
                            ["PlayerSettings"] = u28.Settings,
                            ["ExtraSettings"] = function(p65) --[[ Name: ExtraSettings, Line 188 ]]
                                --[[
                                Upvalues:
                                    [1] = u54
                                    [2] = u23
                                    [3] = u22
                                    [4] = u35
                                    [5] = u12
                                    [6] = u9
                                --]]
                                if u54 == u23.GENERAL and (p65 == u22.GAME and u35) then
                                    local v66 = u12.createFragment
                                    local v67 = {
                                        ["EnableFreecamButton"] = u12.createElement("ImageButton", {
                                            ["Size"] = UDim2.new(0.98, 0, 0, 25),
                                            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                                            ["BackgroundTransparency"] = 0.4,
                                            ["BorderSizePixel"] = 0,
                                            [u12.Event.Activated] = function() --[[ Line: 196 ]]
                                                --[[
                                                Upvalues:
                                                    [1] = u9
                                                --]]
                                                u9.Controllers.FreecamController:enableFreecamController()
                                            end
                                        }, { u12.createElement("TextLabel", {
                                                ["Text"] = "Enable Freecam",
                                                ["TextScaled"] = true,
                                                ["BackgroundTransparency"] = 1,
                                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                                ["Position"] = UDim2.fromScale(0.5, 0.5),
                                                ["Size"] = UDim2.fromScale(0.8, 0.6),
                                                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                                                ["Font"] = Enum.Font.GothamMedium
                                            }) })
                                    }
                                    return v66(v67)
                                end
                            end
                        })
                    })
                else
                    return u12.createFragment()
                end
            end
        end
        local v69 = 0
        local v70 = {}
        for v71, v72 in v53 do
            local v73 = v68(v72, v71 - 1, v53)
            if v73 ~= nil then
                v69 = v69 + 1
                v70[v69] = v73
            end
        end
        for v74, v75 in v70 do
            v40[v41 + 1 + v74] = v75
        end
        local v76 = #v40
        local v77 = u33 == u23.KEYBINDS and not u38
        if v77 then
            v77 = u12.createElement(u25)
        end
        if v77 then
            v40[v76 + 1] = v77
        end
        local v78 = #v40
        if u33 == u23.MOBILE_CONTROLS then
            if u38 then
                u38 = u12.createFragment({
                    ["CustomizeMobileLayoutButton"] = u12.createFragment({
                        ["CustomizeMobileLayoutButton"] = u12.createElement(u5, {
                            ["Text"] = "Customize Mobile Button Layout",
                            ["LayoutOrder"] = 10,
                            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["Size"] = UDim2.new(0.98, 0, 0, 45),
                            ["BackgroundColor3"] = u24.backgroundSuccess,
                            ["OnClick"] = function() --[[ Name: OnClick, Line 246 ]]
                                --[[
                                Upvalues:
                                    [1] = u2
                                    [2] = u26
                                    [3] = u37
                                --]]
                                local v79 = {
                                    ["appId"] = "MobileCustomizationApp",
                                    ["app"] = u26
                                }
                                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v79, {})
                                u37:DoCleaning()
                                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("SettingsApp")
                            end
                        }, { u12.createElement("UICorner", {
                                ["CornerRadius"] = UDim.new(0, 6)
                            }), u12.createElement("UISizeConstraint", {
                                ["MaxSize"] = Vector2.new(180, 45)
                            }) })
                    })
                })
            end
        else
            u38 = false
        end
        if u38 then
            v40[v78 + 1] = u38
        end
        return u12.createFragment({
            ["SettingsList"] = u12.createElement(u4, v39, v40)
        })
    end)
}