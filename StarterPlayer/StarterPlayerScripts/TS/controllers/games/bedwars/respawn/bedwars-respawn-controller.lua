local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, script.Parent, "ui", "respawn-timer").RespawnTimerWrapper
local u13 = u8.CurrentCamera
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BedwarsRespawnController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "BedwarsRespawnController"
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u10
        [4] = u8
        [5] = u4
        [6] = u13
        [7] = u5
        [8] = u12
        [9] = u2
    --]]
    u11.Client:OnEvent("EntityDeathEvent", function(p19) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u8
            [4] = u4
            [5] = u13
            [6] = u18
            [7] = u5
            [8] = u12
        --]]
        if p19.customUI then
            return nil
        end
        if p19.entityInstance == u7.LocalPlayer.Character then
            if u10.getGamePlayer(u7.LocalPlayer):isSpectator() then
                return nil
            end
            local v20 = u7:GetPlayerFromCharacter(p19.fromEntity)
            local u21
            if v20 == nil then
                u21 = v20
            else
                u21 = v20.Character
                if u21 ~= nil then
                    u21 = u21:FindFirstChildOfClass("Humanoid")
                end
            end
            local v22 = p19.entityInstance:FindFirstChild("Head")
            if v22 ~= nil then
                v22 = v22.Position
            end
            local u23 = u8:FindFirstChild("RespawnView")
            if v22 then
                u23 = u4("Part", {
                    ["Name"] = "DeathRespawnView",
                    ["CanCollide"] = false,
                    ["CanQuery"] = false,
                    ["Anchored"] = true,
                    ["Size"] = Vector3.new(0.1, 0.1, 0.1),
                    ["Transparency"] = 1,
                    ["Position"] = v22,
                    ["Parent"] = u8
                })
            end
            task.delay(0.1, function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u13
                    [3] = u23
                --]]
                if u21 then
                    u13.CameraSubject = u21
                elseif u23 then
                    u13.CameraSubject = u23
                end
            end)
            if p19.respawnDuration == 0 then
                return nil
            end
            u18.respawnTree = u5.mount(u5.createElement(u12, {
                ["RespawnDuration"] = p19.respawnDuration,
                ["KilledByPlayer"] = v20,
                ["DamageType"] = p19.damageType
            }), u7.LocalPlayer:WaitForChild("PlayerGui"))
        end
    end)
    u7.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u18
            [4] = u5
        --]]
        if u10.getGamePlayer(u7.LocalPlayer):isSpectator() and u18.respawnTree then
            u5.unmount(u18.respawnTree)
        end
    end)
    u2(function(p24, _) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u18
            [3] = u5
        --]]
        if p24 == u7.LocalPlayer and u18.respawnTree then
            u5.unmount(u18.respawnTree)
        end
    end)
end
return {
    ["BedwarsRespawnController"] = v3.CreateController(u14.new())
}