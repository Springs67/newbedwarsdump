local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.MarketplaceService
local u10 = v8.Players
local u11 = v1.import(script, script.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "LobbyBundleController"
    end,
    ["__index"] = u12
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p26)
    p26.Name = "LobbyBundleController"
end
function u23.KnitStart(u27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u18
        [4] = u6
        [5] = u2
        [6] = u14
    --]]
    u12.KnitStart(u27)
    u3("podium-purchase-prompt-1", function(p28) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u18
        --]]
        u27:setupKitSkinPrompt(p28, u18.CELESTIAL_WIND_WALKER, {
            ["MaxActivationDistance"] = 12
        })
    end)
    u3("podium-purchase-prompt-2", function(p29) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u14
        --]]
        u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "OPEN",
            ["ObjectText"] = "STORE",
            ["HoldDuration"] = 0,
            ["MaxActivationDistance"] = 12,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = p29
        }).Triggered:Connect(function(_) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u14
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.STORE_MENU_APP, {
                ["AppId"] = u14.STORE_MENU_APP
            })
        end)
    end)
end
function u23.setupLobbyBundlePrompt(_, p30, u31, u32) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u2
        [4] = u14
        [5] = u9
    --]]
    local u33 = u17[u31]
    local v34 = u6.Controllers.ProximityPromptController
    local v35 = {}
    local v36
    if u32 == nil then
        v36 = u32
    else
        v36 = u32.giftOnly
    end
    v35.ActionText = v36 and "Gift" or "Purchase"
    v35.ObjectText = u33.name
    v35.HoldDuration = 0
    local v37
    if u32 == nil then
        v37 = u32
    else
        v37 = u32.maxActivationDistance
    end
    v35.MaxActivationDistance = v37 == nil and 12 or v37
    v35.RequiresLineOfSight = false
    local v38
    if u32 == nil then
        v38 = u32
    else
        v38 = u32.promptConfig
    end
    if type(v38) == "table" then
        for v39, v40 in v38 do
            v35[v39] = v40
        end
    end
    v35.Parent = p30
    v34:createProximityPrompt(v35).Triggered:Connect(function(p41) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u32
            [3] = u2
            [4] = u14
            [5] = u33
            [6] = u9
        --]]
        local v42 = p41:GetAttribute("Purchased" .. u31)
        if not v42 then
            v42 = u32
            if v42 ~= nil then
                v42 = v42.giftOnly
            end
        end
        if v42 then
            local v43 = {
                ["GiftType"] = u31
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.GIFTING, v43)
            return
        else
            local v44 = u33.gamepassId
            if v44 == 0 or (v44 ~= v44 or not v44) then
                local v45 = u33.devProductId
                if v45 ~= 0 and (v45 == v45 and v45) then
                    u9:PromptProductPurchase(p41, u33.devProductId)
                end
            else
                u9:PromptGamePassPurchase(p41, u33.gamepassId)
            end
        end
    end)
end
function u23.setupBattlePassPrompt(_, p46, p47) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u15
        [3] = u16
        [4] = u13
        [5] = u2
        [6] = u14
        [7] = u21
        [8] = u9
    --]]
    local v48 = u6.Controllers.ProximityPromptController
    local v49 = {
        ["ActionText"] = "Purchase"
    }
    local v50 = u15(u16.BATTLE_PASS_SEASON).name
    v49.ObjectText = v50 == nil and "Battle Pass" or v50
    v49.HoldDuration = 0
    v49.MaxActivationDistance = 24
    v49.RequiresLineOfSight = false
    if type(p47) == "table" then
        for v51, v52 in p47 do
            v49[v51] = v52
        end
    end
    v49.Parent = p46
    v48:createProximityPrompt(v49).Triggered:Connect(function(p53) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u14
            [4] = u21
            [5] = u9
            [6] = u16
        --]]
        if u13:getState().BattlePass.paid then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.GIFTING, {
                ["GiftType"] = u21.BattlePass
            })
        else
            u9:PromptGamePassPurchase(p53, u16.BATTLE_PASS_SEASON_GAMEPASS)
        end
    end)
end
function u23.setupKitPrompt(_, p54, u55, p56) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u14
        [6] = u9
    --]]
    local u57 = u20(u55)
    local v58 = u6.Controllers.ProximityPromptController
    local v59 = {
        ["ActionText"] = "Purchase",
        ["HoldDuration"] = 0,
        ["MaxActivationDistance"] = 18,
        ["RequiresLineOfSight"] = false,
        ["ObjectText"] = u57.name .. " Kit"
    }
    if type(p56) == "table" then
        for v60, v61 in p56 do
            v59[v60] = v61
        end
    end
    v59.Parent = p54
    v58:createProximityPrompt(v59).Triggered:Connect(function(p62) --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u55
            [3] = u2
            [4] = u14
            [5] = u57
            [6] = u9
        --]]
        if u5.Controllers.UnlockController:isKitOwned(u55) then
            local v63 = {
                ["GiftType"] = u55
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.GIFTING, v63)
        else
            local v64 = u57.gamepassId
            if v64 ~= 0 and (v64 == v64 and v64) then
                u9:PromptGamePassPurchase(p62, u57.gamepassId)
            end
        end
    end)
end
function u23.setupKitSkinPrompt(_, p65, u66, p67) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
        [3] = u13
        [4] = u2
        [5] = u14
        [6] = u7
        [7] = u11
    --]]
    local u68 = u19[u66]
    local v69 = u6.Controllers.ProximityPromptController
    local v70 = {
        ["ActionText"] = "Purchase",
        ["HoldDuration"] = 0,
        ["MaxActivationDistance"] = 24,
        ["RequiresLineOfSight"] = false,
        ["ObjectText"] = u68.name
    }
    if type(p67) == "table" then
        for v71, v72 in p67 do
            v70[v71] = v72
        end
    end
    v70.Parent = p65
    v69:createProximityPrompt(v70).Triggered:Connect(function(_) --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u66
            [3] = u2
            [4] = u14
            [5] = u7
            [6] = u11
            [7] = u68
            [8] = u6
        --]]
        local v73 = nil
        for v74, v75 in u13:getState().Bedwars.ownedKitSkins do
            local _ = v74 - 1
            if v75 == u66 == true then
                v73 = v75
                break
            end
        end
        if v73 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.GIFTING, {
                ["GiftType"] = u66,
                ["CustomImage"] = u7.createElement(u11, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Kit"] = u68.kit,
                    ["Skin"] = u66,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
            })
        elseif u68.kit then
            u6.Controllers.KitSkinController:purchaseKitSkin(u66, u68.kit)
        end
    end)
end
function u23.setupMilestonePrompt(_, p76, p77, p78) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u2
        [4] = u14
    --]]
    local v79 = nil
    for v80, v81 in u22 do
        local _ = v80 - 1
        if v81.id == p77 == true then
            v79 = v81
            break
        end
    end
    local v82 = u6.Controllers.ProximityPromptController
    local v83 = {
        ["ActionText"] = "Open Milestones App",
        ["HoldDuration"] = 0,
        ["MaxActivationDistance"] = 18,
        ["RequiresLineOfSight"] = false,
        ["ObjectText"] = not v79 and "Free Reward" or v79.description
    }
    if type(p78) == "table" then
        for v84, v85 in p78 do
            v83[v84] = v85
        end
    end
    v83.Parent = p76
    v82:createProximityPrompt(v83).Triggered:Connect(function(_) --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.MILESTONES, {})
    end)
end
function u23.purchaseBundle(_, p86) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u10
    --]]
    local v87 = u17[p86]
    local v88 = v87.gamepassId
    if v88 == 0 or (v88 ~= v88 or not v88) then
        local v89 = v87.devProductId
        if v89 ~= 0 and (v89 == v89 and v89) then
            u9:PromptProductPurchase(u10.LocalPlayer, v87.devProductId)
        end
    else
        u9:PromptGamePassPurchase(u10.LocalPlayer, v87.gamepassId)
    end
end
u5.CreateController(u23.new())
return nil