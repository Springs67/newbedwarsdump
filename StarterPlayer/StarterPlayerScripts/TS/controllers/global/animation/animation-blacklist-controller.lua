local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "blacklisted-animation-util").BlacklistedAnimationUtil
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "AnimationBlacklistController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "AnimationBlacklistController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u3
        [4] = u2
        [5] = u7
    --]]
    u6.KnitStart(u12)
    local v13 = 0
    local v14 = {}
    for v15, v16 in u5:GetPlayers() do
        local _ = v15 - 1
        local v17 = v16.Character
        if v17 ~= nil then
            v13 = v13 + 1
            v14[v13] = v17
        end
    end
    for _, u18 in v14 do
        task.spawn(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u12
            --]]
            local v19 = u18:WaitForChild("Humanoid", 10)
            if not v19 then
                return nil
            end
            local v20 = v19:WaitForChild("Animator", 10)
            if not v20 then
                return nil
            end
            for _, v21 in v20:GetPlayingAnimationTracks() do
                u12:validateAnimation(v21)
            end
        end)
    end
    u3(u2.values(u7.ANIMATION_ID_BLACKLIST), function(_, p22) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:validateAnimation(p22)
    end)
end
function u8.validateAnimation(_, p23) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v24 = p23.Animation
    if v24 ~= nil then
        v24 = v24.AnimationId
    end
    if v24 == "" or not v24 then
        return nil
    end
    if u7.ANIMATION_ID_BLACKLIST[v24] == nil then
        return nil
    end
    p23:Stop()
end
v4.CreateController(u8.new())
return nil