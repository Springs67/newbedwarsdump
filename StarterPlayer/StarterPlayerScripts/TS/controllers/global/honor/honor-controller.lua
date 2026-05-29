local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, script.Parent, "ui", "honor-gui").HonorGUI
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "HonorController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p12)
    p12.Name = "HonorController"
    p12.appId = "HonorGUI"
    p12.waitingForOpen = false
    p12.playerDatas = {}
end
function u9.KnitStart(p13) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p13)
end
function u9.honorPlayer(_, u14) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v15 = u7.Client:Get("TryGiveMatchHonorPoints"):CallServerAsync({
        ["toPlayerId"] = u14
    })
    v15:andThen(function(p16) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
        --]]
        local v17 = u14
        print("[HONOR] " .. (p16 and "Succesfully " or "Failed to ") .. " honored " .. tostring(v17))
        if p16 then
            u6:dispatch({
                ["type"] = "GameAddHonoredPlayer",
                ["userId"] = u14
            })
        end
    end)
    return v15
end
function u9.hasHonoredPlayer(_, p18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v19 = u6:getState().Game.honoredPlayers
    return table.find(v19, p18) ~= nil
end
function u9.toggleGui(p20, p21) --[[ Line: 55 ]]
    if p20.waitingForOpen then
        return nil
    elseif p20:isGuiOpen() then
        p20:closeGui()
    else
        p20:showGui(p21)
    end
end
function u9.showGui(p22, p23) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u8
    --]]
    if p22:isGuiOpen() or p22.waitingForOpen then
        return nil
    end
    p22:closeGui()
    p22.waitingForOpen = true
    p22.playerDatas = u7.Client:Get("RequestMatchPlayerPerformanceHonorData"):CallServer()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = p22.appId,
        ["app"] = u8
    }, {
        ["PadBottom"] = p23,
        ["PlayerDatas"] = p22.playerDatas
    })
    task.wait(0.1)
    p22.waitingForOpen = false
end
function u9.closeGui(p24) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local v25 = u4.LocalPlayer:FindFirstChild("PlayerGui")
    if v25 then
        for _, v26 in v25:GetChildren() do
            if v26.Name == "HonorMatchEnd" then
                v26:Destroy()
            end
        end
    end
    if not p24:isGuiOpen() then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p24.appId)
end
function u9.isGuiOpen(p27) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(p27.appId)
end
v3.CreateController(u9.new())
return nil