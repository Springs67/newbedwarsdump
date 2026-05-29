local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = u5.StoreProvider
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil
local u11 = v1.import(script, script.Parent, "ui", "queue-ui-board").QueueUiBoard
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "QueueUiBoardController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "QueueUiBoardController"
    p15.queuePart = {}
    p15.queueBoard = {}
    p15.uiBacklog = {}
end
function u12.KnitStart(u16) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u2
        [4] = u10
    --]]
    u8.KnitStart(u16)
    task.spawn(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u10
            [4] = u16
        --]]
        local v17 = u7:WaitForChild("Lobby")
        if v17 ~= nil then
            v17 = v17:WaitForChild("Queues", 15)
        end
        if v17 ~= nil then
            local v18 = v17:GetChildren()
            local function v22(p19) --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                    [3] = u16
                --]]
                local v20 = p19.Name
                if p19:IsA("BasePart") then
                    u2.new(u10.getCurrTimestamp() - u10.pickInterval)
                    u16.queuePart[v20] = p19
                    local v21 = u16.uiBacklog[v20]
                    if v21 then
                        u16:displayUI(v20, p19, v21.hook, v21.props, v21.config)
                    end
                end
            end
            for v23, v24 in v18 do
                v22(v24, v23 - 1, v18)
            end
        end
    end)
end
function u12.mountUI(p25, p26, p27, p28, p29) --[[ Line: 68 ]]
    local v30 = p25.queuePart[p26]
    if v30 then
        p25:displayUI(p26, v30, p27, p28, p29)
    else
        p25.uiBacklog[p26] = {
            ["hook"] = p27,
            ["props"] = p28,
            ["config"] = p29
        }
    end
end
function u12.displayUI(p31, p32, u33, u34, u35, u36) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u4
        [4] = u6
        [5] = u9
    --]]
    local v37 = p31.queueBoard[p32]
    if v37 then
        u4.update(v37, u4.createElement(u11, {
            ["Adornee"] = u33,
            ["uiHook"] = u34,
            ["hookProps"] = not u35 and {} or u35(u9:getState()),
            ["config"] = u36
        }))
    else
        local v39 = u5.connect(function(p38, _) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
                [3] = u35
                [4] = u36
            --]]
            return {
                ["Adornee"] = u33,
                ["uiHook"] = u34,
                ["hookProps"] = not u35 and {} or u35(p38),
                ["config"] = u36
            }
        end)(u11)
        local v40 = {
            ["store"] = u9
        }
        local v41 = u4.mount(u4.createElement(u6, v40, { u4.createElement(v39) }), u33)
        p31.queueBoard[p32] = v41
    end
end
v3.CreateController(u12.new())
return nil