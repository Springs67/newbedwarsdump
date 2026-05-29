local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").getClosestBlockToWorldPosition
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u19 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "MiloKillEffect"
    end,
    ["__index"] = u19
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
function u20.constructor(p23, p24) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p23, p24)
    u19.setPlayDefaultKillEffect(p23, false)
end
function u20.onKill(u25, u26, u27, u28) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u12
        [4] = u11
        [5] = u19
        [6] = u18
        [7] = u13
        [8] = u14
        [9] = u8
        [10] = u15
        [11] = u7
        [12] = u5
        [13] = u4
        [14] = u9
    --]]
    local u29 = u3.new()
    task.spawn(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u10
            [3] = u29
            [4] = u12
            [5] = u11
            [6] = u19
            [7] = u25
            [8] = u18
            [9] = u13
            [10] = u28
            [11] = u14
            [12] = u8
            [13] = u15
            [14] = u26
            [15] = u7
            [16] = u5
            [17] = u4
            [18] = u9
        --]]
        u27.Archivable = true
        local u30 = u27:Clone()
        u30.HumanoidRootPart.Anchored = true
        u30.Parent = u10
        u29:GiveTask(u30)
        u12:playAnimation(u30, u11.ROBLOX_DEFAULT_IDLE, {
            ["looped"] = true,
            ["speed"] = 1
        })
        local v31 = u30:FindFirstChild("_DamageHighlight_")
        if v31 then
            v31:Destroy()
        end
        u19.hideCharacter(u25, u27)
        local v32 = u30:FindFirstChild("UpperTorso")
        if not v32 then
            return nil
        end
        local v33
        if u18.isLobbyServer() then
            v33 = nil
        else
            v33 = u13(u28.Position)
        end
        local v34
        if v33 == nil then
            v34 = u14.GRASS
        else
            v34 = v33.Name
        end
        local v35 = u8:WaitForChild("Items"):WaitForChild(v34)
        local v36 = u15.cloneItemIntoModel(v35)
        u29:GiveTask(v36)
        v36.Parent = v32
        local v37 = u26.UserId
        v36.Name = "MiloKillEffectBlock_" .. tostring(v37)
        for v38, v39 in v36:GetDescendants() do
            local _ = v38 - 1
            if v39:IsA("BasePart") then
                v39.CanCollide = false
                v39.Anchored = false
            end
        end
        u7:AddTag(v36, "DontBlockSwordRaycast")
        v36:PivotTo(v32.CFrame)
        u5(v36, 2.5)
        u4("WeldConstraint", {
            ["Part0"] = v36.PrimaryPart,
            ["Part1"] = v32,
            ["Parent"] = v32
        })
        local v40 = u30:FindFirstChild("Head")
        if v40 then
            v40.Transparency = 1
        end
        local v41 = u27:FindFirstChild("3DClothing")
        if v41 ~= nil then
            local v42 = v41:FindFirstChild("Head")
            if v42 ~= nil then
                for v43, v44 in v42:GetChildren() do
                    local _ = v43 - 1
                    if v44:IsA("MeshPart") then
                        v44.Transparency = 1
                    end
                    if v44:IsA("Part") then
                        v44.Transparency = 1
                    end
                end
            end
        end
        u25:playEffect(v32.Position)
        task.wait(1.5)
        u12:playAnimation(u30, u11.ROBLOX_DEFAULT_WALK, {
            ["looped"] = true,
            ["speed"] = 2
        })
        local v45 = u25.killerPlayer.Character
        local v46
        if v45 == nil then
            v46 = v45
        else
            v46 = v45.PrimaryPart
        end
        if v45 and v46 then
            local v47 = (u30:GetPivot().Position - v46.Position).Unit
            local v48 = u30:GetPivot().Position + v47
            u30.HumanoidRootPart.CFrame = CFrame.lookAt(u30:GetPivot().Position, v48, Vector3.new(0, 1, 0))
        end
        local v49 = u30:GetPivot().LookVector.X
        local v50 = u30:GetPivot().LookVector.Z
        local u51 = Vector3.new(v49, 0, v50).Unit
        local u53 = u9.Heartbeat:Connect(function(p52) --[[ Line: 140 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u51
            --]]
            u30:SetPrimaryPartCFrame(u30:GetPrimaryPartCFrame() + u51 * (40 * p52))
        end)
        u29:GiveTask(function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            if u53 and u53.Connected then
                u53:Disconnect()
            end
        end)
        task.delay(10, function() --[[ Line: 152 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u30
            --]]
            if u53 and u53.Connected then
                u53:Disconnect()
            end
            u30:Destroy()
        end)
    end)
    return u29
end
function u20.playEffect(_, p54) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u10
        [4] = u17
        [5] = u2
    --]]
    local v55 = u16.MIMIC_HIDE
    local v56 = u8.Assets.Effects.MimicBlockEffect:Clone()
    v56.Parent = u10
    v56.Position = p54
    u17:playEffects({ v56 }, nil, {
        ["destroyAfterSec"] = 1
    })
    u2:playSound(v55, {
        ["volumeMultiplier"] = 0.25,
        ["position"] = p54
    })
end
return u20