local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SkorpController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "SkorpController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u3
        [4] = u8
        [5] = u7
        [6] = u4
    --]]
    u6.KnitStart(p14)
    u9.Client:Get("SkorpAttack"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u7
        --]]
        local v16 = p15.spider:WaitForChild("Humanoid", 3)
        if v16 ~= nil then
            v16 = v16:WaitForChild("Animator", 3)
        end
        if not v16 then
            return nil
        end
        u3:playAnimation(v16, u8:getAssetId(u7.SKORP_ATTACK))
    end)
    u4("skorp", function(p17) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u7
        --]]
        local v18 = p17:WaitForChild("Humanoid", 3)
        if v18 ~= nil then
            v18 = v18:WaitForChild("Animator", 3)
        end
        if not v18 then
            return nil
        end
        local v19 = u3:playAnimation(v18, u8:getAssetId(u7.SKORP_MOVE), {
            ["looped"] = true
        })
        print("LENGTH: " .. tostring(v19))
    end)
end
v5.CreateController(u10.new())
return nil