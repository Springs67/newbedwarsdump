local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderBedState
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, script.Parent, "ui", "murder-bed-progress").MurderBed
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "MurderBedController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "MurderBedController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
        [4] = u10
        [5] = u8
        [6] = u3
        [7] = u9
    --]]
    u7.KnitStart(u15)
    u4("MurderGameBed", function(u16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u6
            [3] = u10
            [4] = u8
            [5] = u3
            [6] = u9
        --]]
        u15.bedProgressTree = u6.mount(u6.createElement(u10, {
            ["BedStage"] = 1,
            ["Progress"] = 0,
            ["Adornee"] = u16,
            ["BedState"] = u8.IDLE
        }), u16)
        u16.AttributeChanged:Connect(function(p17) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u8
                [3] = u3
                [4] = u9
                [5] = u15
                [6] = u6
                [7] = u10
            --]]
            local v18 = u16:GetAttribute("Progress")
            local v19 = u16:GetAttribute("State")
            local v20 = u16:GetAttribute("Stage")
            if p17 == "State" and v19 == u8.IDLE then
                u3:playSound(u9.FLAG_CAPTURE, {
                    ["position"] = u16:GetPivot().Position
                })
            end
            u3:playSound(u9.WOOL_PLACE, {
                ["position"] = u16:GetPivot().Position
            })
            if u15.bedProgressTree then
                local v21 = {
                    ["Adornee"] = u16,
                    ["BedState"] = v19,
                    ["BedStage"] = v20,
                    ["Progress"] = v18
                }
                u15.bedProgressTree = u6.update(u15.bedProgressTree, u6.createElement(u10, v21))
            else
                local v22 = {
                    ["Adornee"] = u16,
                    ["BedState"] = v19,
                    ["BedStage"] = v20,
                    ["Progress"] = v18
                }
                u15.bedProgressTree = u6.mount(u6.createElement(u10, v22), u16)
            end
        end)
    end)
end
v5.CreateController(u11.new())
return nil