local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "PenguinShipController"
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
        [2] = u16
    --]]
    u12.constructor(p23, { u16.SURVIVAL })
    p23.Name = "PenguinShipController"
end
function u20.onGameInit(_) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u19
        [4] = u3
        [5] = u14
        [6] = u13
        [7] = u4
        [8] = u18
        [9] = u15
        [10] = u5
        [11] = u17
        [12] = u10
        [13] = u11
        [14] = u9
    --]]
    u7:GetInstanceAddedSignal("PenguinShip"):Connect(function(u24) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u19
            [3] = u3
            [4] = u14
            [5] = u13
            [6] = u4
            [7] = u18
            [8] = u15
            [9] = u5
        --]]
        u24:GetPropertyChangedSignal("PrimaryPart"):Wait()
        local v25 = u8.Assets.Misc.PenguinPirateShip:Clone()
        if not v25 then
            return nil
        end
        local v26 = v25:FindFirstChildOfClass("Humanoid")
        if v26 ~= nil then
            v26:Destroy()
        end
        v25:SetPrimaryPartCFrame(u24:GetPrimaryPartCFrame())
        for _, v27 in v25:GetChildren() do
            if v27:IsA("BasePart") then
                v27.CanCollide = false
                v27.Massless = true
            end
        end
        v25.Parent = u24
        u19:weldPartsWithJoint(u24.PrimaryPart, v25.PrimaryPart, "Motor6D")
        v25.PrimaryPart.Name = "Main"
        for _, v28 in v25:GetChildren() do
            v28.Parent = u24
        end
        v25:Destroy()
        local v29 = u24:WaitForChild("Humanoid")
        if v29 ~= nil then
            v29 = v29:WaitForChild("Animator")
        end
        if v29 then
            u3:playAnimation(v29, u14:getAssetId(u13.PENGUIN_PIRATE_SHIP_FLY), {
                ["looped"] = true
            })
        end
        local v30 = u24:GetAttribute("MaxHealth")
        local u31 = v30 == nil and 1000 or v30
        local u32 = 100
        local u33 = u24:WaitForChild("FireEffect", 3)
        u24:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u31
                [3] = u32
                [4] = u33
            --]]
            local v34 = u24:GetAttribute("Health")
            local v35 = (v34 == nil and 0 or v34) * 100 / u31
            if u32 > 70 and v35 < 70 then
                local v36 = u33
                if v36 ~= nil then
                    local v37 = v36:WaitForChild("1")
                    if v37 ~= nil then
                        for v38, v39 in v37:GetDescendants() do
                            local _ = v38 - 1
                            if v39:IsA("ParticleEmitter") then
                                v39.Enabled = true
                            end
                        end
                    end
                end
            elseif u32 > 40 and v35 < 40 then
                local v40 = u33
                if v40 ~= nil then
                    local v41 = v40:WaitForChild("2")
                    if v41 ~= nil then
                        for v42, v43 in v41:GetDescendants() do
                            local _ = v42 - 1
                            if v43:IsA("ParticleEmitter") then
                                v43.Enabled = true
                            end
                        end
                    end
                end
            elseif u32 > 10 and v35 < 10 then
                local v44 = u33
                if v44 ~= nil then
                    local v45 = v44:WaitForChild("3")
                    if v45 ~= nil then
                        for v46, v47 in v45:GetDescendants() do
                            local _ = v46 - 1
                            if v47:IsA("ParticleEmitter") then
                                v47.Enabled = true
                            end
                        end
                    end
                end
            end
            u32 = v35
        end)
        u4:playSound(u18.PIRATE_EVENT_MOTHERSHIP)
        task.delay(1, function() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u24
                [3] = u5
            --]]
            local v48 = u15:getEntity(u24)
            if v48 then
                u5.Controllers.ShipBarController:mountEntityBossBar(v48, {
                    ["DisplayName"] = "Pirate Ship",
                    ["Gradient"] = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 56, 56)),
                    ["OffsetY"] = Vector2.new(0, 0.15)
                })
            end
        end)
    end)
    u17.Client:Get("EntityDeathEvent"):Connect(function(p49) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u8
            [4] = u11
            [5] = u4
            [6] = u18
        --]]
        if u7:HasTag(p49.entityInstance, "PenguinShip") then
            for v50, v51 in p49.entityInstance:GetDescendants() do
                local _ = v50 - 1
                if v51:IsA("Part") then
                    v51.Anchored = false
                end
            end
            local v52 = u10
            local v53 = p49.entityInstance.PrimaryPart
            local v54 = TweenInfo.new(5)
            local v55 = {}
            local v56 = p49.entityInstance.PrimaryPart
            if v56 ~= nil then
                local v57 = v56.CFrame
                local v58 = CFrame.Angles(3.141592653589793 * math.random(), 0, 3.141592653589793 * math.random())
                v56 = (v57 + Vector3.new(10, -90, 0)) * v58
            end
            v55.CFrame = v56
            v52:Create(v53, v54, v55):Play()
            local v59 = p49.entityInstance.PrimaryPart.Position
            local v60 = u8.Assets.Effects.DragonMortarExplosion:Clone()
            v60:PivotTo(CFrame.new(v59))
            v60.Parent = u11
            for v61, v62 in v60:GetDescendants() do
                local _ = v61 - 1
                if v62:IsA("ParticleEmitter") then
                    v62:Emit(30)
                end
            end
            u4:playSound(u18.PIRATE_MOTHERSHIP_CANNON_EXPLODE, {
                ["rollOffMinDistance"] = 300,
                ["position"] = v59
            })
            local v63 = p49.entityInstance:FindFirstChild("CaptainPenguin")
            if v63 ~= nil then
                v63:Destroy()
            end
        end
    end)
    u17.Client:Get("CaptainPirateSpawn"):Connect(function(p64) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u14
            [4] = u13
            [5] = u4
            [6] = u18
            [7] = u8
            [8] = u11
            [9] = u9
        --]]
        task.delay(2, function() --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            for _, v65 in u7:GetTagged("PiratePenguin") do
                for v66, v67 in v65:GetDescendants() do
                    local _ = v66 - 1
                    if v67:IsA("ParticleEmitter") then
                        v67.Enabled = true
                    end
                end
            end
        end)
        local u68 = p64.captain:WaitForChild("HumanoidRootPart", 3)
        local v69
        if u68 == nil then
            v69 = u68
        else
            v69 = u68.Position
        end
        if u68 and v69 then
            u3:playAnimation(p64.captain:WaitForChild("Humanoid"):WaitForChild("Animator"), u14:getAssetId(u13.CAPTAIN_PENGUIN_ABILITY))
            u4:playSound(u18.PENGUIN_PIRATE)
            local u70 = u8.Assets.Effects.Impulse:Clone()
            u70.Parent = u11
            u70:PivotTo(CFrame.new(v69))
            local u71 = u9.Heartbeat:Connect(function(_) --[[ Line: 232 ]]
                --[[
                Upvalues:
                    [1] = u70
                    [2] = u11
                    [3] = u68
                --]]
                if u70.Parent ~= u11 or not u68.CFrame then
                    return nil
                end
                u70:PivotTo(u68.CFrame)
            end)
            for v72, v73 in u70:GetChildren() do
                local _ = v72 - 1
                if v73:IsA("ParticleEmitter") then
                    v73:Emit(1)
                end
            end
            task.delay(2, function() --[[ Line: 247 ]]
                --[[
                Upvalues:
                    [1] = u70
                    [2] = u71
                --]]
                u70:Destroy()
                u71:Disconnect()
            end)
        end
    end)
end
u5.CreateController(u20.new())
return nil