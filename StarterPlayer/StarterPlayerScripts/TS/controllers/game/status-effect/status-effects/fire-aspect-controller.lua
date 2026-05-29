local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v4.ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "FireAspectController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "FireAspectController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u12
        [4] = u8
        [5] = u6
        [6] = u7
        [7] = u5
        [8] = u2
        [9] = u11
        [10] = u10
    --]]
    u9.KnitStart(p17)
    local v18 = u3.Controllers.StatusEffectController
    local v19 = u12.BURN
    local u20 = u8
    local u21 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
            return "Anonymous"
        end,
        ["__index"] = u20
    })
    u21.__index = u21
    function u21.new(...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        local v22 = u21
        local v23 = setmetatable({}, v22)
        return v23:constructor(...) or v23
    end
    function u21.constructor(p24, ...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20.constructor(p24, ...)
    end
    function u21.onApply(p25, u26, _) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
            [3] = u5
            [4] = u2
            [5] = u11
        --]]
        if u26.PrimaryPart == nil then
            return nil
        end
        local v27 = u26 == u6.LocalPlayer.Character
        local v28 = u26:FindFirstChild("UpperTorso")
        if not v28 then
            return nil
        end
        local v29 = u26:GetAttribute("BurnStrength")
        local u30 = v29 == nil and 1 or v29
        local u31 = {}
        for _, v32 in u7.Assets.Effects.Burn:GetChildren() do
            local u33 = v32:Clone()
            u33.Parent = v28
            if u33:IsA("ParticleEmitter") then
                u33.Rate = u30 * 15
            end
            p25.maid:GiveTask(u26:GetAttributeChangedSignal("BurnStrength"):Connect(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u26
                    [3] = u30
                --]]
                if not u33:IsA("ParticleEmitter") then
                    return nil
                end
                local v34 = u26:GetAttribute("BurnStrength")
                u30 = v34 == nil and 1 or v34
                u33.Rate = u30 * 10
            end))
            if v27 and (u33:IsA("ParticleEmitter") or u33:IsA("Beam")) then
                u5:AddTag(u33, "FirstPersonHidden")
            end
            table.insert(u31, u33)
        end
        local v35 = u2
        local v36 = u11.BURN_LOOP
        local v37 = {
            ["looped"] = true
        }
        local v38
        if v27 then
            v38 = nil
        else
            v38 = u26.PrimaryPart.Position
        end
        v37.position = v38
        local v39
        if v27 then
            v39 = nil
        else
            v39 = u26.PrimaryPart
        end
        v37.parent = v39
        local u40 = v35:playSound(v36, v37)
        p25.maid:GiveTask(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u31
            --]]
            local v41 = u40
            if v41 ~= nil then
                v41:Stop()
            end
            local v42 = u31
            local function v44(u43) --[[ Line: 107 ]]
                if u43:IsA("ParticleEmitter") then
                    u43.Enabled = false
                    task.delay(3, function() --[[ Line: 110 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                        --]]
                        u43:Destroy()
                    end)
                else
                    u43:Destroy()
                end
            end
            for v45, v46 in v42 do
                v44(v46, v45 - 1, v42)
            end
        end)
    end
    function u21.onRemove(_, _, _) --[[ Line: 122 ]] end
    v18:setHandler(v19, u21)
    u10.Client:OnEvent("FireAspectHit", function(p47, _) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u11
            [4] = u7
        --]]
        if p47.PrimaryPart == nil then
            return nil
        end
        local v48 = p47 == u6.LocalPlayer.Character
        local v49 = u2
        local v50 = u11.BURN_HIT
        local v51 = {}
        local v52
        if v48 then
            v52 = nil
        else
            v52 = p47.PrimaryPart.Position
        end
        v51.position = v52
        local v53
        if v48 then
            v53 = nil
        else
            v53 = p47.PrimaryPart
        end
        v51.parent = v53
        v49:playSound(v50, v51)
        local v54 = p47:FindFirstChild("UpperTorso")
        if not v54 then
            return nil
        end
        local v55 = u2
        local v56 = u11.BURN_HIT
        local v57 = {}
        local v58
        if v48 then
            v58 = nil
        else
            v58 = v54.Position
        end
        v57.position = v58
        v55:playSound(v56, v57)
        local u59 = {}
        for _, v60 in u7.Assets.Effects.FireHit:Clone():GetChildren() do
            v60.Parent = v54
            table.insert(u59, v60)
        end
        task.delay(5, function() --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u59
            --]]
            for v61, v62 in u59 do
                local _ = v61 - 1
                v62:Destroy()
            end
        end)
    end)
end
u3.CreateController(u13.new())
return nil