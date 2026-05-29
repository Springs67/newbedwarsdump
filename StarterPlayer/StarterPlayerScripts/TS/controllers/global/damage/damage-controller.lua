local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network")
local u6 = v5.EntityDamageEventZap
local u7 = v5.EntityHealEventZap
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "heal-type").HealType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent.Parent, "effect", "vignette", "vignette-meta").VignetteType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "DamageController"
    end,
    ["__index"] = u4
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p15)
    p15.Name = "DamageController"
end
function u12.KnitStart(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u3
        [4] = u8
        [5] = u2
        [6] = u11
        [7] = u6
    --]]
    u7.On(function(p16, _, p17, p18) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u8
            [4] = u2
            [5] = u11
        --]]
        if p18 then
            return nil
        end
        if p16.PrimaryPart then
            local v19 = u9:getPlayerFromEntityInstance(p16)
            if not v19 then
                return nil
            end
            if v19 ~= u3.LocalPlayer then
                return nil
            end
            if p17 == u8.REGEN then
                return nil
            end
            u2.Controllers.VignetteController:createVignette(u11.HEAL)
            task.delay(0.5, function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u11
                --]]
                u2.Controllers.VignetteController:destroyVignette(u11.HEAL)
            end)
        end
    end)
    u6.On(function(_, _, _, p20) --[[ Line: 54 ]]
        if p20 then
            return nil
        end
    end)
end
function u12.requestSelfDeath(_, p21) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.Client:Get("RequestSelfDeath"):SendToServer({
        ["damageType"] = p21
    })
end
return {
    ["DamageController"] = u2.CreateController(u12.new())
}