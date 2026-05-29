local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.Workspace
local u12 = u1.import(script, script.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local v17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit")
local u18 = v17.AngelKitUtil
local u19 = v17.AngelType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "LobbyKitDisplayComponent"
    end
})
u24.__index = u24
function u24.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, u28) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u15
        [3] = u16
        [4] = u4
        [5] = u9
        [6] = u2
        [7] = u12
        [8] = u1
        [9] = u10
        [10] = u13
        [11] = u22
        [12] = u23
        [13] = u14
        [14] = u19
        [15] = u18
        [16] = u21
        [17] = u5
        [18] = u20
        [19] = u3
        [20] = u11
        [21] = u8
    --]]
    p27.maid = u6.new()
    if u28:IsA("BasePart") then
        u28.Transparency = 1
    end
    local u29 = u28:GetAttribute("Kit")
    local u30 = u15(u29)
    local u31 = table.find(u16.BattlePassPodiumKits, u29) ~= nil
    u4.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 11,
        ["HoldDuration"] = 0,
        ["ActionText"] = u30.name,
        ["ObjectText"] = u31 and "View Battle Pass" or "View Kit",
        ["Parent"] = u28
    }).Triggered:Connect(function(p32) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u31
            [3] = u2
            [4] = u12
            [5] = u29
        --]]
        if p32 == u9.LocalPlayer then
            if u31 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.BATTLEPASS, {})
                return
            end
            local v33 = {
                ["SelectedKit"] = u29
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.KIT_DETAILS_APP, v33)
        end
    end)
    u1.Promise.defer(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u29
            [3] = u30
            [4] = u10
            [5] = u13
            [6] = u22
            [7] = u23
            [8] = u14
            [9] = u19
            [10] = u18
            [11] = u21
            [12] = u5
            [13] = u20
            [14] = u4
            [15] = u3
            [16] = u11
            [17] = u8
        --]]
        local u34 = u28:WaitForChild(u29)
        local v35 = u30.previewLobbyDisplayConfig
        if v35 ~= nil then
            v35 = v35.armorSet
        end
        local v36 = u10:FindFirstChild("Assets")
        if v36 ~= nil then
            v36 = v36:FindFirstChild("Armor")
        end
        local v37
        if v35 == nil then
            v37 = nil
        else
            v37 = u13[v35]
        end
        if v36 and v37 then
            for _, v38 in v37 do
                local v39 = v36:FindFirstChild(v38)
                if v39 then
                    for _, v40 in v39:GetChildren() do
                        if v40:IsA("Accessory") then
                            u22:addAccessory(u34, v40:Clone())
                        end
                    end
                end
            end
        end
        local v41 = u30
        if v41 ~= nil then
            v41 = v41.kitItems
        end
        if v41 ~= nil then
            for _, v42 in v41 do
                if v42.previewOnLobbyDisplayModel then
                    local v43 = u10:FindFirstChild("Items")
                    if v43 ~= nil then
                        v43 = v43:FindFirstChild(v42.itemType)
                        if v43 ~= nil then
                            v43 = v43:Clone()
                        end
                    end
                    if v43 then
                        v43.Parent = u34
                    end
                end
            end
            u23:weldCharacterAccessories(u34)
        end
        if u29 == u14.ANGEL then
            task.defer(function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u18
                    [3] = u34
                --]]
                local v44 = true
                while true do
                    local v45
                    if v44 then
                        v45 = u19.LIGHT
                    else
                        v45 = u19.VOID
                    end
                    u18.changeAngelAppearance(u34, v45)
                    local v46 = task.wait(3)
                    if v46 == 0 or (v46 ~= v46 or not v46) then
                        return
                    end
                    v44 = not v44
                end
            end)
            return
        end
        if u29 == u14.BARBARIAN then
            u21.updateAppearance(u34, u21.FULL_RAGE)
            return
        end
        if u29 == u14.AXOLOTL then
            for _, v47 in u5.values(u20) do
                u4.Controllers.AxolotlController:createClientOnlyAxolotlData(u34, v47)
            end
            return
        end
        if u29 == u14.CYBER then
            local v48 = false
            local v49 = 0
            local v50 = {
                Vector3.new(2, 3, 2),
                Vector3.new(-2.5, 5, -2),
                Vector3.new(2, 1, -3.4),
                Vector3.new(-2.9, -1.3, 2.4)
            }
            while true do
                if true then
                    if v48 then
                        v49 = v49 + 1
                    else
                        v48 = true
                    end
                end
                if v49 >= #v50 then
                    break
                end
                local v51 = v50[v49 + 1]
                local v52 = u10.Assets:WaitForChild("Projectiles"):WaitForChild("drone"):Clone()
                local v53 = v52:FindFirstChild("Humanoid")
                if v53 ~= nil then
                    v53:Destroy()
                end
                for _, v54 in v52:GetDescendants() do
                    if v54:IsA("BasePart") then
                        v54.Anchored = true
                        v54.CanCollide = false
                        v54.CastShadow = false
                        u3:setQueryIgnored(v54, true)
                    end
                end
                v52:PivotTo(u34:GetPrimaryPartCFrame() + v51)
                v52.Parent = u11
                u8:AddTag(v52, "LobbyDrone")
            end
        end
    end)
end
function u24.Destroy(p55) --[[ Line: 173 ]]
    p55.maid:DoCleaning()
end
u24.Tag = "LobbyKitDisplayComponent"
return u24