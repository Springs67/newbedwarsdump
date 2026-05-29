local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.SoundManager
local u7 = v3.UILayers
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent, "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["PurchaseButton"] = v9.new(u8)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u8
            [3] = u6
            [4] = u12
            [5] = u14
            [6] = u2
            [7] = u10
            [8] = u7
            [9] = u4
            [10] = u11
            [11] = u5
        --]]
        local v17 = p16.useState
        local _ = p16.useEffect
        local v18, u19 = v17(false)
        local v20 = {}
        for v21, v22 in u15 do
            v20[v21] = v22
        end
        v20.OnClick = nil
        v20.Title = nil
        v20.Cost = nil
        local v27 = {
            ["ImageTransparency"] = 1,
            ["BackgroundColor3"] = u13.mcGreen,
            ["BorderSizePixel"] = 0,
            [u8.Event.MouseEnter] = function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u12
                    [3] = u19
                --]]
                u6:playSound(u12.UI_HOVER)
                u19(true)
            end,
            [u8.Event.MouseLeave] = function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19(false)
            end,
            [u8.Event.Activated] = function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u14
                    [3] = u2
                    [4] = u10
                    [5] = u13
                    [6] = u7
                --]]
                if not u15.EnablePurchaseNotInLobby and u14.isLobbyServer() then
                    if u15.OnClick then
                        u15.OnClick()
                    end
                    return nil
                end
                local v23 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v24 = u10.CONFIRMATION_MODAL
                local v25 = {
                    ["Title"] = "Purchase Error"
                }
                local v26 = u15.Title
                if v26 ~= nil then
                    v26 = string.lower(v26)
                end
                v25.Body = "Please go to the lobby in order to " .. tostring(v26) .. "."
                v25.PrimaryBtnProps = {
                    ["Text"] = "OK",
                    ["BackgroundColor3"] = u13.mcGreen
                }
                function v25.OnPrimaryBtnClick() --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u7
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u7.OVERLAY)
                end
                function v25.OnSecondaryBtnClick() --[[ Line: 64 ]] end
                v23:openApp(v24, v25)
                return nil
            end
        }
        for v28, v29 in v20 do
            v27[v28] = v29
        end
        local v30 = {}
        local v31 = #v30
        if v18 then
            v18 = u8.createElement("UIStroke", {
                ["Transparency"] = 0.35,
                ["Thickness"] = 2,
                ["Color"] = u4.brighten(u15.BackgroundColor3 or u13.mcGreen, 0.3)
            }, { u8.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) })
        end
        if v18 then
            v30[v31 + 1] = v18
        end
        local v32 = #v30
        v30[v32 + 1] = u8.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u4.BLACK
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
            }) })
        v30[v32 + 2] = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v33 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v34 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }), u8.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.075, 0),
                ["PaddingLeft"] = UDim.new(0.075, 0),
                ["PaddingBottom"] = UDim.new(0.075, 0),
                ["PaddingTop"] = UDim.new(0.075, 0)
            }) }
        local v35 = #v34
        local v36
        if u15.Title == nil then
            v36 = false
        else
            v36 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.4,
                ["Size"] = UDim2.fromScale(0.9, 0.375),
                ["Text"] = u15.Title,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v36 then
            v34[v35 + 1] = v36
        end
        local v37 = #v34
        local v38 = u15.Cost ~= nil
        if v38 then
            local v39 = u15.Cost
            local function v50(p40, p41) --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u15
                    [3] = u8
                    [4] = u5
                    [5] = u4
                --]]
                local v42
                if p40 == nil then
                    v42 = p40
                else
                    v42 = p40.Image
                end
                if v42 == nil then
                    local v43
                    if p40 == nil then
                        v43 = p40
                    else
                        v43 = p40.bedcoin
                    end
                    if v43 == 0 or (v43 ~= v43 or not v43) then
                        v42 = nil
                    else
                        v42 = u11.BED_COIN_ICON
                    end
                    if v42 == nil then
                        local v44
                        if p40 == nil then
                            v44 = p40
                        else
                            v44 = p40.robux
                        end
                        if v44 == 0 or (v44 ~= v44 or not v44) then
                            v42 = nil
                        else
                            v42 = u11.ROBUX
                        end
                    end
                end
                local v45 = p40.custom
                if v45 == nil then
                    v45 = p40.bedcoin
                    if v45 == nil then
                        v45 = p40.robux
                    end
                end
                local v46 = #u15.Cost
                if v42 == "" or (not v42 or (v45 == 0 or (v45 ~= v45 or not v45))) then
                    return nil
                end
                local v47 = { u8.createElement(u5, {
                        ["Size"] = UDim2.fromScale(1 / v46, 1)
                    }, { u8.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0.03, 0)
                        }), u8.createElement("ImageLabel", {
                            ["LayoutOrder"] = 0,
                            ["SizeConstraint"] = "RelativeYY",
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["Image"] = v42
                        }, { u8.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }) }), u8.createElement("TextLabel", {
                            ["AutomaticSize"] = "X",
                            ["BackgroundTransparency"] = 1,
                            ["TextScaled"] = true,
                            ["LayoutOrder"] = 1,
                            ["Size"] = UDim2.fromScale(0, 1),
                            ["Text"] = tostring(v45),
                            ["TextColor3"] = u4.WHITE,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["TextYAlignment"] = Enum.TextYAlignment.Center
                        }, { u8.createElement("UIStroke", {
                                ["Thickness"] = 1,
                                ["Transparency"] = 0.7,
                                ["Color"] = u4.BLACK
                            }) }) }) }
                local v48 = #v47
                local v49
                if p41 < v46 - 1 then
                    v49 = u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "or",
                        ["Size"] = UDim2.fromScale(0.1, 1),
                        ["TextColor3"] = u4.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u8.createElement("UIStroke", {
                            ["Thickness"] = 1,
                            ["Transparency"] = 0.7,
                            ["Color"] = u4.BLACK
                        }) })
                else
                    v49 = false
                end
                if v49 then
                    v47[v48 + 1] = v49
                end
                return u8.createFragment(v47)
            end
            local v51 = 0
            v38 = {}
            for v52, v53 in v39 do
                local v54 = v50(v53, v52 - 1, v39)
                if v54 ~= nil then
                    v51 = v51 + 1
                    v38[v51] = v54
                end
            end
        end
        local v55 = {
            ["Size"] = UDim2.fromScale(1, 0.6)
        }
        local v56 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v57 = #v56
        if v38 then
            for v58, v59 in v38 do
                v56[v57 + v58] = v59
            end
        end
        v34[v37 + 1] = u8.createElement(u5, v55, v56)
        v30[v32 + 3] = u8.createElement(u5, v33, v34)
        return u8.createElement("ImageButton", v27, v30)
    end)
}