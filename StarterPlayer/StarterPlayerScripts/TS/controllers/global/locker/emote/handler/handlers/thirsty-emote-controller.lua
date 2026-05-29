local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u9 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ThirstyEmoteController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p13)
    p13.Name = "ThirstyEmoteController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u6
        [4] = u9
        [5] = u3
        [6] = u8
        [7] = u5
        [8] = u7
    --]]
    u4.KnitStart(p14)
    local v15 = u2.Controllers.EmoteHandlerController
    local v16 = u6.THIRSTY
    local u17 = u9
    local u18 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
            return "Anonymous"
        end,
        ["__index"] = u17
    })
    u18.__index = u18
    function u18.new(...) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v19 = u18
        local v20 = setmetatable({}, v19)
        return v20:constructor(...) or v20
    end
    function u18.constructor(p21, ...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.constructor(p21, ...)
    end
    function u18.onEnable(u22, u23, u24, _, u25) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u5
            [4] = u7
        --]]
        local u26 = u3.Assets.Misc.Flask:Clone()
        u26.Parent = u24
        u22:setupInstance(u26)
        u8:weldCharacterAccessories(u24)
        u25:GiveTask(u22:watchEmoteAnimation(u23, u24, u5.THIRSTY_EMOTE, function(p27) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u22
                [3] = u7
                [4] = u23
                [5] = u24
            --]]
            local v28 = u25
            if p27 ~= nil then
                p27 = p27:GetMarkerReachedSignal("unscrew"):Connect(function() --[[ Line: 59 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u7
                        [3] = u23
                        [4] = u24
                    --]]
                    u22:playSound(u7.FLASK_UNSCREW, u23, {
                        ["rollOffMaxDistance"] = 50,
                        ["position"] = u24:GetPivot().Position
                    })
                end)
            end
            v28:GiveTask(p27)
        end))
        u25:GiveTask(function() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:Destroy()
        end)
    end
    function u18.onDisable(_, _, _, _) --[[ Line: 72 ]] end
    v15:registerHandler(v16, u18)
end
u2.CreateController(u10.new())
return nil