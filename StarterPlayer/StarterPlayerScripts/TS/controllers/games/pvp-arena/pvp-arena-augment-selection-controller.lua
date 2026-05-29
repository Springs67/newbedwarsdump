local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "collector", "collector-player").CollectorPlayer
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, script.Parent, "ui", "pvp-arena-augment-icon").PvPArenaAugmentIcon
local u17 = v1.import(script, script.Parent, "ui", "pvp-arena-augment-selection-interface").PvPArenaAugmentSelectionInterface
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "PvpArenaAugmentSelectionController"
    end,
    ["__index"] = u11
})
u18.__index = u18
function u18.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
    --]]
    u11.constructor(p21, { u14.PVP_ARENA })
    p21.Name = "PvpArenaAugmentSelectionController"
end
function u18.KnitStart(p22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p22)
end
function u18.onGameInit(u23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u8
    --]]
    u23.selectedAugments = {}
    u15.Client:Get("PvPArenaStartAugmentSelection"):Connect(function(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.selectedAugment = nil
        u23:mountAugmentSelectionInterface(p24.augments, p24.endTime, p24.rerolls)
    end)
    u15.Client:Get("PvPArenaAugmentForceSelect"):Connect(function(p25) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:selectAugment(p25.augment)
    end)
    u15.Client:Get("PvPArenaAugmentUserIdSelected"):Connect(function(p26) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u8
            [3] = u23
        --]]
        u13:dispatch({
            ["type"] = "BedwarsSetPvPArenaAugmentSelection",
            ["userId"] = p26.userId,
            ["augment"] = p26.augment
        })
        if p26.userId == u8.LocalPlayer.UserId then
            u23.selectedAugments[p26.augment] = true
        end
    end)
end
function u18.selectAugment(p27, p28) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u15
        [3] = u10
        [4] = u2
    --]]
    if p27.selectedAugment then
        return nil
    end
    p27.selectedAugment = p28
    u3:playSound("rbxassetid://10977862000")
    u15.Client:Get("PvPArenaAugmentSelected"):SendToServer({
        ["augment"] = p28
    })
    u10.PvPArenaAugmentClientSelected:fire(p28)
    p27:setupAugmentInfoIcon(p28)
    task.delay(1, function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvpArenaAugmentSelectionInterface")
    end)
end
function u18.mountAugmentSelectionInterface(_, p29, p30, p31) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvpArenaAugmentSelectionInterface") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvpArenaAugmentSelectionInterface")
    end
    local v32 = {
        ["appId"] = "PvpArenaAugmentSelectionInterface",
        ["app"] = u17
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v32, {
        ["SelectionEndTime"] = p30,
        ["Augments"] = p29,
        ["Rerolls"] = p31
    })
end
function u18.setupAugmentInfoIcon(p33, p34) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u16
        [4] = u9
        [5] = u5
        [6] = u12
    --]]
    local v35 = u4.Controllers.StatusInfoListController
    local v36 = u6.createElement
    local v37 = u16
    local v38 = {
        ["EnableTooltip"] = true,
        ["Augment"] = p34,
        ["FrameProps"] = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
    }
    p33.augmentInfoIcon = v35:waitForSetupAddElement(v36(v37, v38), "Left", "AugmentInfoIcon", UDim2.fromScale(0.1, 1))
    local v39 = u9.CurrentCamera
    if v39 and u4.Controllers.StatusInfoListController:getList() then
        local v40 = u5("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.03, 0.03)
        })
        u6.mount(u6.createElement(u16, {
            ["Augment"] = p34
        }), v40)
        local v41 = u4.Controllers.StatusInfoListController:getList()
        if v41 ~= nil then
            v41 = v41:WaitForChild("AugmentInfoIcon")
        end
        if v41 ~= nil then
            v41 = v41:FindFirstChildWhichIsA("GuiObject")
        end
        local v42
        if v41 == nil then
            v42 = v41
        else
            v42 = v41:IsA("GuiObject")
        end
        if v42 then
            local v43 = u12
            local v44 = Vector2.new(v39.ViewportSize.X / 2, v39.ViewportSize.Y / 2)
            local v45
            if v41 == nil then
                v45 = v41
            else
                v45 = v41.AbsolutePosition.X
            end
            v43:create(v40, v44, Vector2.new(v45, v41.AbsolutePosition.Y + v41.AbsoluteSize.Y / 2), {
                ["amount"] = 1,
                ["disableSounds"] = true
            }).play()
        end
    end
end
function u18.getLocalPlayerAugmentSelections(p46) --[[ Line: 139 ]]
    return p46.selectedAugments
end
u4.CreateController(u18.new())
return nil