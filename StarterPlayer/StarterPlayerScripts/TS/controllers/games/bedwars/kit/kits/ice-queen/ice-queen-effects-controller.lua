local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "IceQueenEffectsController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "IceQueenEffectsController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u11
        [4] = u8
        [5] = u5
        [6] = u12
        [7] = u7
        [8] = u2
        [9] = u14
        [10] = u9
    --]]
    u10.KnitStart(p19)
    u13.Client:OnEvent("IceQueenFreeze", function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u5
            [4] = u12
            [5] = u7
            [6] = u2
            [7] = u14
        --]]
        local v21 = u11:getEntity(p20.to)
        local v22 = v21 and v21:getInstance():FindFirstChild("HumanoidRootPart")
        if v22 then
            local v23 = u8.Assets.Effects.IceQueenFreezeParticles
            local v24 = u12[u5.Controllers.KitSkinController:getKitSkin(p20.from)].freiya
            local v25
            if v24 == nil then
                v25 = v24
            else
                v25 = v24.effects
                if v25 ~= nil then
                    v25 = v25.maxStacks
                end
            end
            if v25 then
                if v24 ~= nil then
                    v24 = v24.effects
                    if v24 ~= nil then
                        v24 = v24.maxStacks
                    end
                end
            else
                v24 = v23
            end
            for _, u26 in v24:Clone():GetChildren() do
                if u26:IsA("ParticleEmitter") then
                    u26.Parent = v22
                    u26.Enabled = false
                    u26:Emit(p20.strong and 20 or 15)
                    task.delay(5, function() --[[ Line: 68 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        u26:Destroy()
                    end)
                end
            end
            local v27 = u7.LocalPlayer.Character == p20.to
            local v28 = u2
            local v29
            if p20.strong then
                v29 = u14.FREIYA_STRONG_PROC
            else
                v29 = u14.FREIYA_PROC
            end
            local v30 = {}
            local v31
            if v27 then
                v31 = nil
            else
                v31 = p20.to.PrimaryPart
                if v31 ~= nil then
                    v31 = v31.Position
                end
            end
            v30.position = v31
            local v32
            if v27 then
                v32 = nil
            else
                v32 = p20.to.PrimaryPart
            end
            v30.parent = v32
            v28:playSound(v29, v30)
        end
    end)
    u13.Client:Get("IceQueenAbilityEffect"):Connect(function(p33) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u5
            [4] = u12
            [5] = u9
            [6] = u2
        --]]
        local v34 = u8.Assets.Effects.FrostBiteExplode
        local v35 = u14.FREYA_EXPLOSION
        local v36 = p33.user.Character
        local v37
        if v36 then
            v37 = u12[u5.Controllers.KitSkinController:getKitSkin(v36)].freiya
            local v38
            if v37 == nil then
                v38 = v37
            else
                v38 = v37.effects
                if v38 ~= nil then
                    v38 = v38.explode
                end
            end
            if v38 then
                if v37 == nil then
                    v34 = v37
                else
                    v34 = v37.effects
                    if v34 ~= nil then
                        v34 = v34.explode
                    end
                end
            end
            local v39
            if v37 == nil then
                v39 = v37
            else
                v39 = v37.explodeSound
            end
            if v39 == "" or not v39 then
                v37 = v35
            elseif v37 ~= nil then
                v37 = v37.explodeSound
            end
        else
            v37 = v35
        end
        local v40 = p33.victim
        if v40 ~= nil then
            v40 = v40.PrimaryPart
            if v40 ~= nil then
                v40 = v40.Position
            end
        end
        if not v40 then
            return nil
        end
        local u41 = v34:Clone()
        u41.Anchored = true
        u41.Position = v40
        u41.Parent = u9
        local v42 = u41:WaitForChild("CrackAttachment", 1)
        if v42 ~= nil then
            v42 = v42:WaitForChild("Crack")
        end
        if p33.stacks >= 4 then
            v42:Emit(1)
        end
        local v43 = u41:WaitForChild("Attachment", 1)
        if v43 ~= nil then
            for v44, v45 in v43:GetChildren() do
                local _ = v44 - 1
                if v45:IsA("ParticleEmitter") then
                    v45:Emit(p33.stacks * 10)
                end
            end
        end
        u2:playSound(v37, {
            ["position"] = v40
        })
        task.delay(1, function() --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41:Destroy()
        end)
    end)
end
function u15.getAttackerKitSkin(_, p46) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    local v47 = p46:GetAttribute("IceQueenAttackerId")
    if v47 == 0 or (v47 ~= v47 or not v47) then
        return nil
    else
        local v48 = u7:GetPlayerByUserId(v47)
        if v48 ~= nil then
            v48 = v48.Character
        end
        if v48 then
            return u5.Controllers.KitSkinController:getKitSkin(v48)
        else
            return nil
        end
    end
end
v4.CreateController(u15.new())
return nil