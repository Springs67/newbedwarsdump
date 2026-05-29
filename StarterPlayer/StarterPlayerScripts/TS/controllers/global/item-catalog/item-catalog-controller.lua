local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = v1.import(script, script.Parent, "ui", "item-catalog-popup").ItemCatalogPopup
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "ItemCatalogController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "ItemCatalogController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u9
        [4] = u3
        [5] = u8
        [6] = u2
        [7] = u5
        [8] = u10
    --]]
    u6.KnitStart(p15)
    u7.Client:Get("ItemCatalogDiscovery"):Connect(function(p16, p17) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u8
            [4] = u2
            [5] = u5
            [6] = u10
        --]]
        if u9.isLobbyServer() then
            return nil
        end
        u3:playSound(u8.CATALOG_DISCOVERY)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("ItemCatalogPopup")
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TierUpgradeNotificationPopup")
        local u18 = u5.LocalPlayer:FindFirstChild("PlayerGui")
        if u18 ~= nil then
            u18 = u18:FindFirstChild("NotificationApp")
        end
        if u18 then
            u18.Enabled = false
        end
        local v19 = {
            ["appId"] = "ItemCatalogPopup",
            ["app"] = u10
        }
        local v20 = {
            ["itemType"] = p16,
            ["closeMenu"] = function() --[[ Name: closeMenu, Line 54 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u18
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("ItemCatalogPopup")
                if u18 then
                    u18.Enabled = true
                end
            end,
            ["collectionProgress"] = p17
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v19, v20)
    end)
end
v4.CreateController(u11.new())
return nil