local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SlowClapEmoteController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p14)
    p14.Name = "SlowClapEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u8
        [4] = u10
        [5] = u2
        [6] = u7
        [7] = u6
        [8] = u4
        [9] = u9
    --]]
    u5.KnitStart(p15)
    local v16 = u3.Controllers.EmoteHandlerController
    local v17 = u8.SLOW_CLAP
    local u18 = u10
    local u19 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
            return "Anonymous"
        end,
        ["__index"] = u18
    })
    u19.__index = u19
    function u19.new(...) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v20 = u19
        local v21 = setmetatable({}, v20)
        return v21:constructor(...) or v21
    end
    function u19.constructor(p22, ...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u2
        --]]
        u18.constructor(p22, ...)
        p22.clapCooldowns = u2.new(1)
    end
    function u19.onEnable(u23, u24, u25, _, u26) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u4
            [4] = u9
        --]]
        u26:GiveTask((u25.Humanoid.Animator.AnimationPlayed:Connect(function(p27) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u6
                [3] = u23
                [4] = u24
                [5] = u4
                [6] = u9
                [7] = u25
                [8] = u26
            --]]
            local v28 = p27.Animation
            if v28 ~= nil then
                v28 = v28.AnimationId
            end
            if v28 == u7:getAssetId(u6.SLOW_CLAP) then
                if u23.clapCooldowns:has(u24) and u24 ~= u4.LocalPlayer.UserId then
                    return nil
                end
                u23.clapCooldowns:add(u24)
                u26:GiveTask((p27:GetMarkerReachedSignal("Clap"):Connect(function() --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u9
                        [3] = u24
                        [4] = u25
                    --]]
                    u23:playSound(u9.HAND_CLAP, u24, {
                        ["rollOffMaxDistance"] = 50,
                        ["volumeMultiplier"] = 0.25,
                        ["position"] = u25:GetPivot().Position
                    })
                end)))
            end
        end)))
    end
    function u19.onDisable(_, _, _, _) --[[ Line: 76 ]] end
    v16:registerHandler(v17, u19)
end
u3.CreateController(u11.new())
return nil