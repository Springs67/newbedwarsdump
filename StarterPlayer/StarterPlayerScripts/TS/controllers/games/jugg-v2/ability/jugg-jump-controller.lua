local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "JuggJumpController"
    end,
    ["__index"] = u7
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
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    u7.constructor(p12)
    p12.Name = "JuggJumpController"
    p12.jumpMaid = u5.new()
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u6
        [4] = u4
    --]]
    u7.KnitStart(u13)
    u8.Client:Get("NewJuggernaut"):Connect(function(p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u13
        --]]
        if p14.player ~= u6.LocalPlayer then
            return nil
        end
        task.wait(2)
        local v15 = u4.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["airJumps"] = 1
        })
        u13.jumpMaid:GiveTask(v15)
    end)
    u8.Client:Get("EntityDeathEvent"):Connect(function(p16) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
        --]]
        if u6:GetPlayerFromCharacter(p16.entityInstance) == u6.LocalPlayer then
            u13.jumpMaid:DoCleaning()
        end
    end)
end
v3.CreateController(u9.new())
return nil