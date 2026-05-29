local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u13 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PillowFightEmoteController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "PillowFightEmoteController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u10
        [4] = u13
        [5] = u7
        [6] = u12
        [7] = u8
        [8] = u4
        [9] = u3
        [10] = u11
    --]]
    u9.KnitStart(p18)
    local v19 = u5.Controllers.EmoteHandlerController
    local v20 = u10.PILLOW_FIGHT
    local u21 = u13
    local u22 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
            return "Anonymous"
        end,
        ["__index"] = u21
    })
    u22.__index = u22
    function u22.new(...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v23 = u22
        local v24 = setmetatable({}, v23)
        return v24:constructor(...) or v24
    end
    function u22.constructor(p25, ...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.constructor(p25, ...)
    end
    function u22.onEnable(_, _, p26, _, u27) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u8
            [4] = u4
            [5] = u3
            [6] = u11
        --]]
        local u28 = u7.Assets.Effects.WhiteFeatherEffect:Clone()
        local v29 = u7.Assets.Effects.Pillow:Clone()
        v29.Parent = p26
        u12:weldAccessory(p26, v29)
        u28.Parent = u8
        local u30 = p26.PrimaryPart
        if u30 ~= nil then
            u30 = u30.CFrame.LookVector
        end
        local u31 = p26.PrimaryPart
        if u31 ~= nil then
            u31 = u31.Position
        end
        u27:GiveTask(v29)
        task.delay(0.5, function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
                [3] = u28
                [4] = u4
                [5] = u3
                [6] = u11
            --]]
            if u30 and u31 then
                local v32 = u28
                local v33 = u30.Unit * 5
                v32:PivotTo(CFrame.new(u31 + v33))
                for v34, v35 in u28:GetDescendants() do
                    local _ = v34 - 1
                    if v35:IsA("ParticleEmitter") then
                        v35:Emit(30)
                    end
                end
                local v36 = {
                    ["rollOffMaxDistance"] = 220,
                    ["position"] = u31
                }
                u4:playSound(u3.fromList(u11.PILLOW_HIT_1, u11.PILLOW_HIT_2, u11.PILLOW_HIT_3), v36)
            end
        end)
        u27:GiveTask(function() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:Destroy()
        end)
        task.delay(2, function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27:DoCleaning()
        end)
    end
    function u22.onDisable(_, _, _, _) --[[ Line: 98 ]] end
    v19:registerHandler(v20, u22)
end
u5.CreateController(u14.new())
return nil