local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u10 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TakeSelfieEmoteController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p14)
    p14.Name = "TakeSelfieEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u6
        [4] = u10
        [5] = u3
        [6] = u9
        [7] = u5
        [8] = u8
        [9] = u7
    --]]
    u4.KnitStart(p15)
    local v16 = u2.Controllers.EmoteHandlerController
    local v17 = u6.TAKE_SELFIE
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
        --]]
        u18.constructor(p22, ...)
    end
    function u19.onEnable(u23, u24, u25, _, u26) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
            [3] = u5
            [4] = u8
            [5] = u7
        --]]
        local u27 = u3.Assets.Misc.SelfiePhone:Clone()
        u27.Parent = u25
        u23:setupInstance(u27)
        u9:weldCharacterAccessories(u25)
        u26:GiveTask(u23:watchEmoteAnimation(u24, u25, u5.TAKE_SELFIE, function(p28) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u8
                [3] = u27
                [4] = u23
                [5] = u7
                [6] = u24
                [7] = u25
            --]]
            local v29 = u26
            local v30
            if p28 == nil then
                v30 = p28
            else
                v30 = p28:GetMarkerReachedSignal("take_photo"):Connect(function() --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u27
                        [3] = u23
                        [4] = u7
                        [5] = u24
                        [6] = u25
                    --]]
                    u8:playEffects({ u27.Handle.Flash.Flash }, nil, {
                        ["destroyAfterSec"] = 1
                    })
                    u23:playSound(u7.CAMERA_FLASH, u24, {
                        ["rollOffMaxDistance"] = 55,
                        ["position"] = u25:GetPivot().Position
                    })
                end)
            end
            v29:GiveTask(v30)
            local v31 = u26
            if p28 ~= nil then
                p28 = p28:GetMarkerReachedSignal("remove_phone"):Connect(function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    if u27 then
                        u27:Destroy()
                    end
                end)
            end
            v31:GiveTask(p28)
        end))
        u26:GiveTask(function() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            if u27 then
                u27:Destroy()
            end
        end)
    end
    function u19.onDisable(_, _, _, _) --[[ Line: 91 ]] end
    v16:registerHandler(v17, u19)
end
u2.CreateController(u11.new())
return nil