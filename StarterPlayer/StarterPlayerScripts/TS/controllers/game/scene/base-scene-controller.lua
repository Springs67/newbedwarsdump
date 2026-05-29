local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "BaseSceneController"
    end,
    ["__index"] = u3
})
v4.__index = v4
function v4.constructor(p5, p6) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p5)
    p5.Name = "BaseSceneController"
    p5.active = false
    p5.sceneKey = p6
end
function v4.KnitStart(u7) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.SceneStarted:connect(function(p8) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if p8.sceneKey == u7.sceneKey then
            u7.active = true
            u7.sceneAssets = p8.sceneAssets
            u7:onSceneStart()
        elseif u7.active then
            u7:onSceneShutdown()
            u7.active = false
        end
    end)
    u2.SceneLoadingScreenStart:connect(function(p9) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if p9.sceneActivatedFrom == u7.sceneKey then
            u7:onSceneLoadingScreenStart()
        end
    end)
end
return {
    ["BaseSceneController"] = v4
}