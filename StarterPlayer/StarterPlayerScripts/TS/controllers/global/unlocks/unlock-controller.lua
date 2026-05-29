local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rewards", "ranked-rewards-meta").rankSkins
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "unlocks", "unlocks-config").UnlocksConfig
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "UnlockController"
    end,
    ["__index"] = u5
})
u15.__index = u15
function u15.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p18)
    p18.Name = "UnlockController"
    p18.allKitsUnlocked = false
    p18.allKitSkinsUnlocked = false
    p18.testerAccessRankedSkins = true
end
function u15.KnitStart(u19) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u4
        [4] = u8
        [5] = u7
    --]]
    u13.Client:WaitFor("KitUpdate"):andThen(function(p20) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
        --]]
        p20:Connect(function(p21) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            if p21.ownedKits then
                u6:dispatch({
                    ["type"] = "AddOwnedKits",
                    ["kits"] = p21.ownedKits
                })
            end
            if p21.ownedKitSkins then
                u6:dispatch({
                    ["type"] = "SetOwnedKitSkins",
                    ["ownedKitSkins"] = p21.ownedKitSkins
                })
            end
            if p21.useKitSkin ~= nil then
                u6:dispatch({
                    ["type"] = "SetUseKitSkin",
                    ["useKitSkin"] = p21.useKitSkin
                })
            end
            if p21.active then
                u6:dispatch({
                    ["type"] = "SetBedwarsKit",
                    ["kit"] = p21.active.kit
                })
            end
            if p21.activeKitSkins then
                u6:dispatch({
                    ["type"] = "SetEquippedKitSkins",
                    ["equippedKitSkins"] = p21.activeKitSkins
                })
            end
        end)
        u13.Client:WaitFor("RequestKitUpdate"):andThen(function(p22) --[[ Line: 74 ]]
            p22:SendToServer()
        end)
    end)
    task.spawn(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u7
            [4] = u19
        --]]
        u4.Controllers.PermissionController:waitForLocalPermissions()
        if u4.Controllers.PermissionController:hasAllKitsUnlocked() and u8(u7.DisableOwningAllKits) ~= true then
            u19.allKitsUnlocked = true
        end
        if u4.Controllers.PermissionController:hasAllKitSkinsUnlocked() then
            u19.allKitSkinsUnlocked = true
        end
    end)
end
function u15.isKitOwned(_, p23) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u6
    --]]
    local v24 = p23 == u9.NONE and true or u10(p23).freeKit
    if not v24 then
        local v25 = u6:getState().Bedwars.ownedKits
        v24 = table.find(v25, p23) ~= nil
    end
    return v24
end
function u15.isKitUnlocked(p26, p27) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u14
    --]]
    return (p27 == u9.NONE or p27 == u9.RANDOM) and true or (p26.allKitsUnlocked and true or (u3.Controllers.KitController:isKitFree(p27) and true or (p26:isKitOwned(p27) and true or (u3.Controllers.KitRentalController:isKitRented(p27) and true or (u14.isFreeKitsEventActive() and true or false)))))
end
function u15.getUnlockedShopKits(p28) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v29 = u11.ShopKits
    if p28.allKitsUnlocked then
        return v29
    end
    local v30 = 0
    local v31 = {}
    for v32, v33 in v29 do
        local _ = v32 - 1
        if p28:isKitUnlocked(v33) == true then
            v30 = v30 + 1
            v31[v30] = v33
        end
    end
    return v31
end
function u15.isKitSkinOwned(_, p34) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v35 = u6:getState().Bedwars.ownedKitSkins
    return table.find(v35, p34) ~= nil
end
function u15.isKitSkinUnlocked(p36, p37) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
    --]]
    local v38 = p36:isKitSkinOwned(p37)
    local v39 = p36.allKitSkinsUnlocked
    local v40 = table.find(u12, p37) ~= nil
    if v40 and not v38 then
        v39 = false
    end
    if v40 then
        local v41 = u4.Controllers.PermissionController:canTesterAccessRankedSkins() and p36.testerAccessRankedSkins and true or v39
        v39 = u4.Controllers.PermissionController:hasPermission("ranked_skins_bypass") and true or v41
    end
    return v38 or v39
end
return {
    ["UnlockController"] = u3.CreateController(u15.new())
}