local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, script.Parent, "ui", "scene-loading-screen").SceneLoadingScreen
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SceneLoadingScreenController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p12)
    p12.Name = "SceneLoadingScreenController"
end
function u9.KnitStart(u13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    u6.KnitStart(u13)
    u7.Client:Get("DisplayLoadingScreen"):Connect(function(p14) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:displayLoadingScreen(p14.sceneKey, p14.loadingScreen)
    end)
    u7.Client:Get("RemoveLoadingScreen"):Connect(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:removeLoadingScreen()
    end)
end
function u9.displayLoadingScreen(u15, p16, p17) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u4
        [4] = u5
    --]]
    local v18 = u15.activeLoadingScreen
    if v18 ~= nil then
        v18 = v18.sceneKey
    end
    if v18 == p16 then
        return nil
    end
    local u19 = os.time()
    local v20 = u3
    local v21 = {}
    local v22 = {
        ["sceneKey"] = p16
    }
    for v23, v24 in p17 do
        v21[v23] = v24
    end
    v22.tree = v20.mount(u3.createElement(u8, v21), u4.LocalPlayer:WaitForChild("PlayerGui"))
    v22.props = p17
    v22.time = u19
    u15.activeLoadingScreen = v22
    local v25 = p17.MaxDisplayTime
    local v26 = v25 == nil and 15 or v25
    if v26 ~= 0 and (v26 == v26 and v26) then
        task.delay(v26, function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u19
            --]]
            local v27 = u15.activeLoadingScreen
            if v27 ~= nil then
                v27 = v27.time
            end
            if v27 ~= u19 then
                return nil
            end
            u15:removeLoadingScreen()
        end)
    end
    u5.SceneLoadingScreenStart:fire({
        ["props"] = u15.activeLoadingScreen.props,
        ["time"] = u15.activeLoadingScreen.time
    }, u15.activeLoadingScreen.sceneKey)
end
function u9.removeLoadingScreen(u28) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    if not u28.activeLoadingScreen then
        return nil
    end
    local v29 = u28.activeLoadingScreen.props.MinDisplayTime
    local v30 = v29 == nil and 6 or v29
    if v30 ~= 0 and (v30 == v30 and v30) then
        local v31 = os.time() - u28.activeLoadingScreen.time
        if v31 < v30 then
            task.delay(v31 + 0.1, function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:removeLoadingScreen()
            end)
            return nil
        end
    end
    local v32 = u5.SceneLoadingScreenEnd:fire({
        ["props"] = u28.activeLoadingScreen.props,
        ["time"] = u28.activeLoadingScreen.time
    }, u28.activeLoadingScreen.sceneKey)
    task.delay(v32.endAnimationSec, function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u3
        --]]
        if not u28.activeLoadingScreen then
            return nil
        end
        u3.unmount(u28.activeLoadingScreen.tree)
        u28.activeLoadingScreen = nil
    end)
end
v2.CreateController(u9.new())
return nil