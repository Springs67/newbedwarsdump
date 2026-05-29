local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "UfoController"
    end,
    ["__index"] = u13
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p20)
    p20.Name = "UfoController"
end
function u17.watchUfoVehicle(_, p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u15
        [4] = u8
        [5] = u11
        [6] = u3
        [7] = u10
    --]]
    u4(p21, function(u22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
            [3] = u8
            [4] = u11
            [5] = u3
            [6] = u10
        --]]
        if not u22.PrimaryPart then
            u22:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u23 = u6("Sound", {
            ["Name"] = "HoverSound",
            ["Looped"] = true,
            ["Volume"] = 0.7,
            ["SoundId"] = u15.UFO_ENGINE_LOOP,
            ["Parent"] = u22.PrimaryPart
        })
        local u24 = u6("Sound", {
            ["Name"] = "AbducteeHeld",
            ["Looped"] = true,
            ["Volume"] = 1,
            ["SoundId"] = u15.UFO_HOLDING_ABDUCTEE,
            ["Parent"] = u22.PrimaryPart
        })
        local u25 = u6("Sound", {
            ["Name"] = "TractorBeamSound",
            ["Looped"] = true,
            ["Volume"] = 1.2,
            ["SoundId"] = u15.TRACTOR_BEAM_LOOP,
            ["Parent"] = u22.PrimaryPart
        })
        u23:Play()
        u22:GetAttributeChangedSignal("TractorBeamEnabled"):Connect(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u25
            --]]
            if u22:GetAttribute("TractorBeamEnabled") then
                u25:Play()
            else
                u25:Pause()
            end
        end)
        u22:GetAttributeChangedSignal("PlayerAbducted"):Connect(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u8
                [3] = u11
                [4] = u24
            --]]
            if u22:GetAttribute("PlayerAbducted") then
                local v26 = u22:GetAttribute("AbductedPlayerUserID")
                if v26 == u8.LocalPlayer.UserId then
                    u11.CurrentCamera.CameraSubject = u22.PrimaryPart
                end
                u24:Play()
                if v26 ~= 0 and (v26 == v26 and v26) then
                    return
                end
            else
                u24:Pause()
                if u22:GetAttribute("AbductedPlayerUserID") == u8.LocalPlayer.UserId then
                    u11.CurrentCamera.CameraSubject = u8.LocalPlayer.Character.Humanoid
                end
            end
        end)
        local function u29() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u3
                [3] = u15
                [4] = u10
                [5] = u23
            --]]
            local v27 = u22:GetAttribute("EngineOn")
            local v28 = u22.Root:WaitForChild("SpinShell", 1)
            if v27 == true then
                v28:ApplyImpulse(Vector3.new(0, 5000, 5000))
                if v28 then
                    v28.HingeConstraint.AngularVelocity = 2
                end
                u3:playSound(u15.UFO_ENTER, {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u22.Root.Position
                })
            else
                if v28 then
                    v28.HingeConstraint.AngularVelocity = 0
                end
                u3:playSound(u15.UFO_EXIT, {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u22.Root.Position
                })
            end
            u10:Create(u23, TweenInfo.new(0.7), {
                ["Volume"] = v27 == true and 0.6 or 0
            }):Play()
        end
        u22:GetAttributeChangedSignal("EngineOn"):Connect(function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29()
        end)
        u29()
    end)
end
function u17.KnitStart(p30) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u14
        [4] = u9
        [5] = u11
        [6] = u3
        [7] = u15
        [8] = u16
    --]]
    u13.KnitStart(p30)
    u12.ExplosionEffect:connect(function(p31) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u11
            [4] = u3
            [5] = u15
        --]]
        if p31.explosionType == u14.UFO then
            local u32 = u9.Assets.Effects.GuidedMissileExplosion:Clone()
            u32.Position = p31.position
            u32.Parent = u11
            u32.Debris1:Emit(5)
            u32.Debris2:Emit(5)
            u32.ExplosionFlames:Emit(50)
            u3:playSound(u15.MINICOPTER_EXPLODE, {
                ["rollOffMaxDistance"] = 160,
                ["position"] = p31.position
            })
            task.delay(5, function() --[[ Line: 135 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32:Destroy()
            end)
        end
    end)
    p30:watchUfoVehicle(u16.UFO)
end
v5.CreateController(u17.new())
return nil