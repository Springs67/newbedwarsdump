local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "scene-death-screen").SceneDeathScreen
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "SceneDeathScreenController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "SceneDeathScreenController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u3
        [4] = u7
        [5] = u4
    --]]
    u5.KnitStart(u12)
    u6.Client:Get("DisplayDeathScreen"):Connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u4
            [4] = u12
        --]]
        local v14 = u3
        local v15 = {}
        local v16 = {}
        for v17, v18 in p13.deathScreen do
            v15[v17] = v18
        end
        v16.tree = v14.mount(u3.createElement(u7, v15), u4.LocalPlayer:WaitForChild("PlayerGui"))
        v16.props = p13.deathScreen
        v16.time = os.time()
        u12.activeDeathScreen = v16
    end)
end
function u8.unmountActiveDeathScreen(p19) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v20 = p19.activeDeathScreen
    if v20 ~= nil then
        v20 = v20.tree
    end
    if v20 then
        u3.unmount(v20)
    end
end
v2.CreateController(u8.new())
return nil