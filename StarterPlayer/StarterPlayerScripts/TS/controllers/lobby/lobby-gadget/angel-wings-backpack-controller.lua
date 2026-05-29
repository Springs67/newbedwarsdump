local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v2.WatchPlayer
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "angel-wings", "angel-wings-types")
local u21 = v20.AngelWingsColors
local u22 = v20.AngelWingsTypes
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = { v25.XUROT_FLAP_WING_1, v25.XUROT_FLAP_WING_2 }
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "AngelWingsBackpackController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p30)
    p30.Name = "AngelWingsBackpackController"
    p30.playerMaid = {}
    p30.hasAngelWings = false
end
function u27.KnitStart(u31) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u19
        [4] = u17
        [5] = u26
        [6] = u6
        [7] = u24
        [8] = u23
        [9] = u13
        [10] = u15
    --]]
    u16.KnitStart(u31)
    u8.Controllers.PreloadController:preloadForItemType(u19.ANGEL_WINGS, {
        ["animations"] = { u17.ANGEL_WINGS_PLAYER_FLY, u17.ANGEL_WINGS_PLAYER_IDLE, u17.ANGEL_WINGS_WINGS_IDLE },
        ["sounds"] = u26
    })
    u6(function(u32, p33) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u24
            [3] = u23
            [4] = u13
            [5] = u19
            [6] = u15
        --]]
        if u32:GetAttribute("LobbyGadgetType") == u23.ANGEL_WINGS then
            local v34 = u24.Client:Get("RequestAngelWingsEffectType"):CallServer(u32)
            if not u31.hasAngelWings then
                u31.hasAngelWings = true
                u24.Client:Get("RequestAngelWingsEffect"):SendToServer(true)
            end
            u31:equip(u32, v34)
        end
        if u32 == u13.LocalPlayer then
            p33:GiveTask(u32:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u19
                    [3] = u31
                    [4] = u24
                --]]
                if u32:GetAttribute("LobbyGadgetType") ~= u19.ANGEL_WINGS then
                    if not u31.hasAngelWings then
                        return
                    end
                    u31.hasAngelWings = false
                    u24.Client:Get("RequestAngelWingsEffect"):SendToServer(false)
                end
            end))
            u15.BackpackEquipEvent:connect(function(u35) --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u31
                    [3] = u24
                --]]
                task.spawn(function() --[[ Line: 79 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u19
                        [3] = u31
                        [4] = u24
                    --]]
                    local v36 = u35.item == u19.ANGEL_WINGS
                    if v36 and u31.hasAngelWings then
                        return
                    elseif v36 or u31.hasAngelWings then
                        u31.hasAngelWings = v36
                        u24.Client:Get("RequestAngelWingsEffect"):SendToServer(v36)
                    end
                end)
            end)
        end
    end)
    u24.Client:Get("AngelWingsEffect"):Connect(function(p37, p38, p39) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        if p38 then
            u31:unequip(p37)
            u31:equip(p37, p39)
        else
            u31:unequip(p37)
        end
    end)
end
function u27.equip(u40, u41, p42) --[[ Line: 94 ]]
    u40:equipCharacter(u41.Character, p42):andThen(function(p43) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u41
        --]]
        u40.playerMaid[u41.UserId] = p43
    end)
end
function u27.equipCharacter(_, u44, u45, u46) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u19
        [3] = u21
        [4] = u10
        [5] = u9
        [6] = u11
        [7] = u18
        [8] = u17
        [9] = u5
        [10] = u4
        [11] = u26
        [12] = u3
    --]]
    return u1.Promise.new(function(p47, _) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u19
            [3] = u21
            [4] = u45
            [5] = u10
            [6] = u46
            [7] = u9
            [8] = u11
            [9] = u18
            [10] = u17
            [11] = u5
            [12] = u4
            [13] = u26
            [14] = u3
        --]]
        local u48 = u44
        if u48 ~= nil then
            u48 = u48:WaitForChild(u19.ANGEL_WINGS, 5)
        end
        if not u48 then
            return nil
        end
        local v49 = u21[u45]
        for v50, v51 in u48:GetDescendants() do
            local _ = v50 - 1
            if v51:IsA("BasePart") then
                v51.Color = v49.neonColor
            elseif v51:IsA("Decal") then
                v51.Color3 = v49.wingsDecalColor
            end
        end
        local v52 = u10.new()
        local u53 = u44
        if u53 ~= nil then
            u53 = u53:WaitForChild("Humanoid")
        end
        local u54 = u44
        if u54 ~= nil then
            u54 = u54.PrimaryPart
        end
        if not (u54 and u53) then
            return nil
        end
        if not u46 then
            u9.Controllers.FancyExplosionController:createExplosion({
                ["radius"] = 20,
                ["randomSizeOffset"] = 0,
                ["randomPositionOffset"] = 0,
                ["inDuration"] = 0.5,
                ["outDuration"] = 1,
                ["position"] = u54.Position,
                ["model"] = v49.ExplosionEffect
            })
        end
        local v55 = v49.EffectModel:Clone()
        v55:PivotTo(u54.CFrame)
        v55.Parent = u54
        u11("WeldConstraint", {
            ["Enabled"] = true,
            ["Part0"] = v55.EffectPart,
            ["Part1"] = u54,
            ["Parent"] = v55
        })
        v52:GiveTask(v55)
        local v56 = u48.Handle.rig.AnimationController.Animator
        if not v56 then
            v52:DoCleaning()
            return nil
        end
        local v57 = u18:playAnimation(v56, u17.ANGEL_WINGS_WINGS_IDLE, {
            ["looped"] = true
        })
        if v57 then
            v52:GiveTask(v57:GetMarkerReachedSignal("flap"):Connect(function(_) --[[ Line: 168 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u4
                    [3] = u26
                    [4] = u54
                    [5] = u48
                --]]
                local v58 = u26
                u5:playSound(u4.fromList(unpack(v58)), {
                    ["volumeMultiplier"] = 0.1,
                    ["rollOffMaxDistance"] = 10,
                    ["position"] = u54.Position,
                    ["parent"] = u48
                })
            end))
            v52:GiveTask(v57)
        end
        local u59 = false
        local u60 = nil
        local function u66() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u59
                [3] = u60
                [4] = u3
                [5] = u44
                [6] = u18
                [7] = u17
            --]]
            if u53.MoveDirection.Magnitude > 0 and (u53:GetState() == Enum.HumanoidStateType.Running or (u53:GetState() == Enum.HumanoidStateType.Freefall or u53:GetState() == Enum.HumanoidStateType.Jumping)) and not u59 then
                local v61 = u60
                if v61 ~= nil then
                    v61:Stop()
                end
                local v62 = u60
                if v62 ~= nil then
                    v62:Destroy()
                end
                u60 = u3:playAnimation(u44, u18:getAssetId(u17.ANGEL_WINGS_PLAYER_FLY))
                local v63 = u60
                if v63 ~= nil then
                    v63:AdjustSpeed(2)
                end
                u59 = true
            end
            if u53.MoveDirection.Magnitude == 0 and (u53:GetState() == Enum.HumanoidStateType.Running or (u53:GetState() == Enum.HumanoidStateType.Freefall or u53:GetState() == Enum.HumanoidStateType.Jumping)) then
                u59 = false
                local v64 = u60
                if v64 ~= nil then
                    v64:Stop()
                end
                local v65 = u60
                if v65 ~= nil then
                    v65:Destroy()
                end
                u60 = u3:playAnimation(u44, u18:getAssetId(u17.ANGEL_WINGS_PLAYER_IDLE))
            end
        end
        u66()
        v52:GiveTask(u53:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u66
            --]]
            u66()
        end))
        v52:GiveTask(function() --[[ Line: 214 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            local v67 = u60
            if v67 ~= nil then
                v67:Stop()
            end
            local v68 = u60
            if v68 ~= nil then
                v68:Destroy()
            end
        end)
        p47(v52)
    end)
end
function u27.unequip(p69, p70) --[[ Line: 227 ]]
    local v71 = p69.playerMaid[p70.UserId]
    if v71 ~= nil then
        v71:DoCleaning()
    end
end
function u27.getAngelWingType(_) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u22
    --]]
    if u14:IsStudio() or not u8.Controllers.PermissionController:isStaffMember() then
        local v72 = u8.Controllers.MilestonesController:getMilestoneRewardsClaimed()
        if v72 ~= nil then
            v72 = table.find(v72, "CyanAngelWings") ~= nil
        end
        if v72 then
            return u22.CYAN
        else
            return u22.LIGHT
        end
    else
        return u22.DARK
    end
end
u8.CreateController(u27.new())
return nil