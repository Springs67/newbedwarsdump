local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameCoreClientSyncEvents
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller").InteractionCategory
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "TeamUpgradeController"
    end,
    ["__index"] = u13
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
    --]]
    u13.constructor(p21)
    p21.Name = "TeamUpgradeController"
    p21.currentUpgrades = {}
    p21.requestPurchaseTeamUpgradeRemote = u16.Client:Get("RequestPurchaseTeamUpgrade")
end
function u18.KnitStart(u22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u17
        [4] = u16
        [5] = u14
        [6] = u9
        [7] = u10
        [8] = u4
        [9] = u12
        [10] = u11
        [11] = u2
        [12] = u15
        [13] = u5
    --]]
    u13.KnitStart(u22)
    u8.Controllers.PreloadController:runPreload({
        ["sounds"] = { u17.TEAM_UPGRADE_PURCHASE }
    })
    u16.Client:OnEvent("BulkUpdateTeamUpgrades", function(p23) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u14
        --]]
        u22.currentUpgrades = p23
        u14:dispatch({
            ["type"] = "SetMyTeamUpgrades",
            ["myTeamUpgrades"] = p23
        })
    end)
    u16.Client:OnEvent("TeamUpgradePurchased", function(p24, p25) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u22
            [4] = u14
        --]]
        local v26 = u9.Controllers.TeamController:getPlayerTeam(u10.LocalPlayer)
        if v26 ~= nil then
            v26 = v26.id
        end
        if p24 == v26 then
            u22.currentUpgrades = p25
            u14:dispatch({
                ["type"] = "SetMyTeamUpgrades",
                ["myTeamUpgrades"] = p25
            })
        end
        u14:dispatch({
            ["type"] = "BedwarsSetTeamUpgrades",
            ["teamId"] = p24,
            ["teamUpgrades"] = p25
        })
    end)
    u8.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Upgrade Shop",
        ["interactionObjectText"] = "Open",
        ["interactionTag"] = "TeamUpgradeShopkeeper",
        ["instantActivation"] = true,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["category"] = u12.OTHER,
        ["onInteracted"] = function(p27, p28, _, _) --[[ Name: onInteracted, Line 80 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u9
                [3] = u16
                [4] = u2
                [5] = u15
            --]]
            u11.TeamUpgradeOpened:fire()
            local v29 = p28:GetAttribute("GeneratorTeam")
            local v30 = u9.Controllers.TeamController:getPlayerTeam(p27)
            if v30 ~= nil then
                v30 = v30.id
            end
            local v31
            if v30 == "" or (not v30 or v30 ~= v29) then
                v31 = false
            else
                v31 = true
                local v32 = u9.Controllers.ChestItemDisplayController:getTeamCrate()
                if v32 ~= nil then
                    v32 = v32:FindFirstChild("ChestFolderValue")
                end
                if v32 then
                    local v33 = v32.Value
                    if v33 then
                        u16.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(v33)
                    end
                end
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u15.TEAM_UPGRADE, {
                ["TeamId"] = v29,
                ["IsHomeBase"] = v31
            })
        end
    })
    u5.AppClose:connect(function(p34) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
        --]]
        if p34.appId ~= u15.TEAM_UPGRADE then
            return nil
        end
        u16.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
    end)
end
function u18.requestPurchaseTeamUpgrade(p35, p36) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u17
    --]]
    local v37 = p35.requestPurchaseTeamUpgradeRemote:CallServer(p36)
    if v37 then
        u6:playSound(u17.BEDWARS_UPGRADE_SUCCESS)
    end
    return v37
end
function u18.getCurrentTeamUpgrades(p38) --[[ Line: 129 ]]
    return p38.currentUpgrades
end
u8.CreateController(u18.new())
return nil