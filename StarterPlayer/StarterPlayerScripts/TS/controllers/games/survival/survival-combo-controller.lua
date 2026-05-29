local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent, "survival-combo-ui").SurvivalComboUi
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SurvivalComboController"
    end,
    ["__index"] = u6
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
        [1] = u6
        [2] = u7
        [3] = u3
    --]]
    u6.constructor(p13, { u7.SURVIVAL })
    p13.Name = "SurvivalComboController"
    p13.maid = u3.new()
end
function u10.onGameInit(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u9
        [4] = u5
    --]]
    u8.Client:Get("SurvivalComboUpdate"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
            [3] = u9
            [4] = u5
        --]]
        u14.maid:DoCleaning()
        if p15.combo.chain > 0 then
            local u16 = u4.mount(u4.createElement(u9, {
                ["Chain"] = p15.combo.chain
            }), u5.LocalPlayer:WaitForChild("PlayerGui"))
            u14.maid:GiveTask(function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u16
                --]]
                u4.unmount(u16)
            end)
        end
    end)
end
v2.CreateController(u10.new())
return nil