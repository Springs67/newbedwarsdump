local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "CharacterController"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p9)
    p9.Name = "CharacterController"
end
function u6.KnitStart(_) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    u2(function(p10, p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        if p10 == u4.LocalPlayer then
            local v12 = p11:WaitForChild("Humanoid")
            v12:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            v12:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        end
    end)
end
v3.CreateController(u6.new())
return nil