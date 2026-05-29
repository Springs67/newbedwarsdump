local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "MountSittingController"
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
    p11.Name = "MountSittingController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u7
    --]]
    u6.KnitStart(u12)
    u5.Stepped:Connect(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u12
        --]]
        for _, v13 in u4.Controllers.MountController:getActiveMounts() do
            local v14 = u7[v13.mountType]
            if v14 ~= nil then
                local v15 = v13.model.Parent
                if v15 ~= nil then
                    u12:performStep(v13.model, v14, v15)
                end
            end
        end
    end)
end
function u8.performStep(_, p16, p17, p18) --[[ Line: 43 ]]
    local v19 = p16.PrimaryPart and (p17.controlBoneCallback and p17.controlBoneCallback(p16))
    if v19 then
        local v20 = (p18.HumanoidRootPart.CFrame * CFrame.new(p17.playerMountOffset or Vector3.new(0, -1.3, 0))):ToObjectSpace(v19.TransformedWorldCFrame)
        local v21 = CFrame
        local v22 = math
        local v23 = p17.playerMountRotationOffsetDegrees
        if v23 ~= nil then
            v23 = v23.X
        end
        local v24 = 70 + (v23 == nil and 0 or v23)
        local v25 = v22.rad(v24)
        local v26 = p17.playerMountRotationOffsetDegrees
        if v26 ~= nil then
            v26 = v26.Y
        end
        local v27 = v26 == nil and 0 or v26
        local v28 = p17.playerMountRotationOffsetDegrees
        if v28 ~= nil then
            v28 = v28.Z
        end
        local v29 = v28 == nil and 0 or v28
        local v30 = v21.Angles(v25, v27, v29)
        p18.LowerTorso.Root.Transform = v20 * v30
    end
end
v3.CreateController(u8.new())
return nil