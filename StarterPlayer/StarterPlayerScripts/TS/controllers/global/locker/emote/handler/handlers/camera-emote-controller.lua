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
        return "CameraEmoteController"
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
    p15.Name = "CameraEmoteController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
        [4] = u11
        [5] = u4
        [6] = u2
        [7] = u10
        [8] = u6
        [9] = u9
        [10] = u8
    --]]
    u5.KnitStart(p16)
    local v17 = u3.Controllers.EmoteHandlerController
    local v18 = u7.CAMERA
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
            [2] = u2
            [3] = u10
            [4] = u6
            [5] = u9
            [6] = u8
        --]]
        local u28 = u4.Assets.Misc.Camera:Clone()
        u28.Parent = u26
        for v29, v30 in u28:GetDescendants() do
            local _ = v29 - 1
            if v30:IsA("BasePart") then
                u2:setQueryIgnored(v30, true)
            end
        end
        u10:weldCharacterAccessories(u26)
        local v33 = u24:watchEmoteAnimation(u25, u26, u6.CAUGHT_IN_4K, function(p31) --[[ Line: 66 ]]
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
            if p31 ~= nil then
                p31 = p31:GetMarkerReachedSignal("Flash"):Connect(function() --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u28
                        [3] = u24
                        [4] = u8
                        [5] = u25
                        [6] = u26
                    --]]
                    u9:playEffects({ u28.Handle.Flash.Flash }, nil, {
                        ["destroyAfterSec"] = 1
                    })
                    u24:playSound(u8.CAMERA_FLASH, u25, {
                        ["rollOffMaxDistance"] = 55,
                        ["position"] = u26:GetPivot().Position
                    })
                end)
            end
            v32:GiveTask(p31)
        end)
        u27:GiveTask(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:Destroy()
        end)
        u27:GiveTask(v33)
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 88 ]] end
    v17:registerHandler(v18, u20)
end
u3.CreateController(u12.new())
return nil