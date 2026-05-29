local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BattlePassPurchaseButtons"] = v8.new(u7)(function(p15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u13
            [3] = u12
            [4] = u7
            [5] = u4
            [6] = u6
            [7] = u14
            [8] = u2
            [9] = u9
            [10] = u11
            [11] = u5
        --]]
        local _ = p16.useState
        local v17 = {}
        for v18, v19 in p15 do
            v17[v18] = v19
        end
        v17.store = nil
        v17.battlepass = nil
        local v20 = u10[p15.battlepass]
        local function v41(p21, p22) --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            local v23 = p22.emote
            if not v23 then
                local v24 = p22.comingSoon
                if v24 ~= nil then
                    v24 = v24.rewardDisplayType
                end
                v23 = v24 == u13.EMOTE
            end
            if v23 then
                local v25 = u12[p22.emote]
                if v25 and not v25.animation then
                    p21.imageEmotes = p21.imageEmotes + 1
                    return p21
                else
                    p21.animatedEmotes = p21.animatedEmotes + 1
                    return p21
                end
            else
                local v26 = p22.killEffect
                if not v26 then
                    local v27 = p22.comingSoon
                    if v27 ~= nil then
                        v27 = v27.rewardDisplayType
                    end
                    v26 = v27 == u13.KILL_EFFECT
                end
                if v26 then
                    p21.killEffects = p21.killEffects + 1
                    return p21
                end
                local v28 = p22.kit
                if not v28 then
                    local v29 = p22.comingSoon
                    if v29 ~= nil then
                        v29 = v29.rewardDisplayType
                    end
                    v28 = v29 == u13.KIT
                end
                if v28 then
                    p21.kits = p21.kits + 1
                    return p21
                end
                local v30 = p22.kitSkin
                if not v30 then
                    local v31 = p22.comingSoon
                    if v31 ~= nil then
                        v31 = v31.rewardDisplayType
                    end
                    v30 = v31 == u13.KIT_SKIN
                end
                if v30 then
                    p21.kitSkins = p21.kitSkins + 1
                    return p21
                end
                local v32 = p22.lobbyGadget
                if not v32 then
                    local v33 = p22.comingSoon
                    if v33 ~= nil then
                        v33 = v33.rewardDisplayType
                    end
                    v32 = v33 == u13.LOBBY_GADGET
                end
                if v32 then
                    p21.lobbyGadgets = p21.lobbyGadgets + 1
                    return p21
                end
                if p22.title then
                    p21.titles = p21.titles + 1
                    return p21
                end
                local v34 = p22.bedBreakEffect
                if not v34 then
                    local v35 = p22.comingSoon
                    if v35 ~= nil then
                        v35 = v35.rewardDisplayType
                    end
                    v34 = v35 == u13.BED_BREAK_EFFECT
                end
                if v34 then
                    p21.bedBreakEffects = p21.bedBreakEffects + 1
                    return p21
                end
                local v36 = p22.winEffect
                if not v36 then
                    local v37 = p22.comingSoon
                    if v37 ~= nil then
                        v37 = v37.rewardDisplayType
                    end
                    v36 = v37 == u13.WIN_EFFECT
                end
                if v36 then
                    p21.winEffects = p21.winEffects + 1
                    return p21
                end
                local v38 = p22.bedCoins
                if v38 ~= 0 and (v38 == v38 and v38) then
                    local v39 = p22.bedCoins
                    local v40 = v39 == nil and 0 or v39
                    p21.bedCoins = p21.bedCoins + v40
                end
                return p21
            end
        end
        local v42 = {
            ["titles"] = 0,
            ["killEffects"] = 0,
            ["bedBreakEffects"] = 0,
            ["winEffects"] = 0,
            ["imageEmotes"] = 0,
            ["animatedEmotes"] = 0,
            ["kitSkins"] = 0,
            ["kits"] = 0,
            ["lobbyGadgets"] = 0,
            ["bedCoins"] = 0
        }
        for v43 = 1, #v20 do
            v42 = v41(v42, v20[v43], v43 - 1, v20)
        end
        local v44 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = p15.Size
        }
        for v45, v46 in v17 do
            v44[v45] = v46
        end
        local v47 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v48 = #v47
        local v49 = not p15.store.BattlePass.paid
        if v49 then
            v49 = u7.createElement(u4, {
                ["Text"] = "\240\159\142\159\239\184\143  BUY BATTLE PASS",
                ["TextSize"] = 18,
                ["Size"] = UDim2.new(1, 0, 0, 32),
                ["OnClick"] = function() --[[ Name: OnClick, Line 166 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                    --]]
                    u6.Controllers.BattlePassController:promptBattlePassPurchase()
                end,
                ["CornerRadius"] = UDim.new(0, 5),
                ["BackgroundColor3"] = u14.backgroundSuccess
            })
        end
        if v49 then
            v47[v48 + 1] = v49
        end
        v47[#v47 + 1] = u7.createElement(u4, {
            ["Text"] = "\240\159\142\129  GIFT BATTLE PASS",
            ["TextSize"] = 18,
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["OnClick"] = function() --[[ Name: OnClick, Line 180 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u9
                    [3] = u11
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u9.GIFTING, {
                    ["GiftType"] = u11.BattlePass
                })
            end,
            ["CornerRadius"] = UDim.new(0, 5),
            ["BackgroundColor3"] = u5.hexColor(13934614)
        })
        return u7.createFragment({
            ["BattlePassPurchaseButtons"] = u7.createElement("Frame", v44, v47)
        })
    end)
}