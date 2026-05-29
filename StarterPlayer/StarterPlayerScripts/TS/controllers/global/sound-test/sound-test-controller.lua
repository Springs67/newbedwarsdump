local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, script.Parent, "sound-test-app").SoundTestApp
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "SoundTestController"
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
    --]]
    u5.constructor(p12)
    p12.Name = "SoundTestController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u7
        [5] = u2
        [6] = u8
    --]]
    u5.KnitStart(p13)
    u6.Client:Get("OpenSoundTest"):Connect(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u2
            [4] = u8
        --]]
        local v14 = u4.keys(u7)
        local v15 = u4.values(u7)
        local v16 = table.create(#v14)
        for v17, v18 in v14 do
            local v19 = v17 - 1
            v16[v17] = {
                ["Key"] = tostring(v18),
                ["AssetId"] = v15[v19 + 1]
            }
        end
        local v20 = {
            ["appId"] = "SoundTestApp",
            ["app"] = u8
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v20, {
            ["SoundMap"] = v16
        })
    end)
end
v3.CreateController(u9.new())
return nil