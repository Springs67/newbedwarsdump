local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.ImageId
local u7 = v3.ScaleComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "lobby-hud", "lobby-hud-side", "lobby-hud-side-button").LobbyHudSideButton
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v47 = v10.new(u9)(function(_, p21) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u14
        [4] = u4
        [5] = u9
        [6] = u7
        [7] = u15
        [8] = u6
        [9] = u2
        [10] = u17
        [11] = u20
        [12] = u19
        [13] = u16
        [14] = u5
        [15] = u18
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local v24, u25 = v22(nil)
    local v26, u27 = v22("0.00")
    local v28, u29 = v22("0.00")
    local v30, u31 = v22(true)
    local u32 = nil
    v23(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u25
            [4] = u32
            [5] = u29
            [6] = u27
            [7] = u14
        --]]
        u8.Controllers.TrainingRoomDpsCounterController.syncEvents.PlayerDpsUpdatedEvent:connect(function(p33) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u25
                [3] = u32
                [4] = u29
                [5] = u27
            --]]
            if p33.player == u13.LocalPlayer then
                u25(p33.dpsData)
                u32 = p33.dpsData
                if p33.clear then
                    u29("0.00")
                    u27("0.00")
                end
            end
        end)
        u14.Heartbeat:Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u27
                [3] = u29
            --]]
            if not u32 then
                return nil
            end
            if not u32.isRecording then
                return nil
            end
            local v34 = tick() - u32.damageRecordingStartTime
            u27((string.format("%.2f", v34)))
            local v35 = u32.totalDamage / v34
            u29((string.format("%.2f", v35)))
        end)
    end, {})
    local v36 = {
        ["ResetOnSpawn"] = false
    }
    local v37 = {}
    local v38 = #v37
    local v39 = {
        ["Size"] = UDim2.fromOffset(110, 600),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0.01, u4.isSmallScreen() and 0.43 or 0.5)
    }
    local v40 = {}
    local v41 = u9.createElement(u7, {
        ["MaximumSize"] = Vector2.new(110, 600)
    })
    local v42 = u9.createElement("UIListLayout", {
        ["FillDirection"] = "Vertical",
        ["VerticalAlignment"] = "Center",
        ["HorizontalAlignment"] = "Left",
        ["SortOrder"] = "LayoutOrder",
        ["Padding"] = UDim.new(0, 6)
    })
    local v43 = u9.createElement(u15, {
        ["Text"] = "COMMANDS",
        ["Icon"] = u6.WARNING,
        ["OnClick"] = function() --[[ Name: OnClick, Line 80 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u17
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u17.TRAINING_ROOM_COMMANDS_APP, {})
        end
    })
    local v44
    if v30 then
        v44 = u9.createElement(u15, {
            ["Text"] = "STOP DPS",
            ["Icon"] = u20.SWORD_ICON,
            ["OnClick"] = function() --[[ Name: OnClick, Line 87 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u8
                --]]
                u31(false)
                u8.Controllers.TrainingRoomDpsCounterController:setDpsTrackingEnabled(false)
            end
        })
    else
        v44 = u9.createElement(u15, {
            ["Text"] = "RESTART DPS",
            ["Icon"] = u20.SWORD_ICON,
            ["OnClick"] = function() --[[ Name: OnClick, Line 94 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u8
                --]]
                u31(true)
                u8.Controllers.TrainingRoomDpsCounterController:setDpsTrackingEnabled(true)
            end
        })
    end
    __set_list(v40, 1, {v41, v42, v43, v44})
    local v45 = #v40
    local v46
    if u8.Controllers.MatchController:getQueueType() == u19.CUSTOM_KIT_CREATION then
        v46 = false
    else
        v46 = u9.createElement(u15, {
            ["Text"] = "CHANGE KIT",
            ["Icon"] = u6.HELMET_SOLID,
            ["OnClick"] = function() --[[ Name: OnClick, Line 104 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u17
                    [3] = u16
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u17.KIT_SHOP_APP, {
                    ["ShowAllKits"] = true,
                    ["SelectedKit"] = u16:getState().Bedwars.kit
                })
            end
        })
    end
    if v46 then
        v40[v45 + 1] = v46
    end
    v37[v38 + 1] = u9.createElement(u5, v39, v40)
    v37[v38 + 2] = u9.createElement(u5, {
        ["Size"] = UDim2.fromScale(0.5, 0.25),
        ["AnchorPoint"] = Vector2.new(1, 1),
        ["Position"] = UDim2.fromScale(1, 0.3)
    }, {
        u9.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Right",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 5)
        }),
        u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 15,
            ["Text"] = "Total Damage: " .. string.format("%.2f", not v24 and 0 or v24.totalDamage),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = u18.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = Color3.new(1, 0.23, 0.23)
        }),
        u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 15,
            ["Text"] = "Damage Per Second: " .. v28,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = u18.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = Color3.new(1, 0.23, 0.23)
        }),
        u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 15,
            ["Text"] = "Time: " .. v26,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = u18.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = Color3.new(1, 0.23, 0.23)
        })
    })
    return u9.createElement("ScreenGui", v36, v37)
end)
return {
    ["TrainingRoomHudSide"] = v11.connect(function(_, p48) --[[ Line: 173 ]]
        local v49 = {}
        for v50, v51 in p48 do
            v49[v50] = v51
        end
        return v49
    end)(v47)
}