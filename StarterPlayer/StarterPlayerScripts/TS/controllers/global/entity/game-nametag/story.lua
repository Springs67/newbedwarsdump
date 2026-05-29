local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ServerStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity
local u11 = v1.import(script, script.Parent, "game-player-nametag").GamePlayerNametag
return function(_) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u9
        [4] = u7
        [5] = u8
        [6] = u10
        [7] = u3
        [8] = u4
        [9] = u11
    --]]
    local u12 = u2.new()
    local v13 = {
        ["Game"] = u9
    }
    local v14 = u5.combineReducers(v13)
    local v15 = u5.Store.new(v14, {
        ["Game"] = {
            ["myTeam"] = nil
        }
    })
    local u16 = u7.Assets.Villagers:WaitForChild("vesta"):Clone()
    u16.Name = "GameNametagDummy"
    u16.PrimaryPart.Anchored = true
    u16.Parent = u8
    local v17 = u10.new(u16)
    v17:hideLobbyDisplayName()
    v17:setHealth(150)
    v17:setBaseMaxHealth(150)
    u12:GiveTask(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:Destroy()
    end)
    local u18 = u3.mount(u3.createElement(u4, {
        ["store"] = v15
    }, { u3.createElement(u11, {
            ["AppId"] = "GameNametag",
            ["EntityInstance"] = u16
        }) }), u16)
    u12:GiveTask(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u18
        --]]
        u3.unmount(u18)
    end)
    return function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:DoCleaning()
    end
end