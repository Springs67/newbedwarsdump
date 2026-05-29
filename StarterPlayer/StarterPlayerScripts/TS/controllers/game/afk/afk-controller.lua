local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "AfkController"
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
    p11.Name = "AfkController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u7
    --]]
    u6.KnitStart(p12)
    local u13 = u5.CurrentCamera
    u13 = u13
    if u13 ~= nil then
        local u14 = u13.CFrame.LookVector
    end
    u13 = u13
    local v15
    if u13 == nil then
        v15 = u13
    else
        v15 = u13.CFrame.Position
    end
    local u16 = v15
    local u17 = nil
    u17 = u4.Heartbeat:Connect(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
            [3] = u14
            [4] = u16
            [5] = u17
            [6] = u7
        --]]
        local v18 = u5.CurrentCamera
        local v19
        if v18 == nil then
            v19 = v18
        else
            v19 = v18.CFrame.LookVector
        end
        if not v19 then
            u13 = nil
            u14 = nil
            u16 = nil
            return nil
        end
        if not u14 then
            u13 = v18
            u14 = v19
            u16 = v18.CFrame.Position
            return nil
        end
        local v20
        if (u14 - v19).Magnitude > 1 then
            v20 = u16
        else
            v20 = false
        end
        if v20 then
            v20 = (u16 - v18.CFrame.Position).Magnitude < 10
        end
        if v20 then
            u17:Disconnect()
            u7.Client:Get("AfkInfo"):SendToServer({
                ["afk"] = false
            })
            return nil
        end
        u16 = v18.CFrame.Position
    end)
end
v2.CreateController(u8.new())
return nil