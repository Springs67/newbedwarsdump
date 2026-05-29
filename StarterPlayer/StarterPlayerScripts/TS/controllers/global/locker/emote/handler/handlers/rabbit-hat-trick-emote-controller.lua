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
        return "RabbitHatTrickEmoteController"
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
    p13.Name = "RabbitHatTrickEmoteController"
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
        [7] = u7
        [8] = u5
    --]]
    u4.KnitStart(p14)
    local v15 = u2.Controllers.EmoteHandlerController
    local v16 = u6.RABBIT_HAT_TRICK
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
            [3] = u7
            [4] = u5
        --]]
        local u26 = u3.Assets.Misc.TopHatHead:Clone()
        u26.Parent = u24
        u22:setupInstance(u26)
        u8:weldCharacterAccessories(u24)
        local u27 = nil
        local u28 = u22:playSound(u7.RABBIT_HAT_EMOTE_DRUMROLL, u23, {
            ["rollOffMaxDistance"] = 55,
            ["looped"] = true,
            ["position"] = u24:GetPivot().Position
        })
        u25:GiveTask(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            if u28 then
                u28:Stop()
                u28:Destroy()
            end
        end)
        local u29 = nil
        u25:GiveTask(u22:watchEmoteAnimation(u23, u24, u5.RABBIT_HAT_TRICK, function(p30) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u26
                [3] = u29
                [4] = u3
                [5] = u24
                [6] = u22
                [7] = u8
                [8] = u27
                [9] = u28
                [10] = u7
                [11] = u23
            --]]
            local v31 = u25
            local v32
            if p30 == nil then
                v32 = p30
            else
                v32 = p30:GetMarkerReachedSignal("grab_hat"):Connect(function() --[[ Line: 74 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u29
                        [3] = u3
                        [4] = u24
                        [5] = u22
                        [6] = u8
                    --]]
                    if u26 then
                        u26:Destroy()
                    end
                    u29 = u3.Assets.Misc.TopHatHand:Clone()
                    u29.Parent = u24
                    u22:setupInstance(u29)
                    u8:weldCharacterAccessories(u24)
                end)
            end
            v31:GiveTask(v32)
            local v33 = u25
            local v34
            if p30 == nil then
                v34 = p30
            else
                v34 = p30:GetMarkerReachedSignal("grab_rabbit"):Connect(function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u3
                        [3] = u24
                        [4] = u22
                        [5] = u8
                        [6] = u25
                        [7] = u28
                        [8] = u7
                        [9] = u23
                    --]]
                    u27 = u3.Assets.Misc.RabbitHandAccessory:Clone()
                    u27.Parent = u24
                    u22:setupInstance(u27)
                    u8:weldCharacterAccessories(u24)
                    u25:GiveTask(function() --[[ Line: 95 ]]
                        --[[
                        Upvalues:
                            [1] = u27
                        --]]
                        if u27 then
                            u27:Destroy()
                        end
                    end)
                    if u28 then
                        u28:Stop()
                        u28:Destroy()
                    end
                    local u35 = u22:playSound(u7.RABBIT_HAT_EMOTE_TADA, u23, {
                        ["rollOffMaxDistance"] = 55,
                        ["position"] = u24:GetPivot().Position
                    })
                    u25:GiveTask(function() --[[ Line: 110 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                        --]]
                        if u35 then
                            u35:Stop()
                            u35:Destroy()
                        end
                    end)
                end)
            end
            v33:GiveTask(v34)
            local v36 = u25
            local v37
            if p30 == nil then
                v37 = p30
            else
                v37 = p30:GetMarkerReachedSignal("hide_rabbit"):Connect(function() --[[ Line: 122 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    if u27 then
                        u27:Destroy()
                    end
                end)
            end
            v36:GiveTask(v37)
            local v38 = u25
            if p30 ~= nil then
                p30 = p30:GetMarkerReachedSignal("place_hat"):Connect(function() --[[ Line: 132 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                        [2] = u26
                    --]]
                    if u29 then
                        u29:Destroy()
                    end
                    if u26 then
                        u26:Destroy()
                    end
                end)
            end
            v38:GiveTask(p30)
        end))
        u25:GiveTask(function() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u29
            --]]
            if u26 then
                u26:Destroy()
            end
            if u29 then
                u29:Destroy()
            end
        end)
    end
    function u18.onDisable(_, _, _, _) --[[ Line: 152 ]] end
    v15:registerHandler(v16, u18)
end
u2.CreateController(u10.new())
return nil