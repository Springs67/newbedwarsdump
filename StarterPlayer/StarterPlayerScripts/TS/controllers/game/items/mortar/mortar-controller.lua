local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.DeviceUtil
local u7 = v4.SoundManager
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.ReplicatedStorage
local u15 = v12.RunService
local u16 = v12.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v27 = {}
local u28 = setmetatable({}, {
    ["__index"] = v27
})
u28.default = 0
v27[0] = "default"
u28.settingUpMortar = 1
v27[1] = "settingUpMortar"
u28.aiming = 2
v27[2] = "aiming"
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "MortarController"
    end,
    ["__index"] = u18
})
u29.__index = u29
function u29.new(...) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u11
        [3] = u28
    --]]
    u18.constructor(p32)
    p32.Name = "MortarController"
    p32.mainMaid = u11.new()
    p32.aimingMaid = u11.new()
    p32.abilityMaid = u11.new()
    p32.firingMaid = u11.new()
    p32.mortarState = u28.default
end
function u29.onEnable(u33, _, _) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u2
        [3] = u6
        [4] = u19
        [5] = u22
        [6] = u17
        [7] = u13
        [8] = u23
        [9] = u24
    --]]
    u33.mortarState = u28.default
    local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "start-aiming-mortar",
        ["boundFunction"] = function(_, p34, _) --[[ Name: boundFunction, Line 70 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if p34 == Enum.UserInputState.Begin then
                u33:usedActionButton()
            end
        end
    })
    u33.mainMaid:GiveTask(v35)
    if u6.isMobileControls() then
        local v36 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v37 = u19.MORTAR
        local v38 = {
            ["abilityType"] = "ItemPrimary",
            ["clickToTrigger"] = true,
            ["abilityButton"] = {
                ["icon"] = u22.ANVIL_ART
            },
            ["inputStateToActivateAbilityOverride"] = Enum.UserInputState.Begin
        }
        local u39 = v36:enableAbility(v37, v38):expect()
        u33.mainMaid:GiveTask(function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39.Destroy()
        end)
    end
    u17.AbilityUsed:connect(function(p40) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u13
            [3] = u23
            [4] = u24
            [5] = u33
        --]]
        if p40.ability ~= u19.MORTAR then
            return nil
        end
        if p40.userCharacter ~= u13.LocalPlayer.Character then
            return nil
        end
        local v41 = u23.getInventory(u13.LocalPlayer).hand
        if v41 ~= nil then
            v41 = v41.itemType
        end
        if v41 ~= u24.DRAGON_MORTAR then
            return nil
        end
        u33:usedActionButton()
    end)
end
function u29.usedActionButton(p42) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u13
        [3] = u24
        [4] = u28
    --]]
    local v43 = u23.getInventory(u13.LocalPlayer).hand
    if v43 ~= nil then
        v43 = v43.itemType
    end
    if v43 == u24.DRAGON_MORTAR then
        local v44 = p42.mortarState
        if v44 == u28.default then
            p42:initiateAiming(u13.LocalPlayer)
            return
        elseif v44 == u28.settingUpMortar or v44 ~= u28.aiming then
            return
        elseif p42.targetIndicator then
            p42:launchMortar(u13.LocalPlayer, p42.targetIndicator.Position)
        else
            p42:launchMortar(u13.LocalPlayer, u13.LocalPlayer:GetMouse().Hit.Position)
        end
    else
        return nil
    end
end
function u29.onDisable(p45) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    p45.mortarState = u28.default
    p45.mainMaid:DoCleaning()
    p45.aimingMaid:DoCleaning()
    p45.abilityMaid:DoCleaning()
    p45.firingMaid:DoCleaning()
end
function u29.isRelevantItem(_, p46) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p46.itemType == u24.DRAGON_MORTAR
end
function u29.KnitStart(u47) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u24
        [4] = u20
        [5] = u25
        [6] = u13
    --]]
    u18.KnitStart(u47)
    u9.Controllers.PreloadController:preloadForItemType(u24.DRAGON_MORTAR, {
        ["animations"] = { u20.DRAGON_MORTAR_SETUP, u20.DRAGON_MORTAR_FIRE, u20.DRAGON_MORTAR_GET_UP }
    })
    u25.Client:Get("MortarLaunchedFromServer"):Connect(function(p48) --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u47
        --]]
        if u13.LocalPlayer == p48.player then
            return nil
        end
        u47:launchMortar_otherClients(p48.originPosition)
    end)
    u25.Client:Get("MortarHit"):Connect(function(p49) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:mortarHit(p49.targetPosition)
    end)
end
function u29.initiateAiming(u50, u51) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u28
        [3] = u1
        [4] = u10
        [5] = u15
        [6] = u5
        [7] = u21
        [8] = u20
        [9] = u14
        [10] = u16
        [11] = u3
    --]]
    if u51 ~= u13.LocalPlayer then
        return nil
    end
    local u52 = u51.Character
    if u52 ~= nil then
        u52 = u52.PrimaryPart
    end
    if not u52 then
        return nil
    end
    u50.aimingMaid:DoCleaning()
    u50.firingMaid:DoCleaning()
    u50.mortarState = u28.settingUpMortar
    local u85 = u1.Promise.defer(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u50
            [3] = u52
            [4] = u1
            [5] = u15
            [6] = u51
            [7] = u5
            [8] = u21
            [9] = u20
            [10] = u28
            [11] = u14
            [12] = u16
            [13] = u3
        --]]
        local u53 = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["constantSpeedMultiplier"] = 0,
            ["blockSprint"] = true
        })
        u50.mainMaid:GiveTask(u53)
        u50.aimingMaid:GiveTask(u53)
        if u52 then
            local u56 = u1.Promise.defer(function() --[[ Line: 195 ]]
                --[[
                Upvalues:
                    [1] = u52
                    [2] = u15
                    [3] = u50
                --]]
                local u54 = u52.Position
                local v55 = u15.Heartbeat:Connect(function() --[[ Line: 197 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                        [2] = u54
                        [3] = u50
                    --]]
                    if (u52.Position - u54).Magnitude > 0.01 then
                        u50:cancelMortarAiming()
                    end
                end)
                u50.mainMaid:GiveTask(v55)
                u50.aimingMaid:GiveTask(v55)
            end)
            u50.mainMaid:GiveTask(function() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                return u56:cancel()
            end)
            u50.aimingMaid:GiveTask(function() --[[ Line: 210 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                return u56:cancel()
            end)
        end
        local v57 = u51.Character
        if v57 ~= nil then
            v57 = v57:FindFirstChild("Humanoid")
            if v57 ~= nil then
                v57 = v57:FindFirstChild("Animator")
            end
        end
        local u58 = v57 and u5:playAnimation(v57, u21:getAssetId(u20.DRAGON_MORTAR_SETUP), {
            ["looped"] = false
        })
        if u58 then
            u50.mainMaid:GiveTask(u58)
            u50.aimingMaid:GiveTask(u58)
            local v59 = task.delay(0.8, function() --[[ Line: 233 ]]
                --[[
                Upvalues:
                    [1] = u58
                --]]
                u58:AdjustSpeed(0)
            end)
            u50.mainMaid:GiveTask(v59)
            u50.mainMaid:GiveTask(function() --[[ Line: 238 ]]
                --[[
                Upvalues:
                    [1] = u58
                --]]
                u58:AdjustSpeed(1)
            end)
            u50.aimingMaid:GiveTask(v59)
            u50.aimingMaid:GiveTask(function() --[[ Line: 242 ]]
                --[[
                Upvalues:
                    [1] = u58
                --]]
                u58:AdjustSpeed(1)
            end)
        end
        local v84 = task.delay(0.8, function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u28
                [3] = u53
                [4] = u14
                [5] = u16
                [6] = u52
                [7] = u51
                [8] = u3
            --]]
            u50.mortarState = u28.aiming
            u53.Destroy()
            u50.targetIndicator = u14.Assets.Misc.MortarTargetIndicator:Clone()
            u50.targetIndicator.Parent = u16
            u50.targetIndicator.Anchored = true
            u50.targetIndicator.CFrame = CFrame.new(u52.Position)
            u50.mainMaid:GiveTask(u50.targetIndicator)
            u50.aimingMaid:GiveTask(u50.targetIndicator)
            local u60 = u51:GetMouse()
            local v83 = u60.Move:Connect(function() --[[ Line: 262 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u60
                    [3] = u52
                    [4] = u3
                --]]
                if not u50.targetIndicator then
                    return nil
                end
                local v61 = u60.Hit.Position
                local v62 = u52.Position.X
                local v63 = u52.Position.Z
                local v64 = Vector3.new(v62, 0, v63)
                local v65 = v61.X
                local v66 = v61.Z
                local v67 = Vector3.new(v65, 0, v66)
                if (v64 - v67).Magnitude > 100 then
                    v61 = v64 + (v67 - v64).Unit * 100
                end
                local v68 = u3:getBlockPosition(v61)
                local v69 = false
                local v70 = 0
                while true do
                    if v69 then
                        v70 = v70 + 1
                    else
                        v69 = true
                    end
                    if v70 >= 20 then
                        break
                    end
                    local v71 = u3:getStore()
                    local v72 = v68.X
                    local v73 = v68.Y - v70 + 1
                    local v74 = v68.Z
                    local v75 = v71:getBlockAt((Vector3.new(v72, v73, v74)))
                    if v75 then
                        local v76 = u3
                        local v77 = v68.X
                        local v78 = v68.Y - v70 + 1
                        local v79 = v68.Z
                        local v80 = v76:getWorldPosition((Vector3.new(v77, v78, v79))).Y + v75.Size.Y / 2
                        local v81 = v61.X
                        local v82 = v61.Z
                        v61 = Vector3.new(v81, v80, v82)
                        break
                    end
                end
                u50.targetIndicator.CFrame = CFrame.new(v61)
            end)
            u50.mainMaid:GiveTask(v83)
            u50.aimingMaid:GiveTask(v83)
        end)
        u50.aimingMaid:GiveTask(v84)
    end)
    u50.mainMaid:GiveTask(function() --[[ Line: 312 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        return u85:cancel()
    end)
    u50.aimingMaid:GiveTask(function() --[[ Line: 315 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        return u85:cancel()
    end)
end
function u29.launchMortar(u86, p87, p88) --[[ Line: 319 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
        [3] = u25
        [4] = u28
        [5] = u5
        [6] = u21
        [7] = u20
    --]]
    local v89 = p87.Character
    if v89 ~= nil then
        v89 = v89.PrimaryPart
        if v89 ~= nil then
            v89 = v89.Position
        end
    end
    if v89 then
        u7:playSound(u26.FIREWORK_LAUNCH, {
            ["position"] = v89
        })
        u7:playSound(u26.GUIDED_MISSILE_FIRE, {
            ["position"] = v89
        })
    end
    u25.Client:Get("MortarLaunchedFromClient"):SendToServer({
        ["targetPosition"] = p88
    })
    u86.aimingMaid:DoCleaning()
    u86.mortarState = u28.default
    local u90 = p87.Character
    if u90 ~= nil then
        u90 = u90:FindFirstChild("Humanoid")
        if u90 ~= nil then
            u90 = u90:FindFirstChild("Animator")
        end
    end
    local v91 = u90 and u5:playAnimation(u90, u21:getAssetId(u20.DRAGON_MORTAR_FIRE), {
        ["looped"] = false
    })
    if v91 then
        u86.firingMaid:GiveTask(v91)
        if v91 ~= nil then
            v91.Stopped:Connect(function() --[[ Line: 362 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u90
                    [3] = u21
                    [4] = u20
                    [5] = u86
                --]]
                local v92 = u5:playAnimation(u90, u21:getAssetId(u20.DRAGON_MORTAR_GET_UP), {
                    ["looped"] = false
                })
                if v92 then
                    u86.firingMaid:GiveTask(v92)
                end
            end)
        end
    end
    u86:resetMortar()
end
function u29.launchMortar_otherClients(_, p93) --[[ Line: 376 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
    --]]
    u7:playSound(u26.FIREWORK_LAUNCH, {
        ["position"] = p93
    })
    u7:playSound(u26.GUIDED_MISSILE_FIRE, {
        ["position"] = p93
    })
end
function u29.mortarHit(_, p94) --[[ Line: 384 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
    --]]
    u7:playSound(u26.GUIDED_MISSILE_EXPLOSION, {
        ["position"] = p94
    })
end
function u29.cancelMortarAiming(p95) --[[ Line: 389 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    p95.aimingMaid:DoCleaning()
    p95.firingMaid:DoCleaning()
    p95.mortarState = u28.default
end
function u29.resetMortar(_) --[[ Line: 396 ]] end
u9.CreateController(u29.new())
return nil