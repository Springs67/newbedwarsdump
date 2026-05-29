local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "GlitchedItemEffectController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "GlitchedItemEffectController"
end
function u10.KnitStart(u14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u8
    --]]
    u7.KnitStart(u14)
    u6.EntityChangeHeldItem:connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
        --]]
        if not p15.entity then
            return nil
        end
        local v16 = p15.item
        if v16 ~= nil then
            v16 = v16.Name
        end
        if not v16 then
            return nil
        end
        if u8(v16).glitched then
            u14:playGlitchParticlesOnHand(p15.entity:getInstance())
        end
    end)
end
function u10.playGlitchParticlesOnHand(_, u17, _, _) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u9
    --]]
    task.spawn(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
            [3] = u17
            [4] = u9
        --]]
        local v18 = u4.Assets.Effects.GlitchedItemEffect:Clone()
        v18.Name = "GlitchEffectHand"
        v18.Parent = u5
        v18.Transparency = 1
        task.wait(0.3)
        local v19 = u17.RightHand.Position
        v18.CFrame = CFrame.new(v19)
        u9:playEffects({ v18 }, nil, {
            ["destroyAfterSec"] = 1.5
        })
    end)
end
v2.CreateController(u10.new())
return nil