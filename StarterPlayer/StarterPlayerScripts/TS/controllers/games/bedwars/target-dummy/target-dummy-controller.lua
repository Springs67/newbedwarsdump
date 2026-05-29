local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u6 = v1.import(script, script.Parent, "target-dummy-client").TargetDummyClient
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TargetDummyController"
    end,
    ["__index"] = u3
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p10)
    p10.Name = "TargetDummyController"
    p10.targetDummyClientMap = {}
end
function u7.KnitStart(u11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.KnitStart(u11)
    u4.Client:OnEvent("SpawnTargetDummy", function(p12) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:spawnTargetDummy(p12.targetDummyEntity, p12.currentEraTier, p12.targetDummyPosition, p12.teamId)
    end)
    u4.Client:OnEvent("CleanupTargetDummy", function(p13) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v14 = p13.position
        local v15 = u11.targetDummyClientMap[v14]
        if v15 ~= nil then
            local v16 = v15:getGameEntity()
            if v16 ~= nil then
                v16:Destroy()
            end
            u11.targetDummyClientMap[v14] = nil
        end
    end)
end
function u7.spawnTargetDummy(p17, p18, p19, p20, p21) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    local v22 = u5:getGameEntityCFrame(p18)
    local v23 = p18:GetAttribute("EntityUUID")
    local v24 = u6.new(v22, v23, p18, p19, p21)
    p17.targetDummyClientMap[p20] = v24
end
v2.CreateController(u7.new())
return nil