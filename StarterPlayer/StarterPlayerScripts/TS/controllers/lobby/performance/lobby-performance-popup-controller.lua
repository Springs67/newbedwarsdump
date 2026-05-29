local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent, "ui", "lobby-performance-finalized-popup").LobbyPerformanceFinalizedPopup
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "LobbyPerformancePopupController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    u8.constructor(p15)
    p15.Name = "LobbyPerformancePopupController"
    p15.getMatchPerformancePopup = u10.Client:Get("SendMatchPerformancePopup")
    p15.processedMatches = {}
end
function u12.KnitStart(u16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u4
    --]]
    u8.KnitStart(u16)
    u16.getMatchPerformancePopup:Connect(function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u16
        --]]
        u5.Info("Queued popups {data}", u4(p17))
        u16:queuePopups(p17)
    end)
end
function u12.queuePopups(u18, p19) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
    --]]
    for v20, v21 in p19 do
        local _ = v20 - 1
        local v22 = u18.processedMatches
        table.insert(v22, v21)
        local _ = #v22
    end
    local v23 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
    local v24 = {}
    local v25 = #p19
    v24.message = "Click to view <b>" .. tostring(v25) .. "</b> processed matches."
    v24.image = u9.BED_RED_RENDER
    function v24.onClick() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:showPopup()
    end
    v23:sendInfoNotification(v24)
end
function u12.showPopup(p26) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u7
    --]]
    if p26.menuTree then
        u6.unmount(p26.menuTree)
    end
    p26.menuTree = u6.mount(u6.createElement(u11, {
        ["data"] = p26.processedMatches
    }), u7.LocalPlayer:WaitForChild("PlayerGui"), "MatchPerformancePopup")
    p26.processedMatches = {}
end
function u12.hidePopup(p27) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p27.menuTree then
        u6.unmount(p27.menuTree)
    end
end
v3.CreateController(u12.new())
return nil