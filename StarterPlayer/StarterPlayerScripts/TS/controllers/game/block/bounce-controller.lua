local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BounceController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13, ...)
    p13.Name = "BounceController"
end
function u10.KnitStart(_) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u5
        [4] = u9
        [5] = u2
    --]]
    u7.GroundTouch:connect(function(p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u9
            [4] = u2
        --]]
        local v15 = u6.LocalPlayer.Character
        local v16 = nil
        if p14.landingBlock then
            if u5:HasTag(p14.landingBlock, "launch-pad") then
                return nil
            end
            local v17 = u9(p14.landingBlock.Name).block
            if v17 and (v17.elasticity and v15.PrimaryPart) then
                v16 = v17.elasticity
            end
        end
        local v18
        if v16 then
            v18 = v16.bounceSound
        else
            v18 = v16
        end
        if v18 ~= "" and v18 then
            local v19 = u2
            local v20 = v16.bounceSound
            local v21 = {}
            local v22 = p14.velocity.Y / 113
            v21.volumeMultiplier = math.min(v22, 1) * 0.8 + 0.2
            v19:playSound(v20, v21)
        end
        if v16 ~= nil then
            v16 = v16.elasticityPercent
        end
        local v23 = -((v16 == nil and 0 or v16) + 0)
        local v24 = p14.velocity.Y * v15.PrimaryPart.AssemblyMass * v23
        if v24 > 0 then
            local u25 = Vector3.new(0, v24, 0)
            task.delay(0.1, function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u25
                --]]
                local v26 = u6.LocalPlayer.Character
                if v26 ~= nil then
                    local v27 = v26.PrimaryPart
                    if v27 ~= nil then
                        v27:ApplyImpulse(u25)
                    end
                end
            end)
        end
    end)
end
return {
    ["BounceController"] = v3.CreateController(u10.new())
}