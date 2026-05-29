local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v4.ReplicatedStorage
local u8 = v4.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SoakedController"
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
        [2] = u3
    --]]
    u11.constructor(p18)
    p18.Name = "SoakedController"
    p18.maid = u3.new()
    p18.isPlaying = false
    p18.entityInstanceMaid = {}
end
function u15.KnitStart(u19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u14
        [4] = u12
        [5] = u6
        [6] = u2
        [7] = u10
        [8] = u13
    --]]
    u11.KnitStart(u19)
    u9.StatusEffectAdded:connect(function(p20) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u12
            [3] = u19
            [4] = u6
            [5] = u2
            [6] = u10
        --]]
        if p20.statusEffect ~= u14.SOAKED then
            return nil
        end
        local v21 = u12:getPlayerFromEntityInstance(p20.entityInstance)
        u19.entityInstanceMaid[p20.entityInstance] = u19:setEffectsOnCharacter(p20.entityInstance)
        if v21 == u6.LocalPlayer and u19.isPlaying == false then
            u2.Controllers.VignetteController:createVignette(u10.SOAKED)
            u19.maid:GiveTask(function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                --]]
                u2.Controllers.VignetteController:destroyVignette(u10.SOAKED)
            end)
            u19.isPlaying = true
        end
    end)
    u9.StatusEffectRemoved:connect(function(p22) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u19
            [3] = u6
            [4] = u14
        --]]
        local v23 = u12:getPlayerFromEntityInstance(p22.entityInstance)
        local v24 = u19.entityInstanceMaid[p22.entityInstance]
        if v24 then
            v24:DoCleaning()
            u19.entityInstanceMaid[p22.entityInstance] = nil
        end
        if v23 == u6.LocalPlayer and p22.statusEffect == u14.SOAKED then
            u19:cleanUpEffect()
        end
    end)
    u13.Client:Get("EntityDeathEvent"):Connect(function(p25) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u19
        --]]
        if u6:GetPlayerFromCharacter(p25.entityInstance) == u6.LocalPlayer then
            u19:cleanUpEffect()
        end
    end)
end
function u15.cleanUpEffect(p26) --[[ Line: 79 ]]
    p26.isPlaying = false
    p26.maid:DoCleaning()
end
function u15.setEffectsOnCharacter(_, p27) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u8
        [4] = u6
        [5] = u5
    --]]
    local v28 = u3.new()
    local v29 = u7.Assets.Effects.SoakedEffect:Clone()
    v29.Parent = u8
    for v30, v31 in {
        p27.UpperTorso,
        p27.Head,
        p27.LeftUpperArm,
        p27.RightUpperArm
    } do
        local _ = v30 - 1
        local v32 = v29.Droplets:Clone()
        v32.Parent = v31
        if p27 == u6.LocalPlayer.Character then
            u5:AddTag(v32, "FirstPersonHidden")
        end
        v28:GiveTask(v32)
    end
    local u33 = {}
    for v34, v35 in p27:GetDescendants() do
        local _ = v34 - 1
        if v35:IsA("MeshPart") then
            u33[v35] = v35.Material
            v35.Material = Enum.Material.Glass
        end
    end
    v28:GiveTask(function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        for v36, v37 in u33 do
            v36.Material = v37
        end
    end)
    return v28
end
u2.CreateController(u15.new())
return nil