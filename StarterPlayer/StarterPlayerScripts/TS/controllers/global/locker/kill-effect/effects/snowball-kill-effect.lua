local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InQuad
local u7 = v5.OutQuad
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u19 = Random.new()
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "SnowballKillEffect"
    end,
    ["__index"] = u18
})
u20.__index = u20
function u20.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23, p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p23, p24)
    u18.setPlayDefaultKillEffect(p23, false)
end
function u20.onKill(p25, _, p26, u27) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u18
        [4] = u3
        [5] = u4
        [6] = u15
        [7] = u11
        [8] = u12
        [9] = u16
        [10] = u9
        [11] = u14
        [12] = u6
        [13] = u19
        [14] = u17
        [15] = u7
    --]]
    local u28 = u8.new()
    p26.Archivable = true
    local u29 = p26:Clone()
    u29:PivotTo(u27)
    u29.Parent = u13
    u29.HumanoidRootPart.Anchored = false
    u29.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    u18.hideCharacter(p25, p26)
    u28:GiveTask(u29)
    for _, v30 in u29:GetDescendants() do
        if v30:IsA("BasePart") then
            u3:setQueryIgnored(v30, false)
        end
    end
    u4:playSound(u15.SNOWBALL_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 150,
        ["rollOffMinDistance"] = 50,
        ["position"] = u29.HumanoidRootPart.Position,
        ["parent"] = u29.HumanoidRootPart
    })
    local u31 = u11.Assets.Effects.SnowballHit.Attachment:Clone()
    u31.Parent = u13.Terrain
    u28:GiveTask(u31)
    local u32 = 0
    local u33 = 0
    u28:GiveTask(u12.Heartbeat:Connect(function(p34) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u33
            [3] = u27
            [4] = u16
            [5] = u9
            [6] = u13
            [7] = u3
            [8] = u28
            [9] = u14
            [10] = u6
            [11] = u29
            [12] = u19
            [13] = u11
            [14] = u17
            [15] = u31
            [16] = u7
        --]]
        u32 = u32 + p34
        if u32 - u33 > 0.1 then
            u33 = u32
            local v35 = u27.Position + u16.randomUnitVector(Vector3.new(0, 1, 0), 1.5707963267948966) * 14
            local u36 = u9("Part", {
                ["Size"] = Vector3.new(1, 1, 1),
                ["Transparency"] = 1,
                ["Anchored"] = false,
                ["CanCollide"] = true,
                ["Shape"] = Enum.PartType.Ball,
                ["Color"] = Color3.fromRGB(199, 232, 255),
                ["CFrame"] = CFrame.new(v35),
                ["CustomPhysicalProperties"] = PhysicalProperties.new(10, 1, 0, 1, 0),
                ["TopSurface"] = Enum.SurfaceType.Smooth,
                ["BottomSurface"] = Enum.SurfaceType.Smooth,
                ["Parent"] = u13
            })
            u36.CollisionGroup = "snowball"
            u3:setQueryIgnored(u36, true)
            u28:GiveTask(u36)
            u14(0.1, u6, function(p37) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36.Transparency = p37
                return u36.Transparency
            end, 1, 0)
            u36.CollisionGroup = "DisablePlayerCollisions"
            local u38 = (u29:GetPivot().Position - v35).Unit
            u36:ApplyImpulse(u38 * (u36.AssemblyMass * (50 + u19:NextNumber(0, 50))))
            local u39 = nil
            u39 = u36.Touched:Connect(function(p40) --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u39
                    [3] = u36
                    [4] = u38
                    [5] = u11
                    [6] = u13
                    [7] = u29
                    [8] = u17
                    [9] = u31
                    [10] = u14
                    [11] = u7
                    [12] = u28
                --]]
                if u3:isQueryIgnored(p40) then
                    return nil
                end
                u39:Disconnect()
                local v41 = u3:raycast(u36.Position - u38 * 5, u38 * 10)
                if v41 then
                    local u42 = u11.Assets.Effects.OilPart:Clone()
                    u42.Color = Color3.fromRGB(199, 232, 255)
                    u42.Parent = u13
                    local v43 = CFrame
                    local v44 = v41.Position
                    local v45 = v41.Position
                    local v46 = v41.Normal
                    u42.CFrame = v43.lookAt(v44, v45 + v46)
                    u3:setQueryIgnored(u42, true)
                    u42.CanCollide = false
                    u42.CanQuery = false
                    u42.Anchored = true
                    if v41.Instance:IsDescendantOf(u29) then
                        u42.Anchored = false
                        u17:weldParts(u29.HumanoidRootPart, u42)
                    end
                    u31.WorldCFrame = u42.CFrame
                    for _, v47 in u31:GetDescendants() do
                        if v47:IsA("ParticleEmitter") then
                            v47:Emit((v47:GetAttribute("EmitCount")))
                        end
                    end
                    u14(0.5, u7, function(p48) --[[ Line: 137 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                        --]]
                        u42.Size = (Vector3.new(0.3, 0.3, 0.1)):Lerp(Vector3.new(1, 1, 0.1), p48)
                        u42.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(199, 232, 255), p48)
                    end, 0, 1)
                    u28:GiveTask(u42)
                end
                u36.LocalTransparencyModifier = 1
                task.delay(0.1, function() --[[ Line: 144 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36:Destroy()
                end)
            end)
        end
    end))
    task.delay(6, function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:DoCleaning()
    end)
    return u28
end
return u20