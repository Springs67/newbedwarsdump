local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "dagger-util").isDagger
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "DaggerController"
    end,
    ["__index"] = u7
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p19)
    p19.Name = "DaggerController"
    p19.isHolding = false
end
function u16.isRelevantItem(_, p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return u12(p20.itemType)
end
function u16.onEnable(p21, _, _) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
    --]]
    p21.isHolding = true
    local v22 = u5.LocalPlayer:GetAttribute("DaggerCoolDown")
    if v22 == 0 or (v22 ~= v22 or (v22 == "" or not v22)) then
        p21:enableInticator()
    end
    p21:setupDestroyableYield(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u8.DAGGER_DASH, nil):expect()
    end)
end
function u16.onDisable(p23) --[[ Line: 49 ]]
    p23.isHolding = false
    p23:disableIndicator()
end
function u16.KnitStart(u24) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u9
        [4] = u13
        [5] = u5
        [6] = u6
        [7] = u12
        [8] = u11
        [9] = u15
        [10] = u14
        [11] = u10
    --]]
    u7.KnitStart(u24)
    u4.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u9.DAGGER_SWING_1,
            u9.DAGGER_SWING_2,
            u9.DAGGER_SWING_FP,
            u9.DAGGER_SWING_2_FP
        },
        ["sounds"] = {
            u13.DAGGER_SWING_1,
            u13.DAGGER_SWING_2,
            u13.DAGGER_SWING_3,
            u13.DAGGER_SWING_4,
            u13.DAGGER_READY
        }
    })
    u5.LocalPlayer:GetAttributeChangedSignal("DaggerCoolDown"):Connect(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u24
        --]]
        local v25 = u5.LocalPlayer:GetAttribute("DaggerCoolDown")
        if v25 == 0 or v25 ~= v25 then
            v25 = false
        elseif v25 == "" then
            v25 = false
        end
        local v26 = not v25
        if v26 then
            v26 = u24.isHolding
        end
        if v26 then
            u24:enableInticator()
        else
            local v27 = u5.LocalPlayer:GetAttribute("DaggerCoolDown")
            if v27 ~= 0 and (v27 == v27 and (v27 ~= "" and v27)) then
                u24:disableIndicator()
            end
        end
    end)
    u6.BeforeSwordSwing:connect(function(p28) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u11
            [4] = u15
            [5] = u14
            [6] = u10
        --]]
        if not u12(p28.swordType) then
            return nil
        end
        local v29 = u5.LocalPlayer:GetAttribute("DaggerCoolDown")
        if v29 ~= 0 and (v29 == v29 and (v29 ~= "" and v29)) then
            return nil
        end
        local v30 = u11:getLocalPlayerEntity()
        if not v30 or u15:isActive(v30:getInstance(), u14.GROUNDED) then
            return nil
        end
        if not v30 or u15:isActive(v30:getInstance(), u14.FROSTED) then
            return nil
        end
        local v31 = p28.weaponMetaClone
        if v31 ~= nil then
            v31 = v31.sword
            if v31 ~= nil then
                v31 = v31.attackRange
            end
        end
        if v31 ~= 0 and (v31 == v31 and v31) then
            p28.weaponMetaClone.sword.attackRange = 6.5 * u10
        end
    end)
end
function u16.enableInticator(_) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u12
        [4] = u3
        [5] = u13
    --]]
    local v32 = u11:getEntity(u5.LocalPlayer)
    if v32 ~= nil then
        v32 = v32:getHandItemInstanceFromCharacter()
    end
    if v32 and u12(v32.Name) then
        local v33 = v32:FindFirstChild("Handle")
        if v33 ~= nil then
            v33 = v33:FindFirstChild("Pulse")
        end
        if v33 then
            v33:Emit(1)
            u3:playSound(u13.DAGGER_READY)
        end
    end
end
function u16.disableIndicator(_) --[[ Line: 132 ]] end
u4.CreateController(u16.new())
return nil