local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, script.Parent, "bed-health-bar-ui").BedHealthBarUi
return function(_) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
        [4] = u5
    --]]
    local u6 = u2("Part", {
        ["Children"] = { (u2("BillboardGui", {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 0),
                ["MaxDistance"] = 110,
                ["Size"] = UDim2.fromScale(10, 3)
            })) },
        ["Parent"] = u4
    })
    u6:SetAttribute("BedPlatingAmount", 80)
    u6:SetAttribute("BedPlatingTotal", 100)
    u6:SetAttribute("Health", 100)
    u6:SetAttribute("MaxHealth", 100)
    local u7 = u3.mount(u3.createElement(u5, {
        ["ShieldExpireTime"] = 20,
        ["BedBlock"] = u6,
        ["PlatingExpireTime"] = os.time() + 300
    }), u6)
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u6
        --]]
        u3.unmount(u7)
        u6:Destroy()
    end
end