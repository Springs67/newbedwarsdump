local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, script.Parent, "ui", "training-room-queue-hud").TrainingRoomQueueHud
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TrainingRoomLobbyController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "TrainingRoomLobbyController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u9
    --]]
    u7.KnitStart(u15)
    u3("TrainingAreaPortal", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:hookTeleporter(p16)
    end)
    u9.Client:Get("TrainingRoomShowQueuePopupOnClient"):Connect(function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:showQueuePopup(p17.message)
    end)
end
function u11.hookTeleporter(u18, p19) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p19 then
        p19.Touched:Connect(function(p20) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u18
            --]]
            if u6.LocalPlayer.Character and p20.Parent == u6.LocalPlayer.Character then
                u18:clickQueue()
            end
        end)
    end
end
function u11.showKitSelection(_) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.TRAINING_ROOM_KIT_SELECTION_APP, {
        ["IsInLobby"] = true
    })
end
function u11.showQueuePopup(p21, p22) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u6
    --]]
    if p21.trainingRoomHudTree then
        u5.unmount(p21.trainingRoomHudTree)
    end
    p21.trainingRoomHudTree = u5.mount(u5.createElement(u10, {
        ["message"] = p22
    }), u6.LocalPlayer:WaitForChild("PlayerGui"))
end
function u11.clickQueue(_) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.Client:Get("TrainingRoomQueue"):SendToServer({})
end
v4.CreateController(u11.new())
return nil