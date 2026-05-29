local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.TeleportService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, script.Parent, "ui", "afk-place-loading-screen").AfkPlaceLoadingScreen
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "AfkTeleporterController"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p14)
    p14.Name = "AfkTeleporterController"
    p14.teleportTime = 0
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u7
    --]]
    u8.KnitStart(u15)
    u3("AfkLobby", function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:hookAfkTeleporter(p16)
    end)
    u7.TeleportInitFailed:Connect(function(p17, p18, _, _, _) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        if p18 == Enum.TeleportResult.IsTeleporting or p18 == Enum.TeleportResult.Success then
            return nil
        end
        local v19 = p17.Character.PrimaryPart
        if v19 then
            v19.Anchored = false
        end
        u15:teleportToSpawnLocation(p17)
        u15:unMountTeleportToAfkHud()
    end)
end
function u11.hookAfkTeleporter(u20, p21) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u9
    --]]
    if p21 then
        p21.Touched:Connect(function(p22) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u20
                [3] = u11
                [4] = u9
            --]]
            local v23 = p22.Parent
            if v23 ~= nil then
                v23 = v23.Name
            end
            if v23 == "elk" then
                local v24 = p22.Parent.Parent
                if v24 ~= nil then
                    v24 = v24.Name
                end
                local v25 = u6.LocalPlayer.Character
                if v25 ~= nil then
                    v25 = v25.Name
                end
                if v24 == v25 and tick() - u20.teleportTime >= u11.TELEPORT_COOLDOWN then
                    u20.teleportTime = tick()
                    u9.Client:Get("TeleportToAfkLobby"):SendToServer()
                    u20:mountTeleportToAfkHud()
                    local u26 = u6.LocalPlayer.Character.PrimaryPart
                    if u26 then
                        task.delay(0.5, function() --[[ Line: 71 ]]
                            --[[
                            Upvalues:
                                [1] = u26
                            --]]
                            u26.Anchored = true
                        end)
                    end
                end
            end
            if u6.LocalPlayer.Character and (p22.Parent == u6.LocalPlayer.Character and tick() - u20.teleportTime >= u11.TELEPORT_COOLDOWN) then
                u20.teleportTime = tick()
                u9.Client:Get("TeleportToAfkLobby"):SendToServer()
                u20:mountTeleportToAfkHud()
                local u27 = u6.LocalPlayer.Character.PrimaryPart
                if u27 then
                    task.delay(0.5, function() --[[ Line: 86 ]]
                        --[[
                        Upvalues:
                            [1] = u27
                        --]]
                        u27.Anchored = true
                    end)
                end
            end
        end)
    end
end
function u11.mountTeleportToAfkHud(_) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    local v28 = {
        ["appId"] = "AfkPlaceLoadingScreen",
        ["app"] = u10
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v28, {})
end
function u11.unMountTeleportToAfkHud(_) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("AfkPlaceLoadingScreen")
end
function u11.teleportToSpawnLocation(_, p29) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.Client:Get("AfkTeleporterTouched"):SendToServer({
        ["player"] = p29
    })
end
u11.TELEPORT_COOLDOWN = 5
v4.CreateController(u11.new())
return nil