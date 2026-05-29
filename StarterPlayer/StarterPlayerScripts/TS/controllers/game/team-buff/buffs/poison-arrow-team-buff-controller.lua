local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u5 = v1.import(script, script.Parent.Parent, "team-buff-base-controller").TeamBuffKnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "PoisonArrowTeamBuffController"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p9)
    p9.Name = "PoisonArrowTeamBuffController"
end
function u6.onGameInit(_) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.ProjectileLaunched:connect(function(p10) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        if p10:hasStatusEffect(u4.SNAKE_POISON_ARROW) then
            for v11, v12 in p10.projectile:GetDescendants() do
                local _ = v11 - 1
                if v12:IsA("Trail") then
                    v12.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56))
                end
            end
        end
    end)
end
v2.CreateController(u6.new())
return nil