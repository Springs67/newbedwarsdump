local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, script.Parent, "ui", "custom-kit-creation-main-gui").CustomKitCreation_MainGUI
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "CustomKitCreationController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u5
    --]]
    u9.constructor(p17, { u10.CUSTOM_KIT_CREATOR })
    p17.Name = "CustomKitCreationController"
    p17.maid = u5.new()
    p17.loadedKits = false
    p17.customKits = {}
end
function u14.KnitStart(p18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p18)
end
function u14.onGameInit(u19) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u11
        [4] = u8
    --]]
    u12.Client:Get("CustomKitCreation_SendProfileDataToClient"):Connect(function(p20) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u4
            [3] = u11
            [4] = u8
        --]]
        u19.customKits = p20.customKits
        u19.loadedKits = true
        if u4.Controllers.MatchController:getMatchState() == u11.RUNNING then
            u19:mountGui()
        else
            u8.MatchStateChange:connect(function(p21) --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u19
                --]]
                if p21.matchState == u11.RUNNING then
                    u19:mountGui()
                end
            end)
        end
    end)
    u12.Client:Get("CustomKit_ClientGameInitialized"):SendToServer({})
end
function u14.requestKitChanges(p22) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p22.loadedKits then
        return u12.Client:Get("CustomKitCreation_RequestKitChanges"):CallServer({
            ["customKits"] = p22.customKits
        }) and true or false
    else
        return false
    end
end
function u14.mountGui(u23) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u13
    --]]
    task.spawn(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u7
            [3] = u6
            [4] = u13
        --]]
        while not u23.loadedKits do
            task.wait(0.1)
        end
        local v24 = u7.LocalPlayer:WaitForChild("PlayerGui")
        local v25 = u6.mount
        local v26 = u6.createElement
        local v27 = u13
        local v28 = {
            ["CustomKits"] = u23.customKits,
            ["OnSave"] = function() --[[ Name: OnSave, Line 79 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                return u23:requestKitChanges()
            end
        }
        local u29 = v25(v26(v27, v28), v24, "CustomKitCreationMainGUI")
        u23.maid:GiveTask(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u29
            --]]
            u6.unmount(u29)
        end)
    end)
end
v3.CreateController(u14.new())
return nil