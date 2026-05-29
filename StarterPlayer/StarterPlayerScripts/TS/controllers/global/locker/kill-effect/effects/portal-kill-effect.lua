local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InCubic
local u8 = v6.Linear
local u9 = v6.OutBack
local u10 = v6.OutExpo
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.ReplicatedStorage
local u15 = v13.RunService
local u16 = v13.Workspace
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic")
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "PortalKillEffect"
    end,
    ["__index"] = u23
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, p28) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.constructor(p27, p28)
    u23.setPlayDefaultKillEffect(p27, false)
end
function u24.onKill(u29, _, p30, u31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u16
        [3] = u23
        [4] = u4
        [5] = u12
        [6] = u18
        [7] = u14
        [8] = u1
        [9] = u20
        [10] = u19
        [11] = u17
        [12] = u7
        [13] = u5
        [14] = u21
        [15] = u9
        [16] = u22
        [17] = u3
        [18] = u8
        [19] = u10
        [20] = u15
    --]]
    local u32 = u11.new()
    p30.Archivable = true
    local u33 = p30:Clone()
    u33.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u33.HumanoidRootPart.Anchored = true
    u33:PivotTo(u31)
    u33.Parent = u16
    u23.hideCharacter(u29, p30)
    u32:GiveTask(u33)
    for v34, v35 in u33:GetDescendants() do
        local _ = v34 - 1
        if v35:IsA("GuiObject") then
            v35.Transparency = 1
        elseif v35:IsA("UIStroke") then
            v35.Transparency = 1
        elseif v35:IsA("Decal") then
            v35.Transparency = 1
        end
    end
    for v36, v37 in u33:GetDescendants() do
        local _ = v36 - 1
        if v37:IsA("BasePart") and (v37.Transparency ~= 1 and v37.Position.Y <= u33.PrimaryPart.Position.Y) then
            v37.Transparency = 0.01
            if v37.Material == Enum.Material.Glass then
                v37.Material = Enum.Material.SmoothPlastic
            end
        end
    end
    local v38 = RaycastParams.new()
    v38.FilterType = Enum.RaycastFilterType.Exclude
    v38:AddToFilter({ u33 })
    local v39 = u4:raycast(u31.Position, Vector3.new(0, -20, 0))
    local v40
    if v39 == nil then
        v40 = v39
    else
        v40 = v39.Position
    end
    local u41
    if v40 then
        u41 = CFrame.new(v39.Position) * CFrame.Angles(u31:ToOrientation(), select(2, u31:ToOrientation()), (select(3, u31:ToOrientation())))
    else
        u41 = u31 + Vector3.new(0, -6, 0)
    end
    local u42 = u12("Part", {
        ["Size"] = Vector3.new(0.0001, 7, 7),
        ["Rotation"] = Vector3.new(0, -90, -90),
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Shape"] = Enum.PartType.Cylinder,
        ["Position"] = u41.Position,
        ["Parent"] = u16
    })
    u4:setQueryIgnored(u42, true)
    u32:GiveTask(u42)
    local v43 = {
        ["Name"] = "KillEffectGlass",
        ["Anchored"] = true,
        ["Size"] = Vector3.new(1.5, 7, 7),
        ["CanCollide"] = false,
        ["Color"] = Color3.fromRGB(255, 255, 255)
    }
    local v44 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
    v43.CFrame = (u41 - Vector3.new(0, 0.76, 0)) * v44
    v43.Material = Enum.Material.Glass
    v43.Shape = Enum.PartType.Cylinder
    v43.Transparency = 0.999
    v43.Parent = u16
    local u45 = u12("Part", v43)
    u4:setQueryIgnored(u45, true)
    u32:GiveTask(u45)
    local u46 = u18.createFaces(u42, u33, { Enum.NormalId.Left })
    for _, v47 in u46 do
        local v48 = u14.Assets.Effects.PortalKillEffect.ViewportSkybox:Clone()
        v48.Parent = v47.slice.viewportFrame
        u32:GiveTask(v48)
        u12("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0),
            ["Parent"] = v47.slice.viewportFrame
        })
        local v49 = v47.slice.clone
        if v49 ~= nil then
            v49:PivotTo(CFrame.new(Vector3.new(0, 0, 0)))
        end
    end
    local u50 = u14.Assets.Effects.PortalKillEffect.PortalParticles:Clone()
    u32:GiveTask(u50)
    local u51 = nil
    local u70 = u1.Promise.new(function() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u20
            [3] = u19
            [4] = u31
            [5] = u17
            [6] = u7
            [7] = u41
            [8] = u50
            [9] = u42
            [10] = u32
            [11] = u5
            [12] = u21
            [13] = u9
            [14] = u51
            [15] = u22
            [16] = u23
            [17] = u29
            [18] = u45
            [19] = u46
            [20] = u3
            [21] = u8
        --]]
        u20:playAnimation(u33.Humanoid.Animator, u19.SUCKED_INTO_HOLE)
        u17(0.4, u7, function(p52) --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:PivotTo(p52)
        end, u31, u31 + Vector3.new(0, 1, 0)):Wait()
        u17(0.7, u7, function(p53) --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:PivotTo(p53)
        end, u31 + Vector3.new(0, 1, 0), u41)
        u50:PivotTo(CFrame.new(u42:GetPivot().Position) * CFrame.Angles(0, 0, 1.5707963267948966))
        u50.Parent = u42
        u32:GiveTask(u5:playSound(u21.CURSE_SUMMON_MOB_PORTAL_SPAWN))
        local u54 = u5:playSound(u21.CURSE_SUMMON_MOB_PORTAL_LOOP, {
            ["rollOffMaxDistance"] = 100,
            ["looped"] = true,
            ["position"] = u42:GetPivot().Position
        })
        u32:GiveTask(u54)
        u17(0.7, u9, function(p55) --[[ Line: 192 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u51
            --]]
            local v56 = math.noise(os.clock() * 15) * 1.5
            local v57 = u42
            local v58 = (u51.X + v56) * p55
            local v59 = (u51.Y + v56) * p55
            local v60 = u51.Z
            v57.Size = Vector3.new(v58, v59, v60)
        end, 0, 1):Wait()
        if u50.OnOpen then
            u22:playEffects({ u50.OnOpen }, nil)
        end
        if u50.OnOpened then
            u22:playEffects({ u50.OnOpened }, nil)
        end
        u32:GiveTask(function() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u54
            --]]
            local v61 = u54
            if v61 ~= nil then
                v61:Stop()
            end
            local v62 = u54
            if v62 ~= nil then
                v62:Destroy()
            end
        end)
        u23.hideCharacter(u29, u33)
        u45:Destroy()
        u32:GiveTask(u5:playSound(u21.GLITCH_KILL_EFFECT, {
            ["position"] = u31.Position
        }))
        for _, v63 in u46 do
            u3:playAnimation(v63.slice.clone.Humanoid.Animator, u20:getAssetId(u19.ROBLOX_LOCOMOTION_ASTRONAUT_FALL), {
                ["looped"] = true
            })
        end
        u17(3, u8, function(p64) --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u41
            --]]
            for _, v65 in u46 do
                local v66 = v65.slice.clone
                if v66 ~= nil then
                    local v67 = u41
                    local v68 = CFrame.new(0, -60 * p64, 0)
                    local v69 = CFrame.Angles(6.283185307179586 * p64, 6.283185307179586 * p64, 6.283185307179586 * p64)
                    v66:PivotTo(v67 * v68 * v69)
                end
            end
        end)
    end)
    u32:GiveTask(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        return u70:cancel()
    end)
    u51 = u42.Size
    local u94 = u1.Promise.new(function() --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u8
            [3] = u50
            [4] = u9
            [5] = u42
            [6] = u51
            [7] = u10
            [8] = u32
        --]]
        task.wait(2)
        local u71 = nil
        u71 = u17(1, u8, function(u72) --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u71
            --]]
            if not u50:FindFirstChild("OnOpened") then
                u71:Cancel()
                return nil
            end
            local v73 = u50.OnOpened:GetDescendants()
            local function v79(p74) --[[ Line: 251 ]]
                --[[
                Upvalues:
                    [1] = u72
                --]]
                if p74:IsA("ParticleEmitter") or p74:IsA("Beam") then
                    local v75 = 1
                    local v76 = v75
                    for v77, v78 in p74.Transparency.Keypoints do
                        local _ = v77 - 1
                        if v78.Value < v76 then
                            v75 = v78.Value
                            v76 = v75
                        end
                    end
                    if v76 < u72 then
                        p74.Transparency = NumberSequence.new(u72)
                    end
                elseif p74:IsA("ImageLabel") and p74.ImageTransparency < u72 then
                    p74.ImageTransparency = u72
                end
            end
            for v80, v81 in v73 do
                v79(v81, v80 - 1, v73)
            end
        end)
        u17(1.4, u9, function(p82) --[[ Line: 281 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u51
            --]]
            local v83 = math.noise(os.clock() * 15) * 1.5
            local v84 = u42
            local v85 = (u51.X + v83) * p82
            local v86 = (u51.Y + v83) * p82
            local v87 = u51.Z
            v84.Size = Vector3.new(v85, v86, v87)
        end, 1, 0.3):Wait()
        task.wait(0.2)
        u17(0.2, u10, function(p88) --[[ Line: 286 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u51
            --]]
            local v89 = math.random() * 3
            local v90 = u42
            local v91 = (u51.X + v89) * p88
            local v92 = (u51.Y + v89) * p88
            local v93 = u51.Z
            v90.Size = Vector3.new(v91, v92, v93)
        end, 0.3, 0)
        task.delay(1, function() --[[ Line: 290 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32:DoCleaning()
        end)
    end)
    u32:GiveTask(function() --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u94
        --]]
        return u94:cancel()
    end)
    u32:GiveTask(u15.Heartbeat:Connect(function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u18
        --]]
        for _, v95 in u46 do
            u18.update(v95.surfaceGui, {
                ["viewportFrame"] = v95.slice.viewportFrame,
                ["camera"] = v95.slice.camera
            })
        end
    end))
    u32:GiveTask(function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        for _, v96 in u46 do
            v96.surfaceGui:Destroy()
        end
    end)
    u32:GiveTask(u42)
    return u32
end
return u24