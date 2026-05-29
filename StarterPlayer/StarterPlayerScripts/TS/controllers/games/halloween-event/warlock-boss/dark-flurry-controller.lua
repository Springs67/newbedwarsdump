local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuint
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "DarkFlurryController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "DarkFlurryController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u2
        [4] = u9
        [5] = u6
        [6] = u4
        [7] = u5
    --]]
    u7.KnitStart(p14)
    u8.Client:GetNamespace("WarlockBoss"):Get("WarlockDarkFlurry"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u6
            [4] = u4
            [5] = u5
        --]]
        local u16 = p15.bossEntityInstance
        local v17 = p15.targetCFrame
        local u18 = p15.originalCFrame
        local v19 = p15.finishedAt
        local u20 = p15.numBolts
        task.spawn(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u2
                [3] = u9
                [4] = u18
            --]]
            local v21 = false
            local v22 = 0
            while true do
                if v21 then
                    v22 = v22 + 1
                else
                    v21 = true
                end
                if v22 >= u20 then
                    return
                end
                u2:playSound(u9.DARK_BOLT_SHOOT, {
                    ["rollOffMaxDistance"] = 300,
                    ["volumeMultiplier"] = 9,
                    ["position"] = u18.Position,
                    ["playbackSpeedMultiplier"] = 0.1 * (v22 / u20) + 1
                })
                task.wait(1 / u20)
            end
        end)
        u6(0.5, u4, function(p23) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16:PivotTo(p23)
        end, u16:GetPivot(), v17)
        local v24 = v19 - u5:GetServerTimeNow()
        task.delay(v24, function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u4
                [3] = u16
                [4] = u18
            --]]
            u6(0.5, u4, function(p25) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:PivotTo(p25)
            end, u16:GetPivot(), u18)
        end)
    end)
end
v3.CreateController(u10.new())
return nil