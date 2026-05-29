local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InExpo
local u7 = v5.InQuart
local u8 = v5.Linear
local u9 = v5.OutExpo
local u10 = v5.OutQuart
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.ReplicatedStorage
local u14 = v12.Workspace
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u19 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u20 = Random.new()
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "IceBlockKillEffect"
    end,
    ["__index"] = u19
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, p25) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p24, p25)
    u19.setPlayDefaultKillEffect(p24, false)
end
function u21.onKill(p26, _, p27, u28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u19
        [4] = u13
        [5] = u4
        [6] = u16
        [7] = u3
        [8] = u20
        [9] = u1
        [10] = u15
        [11] = u6
        [12] = u9
        [13] = u7
        [14] = u8
        [15] = u10
        [16] = u17
        [17] = u18
    --]]
    local u29 = u11.new()
    local u30 = true
    p27.Archivable = true
    local u31 = p27:Clone()
    u31:PivotTo(u28)
    u31.Parent = u14
    u31.HumanoidRootPart.Anchored = false
    u31.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    u19.hideCharacter(p26, p27)
    u29:GiveTask(u31)
    local u32 = u13.Assets.Effects.FracturedIceBlock:Clone()
    u32:PivotTo(u31:GetPivot())
    u32.Parent = u14
    local u33 = u4:playModifiableSound(u16.WINTER_BOSS_FROST_LOOP, {
        ["looped"] = true,
        ["volumeMultiplier"] = 0,
        ["position"] = u28.Position,
        ["parent"] = u31.HumanoidRootPart
    })
    if u33 then
        u29:GiveTask(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:Destroy()
        end)
    end
    local u34 = {}
    for _, v35 in u32:GetChildren() do
        if v35:IsA("BasePart") then
            v35.Material = Enum.Material.Glass
            u3:setQueryIgnored(v35, true)
            local v36 = {
                ["size"] = v35.Size
            }
            local v37 = v35.Position
            local v38 = u20:NextNumber(-6, 6)
            local v39 = u20:NextNumber(-6, 6)
            local v40 = u20
            v36.origin = v37 + Vector3.new(v38, v39, v40:NextNumber(-6, 6))
            v36.position = v35.Position
            u34[v35] = v36
            v35.Size = Vector3.new(0, 0, 0)
        end
    end
    u29:GiveTask(u32)
    local u53 = u1.Promise.new(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u6
            [3] = u33
            [4] = u9
            [5] = u32
            [6] = u34
            [7] = u7
            [8] = u8
            [9] = u10
            [10] = u31
            [11] = u30
            [12] = u13
            [13] = u29
            [14] = u28
            [15] = u3
            [16] = u14
            [17] = u17
            [18] = u4
            [19] = u16
            [20] = u18
        --]]
        u15(2.5, u6, function(p41) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if u33 then
                u33.Volume = p41
            end
        end, 0, 1)
        u15(0.25, u9, function(p42) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u34
            --]]
            for _, v43 in u32:GetChildren() do
                if v43:IsA("BasePart") then
                    local v44 = u34[v43]
                    if v44 then
                        v43.Size = v44.size * p42
                        v43.Position = v44.origin:Lerp(v44.position, p42)
                        v43.Transparency = 0.9 * p42
                    end
                end
            end
        end, 0, 1):Wait()
        u15(2, u7, function(p45) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u8
            --]]
            for _, v46 in u32:GetChildren() do
                if v46:IsA("BasePart") then
                    v46.Transparency = u8(p45, 0.9, -0.8, 1)
                end
            end
        end, 0, 1):Wait()
        task.wait(0.1)
        u15(0.1, u10, function(p47) --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u8
            --]]
            for _, v48 in u32:GetChildren() do
                if v48:IsA("BasePart") then
                    v48.Transparency = u8(p47, 0.1, -0.1, 1)
                end
            end
        end, 0, 1):Wait()
        local v49 = u33
        if v49 ~= nil then
            v49:Destroy()
        end
        u31:Destroy()
        if not u30 then
            return nil
        end
        local v50 = u13.Assets.Effects.SmallIceBreakEffect:Clone()
        u29:GiveTask(v50)
        v50.Position = u28.Position
        v50.Transparency = 1
        v50.CanCollide = false
        u3:setQueryIgnored(v50, true)
        v50.Parent = u14
        u17:playEffects({ v50 }, nil, {
            ["destroyAfterSec"] = 0.75
        })
        u29:GiveTask(u4:playSound(u16.WINTER_BOSS_ICE_BREAK, {
            ["rollOffMaxDistance"] = 150,
            ["position"] = u28.Position
        }))
        for _, v51 in u32:GetChildren() do
            if v51:IsA("BasePart") then
                v51.Anchored = false
                local v52 = u18.randomUnitVector(Vector3.new(0, 1, 0), 0.5235987755982988) * (v51.AssemblyMass * 70)
                v51:ApplyImpulse(v52)
                v51:ApplyAngularImpulse(v52 * 0.5)
            end
        end
    end)
    u29:GiveTask(function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u53
        --]]
        u30 = false
        u53:cancel()
    end)
    task.delay(6, function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:DoCleaning()
    end)
    return u29
end
return u21