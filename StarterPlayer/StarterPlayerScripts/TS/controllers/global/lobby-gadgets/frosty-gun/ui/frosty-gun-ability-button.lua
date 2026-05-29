local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Countdown
local u5 = v3.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyGunMode
return {
    ["FrostyGunButton"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u5
            [4] = u6
            [5] = u2
            [6] = u9
            [7] = u7
            [8] = u12
            [9] = u4
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(0)
        local v19, u20 = v15(false)
        local u21 = u11[u10.FROSTY_GUN_SWAP].cooldown
        if u21 ~= nil then
            u21 = u21.id
        end
        local v22 = u13.activeMode == u13.buttonMode and true or u13.extra
        local v23 = {}
        v16(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u21
                [3] = u6
                [4] = u2
                [5] = u18
                [6] = u20
                [7] = u9
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            if u21 == "" or not u21 then
                return nil
            end
            local u24 = u6.new()
            local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u21)
            if v25 then
                u18(v25.expire)
                u20(true)
            end
            u24:GiveTask(u9.CooldownStarted:connect(function(p26) --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u2
                    [3] = u18
                    [4] = u20
                --]]
                if p26.cooldownId ~= u21 then
                    return nil
                end
                local v27 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u21)
                if v27 ~= nil then
                    v27 = v27.expire
                end
                if v27 ~= 0 and (v27 == v27 and v27) then
                    u18(v27)
                end
                u20(true)
            end))
            u24:GiveTask(u9.CooldownExpired:connect(function(p28) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u20
                    [3] = u18
                --]]
                if p28.cooldownId ~= u21 then
                    return nil
                end
                u20(false)
                u18(0)
            end))
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end
        end, {})
        local v29 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v30 = { (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.8
            })) }
        local v31 = u7.createElement
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BackgroundTransparency"] = v22 and 0.8 or 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            [u7.Event.Activated] = function(_, _) --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13.ChangeAbility(u13.buttonMode)
            end
        }
        local v33 = {
            u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }),
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            ["AbilityIcon"] = u7.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u13.buttonMode == u12.MIST and "rbxassetid://11611911951" or "rbxassetid://139613766654382",
                ["ImageColor3"] = Color3.fromHex("C0E8FF"),
                ["ImageTransparency"] = v22 and not v19 and 0 or 0.5
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        v30.AbilityButton = v31("ImageButton", v32, v33)
        local v34 = #v30
        if v17 > 0 then
            if v19 then
                v19 = u7.createElement(u4, {
                    ["UseOsClock"] = true,
                    ["OnCompleteText"] = "",
                    ["EndTime"] = v17,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false,
                        ["minutes"] = false,
                        ["seconds"] = true,
                        ["disablePadding"] = true,
                        ["decimalPoints"] = 1,
                        ["seperator"] = ""
                    },
                    ["TextLabel"] = {
                        ["Size"] = UDim2.fromScale(0.8, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center
                    }
                })
            end
        else
            v19 = false
        end
        if v19 then
            v30[v34 + 1] = v19
        end
        local _ = #v30
        local v35 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.fromScale(0.5, -0.05),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v36 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.1, 0)
            }) }
        local v37 = #v36
        for v38, v39 in v23 do
            v36[v37 + v38] = v39
        end
        v30.ManaRequirementWrapper = u7.createElement("Frame", v35, v36)
        return u7.createFragment({
            ["AbilityButtonContainer"] = u7.createElement("Frame", v29, v30)
        })
    end)
}