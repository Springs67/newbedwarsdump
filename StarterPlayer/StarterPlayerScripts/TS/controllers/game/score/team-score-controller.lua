local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "TeamScoreController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "TeamScoreController"
    p10.scoresFolder = nil
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u6
    --]]
    u5.KnitStart(u11)
    task.spawn(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
            [3] = u6
        --]]
        u11.scoresFolder = u3:WaitForChild("TeamScores")
        local v12 = {}
        for _, v13 in u11.scoresFolder:GetChildren() do
            u11:hookScoreInstance(v13)
            table.insert(v12, v13)
        end
        local v14 = u6
        local v15 = table.create(#v12)
        local v16 = {
            ["type"] = "GameSetTeamScores"
        }
        for v17, v18 in v12 do
            local _ = v17 - 1
            v15[v17] = {
                ["teamId"] = v18.Name,
                ["score"] = v18:GetAttribute("Score")
            }
        end
        v16.teamScores = v15
        v14:dispatch(v16)
        u11.scoresFolder.ChildAdded:Connect(function(p19) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
            --]]
            u6:dispatch({
                ["type"] = "GameAddTeamScore",
                ["teamId"] = p19.Name,
                ["score"] = p19:GetAttribute("Score")
            })
            u11:hookScoreInstance(p19)
        end)
    end)
end
function u7.getHighestTeamScore(p20) --[[ Line: 67 ]]
    if not p20.scoresFolder then
        return nil
    end
    local v21 = p20.scoresFolder:GetChildren()
    table.sort(v21, function(p22, p23) --[[ Line: 72 ]]
        return p22:GetAttribute("Score") > p23:GetAttribute("Score")
    end)
    local v24 = v21[1]:GetAttribute("Score")
    local v25 = 0
    local v26 = {}
    for v27, v28 in v21 do
        local _ = v27 - 1
        if v28:GetAttribute("Score") == v24 == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    return v26
end
function u7.getTeamScores(p29) --[[ Line: 94 ]]
    if not p29.scoresFolder then
        return nil
    end
    local v30 = {}
    for _, v31 in p29.scoresFolder:GetChildren() do
        table.insert(v30, v31)
    end
    return v30
end
function u7.hookScoreInstance(_, u32) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u32:GetAttributeChangedSignal("Score"):Connect(function(p33) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
            [3] = u4
        --]]
        u6:dispatch({
            ["type"] = "GameUpdateTeamScore",
            ["teamId"] = u32.Name,
            ["score"] = u32:GetAttribute("Score")
        })
        u4.TeamScoreChange:fire(u32, p33)
    end)
end
v2.CreateController(u7.new())
return nil