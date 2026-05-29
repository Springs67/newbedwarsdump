local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCollectionTag
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "ChestController"
    end,
    ["__index"] = u12
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p23)
    p23.Name = "ChestController"
end
function u20.KnitStart(u24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u16
        [4] = u8
        [5] = u5
        [6] = u17
        [7] = u10
        [8] = u11
        [9] = u2
        [10] = u13
    --]]
    u12.KnitStart(u24)
    u7("chest", function(u25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u8
            [3] = u5
            [4] = u17
            [5] = u10
            [6] = u11
            [7] = u2
            [8] = u13
            [9] = u24
        --]]
        local v26 = u16(u25.Name)
        local v27 = u8.Controllers.ProximityPromptController
        local v28 = {
            ["Name"] = "Open",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 7.5,
            ["ActionText"] = "Open",
            ["ObjectText"] = v26.displayName,
            ["ClickablePrompt"] = u5.isMobileControls(),
            ["Parent"] = u25
        }
        local v29
        if u25.Name == u17.TEAM_CRATE then
            v29 = Vector2.new(0, 75)
        else
            v29 = Vector2.new(0, 0)
        end
        v28.UIOffset = v29
        v27:createProximityPrompt(v28).Triggered:Connect(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u25
                [3] = u17
                [4] = u11
                [5] = u2
                [6] = u13
                [7] = u24
            --]]
            local v30 = u10.LocalPlayer.Character
            if v30 ~= nil then
                v30 = v30:GetAttribute("GhostForm")
            end
            if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
                return nil
            end
            local v31 = nil
            if u25.Name == u17.PERSONAL_CHEST or u25.Name == u17.OG_PERSONAL_CHEST then
                v31 = u11:WaitForChild("Inventories"):FindFirstChild(u10.LocalPlayer.Name .. "_personal")
            elseif u25.Name == u17.LUCKY_BLOCK_ITEM_SMELTER then
                v31 = u11:WaitForChild("Inventories"):FindFirstChild(u10.LocalPlayer.Name .. "_smelter")
            else
                local v32 = u25:FindFirstChild("ChestFolderValue")
                if v32 then
                    v31 = v32.Value
                end
            end
            if v31 then
                local v33 = {
                    ["chestBlock"] = u25
                }
                if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.CHEST_INVENTORY, v33) then
                    u24:openChest(v31)
                end
            end
        end)
        u25:GetAttributeChangedSignal("ChestOpened"):Connect(function(_) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u24
            --]]
            if u25:GetAttribute("ChestOpened") == true then
                u24:playChestOpenAnimation(u25)
            end
        end)
        if u25:GetAttribute("ChestOpened") == true then
            u24:playChestOpenAnimation(u25)
        end
    end)
end
function u20.playChestOpenAnimation(_, p34) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u15
        [3] = u14
        [4] = u6
        [5] = u19
    --]]
    local u35 = u4:playAnimation(p34:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"), u15:getAssetId(u14.CHEST_OPEN))
    if u35 ~= nil then
        u35:GetMarkerReachedSignal("open"):Connect(function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35:AdjustSpeed(0)
        end)
    end
    u6:playSound(u19.TREASURE_CHEST_UNLOCK, {
        ["position"] = p34.Position
    })
end
function u20.openChest(_, u36) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    task.spawn(function() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u36
        --]]
        u18.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(u36)
    end)
end
u8.CreateController(u20.new())
return nil