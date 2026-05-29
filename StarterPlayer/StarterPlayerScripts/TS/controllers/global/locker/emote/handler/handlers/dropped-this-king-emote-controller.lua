local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "DroppedThisKingEmoteController"
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
    p15.Name = "DroppedThisKingEmoteController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u8
        [4] = u11
        [5] = u7
        [6] = u4
        [7] = u10
        [8] = u9
        [9] = u5
        [10] = u3
    --]]
    u6.KnitStart(p16)
    local v17 = u2.Controllers.EmoteHandlerController
    local v18 = u8.DROPPED_THIS_CROWN
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
            [1] = u7
            [2] = u4
            [3] = u10
            [4] = u9
            [5] = u5
            [6] = u3
        --]]
        local u28 = nil
        u27:GiveTask((u24:watchEmoteAnimation(u25, u26, u7.DROPPED_THIS_KING_LONG, function(p29) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u28
                [3] = u4
                [4] = u26
                [5] = u24
                [6] = u10
                [7] = u9
                [8] = u25
                [9] = u5
                [10] = u3
            --]]
            local v30 = u27
            local v31
            if p29 == nil then
                v31 = p29
            else
                v31 = p29:GetMarkerReachedSignal("FoundItem"):Connect(function() --[[ Line: 60 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u4
                        [3] = u26
                        [4] = u24
                        [5] = u27
                        [6] = u10
                        [7] = u9
                        [8] = u25
                    --]]
                    u28 = u4.Assets.Misc.GoldCrown:Clone()
                    u28.Parent = u26
                    u24:setupInstance(u28)
                    u27:GiveTask(function() --[[ Line: 64 ]]
                        --[[
                        Upvalues:
                            [1] = u28
                        --]]
                        local v32 = u28
                        if v32 ~= nil then
                            v32:Destroy()
                        end
                    end)
                    u10:weldCharacterAccessories(u26)
                    local u33 = u24:playSound(u9.RARE_FIND, u25, {
                        ["rollOffMaxDistance"] = 55,
                        ["volumeMultiplier"] = 1.1,
                        ["position"] = u26:GetPivot().Position
                    })
                    u27:GiveTask(function() --[[ Line: 77 ]]
                        --[[
                        Upvalues:
                            [1] = u33
                        --]]
                        u33:Destroy()
                    end)
                end)
            end
            v30:GiveTask(v31)
            local v34 = u27
            local v35
            if p29 == nil then
                v35 = p29
            else
                v35 = p29:GetMarkerReachedSignal("Reveal"):Connect(function() --[[ Line: 87 ]] end)
            end
            v34:GiveTask(v35)
            local v36 = u27
            if p29 ~= nil then
                p29 = p29:GetMarkerReachedSignal("PullBack"):Connect(function() --[[ Line: 94 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u5
                        [3] = u3
                    --]]
                    if not u28 then
                        return nil
                    end
                    u5(0.2, u3, function(p37) --[[ Line: 98 ]]
                        --[[
                        Upvalues:
                            [1] = u28
                        --]]
                        local v38 = u28
                        if v38 ~= nil then
                            for v39, v40 in v38:GetDescendants() do
                                local _ = v39 - 1
                                if v40:IsA("BasePart") then
                                    v40.Transparency = p37 * 1
                                end
                            end
                        end
                    end)
                end)
            end
            v36:GiveTask(p29)
        end)))
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 118 ]] end
    v17:registerHandler(v18, u20)
end
u2.CreateController(u12.new())
return nil