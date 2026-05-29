local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.GameQueryUtil
local u7 = v5.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u23 = v1.import(script, script.Parent.Parent, "armor-augment-controller").ArmorAugmentController
local u24 = v1.import(script, script.Parent, "cloud-energy-component").CloudEnergyComponent
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "CloudEnchantController"
    end,
    ["__index"] = u23
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
        [1] = u23
        [2] = u18
        [3] = u21
        [4] = u9
    --]]
    u23.constructor(p28, u18.CLOUD, u21.ENCHANT_CLOUD)
    p28.Name = "CloudEnchantController"
    p28.cloudMap = {}
    p28.uiMaid = u9.new()
end
function u25.KnitStart(u29) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u16
        [3] = u21
        [4] = u13
        [5] = u6
        [6] = u15
        [7] = u9
        [8] = u12
        [9] = u2
        [10] = u10
        [11] = u24
        [12] = u14
        [13] = u4
        [14] = u19
        [15] = u3
        [16] = u17
        [17] = u22
    --]]
    u23.KnitStart(u29)
    u16.StatusEffectAdded:connect(function(p30) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u13
            [3] = u6
            [4] = u15
            [5] = u29
            [6] = u9
            [7] = u12
            [8] = u2
            [9] = u10
            [10] = u24
        --]]
        if p30.statusEffect ~= u21.ENCHANT_CLOUD then
            return nil
        end
        local v31 = u13.Assets.Effects.Cloud:Clone()
        v31.Material = Enum.Material.Snow
        u6:setQueryIgnored(v31, true)
        v31.Parent = u15
        u29.cloudMap[p30.entityInstance] = {
            ["yPos"] = 0,
            ["cloudIsActive"] = false,
            ["heightLimit"] = nil,
            ["cloud"] = v31,
            ["cloudVisibleMaid"] = u9.new()
        }
        if p30.entityInstance == u12.LocalPlayer.Character then
            u29.uiMaid:DoCleaning()
            u29.uiMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10.createElement(u24, {
                ["character"] = p30.entityInstance
            }))
            u29.uiMaid:GiveTask(p30.entityInstance.AncestryChanged:Connect(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29.uiMaid:DoCleaning()
            end))
        end
    end)
    u16.StatusEffectRemoved:connect(function(p32) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u12
            [3] = u29
        --]]
        if p32.statusEffect ~= u21.ENCHANT_CLOUD then
            return nil
        end
        if p32.entityInstance == u12.LocalPlayer.Character then
            u29.uiMaid:DoCleaning()
        end
    end)
    u14.Heartbeat:Connect(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u29
            [3] = u19
            [4] = u3
            [5] = u12
            [6] = u17
            [7] = u22
        --]]
        for _, v33 in u4.entries(u29.cloudMap) do
            local v34 = v33[1]
            local v35 = v33[2]
            local v36 = v35.cloud
            local v37 = u19:getEntity(v34)
            local v38 = not v34:IsA("Model")
            if not v38 then
                local v39
                if v34 == nil then
                    v39 = v34
                else
                    v39 = v34.PrimaryPart
                end
                v38 = not (v39 and (v36.Parent and v37))
            end
            if v38 then
                v35.cloudVisibleMaid:DoCleaning()
                v35.cloud:Destroy()
                u29.cloudMap[v34] = nil
            else
                local v40 = v35.yPos
                local v41 = v34:GetPrimaryPartCFrame().Position
                if v41 then
                    local v42 = u3:getBlockPosition(v41) - Vector3.new(0, 1, 0)
                    local v43 = v41 * Vector3.new(1, 0, 1)
                    local v44 = u3:getWorldPosition(v42).Y
                    local v45 = v43 + Vector3.new(0, v44, 0)
                    local v46 = v34:GetAttribute("CloudEnergy")
                    local v47 = (v46 == nil and 0 or v46) > 0
                    local v48 = v34:GetAttribute("CloudActive") == true
                    if v34 == u12.LocalPlayer.Character then
                        v48 = u17:isAboveVoid(v37:getInstance()) and v47
                        local v49 = u22.raycastDownToClosestFloor(v34.PrimaryPart.Position)
                        if v49 and v49.Distance < 4 then
                            v35.heightLimit = nil
                        end
                    end
                    if v48 then
                        if v40 < v45.Y then
                            local v50 = Vector3.new(0, v40, 0)
                            v45 = v45 * Vector3.new(1, 0, 1) + v50
                        end
                        v36.Position = v45
                    end
                    v35.yPos = v36.Position.Y
                    if not v48 then
                        v35.yPos = v45.Y
                    end
                    if v35.cloudIsActive ~= v48 then
                        if v34 == u12.LocalPlayer.Character and (v48 and v35.heightLimit == nil) then
                            v35.heightLimit = v34.PrimaryPart.Position.Y
                        end
                        if v34 ~= u12.LocalPlayer.Character or (v35.heightLimit == nil or (not v48 or v34.PrimaryPart.Position.Y <= v35.heightLimit)) then
                            u29:setCloudEnabled(v34, v48)
                        end
                    end
                end
            end
        end
    end)
end
function u25.onArmorAugmentUpgraded(_, p51) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.Controllers.ArmorAugmentManagerController:playVoidifyEffect(p51)
end
function u25.onArmorAugmentProced(_, _, _) --[[ Line: 167 ]] end
function u25.onArmorEnchantRemoved(_, _) --[[ Line: 169 ]] end
function u25.setCloudEnabled(p52, p53, p54) --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u20
        [4] = u8
    --]]
    local v55 = p52.cloudMap[p53]
    if not v55 then
        return nil
    end
    local u56 = v55.cloud
    if u56:GetAttribute("Enabled") == p54 then
        return nil
    end
    u56:SetAttribute("Enabled", p54)
    v55.cloudIsActive = p54
    local v57 = 0
    local u58 = {}
    for v59, v60 in u56:GetChildren() do
        local _ = v59 - 1
        if v60:IsA("ParticleEmitter") == true then
            v57 = v57 + 1
            u58[v57] = v60
        end
    end
    local v61 = p53 == u12.LocalPlayer.Character
    if v61 or u56.Position then
        local v62 = u7
        local v63
        if p54 then
            v63 = u20.CLOUD_ENCHANT_SPAWN
        else
            v63 = u20.CLOUD_ENCHANT_DESPAWN
        end
        local v64 = {}
        local v65
        if v61 then
            v65 = nil
        else
            v65 = u56.Position
        end
        v64.position = v65
        v62:playSound(v63, v64)
    end
    if not p54 then
        v55.cloudVisibleMaid:DoCleaning()
        return nil
    end
    local v66 = u7
    local v67 = u20.CLOUD_ENCHANT_LOOP
    local v68 = {}
    local v69
    if v61 then
        v69 = nil
    else
        v69 = u56
    end
    v68.parent = v69
    local u70 = v66:playSound(v67, v68)
    v55.cloudVisibleMaid:GiveTask(function() --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        local v71 = u70
        if v71 ~= nil then
            v71:Stop()
        end
        local v72 = u70
        if v72 ~= nil then
            v72:Destroy()
        end
    end)
    u56.CanCollide = v61
    for v73, v74 in u58 do
        local _ = v73 - 1
        v74.Enabled = true
        local _ = v74.Enabled
    end
    v55.cloudVisibleMaid:GiveTask(function() --[[ Line: 231 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u58
        --]]
        u56.CanCollide = false
        for v75, v76 in u58 do
            local _ = v75 - 1
            v76.Enabled = false
            local _ = v76.Enabled
        end
    end)
    if v61 then
        v55.cloudVisibleMaid:GiveTask(u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = 1.2
        }))
    end
end
u8.CreateController(u25.new())
return nil