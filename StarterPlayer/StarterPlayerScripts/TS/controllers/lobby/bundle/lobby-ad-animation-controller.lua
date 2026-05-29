local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContentProvider
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "LobbyAdAnimation"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "LobbyAdAnimation"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u8
        [4] = u10
        [5] = u9
        [6] = u3
        [7] = u6
    --]]
    u7.KnitStart(p15)
    u4("music-ad", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u9
            [4] = u3
            [5] = u6
        --]]
        local v17 = u8.SPIRIT_ASSASSIN_AD
        local v18 = u10.SPIRIT_ASSASSIN_LOOP
        local v19 = u9:getAnimation(v17)
        local v20 = u3:createSound(v18)
        if not v20 then
            return nil
        end
        v20.RollOffMinDistance = 50
        v20.RollOffMaxDistance = 70
        v20.RollOffMode = Enum.RollOffMode.Linear
        v20.Volume = 0.5
        u6:PreloadAsync({ v19, v20 })
        if not p16.PrimaryPart then
            p16:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local v21 = p16:WaitForChild("Humanoid")
        if v21 ~= nil then
            v21 = v21:WaitForChild("Animator")
        end
        v20.Parent = p16.PrimaryPart
        v20.Looped = true
        local v22 = v21:LoadAnimation(v19)
        v22.Looped = true
        v22:Play()
        v20:Play()
    end)
end
v5.CreateController(u11.new())
return nil