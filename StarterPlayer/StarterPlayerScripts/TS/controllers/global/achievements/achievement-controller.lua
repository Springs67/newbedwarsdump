local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta").AchievementsMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRankMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent, "ui", "achievement-notification").AchievementNotification
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "AchievementController"
    end,
    ["__index"] = u12
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p24)
    p24.Name = "AchievementController"
    p24.lastNotifTime = 0
    p24.notifDelay = 3.5
end
function u21.KnitStart(u25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u19
        [4] = u7
        [5] = u15
        [6] = u16
        [7] = u18
        [8] = u13
        [9] = u10
        [10] = u11
        [11] = u2
        [12] = u14
    --]]
    u12.KnitStart(u25)
    local v26 = u6.Controllers.PreloadController
    local v27 = {
        ["sounds"] = {
            u19.ACHIEVEMENT_UNLOCK_COMMON,
            u19.ACHIEVEMENT_UNLOCK_RARE,
            u19.ACHIEVEMENT_UNLOCK_EPIC,
            u19.ACHIEVEMENT_UNLOCK_LEGENDARY
        }
    }
    local v28 = {}
    local v29 = #v28
    local v30 = 0
    local v31 = {}
    for v32, v33 in u7.values(u15) do
        local _ = v32 - 1
        local v34 = v33.icon
        if v34 ~= nil then
            v34 = v34.image
        end
        if v34 ~= nil then
            v30 = v30 + 1
            v31[v30] = v34
        end
    end
    local v35 = #v31
    table.move(v31, 1, v35, v29 + 1, v28)
    local v36 = v29 + v35
    local v37 = 0
    local v38 = {}
    for v39, v40 in u7.values(u16) do
        local _ = v39 - 1
        local v41 = v40.background
        if v41 ~= nil then
            v37 = v37 + 1
            v38[v37] = v41
        end
    end
    local v42 = #v38
    table.move(v38, 1, v42, v36 + 1, v28)
    local v43 = v36 + v42
    local v44 = 0
    local v45 = {}
    for v46, v47 in u7.values(u16) do
        local _ = v46 - 1
        local v48 = v47.frame
        if v48 ~= nil then
            v44 = v44 + 1
            v45[v44] = v48
        end
    end
    table.move(v45, 1, #v45, v43 + 1, v28)
    v27.imageIds = v28
    v26:runPreload(v27)
    u18.Client:Get("AchievementsUpdate"):Connect(function(p49) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u18
            [3] = u10
        --]]
        u13:dispatch({
            ["type"] = "LobbySetAchievements",
            ["achievements"] = p49.achievements
        })
        u18.Client:Get("RequestProfileData"):CallServerAsync(u10.LocalPlayer):andThen(function(p50) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            if p50 then
                u13:dispatch({
                    ["type"] = "LobbySetProfileData",
                    ["profileData"] = p50
                })
            end
        end)
    end)
    u18.Client:Get("AchievementUnlocked"):Connect(function(u51) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
        --]]
        if tick() - u25.lastNotifTime >= u25.notifDelay then
            u25:playUnlockNotification(u51.id)
            u25.lastNotifTime = tick()
        else
            local u52 = nil
            u52 = u11.Heartbeat:Connect(function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u51
                    [3] = u52
                --]]
                if tick() - u25.lastNotifTime >= u25.notifDelay then
                    u25:playUnlockNotification(u51.id)
                    u25.lastNotifTime = tick()
                    u52:Disconnect()
                end
            end)
        end
    end)
    u18.Client:Get("OpenAchievementApp"):Connect(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.ACHIEVEMENTS, {})
    end)
end
function u21.playUnlockNotification(p53, p54) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
        [3] = u16
        [4] = u3
        [5] = u8
        [6] = u20
        [7] = u10
    --]]
    local v55 = u19.ACHIEVEMENT_UNLOCK_COMMON
    local v56 = u17.getMeta(p54)
    if v56.rank then
        v55 = u16[v56.rank].sound
    end
    u3:playSound(v55)
    local u57 = u8.mount(u8.createElement(u20, {
        ["Id"] = p54
    }), u10.LocalPlayer:WaitForChild("PlayerGui"))
    task.delay(p53.notifDelay, function() --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u57
        --]]
        u8.unmount(u57)
    end)
end
v5.CreateController(u21.new())
return nil