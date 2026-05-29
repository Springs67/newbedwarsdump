local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Debris
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "GlitchEffectsController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p19)
    p19.Name = "GlitchEffectsController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u10
        [4] = u11
        [5] = u3
        [6] = u7
        [7] = u9
        [8] = u5
        [9] = u4
        [10] = u14
    --]]
    u12.KnitStart(p20)
    u13.Client:WaitFor("GlitchExplosion"):andThen(function(p21) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u3
            [4] = u7
            [5] = u9
        --]]
        p21:Connect(function(p22) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u11
                [3] = u3
                [4] = u7
                [5] = u9
            --]]
            local v23 = u10.Assets.Effects.GlitchExplosion:Clone()
            v23.Position = p22.position
            v23.Parent = u11
            u3:setQueryIgnored(v23, true)
            u7(v23, p22.scale)
            for v24, v25 in v23:GetDescendants() do
                local _ = v24 - 1
                if v25:IsA("ParticleEmitter") then
                    v25:Emit(p22.numberParticles)
                end
            end
            u9:AddItem(v23, p22.duration)
        end)
    end)
    u13.Client:Get("GlitchedExplodeEffect"):Connect(function(p26) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u14
        --]]
        local v27 = p26.entity
        u5.Controllers.GlitchEffectsController:playGlitchExplosion(v27:GetPivot().Position, {
            ["entityTarget"] = p26.entity,
            ["effectConfig"] = {
                ["sizeMultiplier"] = 0.5
            }
        })
        u4:playSound(u14.GLITCH_AMBIENT_1, {
            ["rollOffMaxDistance"] = 30,
            ["parent"] = v27,
            ["position"] = v27:GetPivot().Position
        })
    end)
end
function u16.playGlitchExplosion(_, p28, u29) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u11
        [4] = u4
        [5] = u14
        [6] = u15
    --]]
    local v30 = u6.new()
    local u31 = u10.Assets.Effects.GlitchExplosion:Clone()
    u31.Position = p28
    local v32
    if u29 == nil then
        v32 = u29
    else
        v32 = u29.parent
    end
    if v32 == nil then
        v32 = u11
    end
    u31.Parent = v32
    local v33
    if u29 == nil then
        v33 = u29
    else
        v33 = u29.disableSound
    end
    if not v33 then
        local v34 = u4
        local v35 = u14.GLITCHED_LUCKY_BLOCK_TELEPORT
        local v36 = {
            ["rollOffMaxDistance"] = 30,
            ["position"] = p28
        }
        local v37
        if u29 == nil then
            v37 = u29
        else
            v37 = u29.entityTarget
        end
        if v37 == nil then
            if u29 == nil then
                v37 = u29
            else
                v37 = u29.parent
            end
        end
        v36.parent = v37
        v34:playSound(v35, v36)
    end
    local v38
    if u29 == nil then
        v38 = u29
    else
        v38 = u29.loopConfig
        if v38 ~= nil then
            v38 = v38.looped
        end
    end
    if v38 then
        local v39 = 0
        local u40 = true
        local v41 = u15
        local v42 = { u31 }
        local v43
        if u29 == nil then
            v43 = u29
        else
            v43 = u29.entityTarget
        end
        local v44 = {}
        local v45
        if u29 == nil then
            v45 = u29
        else
            v45 = u29.effectConfig
        end
        if type(v45) == "table" then
            for v46, v47 in v45 do
                v44[v46] = v47
            end
        end
        v41:playEffects(v42, v43, v44)
        local u48 = v39 + 1
        task.spawn(function() --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u31
                [3] = u40
                [4] = u29
                [5] = u48
            --]]
            task.delay(0.5, function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u31
                    [3] = u40
                    [4] = u29
                    [5] = u48
                --]]
                while true do
                    local v49 = u40
                    if v49 then
                        local v50 = task
                        local v51 = u29.loopConfig
                        if v51 ~= nil then
                            v51 = v51.loopDelay
                        end
                        v49 = v50.wait(v51)
                    end
                    if v49 == 0 or (v49 ~= v49 or not v49) then
                        return
                    end
                    local v52 = u29.loopConfig
                    if v52 ~= nil then
                        v52 = v52.numLoops
                    end
                    if v52 ~= 0 and (v52 == v52 and v52) then
                        local v53 = u48
                        local v54 = u29.loopConfig
                        if v54 ~= nil then
                            v54 = v54.numLoops
                        end
                        v52 = v54 <= v53
                    end
                    if v52 ~= 0 and (v52 == v52 and v52) then
                        u40 = false
                        return
                    end
                    u15:disableEffects({ u31 })
                    u48 = u48 + 1
                end
            end)
        end)
        v30:GiveTask(function() --[[ Line: 186 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40 = false
        end)
    else
        local v55 = u15
        local v56 = { u31 }
        local v57
        if u29 == nil then
            v57 = u29
        else
            v57 = u29.entityTarget
        end
        local v58 = {
            ["destroyAfterSec"] = 0.5
        }
        if u29 ~= nil then
            u29 = u29.effectConfig
        end
        if type(u29) == "table" then
            for v59, v60 in u29 do
                v58[v59] = v60
            end
        end
        v55:playEffects(v56, v57, v58)
    end
    v30:GiveTask(u31)
    return v30
end
u5.CreateController(u16.new())
return nil