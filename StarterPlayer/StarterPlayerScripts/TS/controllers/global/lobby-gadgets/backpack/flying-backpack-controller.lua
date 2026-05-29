local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.UserInputService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "backpack", "ui", "backpack-energy-component").BackpackEnergyComponent
local u24 = { v21.XUROT_FLAP_WING_1, v21.XUROT_FLAP_WING_2 }
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "FlyingBackpackController"
    end,
    ["__index"] = u16
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
    --]]
    u16.constructor(p28)
    p28.Name = "FlyingBackpackController"
    p28.equipped = false
    p28.jumpReadyTime = -1
    p28.lastJumpTime = -1
    p28.isFlying = false
    p28.uiMaid = u7.new()
end
function u25.KnitStart(u29) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u19
        [4] = u12
        [5] = u11
        [6] = u14
        [7] = u22
        [8] = u13
        [9] = u20
    --]]
    u16.KnitStart(u29)
    local u30 = -1
    u15.ItemAdded:connect(function(p31) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
            [3] = u11
            [4] = u14
            [5] = u22
        --]]
        if p31.item.Name == u19.FLYING_BACKPACK then
            local v32 = u12.Assets.Effects.FlyingBackpackEffect:Clone()
            local v33 = u11.LocalPlayer.Character
            if v33 ~= nil then
                v33 = v33.PrimaryPart
                if v33 ~= nil then
                    v33 = v33.Position
                end
            end
            if not v33 then
                return nil
            end
            v32.Position = v33
            v32.Parent = u14
            u22:playEffects({ v32 }, nil, {
                ["destroyAfterSec"] = 1
            })
        end
    end)
    u15.BackpackEquipEvent:connect(function(p34) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u19
            [3] = u29
        --]]
        if p34.player == u11.LocalPlayer then
            if p34.item == u19.FLYING_BACKPACK then
                u29:equip(p34.backpack)
                return
            end
            u29:unequip()
        end
    end)
    u13.JumpRequest:Connect(function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u11
            [3] = u29
        --]]
        if u30 < time() then
            u30 = time() + 0.15
            local v35 = u11.LocalPlayer.Character
            if (v35.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or v35.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) and (u29.equipped and u29:flapWings()) then
                u30 = time() + 1
            end
        end
    end)
    u20.Client:Get("flyingBackpackFlap"):Connect(function(p36) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u29
        --]]
        if p36.player ~= u11.LocalPlayer then
            u29:flapAnimation(p36.player)
        end
    end)
end
function u25.equip(u37, p38) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u9
        [4] = u23
    --]]
    u37.uiMaid:DoCleaning()
    if not p38 or p38.itemType ~= u19.FLYING_BACKPACK then
        return nil
    end
    u37.uiMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u23, {
        ["backpack"] = p38.tool
    }))
    u37.uiMaid:GiveTask(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37.uiMaid:DoCleaning()
    end)
    u37.equipped = true
end
function u25.unequip(p39) --[[ Line: 112 ]]
    p39.uiMaid:DoCleaning()
    p39.equipped = false
end
function u25.flapWings(u40) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u11
        [3] = u8
        [4] = u14
    --]]
    if not u20.Client:Get("FlyingBackpackFlap"):CallServer() then
        return nil
    end
    u40:flapAnimation(u11.LocalPlayer)
    local v41 = u11.LocalPlayer.Character
    if v41 ~= nil then
        v41 = v41.PrimaryPart
    end
    local v42 = u11.LocalPlayer.Character
    if v42 ~= nil then
        v42 = v42:FindFirstChild("Humanoid")
    end
    local v43 = v41.AssemblyMass
    local v44 = v41.AssemblyLinearVelocity.Y * v43
    if v42 ~= nil then
        v42 = v42:GetState()
    end
    local v45 = v42 == Enum.HumanoidStateType.Landed and 0 or v44
    if v41 ~= nil then
        local v46 = v43 * 40 - v45
        v41:ApplyImpulse((Vector3.new(0, v46, 0)))
    end
    if not u40.liftBodyForce then
        local v47 = u8
        local v48 = {
            ["Name"] = "FlapWingForce"
        }
        local v49 = u14.Gravity * v43 * 0.75
        v48.Force = Vector3.new(0, v49, 0)
        v48.Parent = v41
        u40.liftBodyForce = v47("BodyForce", v48)
    end
    local u50 = u14:GetServerTimeNow()
    u40.lastJumpTime = u50
    task.delay(1.1, function() --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u40
        --]]
        if u50 == u40.lastJumpTime then
            local v51 = u40.liftBodyForce
            if v51 ~= nil then
                v51:Destroy()
            end
            u40.liftBodyForce = nil
        end
    end)
    return true
end
function u25.flapAnimation(_, p52) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u5
        [4] = u4
        [5] = u24
    --]]
    local v53 = p52.Character
    if v53 ~= nil then
        v53 = v53:FindFirstChild("flying_backpack")
        if v53 ~= nil then
            v53 = v53:WaitForChild("AnimationController", 3)
            if v53 ~= nil then
                v53 = v53:WaitForChild("Animator", 3)
            end
        end
    end
    if not v53 then
        return nil
    end
    u18:playAnimation(v53, u17.FLYING_BACKPACK_FLAP)
    local v54 = p52.Character
    if v54 ~= nil then
        v54 = v54:GetPrimaryPartCFrame().Position
    end
    local v55 = u24
    u5:playSound(u4.fromList(unpack(v55)), {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.5,
        ["position"] = v54
    })
end
v6.CreateController(u25.new())
return nil