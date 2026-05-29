local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "QueenBeeUtil"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
function u4.runGlidePhysics(_, u7) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u8 = u2.new()
    local u9 = 0.01
    u8:GiveTask(u3.Heartbeat:Connect(function(p10) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u7
        --]]
        debug.profilebegin("queen-bee-glide-physics")
        u9 = u9 + p10
        local v11 = u9
        local v12 = u9
        local v13 = math.pow(v11, 0.2) - math.pow(v12, 2) * 0.02
        local v14 = math.clamp(v13, 0, 1)
        if v14 == 0 then
            u8:DoCleaning()
            return nil
        end
        u7(v14 * -3 + (1 - v14) * -50)
        debug.profileend()
    end))
    return u8
end
u4.GLIDE_COOLDOWN = 30
u4.GLIDE_DURATION_SEC = 7.5
u4.GLIDE_ATTRIBUTE = "BeeGlide"
u4.MAX_BEEHIVE_GRENADES = 5
return {
    ["QueenBeeUtil"] = u4
}