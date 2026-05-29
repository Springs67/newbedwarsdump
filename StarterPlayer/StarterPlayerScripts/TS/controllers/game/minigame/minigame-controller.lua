local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.Signal
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta")
local u11 = v10.getMinigameMeta
local v12 = v10.MinigameType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v16 = v1.import(script, script.Parent, "ui", "color-block-hud").ColorBlockHUD
local v17 = v1.import(script, script.Parent, "ui", "ice-fishing-hud").IceFishingHUD
local u18 = v1.import(script, script.Parent, "ui", "minigame-info").MinigameInfo
local u19 = v1.import(script, script.Parent, "ui", "minigame-team-score-hud").MinigameTeamScoreHud
local u20 = Color3.fromRGB(248, 246, 240)
local u21 = {
    [v12.COLOR_BLOCK] = u6.createElement(v16),
    [v12.ICE_FISHING] = u6.createElement(v17)
}
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "MinigameController"
    end,
    ["__index"] = u9
})
u22.__index = u22
function u22.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
    --]]
    u9.constructor(p25)
    p25.Name = "MinigameController"
    p25.scoreUpdateSignal = u5.new()
    p25.minigameActive = false
    p25.eliminated = false
end
function u22.KnitStart(u26) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u7
        [4] = u4
    --]]
    u9.KnitStart(u26)
    u26:listenForMinigameSelected()
    u26:listenForMinigameStarted()
    u26:listenForMinigameEnded()
    u14.Client:WaitFor("WinterMinigameTeamScoreUpdate"):expect():Connect(function(p27) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26.scoreSnapshot = p27.scoreUpdate
        u26.scoreUpdateSignal:Fire(p27.scoreUpdate)
    end)
    u14.Client:WaitFor("MinigamePlayerEliminated"):expect():Connect(function(p28) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u26
            [3] = u4
        --]]
        if p28 == u7.LocalPlayer.UserId then
            u26.eliminated = true
            u4.Controllers.SpectateUIController:setLobbyButtonsVisiblity(true)
            u4.Controllers.MinigameTeamController:updateActionBar("Your have been eliminated", Color3.fromRGB(255, 51, 51))
        end
    end)
end
function u22.isEliminated(p29) --[[ Line: 74 ]]
    return p29.eliminated
end
function u22.isMinigameActive(p30) --[[ Line: 77 ]]
    return p30.minigameActive
end
function u22.listenForMinigameSelected(u31) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:WaitFor("MinigameSelected"):expect():Connect(function(p32) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:minigameStartFade(p32.minigame)
    end)
end
function u22.listenForMinigameStarted(u33) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u4
    --]]
    u14.Client:WaitFor("MinigameStarted"):expect():Connect(function(p34) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u11
            [3] = u4
        --]]
        u33.minigameActive = true
        local v35 = u11(p34.minigame.type).teamScoresHud
        if v35 ~= nil then
            v35 = v35.disable
        end
        if not v35 then
            u33:displayMinigameHUD(p34.minigame)
        end
        if not u33:isEliminated() then
            u4.Controllers.SpectateUIController:setLobbyButtonsVisiblity(false)
        end
        u4.Controllers.WinterEventController:enableThirdPersonMode(12)
    end)
end
function u22.listenForMinigameEnded(u36) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
    --]]
    u14.Client:WaitFor("MinigameEnded"):expect():Connect(function(_) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u4
        --]]
        u36.minigameActive = false
        u36:hideMinigameHUD()
        u36:minigameEndFade()
        u36.scoreSnapshot = nil
        if not u36:isEliminated() then
            u4.Controllers.WinterEventController:forceFirstPersonMode()
        end
    end)
end
function u22.minigameStartFade(u37, u38) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
    --]]
    u8:fade(0.5, 3, 0.5, u20):andThen(function() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u38
        --]]
        u37:displayMinigameInfo(u38)
    end)
end
function u22.minigameEndFade(_) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
    --]]
    u8:fade(0.5, 3, 0.5, u20)
end
function u22.displayMinigameInfo(u39, p40) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
        [3] = u13
        [4] = u7
        [5] = u2
        [6] = u15
    --]]
    if u39.infoTree then
        u6.unmount(u39.infoTree)
    end
    u39.infoTree = u6.mount(u6.createElement(u18, {
        ["minigame"] = p40,
        ["startTime"] = os.time() + u13.INFO_SCREEN_DURATION
    }), u7.LocalPlayer:WaitForChild("PlayerGui"))
    task.delay(u13.INFO_SCREEN_DURATION, function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u6
            [3] = u2
            [4] = u15
        --]]
        if u39.infoTree then
            u6.unmount(u39.infoTree)
        end
        u2:playSound(u15.COUNTDOWN_GAMESTART)
    end)
end
function u22.displayMinigameHUD(p41, p42) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u21
        [3] = u19
        [4] = u7
    --]]
    if p41.hudTree then
        u6.unmount(p41.hudTree)
    end
    local v43 = u21[p42.type] or u6.createElement(u19, {
        ["Minigame"] = p42
    })
    p41.hudTree = u6.mount(v43, u7.LocalPlayer:WaitForChild("PlayerGui"))
end
function u22.hideMinigameHUD(p44) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p44.hudTree then
        u6.unmount(p44.hudTree)
    end
end
u4.CreateController(u22.new())
return nil