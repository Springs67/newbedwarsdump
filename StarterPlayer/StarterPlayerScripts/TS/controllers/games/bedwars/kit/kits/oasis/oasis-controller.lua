local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "OasisController"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u16
        [4] = u15
    --]]
    u18.constructor(p22, u14.OASIS, {
        ["sounds"] = {
            u16.OASIS_HEAL_PROJECTILE_1,
            u16.OASIS_HEAL_PROJECTILE_2,
            u16.OASIS_HEAL_PROJECTILE_3,
            u16.OASIS_HEAL_PROJECTILE_4,
            u16.OASIS_BUFF_PROJECTILE_1,
            u16.OASIS_BUFF_PROJECTILE_2,
            u16.OASIS_BUFF_PROJECTILE_3,
            u16.OASIS_BUFF_PROJECTILE_4,
            u16.OASIS_SWAP_BUFF,
            u16.OASIS_SWAP_HEAL,
            u16.OASIS_WATER_VEIL_APPLY,
            u16.OASIS_WATER_VEIL_LOOP,
            u16.OASIS_CANNOT_TARGET
        }
    })
    p22.Name = "OasisController"
    p22.healVeilTargetRemote = u15.Client:Get("HealVeilTargetsSelected")
    p22.healVeilEndedEarlyRemote = u15.Client:Get("HealVeilEndedEarly")
    p22.healVeilEffectMaids = {}
end
function u19.KnitStart(u23) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
    --]]
    u18.KnitStart(u23)
    u23.healVeilTargetRemote:Connect(function(p24, p25, p26) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u23
        --]]
        local v27 = u9:GetPlayerByUserId(p24)
        if not v27 then
            return nil
        end
        local v28 = 0
        local v29 = {}
        for v30, v31 in p25 do
            local _ = v30 - 1
            local v32 = u9:GetPlayerByUserId(v31)
            if v32 ~= nil then
                v28 = v28 + 1
                v29[v28] = v32
            end
        end
        if #v29 == 0 then
            return nil
        end
        u23:playWaterVeilUserEffect(v27)
        for _, v33 in v29 do
            u23:createWaterVeilEffect(v33, p26)
        end
    end)
    u23.healVeilEndedEarlyRemote:Connect(function(p34) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v35 = u23.healVeilEffectMaids[p34]
        if v35 ~= nil then
            v35:DoCleaning()
        end
    end)
end
function u19.onKitLocalActivated(_, _) --[[ Line: 83 ]] end
function u19.onKitLocalDeactivated(_) --[[ Line: 85 ]] end
function u19.onKitReplicationActivated(_, _) --[[ Line: 87 ]] end
function u19.onKitReplicationDeactivated(_) --[[ Line: 89 ]] end
function u19.onInnateAbilityEnabled(_, _, _) --[[ Line: 91 ]] end
function u19.onAbilityUsed(_, _, _) --[[ Line: 93 ]] end
function u19.playWaterVeilUserEffect(_, p36) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u13
        [3] = u12
        [4] = u9
        [5] = u5
    --]]
    u3:playAnimation(p36, u13:getAssetId(u12.PUNCH))
    if p36 == u9.LocalPlayer then
        u5.Controllers.ViewmodelController:playAnimation(u12.FP_USE_ITEM)
    end
end
function u19.createWaterVeilEffect(p37, u38, p39) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u9
        [4] = u6
        [5] = u17
        [6] = u4
        [7] = u16
        [8] = u11
    --]]
    if not u38.Character then
        return nil
    end
    local u40 = u10.Assets.Effects.OasisWaterVeil:Clone()
    local u41 = u7.new()
    u41:GiveTask(u40)
    p37.healVeilEffectMaids[u38.UserId] = u41
    local function u45(p42) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u38
            [3] = u9
            [4] = u6
        --]]
        for v43, v44 in u40:GetDescendants() do
            local _ = v43 - 1
            if v44:IsA("ParticleEmitter") or v44:IsA("Beam") then
                if u38 ~= u9.LocalPlayer or (u6.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 or not p42) then
                    v44.Enabled = p42
                end
            end
        end
    end
    u45(false)
    u40.Parent = u38.Character
    u17:weldAccessory(u38.Character, u40)
    u45(true)
    local u46 = u7.new()
    if u38 == u9.LocalPlayer then
        local v47 = u4:playSound(u16.OASIS_WATER_VEIL_APPLY, {
            ["position"] = nil
        })
        local v48 = u4:playSound(u16.OASIS_WATER_VEIL_LOOP, {
            ["position"] = nil
        })
        u46:GiveTask(v47)
        u46:GiveTask(v48)
        u41:GiveTask(u46)
    end
    local v49 = p39 - u11:GetServerTimeNow()
    task.delay(v49, function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
            [3] = u41
        --]]
        u45(false)
        u46:DoCleaning()
        task.wait(1)
        u41:DoCleaning()
    end)
end
u5.CreateController(u19.new())
return nil