local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Players
local u6 = v3.ReplicatedStorage
local u7 = v1.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "HealingController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13)
    p13.Name = "HealingController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u9
        [4] = u7
        [5] = u5
        [6] = u6
        [7] = u4
    --]]
    u8.KnitStart(p14)
    local v15 = u2.Controllers.StatusEffectController
    local v16 = u9.HEAL_OVER_TIME
    local u17 = u7
    local u18 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
            return "Anonymous"
        end,
        ["__index"] = u17
    })
    u18.__index = u18
    function u18.new(...) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v19 = u18
        local v20 = setmetatable({}, v19)
        return v20:constructor(...) or v20
    end
    function u18.constructor(p21, ...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.constructor(p21, ...)
    end
    function u18.onApply(p22, p23, _) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
        --]]
        if p23.PrimaryPart == nil then
            return nil
        end
        local v24 = p23 == u5.LocalPlayer.Character
        local v25 = p23:FindFirstChild("UpperTorso")
        if not v25 then
            return nil
        end
        local u26 = {}
        for _, v27 in u6.Assets.Effects.Healing:GetChildren() do
            local v28 = v27:Clone()
            v28.Parent = v25
            if v24 and (v28:IsA("ParticleEmitter") or v28:IsA("Beam")) then
                u4:AddTag(v28, "FirstPersonHidden")
            end
            table.insert(u26, v28)
        end
        p22.maid:GiveTask(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            local v29 = u26
            local function v31(u30) --[[ Line: 74 ]]
                if u30:IsA("ParticleEmitter") then
                    u30.Enabled = false
                    task.delay(3, function() --[[ Line: 77 ]]
                        --[[
                        Upvalues:
                            [1] = u30
                        --]]
                        u30:Destroy()
                    end)
                else
                    u30:Destroy()
                end
            end
            for v32, v33 in v29 do
                v31(v33, v32 - 1, v29)
            end
        end)
    end
    function u18.onRemove(_, _, _) --[[ Line: 89 ]] end
    v15:setHandler(v16, u18)
end
u2.CreateController(u10.new())
return nil