local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ComponentUtil
local u6 = v4.UILayers
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContextActionService
local u11 = v9.Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "creative-id-billboard-component").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, script.Parent, "creative", "ui", "creative-inventory").CreativeInventory
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "GamemodeController"
    end,
    ["__index"] = u14
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
        [1] = u14
        [2] = u21
        [3] = u18
        [4] = u8
    --]]
    u14.constructor(p26)
    p26.Name = "GamemodeController"
    p26.gamemodeRemotes = u21.Client:GetNamespace("Gamemode")
    p26.currGamemode = u18.PVP
    p26.creativeAbilityMaid = u8.new()
end
function u23.KnitStart(u27) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u10
        [4] = u2
        [5] = u16
        [6] = u19
        [7] = u5
        [8] = u17
        [9] = u12
        [10] = u11
        [11] = u13
        [12] = u3
        [13] = u20
    --]]
    u14.KnitStart(u27)
    u27.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p28) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u18
            [3] = u10
            [4] = u2
            [5] = u16
            [6] = u19
            [7] = u5
            [8] = u17
        --]]
        u27.currGamemode = p28.gamemode
        if p28.gamemode == u18.CREATIVE then
            u10:BindActionAtPriority("creative-inventory-toggle", function(_, p29, _) --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                if p29 == Enum.UserInputState.Begin then
                    u27:toggleCreativeInventory()
                end
            end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.C)
            local v30 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v31 = u16.BLOCK_PICKER
            local v32 = {
                ["abilityType"] = "ItemPrimary",
                ["abilityButton"] = {
                    ["icon"] = u19.ORE_BLOCK
                }
            }
            local u33 = v30:enableAbility(v31, v32):expect()
            u27.creativeAbilityMaid:GiveTask(function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33.Destroy()
            end)
            for v34, v35 in u5:getAllComponents(u17) do
                local _ = v34 - 1
                v35:displayBillboard()
            end
        else
            u10:UnbindAction("creative-inventory-toggle")
            u27.creativeAbilityMaid:DoCleaning()
            for v36, v37 in u5:getAllComponents(u17) do
                local _ = v36 - 1
                v37:removeBillboard()
            end
        end
    end)
    u12.AbilityUsed:connect(function(p38) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u11
            [3] = u13
            [4] = u3
            [5] = u20
            [6] = u27
            [7] = u2
        --]]
        if p38.ability ~= u16.BLOCK_PICKER then
            return nil
        end
        if p38.userCharacter ~= u11.LocalPlayer.Character then
            return nil
        end
        local v39 = u13:getBlockSelector():getMouseInfo(u3.SELECT)
        if v39 ~= nil then
            v39 = v39.target
        end
        if not v39 then
            return nil
        end
        local u40 = v39.blockInstance.Name
        local v41 = u20(u40)
        if not (v41 and v41.block) then
            return nil
        end
        task.spawn(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u40
                [3] = u2
            --]]
            if u27:requestCreativeItem(u40) then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    ["message"] = "Picked a block of <b>" .. u40 .. "</b>."
                })
            end
        end)
    end)
end
function u23.toggleCreativeInventory(p42) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u2
        [3] = u15
        [4] = u22
        [5] = u6
    --]]
    if p42:getLocalPlayerGamemode() == u18.CREATIVE then
        local v43 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        if v43:isAppOpen("CreativeInventory") then
            v43:closeApp("CreativeInventory")
        else
            v43:closeApp(u15.INVENTORY)
            v43:openApp({
                ["appId"] = "CreativeInventory",
                ["app"] = u22,
                ["layer"] = u6.MAIN
            }, {
                ["AppId"] = "CreativeInventory"
            })
        end
    else
        return nil
    end
end
function u23.requestCreativeItem(p44, p45) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p44.currGamemode == u18.CREATIVE then
        return p44.gamemodeRemotes:Get("RequestCreativeItem"):CallServer(p45)
    else
        return false
    end
end
function u23.getLocalPlayerGamemode(p46) --[[ Line: 143 ]]
    return p46.currGamemode
end
function u23.isLocalPlayerInCreativeMode(p47) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return p47.currGamemode == u18.CREATIVE
end
function u23.isLocalPlayerInPVPMode(p48) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return p48.currGamemode == u18.PVP
end
v7.CreateController(u23.new())
return nil