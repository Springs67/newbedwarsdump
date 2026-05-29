local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.RunService
local u9 = v5.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "CurseOfUnityController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18)
    p18.Name = "CurseOfUnityController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u2
        [4] = u13
        [5] = u9
        [6] = u7
        [7] = u10
        [8] = u4
        [9] = u8
        [10] = u6
        [11] = u3
        [12] = u14
    --]]
    u11.KnitStart(p19)
    u12.Client:GetNamespace("WarlockBoss"):Get("WarlockCurseOfUnity"):Connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
            [3] = u9
            [4] = u7
            [5] = u10
            [6] = u4
            [7] = u8
            [8] = u6
            [9] = u3
            [10] = u14
        --]]
        local v21 = p20.targetPlayer
        local u22 = p20.fromPosition
        local u23 = p20.radius
        local v24 = p20.explodeAt
        u2:playSound(u13.HALLOWEEN_BOSS_CAST, {
            ["rollOffMaxDistance"] = 300,
            ["position"] = u22
        })
        local v25 = v24 - u9:GetServerTimeNow()
        local u26 = v21.Character
        if not u26 then
            return nil
        end
        local u27 = u26:GetPivot().Position
        local u28 = u7.Assets.Effects.Warlock.Ball:Clone()
        for v29, v30 in u28:GetDescendants() do
            local _ = v29 - 1
            if v30:IsA("BasePart") then
                v30.CanCollide = false
                v30.CanQuery = false
                v30.Transparency = 1
            end
        end
        u28:PivotTo(CFrame.new(u22))
        u28.Parent = u9
        local u31 = (math.random() < 0.5 and -1 or 1) * (0.5235987755982988 + math.random() * 0.5235987755982988)
        local u32 = u28:GetPrimaryPartCFrame().Position
        u10(0.3, u4, function(p33) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u27
                [3] = u22
                [4] = u31
                [5] = u32
            --]]
            if u28.Parent then
                local v34 = u27 - u22
                local v35 = CFrame.lookAt(Vector3.new(0, 0, 0), v34) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.Angles(0, u31, 0) * Vector3.new(0, 0, 1)
                local v36 = (u27 - u22) * p33 + u22
                local v37 = 9.87 * p33
                local v38 = math.pow(v37, 0.5)
                local v39 = v36 + v35 * (math.sin(v38) * 0.16666666666666666 * v34.Magnitude)
                local v40 = u28
                local v41 = v39 - u32
                v40:PivotTo(CFrame.new(v39, v39 + v41) * CFrame.Angles(0, 1.5707963267948966, 0))
                u32 = v39
            end
        end)
        u2:playSound(u13.CURSE_INFLICT, {
            ["rollOffMaxDistance"] = 300,
            ["parent"] = u26.PrimaryPart
        })
        local u42 = u7.Assets.Effects.Warlock.UnityCurseAura:Clone()
        for v43, v44 in u42:GetDescendants() do
            local _ = v43 - 1
            if v44:IsA("BasePart") then
                v44.CanCollide = false
                v44.CanQuery = false
                v44.Anchored = false
                v44.CanTouch = false
            end
        end
        local v45 = u42.Root
        local v46 = u23 * 2
        local v47 = u23 * 2
        v45.Size = Vector3.new(0.1, v46, v47)
        local v48 = u42.Root.OnExplode
        local v49 = u23 * 2
        local v50 = u23 * 2
        v48.Size = Vector3.new(0.1, v49, v50)
        u42.Parent = u26
        local u51 = u2:playSound(u13.CURSE_LOOP, {
            ["rollOffMaxDistance"] = 100,
            ["looped"] = true,
            ["volumeMultiplier"] = 7,
            ["parent"] = u26.PrimaryPart
        })
        local u57 = u8.Heartbeat:Connect(function(p52) --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u26
            --]]
            local v53 = u42
            local v54 = u26:GetPivot().Position
            v53:PivotTo(CFrame.new(v54 - Vector3.new(0, 2.6, 0)) * CFrame.Angles(0, 0, 1.5707963267948966))
            for v55, v56 in u42.Root.SurfaceGui:GetDescendants() do
                local _ = v55 - 1
                if v56:IsA("ImageLabel") then
                    v56.Rotation = v56.Rotation + p52 * 30
                end
            end
        end)
        task.delay(v25, function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u42
                [3] = u23
                [4] = u3
                [5] = u14
                [6] = u2
                [7] = u13
                [8] = u26
                [9] = u51
                [10] = u57
            --]]
            local v58 = u6.LocalPlayer.Character
            if v58 ~= nil then
                v58 = v58:GetPivot().Position
            end
            if v58 ~= nil then
                v58 = (v58 - u42:GetPivot().Position).Magnitude
            end
            if v58 ~= 0 and (v58 == v58 and v58) then
                v58 = v58 <= u23
            end
            if v58 ~= 0 and (v58 == v58 and v58) then
                u3.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    ["magnitude"] = 1.6
                })
            end
            u14:playInstanceEffects({ u42.Root.OnExplode }, {
                ["destroyAfterSec"] = 1,
                ["sizeMultiplier"] = 0.3
            })
            u2:playSound(u13.CURSE_ACTIVATE, {
                ["rollOffMaxDistance"] = 200,
                ["position"] = u26:GetPivot().Position
            })
            task.delay(0.5, function() --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u51
                    [3] = u57
                --]]
                u42:Destroy()
                local v59 = u51
                if v59 ~= nil then
                    v59:Destroy()
                end
                u57:Disconnect()
            end)
        end)
    end)
end
u3.CreateController(u15.new())
return nil