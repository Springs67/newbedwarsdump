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
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["WizardAbilityButton"] = v8.new(u7)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u7
            [4] = u5
            [5] = u6
            [6] = u2
            [7] = u9
            [8] = u10
            [9] = u13
            [10] = u4
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18, u19 = v16(0)
        local v20, u21 = v16(false)
        local u22 = u11[u14.ability].cooldown
        if u22 ~= nil then
            u22 = u22.id
        end
        local v23 = u14.activeAbility == u14.ability and true or u14.extra
        local v24 = false
        local v25 = 0
        local v26 = {}
        while true do
            if v24 then
                v25 = v25 + 1
            else
                v24 = true
            end
            local v27 = u12:getAbilityCost(u14.ability)
            if v25 >= (v27 == nil and 0 or v27) then
                v17(function() --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u22
                        [3] = u6
                        [4] = u2
                        [5] = u19
                        [6] = u21
                        [7] = u9
                    --]]
                    if u5.isHoarceKat() then
                        return nil
                    end
                    if u22 == "" or not u22 then
                        return nil
                    end
                    local u28 = u6.new()
                    local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u22)
                    if v29 then
                        u19(v29.expire)
                        u21(true)
                    end
                    u28:GiveTask(u9.CooldownStarted:connect(function(p30) --[[ Line: 81 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u2
                            [3] = u19
                            [4] = u21
                        --]]
                        if p30.cooldownId ~= u22 then
                            return nil
                        end
                        local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u22)
                        if v31 ~= nil then
                            v31 = v31.expire
                        end
                        if v31 ~= 0 and (v31 == v31 and v31) then
                            u19(v31)
                        end
                        u21(true)
                    end))
                    u28:GiveTask(u9.CooldownExpired:connect(function(p32) --[[ Line: 95 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u21
                            [3] = u19
                        --]]
                        if p32.cooldownId ~= u22 then
                            return nil
                        end
                        u21(false)
                        u19(0)
                    end))
                    return function() --[[ Line: 102 ]]
                        --[[
                        Upvalues:
                            [1] = u28
                        --]]
                        u28:DoCleaning()
                    end
                end, {})
                local v33 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v34 = { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 0.8
                    }) }
                local v35 = #v34
                local v37 = {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                    ["BackgroundTransparency"] = v23 and 0.8 or 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    [u7.Event.Activated] = function(_, p36) --[[ Line: 125 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u10
                            [3] = u2
                        --]]
                        if not u14.extra then
                            u14.ChangeAbility(u14.ability)
                        end
                        if u14.ability == u10.SHOCKWAVE then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u10.SHOCKWAVE, p36, {
                                ["target"] = Vector3.new()
                            })
                        end
                    end
                }
                local v38 = { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }) }
                local _ = #v38
                local v39 = {
                    ["Size"] = UDim2.fromScale(0.9, 0.9),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v40 = u12:getAbilityImage(u14.ability)
                if v40 == nil then
                    v40 = u13.WIZARD_LIGHTNING_STRIKE
                end
                v39.Image = v40
                v39.ImageColor3 = Color3.fromHex("C0E8FF")
                v39.ImageTransparency = v23 and not v20 and 0 or 0.5
                v39.ScaleType = "Fit"
                v39.BorderSizePixel = 0
                v39.BackgroundTransparency = 1
                v39.LayoutOrder = 1
                v38.AbilityIcon = u7.createElement("ImageLabel", v39, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                v34.AbilityButton = u7.createElement("ImageButton", v37, v38)
                if v18 > 0 then
                    if v20 then
                        v20 = u7.createElement(u4, {
                            ["UseOsClock"] = true,
                            ["OnCompleteText"] = "",
                            ["EndTime"] = v18,
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
                    v20 = false
                end
                if v20 then
                    v34[v35 + 1] = v20
                end
                local _ = #v34
                local v41 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Position"] = UDim2.fromScale(0.5, -0.05),
                    ["AnchorPoint"] = Vector2.new(0.5, 0)
                }
                local v42 = { u7.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0.1, 0)
                    }) }
                local v43 = #v42
                for v44, v45 in v26 do
                    v42[v43 + v44] = v45
                end
                v34.ManaRequirementWrapper = u7.createElement("Frame", v41, v42)
                return u7.createFragment({
                    ["AbilityButtonContainer"] = u7.createElement("Frame", v33, v34)
                })
            end
            local v46 = u7.createFragment({
                ["ManaCircle"] = u7.createElement("ImageLabel", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0,
                    ["Size"] = UDim2.fromScale(0.2, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(0, 255, 238)
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 10)
                    }), u7.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Transparency"] = 0,
                        ["Color"] = Color3.fromRGB(0, 48, 66)
                    }) })
            })
            table.insert(v26, v46)
        end
    end)
}