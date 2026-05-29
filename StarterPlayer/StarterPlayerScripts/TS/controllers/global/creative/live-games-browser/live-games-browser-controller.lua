local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "LiveGamesBrowserController"
    end,
    ["__index"] = u3
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.constructor(p8)
    p8.Name = "LiveGamesBrowserController"
    p8.remotes = u4.Client:GetNamespace("LiveCreativeServers")
end
function u5.KnitStart(p9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p9)
end
function u5.joinServer(p10, p11) --[[ Line: 28 ]]
    return p10.remotes:Get("LiveServersRequestJoin"):CallServerAsync(p11)
end
function u5.searchServers(p12, p13) --[[ Line: 31 ]]
    return p12.remotes:Get("LiveServersSeach"):CallServerAsync(p13)
end
v2.CreateController(u5.new())
return nil