local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.RunService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "DodoBirdSittingController"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10, ...)
    p10.Name = "DodoBirdSittingController"
end
function u7.KnitStart(p11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
    --]]
    u6.KnitStart(p11)
    u5.Stepped:Connect(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        for _, v12 in u4:GetTagged("dodo-bird-mount") do
            local v13 = v12.Parent
            if v13 and v13.PrimaryPart then
                local v14 = (v13.HumanoidRootPart.CFrame * CFrame.new(0, -1.3, 0)):ToObjectSpace(v12.RootPart.master.torso["torso.001"].TransformedWorldCFrame)
                local v15 = CFrame.Angles(1.2217304763960306, 0, 0)
                v13.LowerTorso.Root.Transform = v14 * v15
            end
        end
    end)
end
v2.CreateController(u7.new())
return nil