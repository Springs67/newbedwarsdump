local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, script.Parent, "ui", "missing-keys-modal").MissingKeysModal
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "KeysController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
    --]]
    u5.constructor(p12)
    p12.Name = "KeysController"
    p12.keysRemotes = u7.Client:GetNamespace("Keys")
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u8
        [5] = u3
    --]]
    u5.KnitStart(p13)
    p13.keysRemotes:Get("KeysDataUpdate"):Connect(function(p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v15 = {
            ["type"] = "SetKeysPartial",
            ["data"] = {
                ["keysData"] = p14
            }
        }
        u6:dispatch(v15)
    end)
    p13.keysRemotes:Get("NotifyMissingQueueKeys"):Connect(function(p16) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u3
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            ["appId"] = "MissingKeyModal",
            ["app"] = u8,
            ["layer"] = u3.MAIN
        }, {
            ["MissingKeys"] = p16.missingKeys,
            ["QueueType"] = p16.queueType
        })
    end)
end
v4.CreateController(u9.new())
return nil