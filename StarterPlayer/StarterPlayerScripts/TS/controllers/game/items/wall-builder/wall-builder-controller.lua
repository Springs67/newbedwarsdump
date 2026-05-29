local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "WallBuilderController"
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
    p10.Name = "WallBuilderController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
        [4] = u6
    --]]
    u5.KnitStart(p11)
    u2.PlaceBlock:connect(function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
        --]]
        local v13 = #p12.blockType - 7
        local v14 = v13 <= 0
        if not v14 then
            local v15 = p12.blockType
            v14 = string.sub(v15, v13) ~= "_builder"
        end
        if v14 then
            return nil
        end
        local v16 = u4.CurrentCamera.CFrame.LookVector
        local v17 = v16.X
        local v18 = math.abs(v17)
        local v19 = v16.Z
        local v20 = v18 - math.abs(v19) > 0 and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0)
        u6.Client:Get("WallBuilderPlaced"):SendToServer({
            ["blockPosition"] = p12.blockPosition,
            ["direction"] = v20,
            ["blockType"] = p12.blockType
        })
    end)
end
v3.CreateController(u7.new())
return nil