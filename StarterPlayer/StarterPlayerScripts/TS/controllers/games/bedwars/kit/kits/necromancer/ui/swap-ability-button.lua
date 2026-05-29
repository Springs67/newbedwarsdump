local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Countdown
local u5 = v3.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "necromancer", "necromancer-kit-util").NecromancerSummonType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["SwapButton"] = v8.new(u7)(function(u14, p15) --[[ Line: 15 ]]
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
            [9] = u13
            [10] = u4
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18, u19 = v16(0)
        local v20, u21 = v16(false)
        local u22 = u11[u10.NECROMANCER_SWAP].cooldown
        if u22 ~= nil then
            u22 = u22.id
        end
        local v23 = u14.activeMode == u14.buttonMode and true or u14.extra
        local v24 = {}
        v17(function() --[[ Line: 27 ]]
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
            local u25 = u6.new()
            local v26 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u22)
            if v26 then
                u19(v26.expire)
                u21(true)
            end
            u25:GiveTask(u9.CooldownStarted:connect(function(p27) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u2
                    [3] = u19
                    [4] = u21
                --]]
                if p27.cooldownId ~= u22 then
                    return nil
                end
                local v28 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u22)
                if v28 ~= nil then
                    v28 = v28.expire
                end
                if v28 ~= 0 and (v28 == v28 and v28) then
                    u19(v28)
                end
                u21(true)
            end))
            u25:GiveTask(u9.CooldownExpired:connect(function(p29) --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u21
                    [3] = u19
                --]]
                if p29.cooldownId ~= u22 then
                    return nil
                end
                u21(false)
                u19(0)
            end))
            return function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end, {})
        local v30 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v31 = { (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.8
            })) }
        local v32 = u7.createElement
        local v33 = "ImageButton"
        local v34 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BackgroundTransparency"] = v23 and 0.8 or 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            [u7.Event.Activated] = function(_, _) --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14.ChangeAbility(u14.buttonMode)
            end
        }
        local v35 = { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), (u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })) }
        local v36 = u7.createElement
        local v37 = "ImageLabel"
        local v38 = {
            ["ScaleType"] = "Fit",
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v39
        if u14.buttonMode == u12.MELEE then
            v39 = u13.SWORD_ICON
        else
            v39 = u13.BOW_ARROW_ICON_SOLID
        end
        v38.Image = v39
        v38.ImageColor3 = Color3.fromHex("C0E8FF")
        v38.ImageTransparency = v23 and not v20 and 0 or 0.5
        v35.AbilityIcon = v36(v37, v38, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v31.AbilityButton = v32(v33, v34, v35)
        local v40 = #v31
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
            v31[v40 + 1] = v20
        end
        local _ = #v31
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
        for v44, v45 in v24 do
            v42[v43 + v44] = v45
        end
        v31.ManaRequirementWrapper = u7.createElement("Frame", v41, v42)
        return u7.createFragment({
            ["AbilityButtonContainer"] = u7.createElement("Frame", v30, v31)
        })
    end)
}