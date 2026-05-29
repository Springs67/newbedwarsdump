local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "IcyDelightEmoteController"
    end,
    ["__index"] = u5
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p15)
    p15.Name = "IcyDelightEmoteController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
        [4] = u11
        [5] = u4
        [6] = u9
        [7] = u2
        [8] = u10
        [9] = u6
        [10] = u8
    --]]
    u5.KnitStart(p16)
    local v17 = u3.Controllers.EmoteHandlerController
    local v18 = u7.ICY_DELIGHT
    local u19 = u11
    local u20 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
            return "Anonymous"
        end,
        ["__index"] = u19
    })
    u20.__index = u20
    function u20.new(...) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        local v22 = setmetatable({}, v21)
        return v22:constructor(...) or v22
    end
    function u20.constructor(p23, ...) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19.constructor(p23, ...)
    end
    function u20.onEnable(u24, u25, u26, _, u27) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u9
            [3] = u2
            [4] = u10
            [5] = u6
            [6] = u8
        --]]
        local u28 = u4.Assets.Misc.IcyDelight:Clone()
        u9:scaleEffect({ u28.Handle.SnowBlast }, 0.3)
        u9:scaleEffect({ u28.Handle.SnowPoof }, 0.6)
        u28.Parent = u26
        for v29, v30 in u28:GetDescendants() do
            local _ = v29 - 1
            if v30:IsA("BasePart") then
                u2:setQueryIgnored(v30, true)
            end
        end
        u10:weldCharacterAccessories(u26)
        u27:GiveTask(u24:watchEmoteAnimation(u25, u26, u6.ICY_DELIGHT, function(p31) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u9
                [3] = u28
                [4] = u24
                [5] = u8
                [6] = u25
                [7] = u26
            --]]
            local v32 = u27
            local v33
            if p31 == nil then
                v33 = p31
            else
                v33 = p31:GetMarkerReachedSignal("Lick"):Connect(function() --[[ Line: 71 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u28
                        [3] = u24
                        [4] = u8
                        [5] = u25
                        [6] = u26
                    --]]
                    u9:playEffects({ u28.Handle.SnowBlast }, nil, {})
                    u24:playSound(u8.ICY_DELIGHT_LICK, u25, {
                        ["rollOffMaxDistance"] = 50,
                        ["position"] = u26:GetPivot().Position
                    })
                end)
            end
            v32:GiveTask(v33)
            local v34 = u27
            local v35
            if p31 == nil then
                v35 = p31
            else
                v35 = p31:GetMarkerReachedSignal("PoofStart"):Connect(function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u28
                        [3] = u24
                        [4] = u8
                        [5] = u25
                        [6] = u26
                    --]]
                    u9:playEffects({ u28.Handle.SnowPoof }, nil, {
                        ["destroyAfterSec"] = 0.8
                    })
                    u24:playSound(u8.SATELLITE_INTERACT, u25, {
                        ["rollOffMaxDistance"] = 50,
                        ["volumeMultiplier"] = 0.4,
                        ["playbackSpeedMultiplier"] = 2,
                        ["position"] = u26:GetPivot().Position
                    })
                end)
            end
            v34:GiveTask(v35)
            local v36 = u27
            if p31 ~= nil then
                p31 = p31:GetMarkerReachedSignal("PoofEnd"):Connect(function() --[[ Line: 100 ]] end)
            end
            v36:GiveTask(p31)
        end))
        u27:GiveTask(function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:Destroy()
        end)
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 108 ]] end
    v17:registerHandler(v18, u20)
end
u3.CreateController(u12.new())
return nil