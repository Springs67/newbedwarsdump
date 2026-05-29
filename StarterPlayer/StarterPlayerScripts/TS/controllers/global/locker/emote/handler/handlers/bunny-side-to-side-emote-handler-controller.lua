local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacterAnimation
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BunnySideToSideEmoteHandlerController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "BunnySideToSideEmoteHandlerController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
        [4] = u11
        [5] = u4
        [6] = u8
        [7] = u7
        [8] = u3
        [9] = u10
    --]]
    u6.KnitStart(p16)
    local v17 = u5.Controllers.EmoteHandlerController
    local v18 = u9.BUNNY_SIDE_TO_SIDE
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
    function u20.onEnable(_, u24, u25, _, u26) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u7
            [4] = u3
            [5] = u10
        --]]
        u26:GiveTask((u4({ u8:getAssetId(u7.BUNNY_SIDE_TO_SIDE) }, function(p27, p28) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u26
                [3] = u25
                [4] = u3
                [5] = u10
            --]]
            if p27.UserId ~= u24 then
                return nil
            end
            local v29 = u26
            if p28 ~= nil then
                p28 = p28:GetMarkerReachedSignal("bounce"):Connect(function() --[[ Line: 60 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u3
                        [3] = u10
                    --]]
                    if not u25.PrimaryPart then
                        return nil
                    end
                    u3:playSound(u10.POGO_BOUNCE, {
                        ["volumeMultiplier"] = 0.3,
                        ["position"] = u25.PrimaryPart.Position
                    })
                end)
            end
            v29:GiveTask(p28)
        end)))
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 74 ]] end
    v17:registerHandler(v18, u20)
end
u5.CreateController(u12.new())
return nil