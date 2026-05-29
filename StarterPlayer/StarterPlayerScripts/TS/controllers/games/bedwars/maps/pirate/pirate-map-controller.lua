local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "maps", "pirate", "pirate-map").PirateMap
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, script.Parent.Parent, "map-knit-controller").MapKnitController
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "PirateMapController"
    end,
    ["__index"] = u17
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
        [1] = u17
        [2] = u14
    --]]
    u17.constructor(p21, u14.MAPS)
    p21.Name = "PirateMapController"
end
function u18.onMapInit(p22) --[[ Line: 37 ]]
    p22:decorateNpcs()
end
function u18.onMatchStart(p23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.Controllers.PirateTreasureController:preloadAssets()
    p23:setupBarrels()
end
function u18.setupBarrels(_) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u14
        [4] = u3
        [5] = u8
        [6] = u10
        [7] = u13
        [8] = u12
        [9] = u15
    --]]
    u4("ExplosiveBarrel", function(u24) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u3
            [4] = u8
            [5] = u10
            [6] = u13
            [7] = u12
            [8] = u15
        --]]
        local v25 = u7.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Pick Up",
            ["ObjectText"] = "Explosive Barrel",
            ["RequiresLineOfSight"] = false,
            ["HoldDuration"] = 1,
            ["Parent"] = u24,
            ["MaxActivationDistance"] = u14.BarrelPromptMaxDistance,
            ["ClickablePrompt"] = u3.isMobileControls()
        })
        local u26 = u8.new()
        v25.PromptButtonHoldBegan:Connect(function(p27) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u13
                [3] = u12
                [4] = u7
                [5] = u26
            --]]
            if p27 ~= u10.LocalPlayer then
                return nil
            end
            if not p27.Character then
                return nil
            end
            local u28 = u13:playAnimation(p27, u12.OPEN_CRATE, {
                ["looped"] = true
            })
            local u29 = u7.Controllers.ViewmodelController:playAnimation(u12.OPEN_CRATE, {
                ["looped"] = true
            })
            u26:GiveTask(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u29
                --]]
                local v30 = u28
                if v30 ~= nil then
                    v30:Stop()
                end
                local v31 = u28
                if v31 ~= nil then
                    v31:Destroy()
                end
                local v32 = u29
                if v32 ~= nil then
                    v32:Stop()
                end
                local v33 = u29
                if v33 ~= nil then
                    v33:Destroy()
                end
            end)
        end)
        v25.PromptButtonHoldEnded:Connect(function(p34) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u26
            --]]
            if p34 ~= u10.LocalPlayer then
                return nil
            end
            u26:DoCleaning()
        end)
        v25.Triggered:Connect(function(p35) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
                [3] = u15
                [4] = u24
            --]]
            u13:playAnimation(p35, u12.TENNIS_RACKET_HIT)
            u15.Client:Get("CollectGunpowderBarrel"):CallServer({
                ["barrelPos"] = u24.Position
            })
        end)
    end)
end
function u18.decorateNpcs(_) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u16
    --]]
    u4("NpcModel", function(u36) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
        --]]
        task.delay(1, function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u11
                [3] = u16
            --]]
            local v37 = u36:FindFirstChildOfClass("Humanoid")
            if not v37 then
                return nil
            end
            v37:AddAccessory((u11.Assets.Misc.Parrot:Clone()))
            u16:weldCharacterAccessories(u36)
        end)
    end)
end
v6.CreateController(u18.new())
return nil