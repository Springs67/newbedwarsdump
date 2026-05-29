local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.RunService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v3.registerConstants(script, {
    ["ReturnBackHome"] = true
})
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BeeWanderController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13)
    p13.Name = "BeeWanderController"
    p13.random = Random.new()
end
function u10.KnitStart(u14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u2
        [5] = u9
    --]]
    u8.KnitStart(u14)
    u7.Heartbeat:Connect(function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u9
            [4] = u14
        --]]
        for _, v15 in u6:GetTagged("bee") do
            local v16 = v15:GetAttribute("BeeOrigin")
            if v15:GetAttribute("NextUpdateDirection") < time() then
                v15:SetAttribute("NextUpdateDirection", time() + 0.5)
                local v17 = u2:getBlockPosition(v15.Root.Position + Vector3.new(0, 0, 0))
                local v18
                if u2:getStore():getBlockAt(v17) then
                    local v19 = (v15.Root.Position - u2:getWorldPosition(v17)).Unit
                    v18 = v19.Magnitude <= 0 and Vector3.new(0, 0, 0) or v19 * 10
                else
                    v18 = Vector3.new(0, 0, 0)
                end
                if (v15.Root.Position - v16).Magnitude > v15:GetAttribute("MaxDistanceFromOrigin") and u9.ReturnBackHome == true then
                    local v20 = CFrame
                    local v21 = v15.Root.Position
                    v15.Root.BodyGyro.CFrame = v20.lookAt(v21, v16 + v18)
                else
                    local v22 = v15.Root.CFrame.LookVector
                    local v23 = u14.random:NextNumber(-2, 2)
                    local v24 = u14.random:NextNumber(-2, 2)
                    local v25 = u14.random
                    local v26 = v22 + Vector3.new(v23, v24, v25:NextNumber(-2, 2)) + v18
                    local v27 = v26.Unit:Cross(Vector3.new(0, 1, 0))
                    local v28 = v27:Cross(v26.Unit)
                    v15.Root.BodyGyro.CFrame = CFrame.fromMatrix(v15.Root.Position, v27, v28)
                end
            end
            local v29 = v15.Root.CFrame.LookVector.Unit * 5
            local v30 = time() * 6
            local v31 = math.sin(v30) / 1.5
            local v32 = Vector3.new(0, v31, 0)
            v15.Root.BodyVelocity.Velocity = v29 + v32
        end
    end)
end
v4.CreateController(u10.new())
return nil