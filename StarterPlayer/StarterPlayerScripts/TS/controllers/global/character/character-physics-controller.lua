local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.RunService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "CharacterPhysicsController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u7
    --]]
    u6.constructor(p12, ...)
    p12.Name = "CharacterPhysicsController"
    p12.maxFallSpeed = u8(u7.TerminalFallSpeed)
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
    --]]
    u6.KnitStart(u13)
    u5.Heartbeat:Connect(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
        --]]
        local v14 = u4.LocalPlayer.Character
        if v14 ~= nil then
            v14 = v14.PrimaryPart
        end
        if not v14 then
            return nil
        end
        local v15 = v14.AssemblyLinearVelocity
        local v16 = -u13.maxFallSpeed
        if v16 <= v15.Y then
            return nil
        end
        local v17 = v15.X
        local v18 = v15.Z
        v14.AssemblyLinearVelocity = Vector3.new(v17, v16, v18)
    end)
end
v2.CreateController(u9.new())
return nil