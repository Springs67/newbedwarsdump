local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u10 = u1.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "HalloweenEventController"
    end,
    ["__index"] = u9
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
    --]]
    u9.constructor(p19, { u13.HALLOWEEN_EVENT })
    p19.Name = "HalloweenEventController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p20)
end
function u16.onGameInit(u21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u1
        [3] = u7
        [4] = u5
        [5] = u15
        [6] = u4
        [7] = u12
        [8] = u2
    --]]
    u14.Client:Get("WinHalloweenEvent"):Connect(function(p22) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u7
            [3] = u5
            [4] = u15
            [5] = u21
            [6] = u4
            [7] = u12
        --]]
        u1.try(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7.Controllers.HalloweenBossSceneController:disableMusic()
        end, function(p23) --[[ Line: 43 ]]
            warn(p23)
        end)
        u5:playSound(u15.HALLOWEEN_LTM_WIN)
        u21:disableFirstPersonMode()
        local v24 = false
        local v25 = 0
        while true do
            if v24 then
                v25 = v25 + 1
            else
                v24 = true
            end
            if v25 >= 12 then
                return
            end
            local v26 = 0
            local v27 = {}
            for v28, v29 in p22 do
                local _ = v28 - 1
                local v30 = v29.Character
                if v30 ~= nil then
                    v30 = v30.PrimaryPart
                    if v30 ~= nil then
                        v30 = v30.Position
                    end
                end
                if v30 ~= nil then
                    v26 = v26 + 1
                    v27[v26] = v30
                end
            end
            for _, u31 in v27 do
                task.spawn(function() --[[ Line: 83 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u31
                        [3] = u4
                        [4] = u12
                    --]]
                    local v32 = false
                    local v33 = 0
                    while true do
                        if v32 then
                            v33 = v33 + 1
                        else
                            v32 = true
                        end
                        if v33 >= 3 then
                            return
                        end
                        local v34 = u7.Controllers.FireworkController
                        local v35 = (math.random() - 0.5) * 30
                        local v36 = (math.random() - 0.5) * 30
                        v34:playFireworkEffect(u31 + Vector3.new(v35, 30, v36), u4.fromList(u12.NORMAL, u12.SPARKS))
                        task.wait(0.2)
                    end
                end)
            end
            task.wait(2.5)
        end
    end)
    u21:hideNametags()
    u21:enableFirstPersonMode()
    u7.Controllers.ConsumableController:setDisplayBoostList(false)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("ConsumableBoostList")
end
function u16.hideNametags(_) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    u6(function(p37, _) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v38 = u11:getEntity(p37)
        if v38 then
            v38:hideNametag()
        end
    end)
end
function u16.enableFirstPersonMode(_) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u8
    --]]
    u7.Controllers.MobileShiftLockController:blockShiftLock(true)
    u7.Controllers.FootstepsController.footstepModifier:addModifier({
        ["localVolumeMultiplier"] = 5,
        ["localFootstepFrequency"] = 0.13513513513513511
    })
    u7.Controllers.ScreenWobbleController:enableScreenWobble()
    u7.Controllers.ViewmodelController:setViewModelMode(u10.SHOW_ARMS)
    u8.LocalPlayer.CameraMinZoomDistance = 0
    u8.LocalPlayer.CameraMaxZoomDistance = 0
end
function u16.disableFirstPersonMode(_) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    u7.Controllers.MobileShiftLockController:blockShiftLock(false)
    u8.LocalPlayer.CameraMaxZoomDistance = 14
    task.delay(5, function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.LocalPlayer.CameraMinZoomDistance = 4
        task.delay(0.1, function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.LocalPlayer.CameraMinZoomDistance = 0
        end)
    end)
end
u7.CreateController(u16.new())
return nil