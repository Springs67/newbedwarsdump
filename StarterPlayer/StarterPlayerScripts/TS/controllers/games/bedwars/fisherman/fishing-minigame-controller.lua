local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "fisherman", "fisherman-drops")
local u13 = v12.FishermanDropsEarlyGame
local u14 = v12.FishermanDropsLateGame
local u15 = u1.import(script, script.Parent, "ui", "fisherman-minigame-app").FishermanMinigameApp
local u16 = u1.import(script, script.Parent, "ui", "fisherman-minigame-game-over").FisherMinigameGameOver
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "FishingMinigameController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p20)
    p20.Name = "FishingMinigameController"
end
function u17.KnitStart(p21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p21)
end
function u17.startMinigame(u22, u23, u24, u25) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u13
        [4] = u14
        [5] = u5
        [6] = u15
        [7] = u7
        [8] = u2
        [9] = u8
        [10] = u9
        [11] = u16
        [12] = u1
    --]]
    if u22.minigameMaid then
        u22.minigameMaid:DoCleaning()
    else
        u22.minigameMaid = u4.new()
    end
    local v26
    if os.time() - u11:getState().Game.startTime < 480 then
        v26 = u13:getMaxElementWeight()
    else
        v26 = u14:getMaxElementWeight()
    end
    local v27 = {
        ["fishType"] = u23.fishModel,
        ["decaySpeedMultiplier"] = 1 + (1 - u23.weight / v26)
    }
    local v28
    if u25 == nil then
        v28 = u25
    else
        v28 = u25.duration
    end
    v27.duration = v28
    local v29
    if u25 == nil then
        v29 = u25
    else
        v29 = u25.customUI
        if v29 ~= nil then
            v29 = v29.size
        end
    end
    v27.size = v29
    local v30
    if u25 == nil then
        v30 = u25
    else
        v30 = u25.customUI
        if v30 ~= nil then
            v30 = v30.position
        end
    end
    v27.position = v30
    local v31
    if u25 == nil then
        v31 = u25
    else
        v31 = u25.customUI
        if v31 ~= nil then
            v31 = v31.anchorPoint
        end
    end
    v27.anchorPoint = v31
    local v32 = u5.createElement(u15, v27)
    local v33
    if u25 == nil then
        v33 = u25
    else
        v33 = u25.customUI
    end
    if v33 then
        u22.appMaid = u4.new()
        local v34 = u5
        local v35 = u5.createFragment({
            ["FishingMinigameScreen"] = u5.createElement("ScreenGui", {}, { v32 })
        })
        local v36
        if u25 == nil then
            v36 = u25
        else
            v36 = u25.customUI.parent
        end
        if v36 == nil then
            v36 = u7.LocalPlayer:WaitForChild("PlayerGui")
        end
        local u37 = v34.mount(v35, v36)
        u22.appMaid:GiveTask(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u37
            --]]
            u5.unmount(u37)
        end)
    else
        u22.appMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(v32)
    end
    local u38 = u7.LocalPlayer.Character
    if u38 ~= nil then
        u38 = u38.PrimaryPart
        if u38 ~= nil then
            u38 = u38.CFrame.Position
        end
    end
    local v39
    if u25 == nil then
        v39 = u25
    else
        v39 = u25.cancelOnMove
    end
    if v39 == nil and true or v39 then
        local u40 = nil
        u40 = u8.Heartbeat:Connect(function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u7
                [3] = u25
                [4] = u22
                [5] = u24
                [6] = u40
            --]]
            local v41 = not u38
            if not v41 then
                local v42 = u7.LocalPlayer.Character
                if v42 ~= nil then
                    v42 = v42.PrimaryPart
                    if v42 ~= nil then
                        v42 = (v42.Position - u38).Magnitude
                    end
                end
                local v43 = v42 == nil and 1 or v42
                local v44 = u25
                if v44 ~= nil then
                    v44 = v44.interactionRangeLimit
                end
                v41 = (v44 == nil and 0.5 or v44) < v43
            end
            if v41 then
                u22:cancelMinigame()
                u24({
                    ["gameOver"] = true,
                    ["win"] = false
                })
                u40:Disconnect()
            end
        end)
        u22.minigameMaid:GiveTask(u40)
    end
    local v50 = u9.FishermanMinigameEnd:connect(function(p45) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u24
            [3] = u2
            [4] = u23
            [5] = u5
            [6] = u16
            [7] = u1
        --]]
        local v46 = u22.minigameMaid
        if v46 ~= nil then
            v46:DoCleaning()
        end
        u24(p45)
        local v47 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
        local v48 = {
            ["win"] = p45.win,
            ["fishType"] = u23.fishModel
        }
        local v49 = p45.timeElapsed
        v48.elapsedItem = v49 == nil and 0 or v49
        u22.gameOverScreenMaid = v47:addComponent(u5.createElement(u16, v48))
        u1.Promise.delay(3):andThen(function() --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if not u22.gameOverScreenMaid then
                return nil
            end
            u22.gameOverScreenMaid:DoCleaning()
        end)
    end)
    u22.minigameMaid:GiveTask(v50)
end
function u17.cancelMinigame(p51) --[[ Line: 194 ]]
    p51:closeFishingMinigameApp()
end
function u17.closeFishingMinigameApp(p52) --[[ Line: 197 ]]
    if p52.appMaid then
        local v53 = p52.appMaid
        if v53 ~= nil then
            v53:DoCleaning()
        end
    end
end
v3.CreateController(u17.new())
return nil