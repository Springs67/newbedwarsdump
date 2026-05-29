local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ServerStorage
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity
local u7 = v1.import(script, script.Parent, "nametag").NameTag
return function(_) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u2
        [5] = u7
    --]]
    local u8 = u4.Assets.Villagers:WaitForChild("vesta"):Clone()
    u8.Name = "NametagDummy"
    u8.PrimaryPart.Anchored = true
    u8.Parent = u5
    local v9 = u6.new(u8)
    v9:hideLobbyDisplayName()
    v9:setHealth(150)
    v9:setBaseMaxHealth(150)
    local u10 = u2.mount(u2.createElement(u7, {
        ["EntityInstance"] = u8
    }), u8)
    return function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u8
        --]]
        u2.unmount(u10)
        u8:Destroy()
    end
end