local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MaterialService
local u12 = v10.Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = u1.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = u1.import(script, script.Parent, "ui", "halloween-ability-initial-selection-app").HalloweenAbilityInitialSelectionApp
local u25 = u1.import(script, script.Parent, "ui", "halloween-ability-tree-app").HalloweenAbilityTreeApp
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "Halloween2024EventController"
    end,
    ["__index"] = u14
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
    --]]
    u14.constructor(p29, { u20.HALLOWEEN_2024_EVENT })
    p29.Name = "Halloween2024EventController"
end
function u26.KnitStart(p30) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p30)
end
function u26.onGameInit(u31) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u11
        [4] = u21
        [5] = u1
        [6] = u8
        [7] = u5
        [8] = u23
        [9] = u4
        [10] = u19
        [11] = u13
        [12] = u2
        [13] = u16
        [14] = u17
        [15] = u22
        [16] = u24
        [17] = u25
    --]]
    u31:hideNametags()
    u9.Controllers.ViewmodelController:setViewModelMode(u15.SHOW_ARMS)
    u11:SetBaseMaterialOverride(Enum.Material.Ground, "")
    u21.Client:Get("WinHalloweenEvent"):Connect(function(p32) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u8
            [3] = u5
            [4] = u23
            [5] = u31
            [6] = u4
            [7] = u19
        --]]
        u1.try(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.Halloween2024Stage3SceneController:disableMusic()
        end, function(p33) --[[ Line: 57 ]]
            warn(p33)
        end)
        u5:playSound(u23.HALLOWEEN_LTM_WIN)
        u31:disableFirstPersonMode()
        local v34 = false
        local v35 = 0
        while true do
            if v34 then
                v35 = v35 + 1
            else
                v34 = true
            end
            if v35 >= 12 then
                return
            end
            local v36 = 0
            local v37 = {}
            for v38, v39 in p32 do
                local _ = v38 - 1
                local v40 = v39.Character
                if v40 ~= nil then
                    v40 = v40.PrimaryPart
                    if v40 ~= nil then
                        v40 = v40.Position
                    end
                end
                if v40 ~= nil then
                    v36 = v36 + 1
                    v37[v36] = v40
                end
            end
            for _, u41 in v37 do
                task.spawn(function() --[[ Line: 97 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u41
                        [3] = u4
                        [4] = u19
                    --]]
                    local v42 = false
                    local v43 = 0
                    while true do
                        if v42 then
                            v43 = v43 + 1
                        else
                            v42 = true
                        end
                        if v43 >= 3 then
                            return
                        end
                        local v44 = u8.Controllers.FireworkController
                        local v45 = (math.random() - 0.5) * 30
                        local v46 = (math.random() - 0.5) * 30
                        v44:playFireworkEffect(u41 + Vector3.new(v45, 30, v46), u4.fromList(u19.NORMAL, u19.SPARKS))
                        task.wait(0.2)
                    end
                end)
            end
            task.wait(2.5)
        end
    end)
    u13.SceneLoadingScreenEnd:connect(function(p47) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u17
            [4] = u22
            [5] = u24
            [6] = u25
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u16.HALLOWEEN_VIEW_ABILITIES, u17[u16.HALLOWEEN_VIEW_ABILITIES].triggerConfig)
        if p47.sceneActivatedFrom == u22.HALLOWEEN_2024_STAGE_1 then
            task.delay(6, function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u24
                --]]
                local v48 = {
                    ["appId"] = "HalloweenAbilityInitialSelectionApp",
                    ["app"] = u24
                }
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v48, {})
            end)
            local v49 = {
                ["appId"] = "HalloweenAbilityTreeApp",
                ["app"] = u25
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v49, {})
        end
    end)
end
function u26.hideNametags(_) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
    --]]
    u6(function(p50, _) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v51 = u18:getEntity(p50)
        if v51 then
            v51:hideNametag()
        end
    end)
end
function u26.enableFirstPersonMode(_) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u12
    --]]
    u8.Controllers.MobileShiftLockController:blockShiftLock(true)
    u8.Controllers.FootstepsController.footstepModifier:addModifier({
        ["localVolumeMultiplier"] = 5,
        ["localFootstepFrequency"] = 0.13513513513513511
    })
    u8.Controllers.ScreenWobbleController:enableScreenWobble()
    u8.Controllers.ViewmodelController:setViewModelMode(u15.SHOW_ARMS)
    u12.LocalPlayer.CameraMinZoomDistance = 0
    u12.LocalPlayer.CameraMaxZoomDistance = 0
end
function u26.disableFirstPersonMode(_) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
    --]]
    u8.Controllers.MobileShiftLockController:blockShiftLock(false)
    u12.LocalPlayer.CameraMaxZoomDistance = 14
    task.delay(5, function() --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12.LocalPlayer.CameraMinZoomDistance = 4
        task.delay(0.1, function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12.LocalPlayer.CameraMinZoomDistance = 0
        end)
    end)
end
u8.CreateController(u26.new())
return nil