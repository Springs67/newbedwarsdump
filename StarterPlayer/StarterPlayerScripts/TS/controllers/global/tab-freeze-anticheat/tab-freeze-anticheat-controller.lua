local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TabFreezeAnticheat"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "TabFreezeAnticheat"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
        [4] = u5
    --]]
    u6.KnitStart(p12)
    u4.RenderStepped:Connect(function(p13) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
        --]]
        if p13 > 2.5 then
            local v14 = u7.Client:Get("TabFreezeAnticheat_ClientToServerReport")
            local v15 = {
                ["report"] = {
                    ["frozenSeconds"] = p13,
                    ["endServerTime"] = u5:GetServerTimeNow()
                }
            }
            v14:SendToServer(v15)
        end
    end)
end
v2.CreateController(u8.new())
return nil