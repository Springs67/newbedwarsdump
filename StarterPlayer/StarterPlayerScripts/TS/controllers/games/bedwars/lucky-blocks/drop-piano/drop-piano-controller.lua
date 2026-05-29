local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "drop-piano", "drop-piano-constants").DropPianoConstants
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "DropPianoController"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    p17.maid = u5.new()
end
function u14.onStart(u18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u7
        [4] = u9
        [5] = u3
        [6] = u12
        [7] = u8
    --]]
    u11.Client:OnEvent("DropPiano", function(p19) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u9
            [4] = u3
            [5] = u12
            [6] = u18
            [7] = u8
        --]]
        local u20 = u10.DROP_DURATION
        local u21 = p19.target
        if not (u21 and (u21.Character and u21.Character.PrimaryPart)) then
            return nil
        end
        local v22 = u21.Character.PrimaryPart.Position
        local u23 = u7.Assets.Misc.Piano:Clone()
        u23.Parent = u9
        local u24 = CFrame.new(v22 + Vector3.new(0, 100, 0))
        u23:PivotTo(u24)
        local u25 = u3:playSound(u12.SLIDE_WHISTLE_FALLING, {
            ["fadeInTime"] = 0.2
        })
        if u25 then
            u3:tweenSoundVolume(u25, 3, u10.DROP_DURATION)
        end
        u18.maid:GiveTask(function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            if u25 then
                u25:Destroy()
            end
        end)
        local u26 = 0
        u18.maid:GiveTask(u8.Heartbeat:Connect(function(p27) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u23
                [3] = u18
                [4] = u21
                [5] = u20
                [6] = u24
            --]]
            u26 = u26 + p27
            if not u23.Parent then
                u18.maid:DoCleaning()
                return nil
            end
            if not (u21 and (u21.Character and u21.Character.PrimaryPart)) then
                return nil
            end
            local v28 = u21.Character.PrimaryPart.CFrame
            local v29 = u26 / u20
            local v30 = u24:Lerp(v28, (math.clamp(v29, 0, 1)))
            u23:PivotTo(v30)
            if u20 <= u26 then
                u18:crashPiano(u23, v30.Position)
                return nil
            end
        end))
    end)
end
function u14.crashPiano(p31, u32, p33) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u13
        [4] = u3
        [5] = u12
    --]]
    p31.maid:DoCleaning()
    for _, v34 in u32:GetDescendants() do
        if v34:IsA("BasePart") then
            v34.Anchored = false
            v34:ApplyImpulse(Vector3.new(2, 6, 2) * v34.Mass)
            v34.CanCollide = true
            v34.CollisionGroup = "Players"
        end
    end
    task.delay(1, function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:Destroy()
    end)
    local u35 = u7.Assets.Effects.LandmineExplosion:Clone()
    u35.Parent = u9
    u13:playEffects({ u35 }, nil, {
        ["sizeMultiplier"] = 3
    })
    u3:playSound(u12.PIANO_CRASH, {
        ["rollOffMaxDistance"] = 300,
        ["position"] = p33
    })
    u35.CFrame = CFrame.new(p33)
    task.delay(0.7, function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:Destroy()
    end)
end
v2.defineMetadata(u14, "identifier", "client/controllers/games/bedwars/lucky-blocks/drop-piano/drop-piano-controller@DropPianoController")
v2.defineMetadata(u14, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u14, "$:flamework@Controller", v4, {
    {}
})
return {
    ["default"] = u14
}