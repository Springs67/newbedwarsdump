local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.TweenService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile").HelicopterMissile
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "HelicopterController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "HelicopterController"
end
function u18.watchHelicopterVehicle(_, p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u15
        [4] = u3
        [5] = u9
    --]]
    u4(p22, function(u23) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
            [3] = u3
            [4] = u9
        --]]
        if not u23.PrimaryPart then
            u23:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u24 = u6("Sound", {
            ["Name"] = "HoverSound",
            ["Looped"] = true,
            ["Volume"] = 0.2,
            ["SoundId"] = u15.MINICOPTER_LOOP,
            ["Parent"] = u23.PrimaryPart
        })
        u24:Play()
        local function u30() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u3
                [3] = u15
                [4] = u9
                [5] = u24
            --]]
            local v25 = u23:GetAttribute("EngineOn")
            if v25 == true then
                local v26 = u23.Root:WaitForChild("Propeller", 1)
                local v27 = u23.Root:WaitForChild("BackPropeller", 1)
                if v26 then
                    v26.HingeConstraint.AngularVelocity = 42
                end
                if v27 then
                    v27.HingeConstraint.AngularVelocity = 42
                end
                u3:playSound(u15.MINICOPTER_START, {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u23.Root.Position
                })
            else
                local v28 = u23.Root:WaitForChild("Propeller", 1)
                local v29 = u23.Root:WaitForChild("BackPropeller", 1)
                if v28 then
                    v28.HingeConstraint.AngularVelocity = 0
                end
                if v29 then
                    v29.HingeConstraint.AngularVelocity = 0
                end
                u3:playSound(u15.MINICOPTER_STOP, {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u23.Root.Position
                })
            end
            u9:Create(u24, TweenInfo.new(0.6), {
                ["Volume"] = v25 == true and 0.5 or 0
            }):Play()
        end
        u23:GetAttributeChangedSignal("EngineOn"):Connect(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30()
        end)
        u30()
    end)
end
function u18.KnitStart(p31) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u13
        [4] = u8
        [5] = u10
        [6] = u3
        [7] = u15
        [8] = u17
        [9] = u14
        [10] = u16
    --]]
    u12.KnitStart(p31)
    u11.ExplosionEffect:connect(function(p32) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u8
            [3] = u10
            [4] = u3
            [5] = u15
        --]]
        if p32.explosionType == u13.HELICOPTER then
            local u33 = u8.Assets.Effects.GuidedMissileExplosion:Clone()
            u33.Position = p32.position
            u33.Parent = u10
            u33.Debris1:Emit(5)
            u33.Debris2:Emit(5)
            u33.ExplosionFlames:Emit(50)
            u3:playSound(u15.MINICOPTER_EXPLODE, {
                ["rollOffMaxDistance"] = 160,
                ["position"] = p32.position
            })
            task.delay(5, function() --[[ Line: 103 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:Destroy()
            end)
        end
    end)
    p31:watchHelicopterVehicle(u17.MINICOPTER)
    p31:watchHelicopterVehicle(u17.ATTACK_HELI)
    u14.Client:GetNamespace("Helicopter"):Get("ReplicateMissile"):Connect(function(p34, p35, p36, p37) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.new(p35, p36, p34):fire(p37, function() --[[ Line: 114 ]] end)
    end)
end
v5.CreateController(u18.new())
return nil