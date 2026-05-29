local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.MaterialService
local u10 = v8.Players
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u13 = u1.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = u1.import(script, script.Parent, "ui", "halloween-ability-initial-selection-app").HalloweenAbilityInitialSelectionApp
local u23 = u1.import(script, script.Parent, "ui", "halloween-ability-tree-app").HalloweenAbilityTreeApp
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "Halloween2025EventController"
    end,
    ["__index"] = u12
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u18
    --]]
    u12.constructor(p27, { u18.HALLOWEEN_2025_EVENT_PVE })
    p27.Name = "Halloween2025EventController"
    p27.abilityMounted = false
end
function u24.KnitStart(p28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p28)
end
function u24.onGameInit(u29) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u9
        [4] = u19
        [5] = u1
        [6] = u5
        [7] = u21
        [8] = u4
        [9] = u17
        [10] = u11
        [11] = u2
        [12] = u14
        [13] = u15
        [14] = u20
        [15] = u22
        [16] = u23
    --]]
    u29:hideNametags()
    u29:enableFirstPersonMode()
    u7.Controllers.ViewmodelController:setViewModelMode(u13.SHOW_ARMS)
    u9:SetBaseMaterialOverride(Enum.Material.Ground, "")
    u19.Client:Get("WinHalloweenEvent"):Connect(function(p30) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u7
            [3] = u5
            [4] = u21
            [5] = u29
            [6] = u4
            [7] = u17
        --]]
        u1.try(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7.Controllers.Halloween2024Stage3SceneController:disableMusic()
        end, function(p31) --[[ Line: 56 ]]
            warn(p31)
        end)
        u5:playSound(u21.HALLOWEEN_LTM_WIN)
        u29:disableFirstPersonMode()
        local v32 = false
        local v33 = 0
        while true do
            if v32 then
                v33 = v33 + 1
            else
                v32 = true
            end
            if v33 >= 12 then
                return
            end
            local v34 = 0
            local v35 = {}
            for v36, v37 in p30 do
                local _ = v36 - 1
                local v38 = v37.Character
                if v38 ~= nil then
                    v38 = v38.PrimaryPart
                    if v38 ~= nil then
                        v38 = v38.Position
                    end
                end
                if v38 ~= nil then
                    v34 = v34 + 1
                    v35[v34] = v38
                end
            end
            for _, u39 in v35 do
                task.spawn(function() --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u39
                        [3] = u4
                        [4] = u17
                    --]]
                    local v40 = false
                    local v41 = 0
                    while true do
                        if v40 then
                            v41 = v41 + 1
                        else
                            v40 = true
                        end
                        if v41 >= 3 then
                            return
                        end
                        local v42 = u7.Controllers.FireworkController
                        local v43 = (math.random() - 0.5) * 30
                        local v44 = (math.random() - 0.5) * 30
                        v42:playFireworkEffect(u39 + Vector3.new(v43, 30, v44), u4.fromList(u17.NORMAL, u17.SPARKS))
                        task.wait(0.2)
                    end
                end)
            end
            task.wait(2.5)
        end
    end)
    u11.SceneLoadingScreenEnd:connect(function(p45) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u2
            [3] = u14
            [4] = u15
            [5] = u20
            [6] = u22
            [7] = u23
        --]]
        if not u29.abilityMounted then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u14.HALLOWEEN_VIEW_ABILITIES, u15[u14.HALLOWEEN_VIEW_ABILITIES].triggerConfig)
            u29.abilityMounted = true
        end
        if p45.sceneActivatedFrom == u20.HALLOWEEN_2024_STAGE_1 then
            task.delay(6, function() --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u22
                --]]
                local v46 = {
                    ["appId"] = "HalloweenAbilityInitialSelectionApp",
                    ["app"] = u22
                }
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v46, {})
            end)
            local v47 = {
                ["appId"] = "HalloweenAbilityTreeApp",
                ["app"] = u23
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v47, {})
        end
    end)
end
function u24.hideNametags(_) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u16
    --]]
    u6(function(p48, _) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v49 = u16:getEntity(p48)
        if v49 then
            v49:hideNametag()
        end
    end)
end
function u24.enableFirstPersonMode(_) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u10
    --]]
    u7.Controllers.MobileShiftLockController:blockShiftLock(true)
    u7.Controllers.FootstepsController.footstepModifier:addModifier({
        ["localVolumeMultiplier"] = 5,
        ["localFootstepFrequency"] = 0.13513513513513511
    })
    u7.Controllers.ScreenWobbleController:enableScreenWobble()
    u7.Controllers.ViewmodelController:setViewModelMode(u13.SHOW_ARMS)
    u10.LocalPlayer.CameraMinZoomDistance = 0
    u10.LocalPlayer.CameraMaxZoomDistance = 0
end
function u24.disableFirstPersonMode(_) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
    --]]
    u7.Controllers.MobileShiftLockController:blockShiftLock(false)
    u10.LocalPlayer.CameraMaxZoomDistance = 14
    task.delay(5, function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10.LocalPlayer.CameraMinZoomDistance = 4
        task.delay(0.1, function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.LocalPlayer.CameraMinZoomDistance = 0
        end)
    end)
end
u7.CreateController(u24.new())
return nil