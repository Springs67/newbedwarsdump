local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar
return function(_) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u6
    --]]
    local u7 = u4.Assets.Misc.SkeletonChristmas:Clone()
    u7:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
    u7.Parent = u5
    local u8 = u2.mount(u2.createElement("BillboardGui", {
        ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 18, 0),
        ["MaxDistance"] = 200,
        ["Adornee"] = u7.PrimaryPart,
        ["Size"] = UDim2.new(0, 200, 0, 100)
    }, { u2.createElement(u6, {
            ["health"] = 500,
            ["maxHealth"] = 1000
        }) }), u7.PrimaryPart)
    return function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u8
        --]]
        u7:Destroy()
        u2.unmount(u8)
    end
end