local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.EmptyButton
local u7 = v2.ScaleComponent
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, script.Parent.Parent, "buttons", "round-text-button").RoundTextButton
return {
    ["FullScreenMenu"] = v13.new(u12)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u14
            [4] = u4
            [5] = u9
            [6] = u17
            [7] = u8
            [8] = u16
            [9] = u12
            [10] = u18
            [11] = u15
            [12] = u7
            [13] = u3
            [14] = u5
            [15] = u6
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local u23, u24 = v21(true)
        local u25, u26 = v21(true)
        local u27 = u19.ContainerSize or UDim2.fromOffset(900, 520)
        v22(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u19
                [3] = u11
                [4] = u14
                [5] = u4
                [6] = u9
            --]]
            local u28 = u10.new()
            if not u19.Background.Blur then
                return nil
            end
            local v29 = u11("BlurEffect", {
                ["Parent"] = u14
            })
            v29.Size = u19.Background.Blur and 12 or 0
            u28:GiveTask(v29)
            if not u4.isHoarceKat() then
                u9.Controllers.FovController:playUIOpenFOVTween()
            end
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u4
                    [3] = u9
                --]]
                u28:DoCleaning()
                if not u4.isHoarceKat() then
                    u9.Controllers.FovController:playUICloseFOVTween()
                end
            end
        end, {})
        v22(function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u9
                [3] = u17
            --]]
            if not u4.isHoarceKat() then
                u9.Controllers.HotbarController:unmountHotbar()
                if u17.isLobbyServer() then
                    u9.Controllers.LobbyHudController:unmountLobbyHud()
                end
            end
            return function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u9
                    [3] = u17
                --]]
                if not u4.isHoarceKat() then
                    u9.Controllers.HotbarController:mountHotbar()
                    if u17.isLobbyServer() then
                        u9.Controllers.LobbyHudController:mountLobbyHud()
                    end
                end
            end
        end, {})
        v22(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u16
            --]]
            u8:playSound(u16.UI_OPEN_2)
        end, {})
        local function v31() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u24
            --]]
            local v30 = u19.BackButton
            if v30 ~= nil then
                v30 = v30.ShouldShow
            end
            u24(v30 == nil and true or v30)
        end
        local v32 = u19.BackButton
        if v32 ~= nil then
            v32 = v32.ShouldShow
        end
        v22(v31, { v32 })
        local function v34() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u26
            --]]
            local v33 = u19.ExitButton
            if v33 ~= nil then
                v33 = v33.ShouldShow
            end
            u26(v33 == nil and true or v33)
        end
        local v35 = u19.ExitButton
        if v35 ~= nil then
            v35 = v35.ShouldShow
        end
        v22(v34, { v35 })
        local function u44() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u19
                [3] = u12
                [4] = u18
                [5] = u15
                [6] = u25
            --]]
            local v36 = {}
            local v37 = #v36
            local v38 = u23 and u19.BackButton
            if v38 then
                v38 = u12.createElement(u18, {
                    ["Selectable"] = true,
                    ["ZIndex"] = 91,
                    ["Text"] = {
                        ["Text"] = "BACK",
                        ["Bold"] = true
                    },
                    ["Image"] = u15.ARROW_LEFT,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 109 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                        --]]
                        local v39 = u19.BackButton
                        if v39 ~= nil then
                            v39.OnClick()
                        end
                    end,
                    ["Size"] = UDim2.fromScale(0.1, 0.85),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, { u12.createElement("UISizeConstraint", {
                        ["MaxSize"] = Vector2.new(150, 75),
                        ["MinSize"] = Vector2.new(75, 37.5)
                    }) })
            end
            if v38 then
                v36[v37 + 1] = v38
            end
            local v40 = #v36
            local v41 = u25
            if v41 then
                v41 = u19.ExitButton
            end
            if v41 then
                local v42 = {
                    ["Selectable"] = true,
                    ["Text"] = {
                        ["Text"] = "EXIT",
                        ["Bold"] = true
                    },
                    ["Image"] = u15.X
                }
                local v43 = u19.ExitButton
                if v43 ~= nil then
                    v43 = v43.OnClick
                end
                v42.OnClick = v43
                v42.Size = UDim2.fromScale(u19.DisableScaleComponent and 0.9 or 0.1, 0.85)
                v42.AnchorPoint = Vector2.new(0.5, 0.5)
                v42.Position = UDim2.fromScale(0.5, 0.5)
                v42.ZIndex = 91
                v41 = u12.createElement(u18, v42, { u12.createElement("UISizeConstraint", {
                        ["MaxSize"] = Vector2.new(150, 75),
                        ["MinSize"] = Vector2.new(75, 37.5)
                    }) })
            end
            if v41 then
                v36[v40 + 1] = v41
            end
            return u12.createFragment(v36)
        end
        local function v67() --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u12
                [3] = u27
                [4] = u7
                [5] = u3
                [6] = u4
                [7] = u44
                [8] = u5
            --]]
            local v45 = {}
            local _ = #v45
            local v46 = {}
            local v47 = u19.Background.BackgroundImageProps
            if v47 then
                for v48, v49 in v47 do
                    v46[v48] = v49
                end
            end
            v46.Size = UDim2.fromScale(1, 1)
            v46.Position = UDim2.fromScale(0.5, 0.5)
            v46.AnchorPoint = Vector2.new(0.5, 0.5)
            v46.ZIndex = -1
            v45.Background = u12.createFragment({
                ["Background"] = u12.createElement("ImageLabel", v46)
            })
            local v50 = {
                ["Size"] = u27,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v51 = u19.ContentProps
            if v51 then
                for v52, v53 in v51 do
                    v50[v52] = v53
                end
            end
            local v54 = {}
            local v55 = #v54
            local v56 = not u19.DisableScaleComponent
            if v56 then
                v56 = u12.createElement(u7, {
                    ["PowerRelationshipPastMaximum"] = 0.8,
                    ["MaximumSize"] = Vector2.new(u27.X.Offset * 2.25, u27.Y.Offset * 2.25)
                })
            end
            if v56 then
                v54[v55 + 1] = v56
            end
            local v57 = #v54
            local v58 = u19[u12.Children]
            if v58 then
                for v59, v60 in v58 do
                    if type(v59) == "number" then
                        v54[v57 + v59] = v60
                    else
                        v54[v59] = v60
                    end
                end
            end
            local _ = #v54
            local v61 = {
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["Position"] = UDim2.fromScale(0, 0.9)
            }
            local v62 = {}
            local v63 = #v62
            local v64 = u19.DisableScaleComponent
            if v64 then
                v64 = u12.createElement("UIPadding", {
                    ["PaddingBottom"] = UDim.new(0, 12)
                })
            end
            if v64 then
                v62[v63 + 1] = v64
            end
            local v65 = #v62 + 1
            local v66
            if u19.EnableButtonBackgroundPanel then
                v66 = u12.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.3,
                    ["ZIndex"] = 90,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundColor3"] = u3.BLACK
                }, {
                    u12.createElement("UIListLayout", {
                        ["HorizontalFlex"] = "SpaceAround",
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0, 10)
                    }),
                    u12.createElement("UIPadding", {
                        ["PaddingRight"] = UDim.new(0.02, u4.isSmallScreen() and 3 or 10),
                        ["PaddingLeft"] = UDim.new(0.02, u4.isSmallScreen() and 3 or 10),
                        ["PaddingTop"] = UDim.new(0.01, u4.isSmallScreen() and 3 or 6),
                        ["PaddingBottom"] = UDim.new(0.01, u4.isSmallScreen() and 3 or 6)
                    }),
                    u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }),
                    u44()
                })
            else
                v66 = u12.createFragment({ u12.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0, 10)
                    }), u44() })
            end
            v62[v65] = v66
            v54.Footer = u12.createElement(u5, v61, v62)
            v45.Content = u12.createFragment({
                ["Content"] = u12.createElement(u5, v50, v54)
            })
            return u12.createFragment(v45)
        end
        local v68 = {
            ["IgnoreGuiInset"] = true,
            ["ResetOnSpawn"] = false
        }
        local v69 = u19.ScreenGuiProps
        if v69 then
            for v70, v71 in v69 do
                v68[v70] = v71
            end
        end
        local v72 = {}
        local v73 = #v72
        local v74 = u19.UseFrame
        if v74 then
            v74 = u12.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }, { v67() })
        end
        if v74 then
            v72[v73 + 1] = v74
        end
        local v75 = #v72
        local v76 = not u19.UseFrame
        if v76 then
            v76 = u12.createElement(u6, {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Modal"] = true,
                [u12.Event.MouseButton1Click] = u19.Background.OnClick
            }, { v67() })
        end
        if v76 then
            v72[v75 + 1] = v76
        end
        return u12.createElement("ScreenGui", v68, v72)
    end)
}