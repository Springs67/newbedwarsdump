local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v3.registerConstants(script, {
    ["ReturnBackHome"] = true
})
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SmallBeeController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "SmallBeeController"
    p11.random = Random.new()
end
function u8.KnitStart(p12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u2
        [4] = u7
    --]]
    u6.KnitStart(p12)
    while true do
        local v13 = task.wait(0.5)
        if v13 == 0 or (v13 ~= v13 or not v13) then
            break
        end
        for _, v14 in u5:GetTagged("flower-bee") do
            if v14.Parent then
                local v15 = v14.Parent.PrimaryPart
                if v15 ~= nil then
                    v15 = v15.Position + Vector3.new(0, 2, 0)
                end
                if v14.Parent.PrimaryPart and v15 then
                    local v16 = u2:getBlockPosition(v14.Root.Position + Vector3.new(0, 0, 0))
                    local v17
                    if u2:getStore():getBlockAt(v16) then
                        local v18 = (v14.Root.Position - u2:getWorldPosition(v16)).Unit
                        v17 = v18.Magnitude <= 0 and Vector3.new(0, 0, 0) or v18 * 10
                    else
                        v17 = Vector3.new(0, 0, 0)
                    end
                    if (v14.Root.Position - v15).Magnitude > v14:GetAttribute("MaxDistanceFromOrigin") and u7.ReturnBackHome == true then
                        local v19 = CFrame
                        local v20 = v14.Root.Position
                        v14.Root.BodyGyro.CFrame = v19.lookAt(v20, v15 + v17)
                    else
                        local v21 = v14.Root.CFrame.LookVector
                        local v22 = p12.random:NextNumber(-2, 2)
                        local v23 = p12.random:NextNumber(-2, 2)
                        local v24 = p12.random
                        local v25 = v21 + Vector3.new(v22, v23, v24:NextNumber(-2, 2)) + v17
                        local v26 = v25.Unit:Cross(Vector3.new(0, 1, 0))
                        local v27 = v26:Cross(v25.Unit)
                        v14.Root.BodyGyro.CFrame = CFrame.fromMatrix(v14.Root.Position, v26, v27)
                    end
                    local v28 = v14.Root.CFrame.LookVector.Unit * 10
                    local v29 = time() * 6
                    local v30 = math.sin(v29)
                    local v31 = Vector3.new(0, v30, 0)
                    v14.Root.BodyVelocity.Velocity = v28 + v31
                else
                    v14:Destroy()
                end
            else
                v14:Destroy()
            end
        end
    end
end
v4.CreateController(u8.new())
return nil