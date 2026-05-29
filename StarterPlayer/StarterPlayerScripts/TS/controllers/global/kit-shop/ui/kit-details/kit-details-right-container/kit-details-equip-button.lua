local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.DeviceUtil
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitDetailsEquipButton"] = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u7
            [4] = u3
            [5] = u16
            [6] = u10
            [7] = u4
            [8] = u12
            [9] = u11
            [10] = u14
            [11] = u6
            [12] = u15
            [13] = u13
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local u21 = u8.createRef()
        local v22, u23 = v19(false)
        local v24 = {}
        for v25, v26 in u17 do
            v24[v25] = v26
        end
        v24.SelectedKit = nil
        v24.Equipped = nil
        v24.ActiveRental = nil
        v20(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u21
                [3] = u7
            --]]
            if u5.isGamepadControls() then
                u7:selectGui((u21:getValue()))
            end
        end, {})
        local v27 = {
            ["BackgroundColor3"] = u3.WHITE
        }
        for v28, v29 in v24 do
            v27[v28] = v29
        end
        local v30 = { u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 206, 92)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 166, 76)) })
            }) }
        local v31 = #v30
        if v22 then
            local v32 = u8.createElement
            local v33 = "UIStroke"
            local v34 = {
                ["Transparency"] = 0.35,
                ["Thickness"] = 2
            }
            local v35
            if u17.Equipped then
                v35 = u16.mcGreen
            else
                v35 = u3.brighten(u16.mcGreen, 0.2)
            end
            v34.Color = v35
            v22 = v32(v33, v34, { u8.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) })
        end
        if v22 then
            v30[v31 + 1] = v22
        end
        local v36 = #v30
        local v37 = u17.ActiveRental
        if v37 ~= nil then
            v37 = v37.endTime
        end
        local v38 = v37 ~= nil
        if v38 then
            local v39 = {
                ["BackgroundTransparency"] = 0.5,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v40 = { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }
            local v41 = #v40
            local v42 = {
                ["EndTime"] = u17.ActiveRental.endTime
            }
            local v43 = u10:GetServerTimeNow()
            local v44 = u17.ActiveRental
            if v44 ~= nil then
                v44 = v44.endTime
            end
            v42.PreText = " (" .. (v44 < v43 and "Expired" or "")
            v42.PostText = ")"
            v42.TextLabel = {
                ["TextTransparency"] = 0.3,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            v40[v41 + 1] = u8.createElement(u4, v42)
            v38 = u8.createElement("Frame", v39, v40)
        end
        local v45 = {
            ["Size"] = UDim2.fromScale(0.8, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Text"] = u17.Equipped and "EQUIPPED" or "EQUIP KIT",
            ["TextTransparency"] = u17.Equipped and 0.4 or 0
        }
        local v46
        if u17.Equipped then
            v46 = u3.BLACK
        else
            v46 = u3.WHITE
        end
        v45.TextColor3 = v46
        v45.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v45.TextXAlignment = Enum.TextXAlignment.Center
        v45.TextYAlignment = Enum.TextYAlignment.Center
        v45[u8.Event.Activated] = function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u12
                [3] = u5
                [4] = u11
                [5] = u14
                [6] = u6
                [7] = u15
            --]]
            local u47
            if u17.Equipped then
                u47 = u12.NONE
            else
                u47 = u17.SelectedKit
            end
            if u5.isHoarceKat() then
                u11:dispatch({
                    ["type"] = "SetBedwarsKit",
                    ["kit"] = u47
                })
                return nil
            end
            u14.Client:Get("BedwarsActivateKit"):CallServerAsync({
                ["kit"] = u47
            }):andThen(function(p48) --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u11
                    [4] = u47
                --]]
                if p48 then
                    u6:playSound(u15.ARMOR_UNEQUIP)
                    u11:dispatch({
                        ["type"] = "SetBedwarsKit",
                        ["kit"] = u47
                    })
                end
            end)
        end
        v45[u8.Event.MouseEnter] = function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u15
                [3] = u23
            --]]
            u6:playSound(u15.UI_HOVER)
            u23(true)
        end
        v45[u8.Event.MouseLeave] = function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23(false)
        end
        v45[u8.Ref] = u21
        local v49 = {}
        local v50 = #v49
        if v38 then
            v49[v50 + 1] = v38
        end
        v30[v36 + 1] = u8.createElement("TextButton", v45, v49)
        local v51 = u17.ActiveRental
        if v51 then
            v51 = u8.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, {
                u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u8.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 83, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(114, 122, 255)) })
                }),
                u8.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u13.HUD_TIMER_ICON
                })
            })
        end
        if v51 then
            v30[v36 + 2] = v51
        end
        v30[#v30 + 1] = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        return u8.createElement("Frame", v27, v30)
    end)
}