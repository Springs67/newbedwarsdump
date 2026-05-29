local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.RunService
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "ScreenParticlesController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p16)
    p16.Name = "ScreenParticlesController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p17)
end
function u13.emitParticlesOnScreen(_, u18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u2
        [4] = u9
        [5] = u12
        [6] = u5
        [7] = u6
    --]]
    local u19 = u7("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["Parent"] = u10.CurrentCamera
    })
    u2:setQueryIgnored(u19, true)
    local v20 = {}
    for _, v21 in u18.particleEmitter do
        local v22 = v21:Clone()
        v22.LockedToPart = true
        v22.ZOffset = 0
        v22.EmissionDirection = Enum.NormalId.Back
        if not u18.keepEnabled then
            v22.Enabled = false
        end
        v22.Parent = u19
        table.insert(v20, v22)
    end
    local v28 = u9.Heartbeat:Connect(function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u12
            [3] = u5
            [4] = u10
            [5] = u19
        --]]
        local v23 = u18.depth
        local v24 = v23 == nil and 0.5 or v23
        local v25 = u12.ScreenWidthToWorldWidth(u12.ViewSizeX(), -v24, u5.Controllers.FovController:getBaseFOV()) * 1.2
        local v26 = u12.ScreenHeightToWorldHeight(u12.ViewSizeY(), -v24, u5.Controllers.FovController:getBaseFOV()) * 1.2
        local v27 = Vector3.new(v25, v26, 1)
        u19.CFrame = u10.CurrentCamera.CFrame * CFrame.new(0, 0, -v24 - 0.5)
        u19.Size = v27
    end)
    for _, v29 in v20 do
        local v30 = v29:GetAttribute("EmitCount")
        v29:Emit(v30 == nil and 30 or v30)
    end
    local u31 = u6.new()
    u31:GiveTask(u19)
    u31:GiveTask(v28)
    local v32 = u18.cleanupAfter
    if v32 ~= 0 and (v32 == v32 and v32) then
        task.delay(u18.cleanupAfter, function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:DoCleaning()
        end)
    end
    return u31
end
v4.CreateController(u13.new())
return nil