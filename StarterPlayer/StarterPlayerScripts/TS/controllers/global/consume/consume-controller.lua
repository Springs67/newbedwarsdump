local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityDisabled
local u5 = v3.ClickHold
local u6 = v3.MobileButton
local u7 = v3.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.UserInputService
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "consume-util").ConsumeUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "ConsumeController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
    --]]
    u16.constructor(p30)
    p30.Name = "ConsumeController"
    p30.maid = u10.new()
    p30.lastDisabledNotification = 0
end
function u27.KnitStart(u31) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u9
    --]]
    u16.KnitStart(u31)
    u15.StartConsuming:setPriority(u9.HIGHEST + 1):connect(function(p32) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        if p32:isCancelled() then
            return nil
        end
        if u31:isConsumeDisabled(p32.itemType, true) then
            p32:setCancelled(true)
        end
    end)
end
function u27.isConsumeDisabled(u33, p34, p35) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u25
        [4] = u10
        [5] = u2
        [6] = u11
        [7] = u4
    --]]
    local v36 = u20:getLocalPlayerEntity()
    local v37 = u22(p34)
    if v37 ~= nil then
        v37 = v37.consumable
        if v37 ~= nil then
            v37 = v37.blockingStatusEffects
        end
    end
    if v36 and (v37 and u25:hasAnyActive(v36:getInstance(), v37)) then
        if p35 and not u33.disabledActionBarMaid then
            local u38 = time()
            u33.lastDisabledNotification = u38
            u33.disabledActionBarMaid = u10.new()
            u33.disabledActionBarMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11.createElement(u4)))
            u33.disabledActionBarMaid:GiveTask(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33.disabledActionBarMaid = nil
            end)
            task.delay(1.5, function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u38
                --]]
                if u33.lastDisabledNotification ~= u38 then
                    return nil
                end
                local v39 = u33.disabledActionBarMaid
                if v39 ~= nil then
                    v39:DoCleaning()
                end
            end)
        end
        return true
    end
end
function u27.isRelevantItem(_, p40) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    return u26:isConsumable(p40.itemType)
end
function u27.onEnable(u41, u42) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u10
        [3] = u15
        [4] = u5
        [5] = u23
        [6] = u20
        [7] = u8
        [8] = u1
        [9] = u24
        [10] = u7
        [11] = u19
        [12] = u13
        [13] = u18
        [14] = u17
        [15] = u2
        [16] = u14
        [17] = u11
        [18] = u6
        [19] = u21
    --]]
    u41.maid:DoCleaning()
    local u43 = u22(u42.itemType)
    if not u43.consumable then
        return nil
    end
    local u44 = u10.new()
    local u45 = false
    local u46 = nil
    local u47 = nil
    local v48 = u43.consumable.consumeTime
    local v49 = u15.ConsumableConsumeTimeModifierCheck:fire(v48).consumeTime
    local u50 = u5.new(v49, u43.consumable.closeOnComplete)
    local u51 = nil
    local u52 = nil
    u50:setOnComplete(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u41
            [3] = u42
            [4] = u51
            [5] = u15
            [6] = u45
            [7] = u46
            [8] = u47
            [9] = u52
            [10] = u23
        --]]
        u44:DoCleaning()
        if u41:isConsumeDisabled(u42.itemType, true) then
            u51()
            u15.StopConsuming:fire(u42.itemType, false)
            return nil
        end
        u15.StopConsuming:fire(u42.itemType, true)
        u45 = false
        local v53 = u46
        if v53 ~= nil then
            v53:Stop()
        end
        local v54 = u47
        if v54 ~= nil then
            v54:Stop()
        end
        u52 = -1
        u23.Client:Get("ConsumeItem"):CallServerAsync({
            ["item"] = u42.tool
        }):andThen(function() --[[ Line: 131 ]] end):catch(function(p55) --[[ Line: 132 ]]
            warn(p55)
        end)
    end)
    u41.maid:GiveTask(function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50:disable()
    end)
    u52 = -1
    local function u77() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u20
            [3] = u44
            [4] = u8
            [5] = u45
            [6] = u52
            [7] = u15
            [8] = u42
            [9] = u51
            [10] = u1
            [11] = u24
            [12] = u47
            [13] = u7
            [14] = u19
            [15] = u13
            [16] = u18
            [17] = u46
            [18] = u50
        --]]
        local v56 = u43.consumable
        if v56 ~= nil then
            v56 = v56.requiresMissingHealth
        end
        if v56 then
            local v57 = u20:getLocalPlayerEntity()
            if v57 and v57:getHealth() >= v57:getMaxHealth() then
                return nil
            end
        end
        local v58 = u43.consumable
        if v58 ~= nil then
            v58 = v58.disableJump
        end
        if v58 then
            local v59 = u20:getLocalPlayerEntity()
            if not v59 then
                return nil
            end
            local u60 = v59:getHumanoid()
            if u60 then
                local u61 = u60.JumpHeight
                u44:GiveTask(function() --[[ Line: 163 ]]
                    --[[
                    Upvalues:
                        [1] = u60
                        [2] = u61
                    --]]
                    u60.JumpHeight = u61
                end)
                u60.JumpHeight = 0
            end
        end
        local v62 = u44
        local v63 = u8.Controllers.SprintController:getMovementStatusModifier()
        local v64 = {
            ["blockSprint"] = true
        }
        local v65 = u43.consumable
        if v65 ~= nil then
            v65 = v65.walkSpeedMultiplier
        end
        v64.moveSpeedMultiplier = v65 == nil and 0.5 or v65
        v62:GiveTask(v63:addModifier(v64))
        u45 = true
        local u66 = tick()
        u52 = u66
        if u15.StartConsuming:fire(u42.itemType):isCancelled() then
            u51()
            return nil
        end
        u1.Promise.defer(function() --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u24
                [3] = u47
                [4] = u7
                [5] = u52
                [6] = u66
            --]]
            local v67 = u43.consumable
            if v67 ~= nil then
                v67 = v67.soundOverride
            end
            if v67 == "None" then
                ::l4::
                return
            else
                while true do
                    local v68 = u43.consumable
                    if v68 ~= nil then
                        v68 = v68.soundOverride
                    end
                    if v68 == nil then
                        v68 = u24.EAT_FOOD_1
                    end
                    u47 = u7:playSound(v68)
                    local v69 = task.wait(0.23)
                    local v70 = (v69 ~= 0 and (v69 == v69 and v69) and true or false) and u52 == u66
                    if v70 then
                        local v71 = u43.consumable
                        if v71 ~= nil then
                            v71 = v71.disableSoundRepeat
                        end
                        v70 = v71 ~= true
                    end
                    if v70 == 0 or (v70 ~= v70 or not v70) then
                        goto l4
                    end
                end
            end
        end)
        u1.Promise.defer(function() --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u19
                [3] = u13
                [4] = u18
                [5] = u46
                [6] = u45
            --]]
            local v72 = u43.consumable
            if v72 ~= nil then
                v72 = v72.disableAnimation
            end
            if v72 ~= true then
                local v73 = u19
                local v74 = u13.LocalPlayer
                local v75 = u43.consumable
                if v75 ~= nil then
                    v75 = v75.animationOverride
                end
                if v75 == nil then
                    v75 = u18.EAT
                end
                u46 = v73:playAnimation(v74, v75, {
                    ["looped"] = true
                })
                if not u45 then
                    local v76 = u46
                    if v76 ~= nil then
                        v76:Stop()
                    end
                end
            end
        end)
        u50:startClick()
    end
    u51 = function() --[[ Name: stopConsuming, Line 255 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u45
            [3] = u52
            [4] = u50
            [5] = u46
            [6] = u47
        --]]
        u44:DoCleaning()
        u45 = false
        u52 = -1
        u50:endClick()
        local v78 = u46
        if v78 ~= nil then
            v78:Stop()
        end
        local v79 = u47
        if v79 ~= nil then
            v79:Stop()
        end
    end
    u41.maid:GiveTask(function() --[[ Line: 269 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51()
    end)
    if u43.consumable.cancelOnDamage then
        task.spawn(function() --[[ Line: 273 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u13
                [3] = u15
                [4] = u42
                [5] = u50
                [6] = u51
                [7] = u41
            --]]
            local u81 = u17.On(function(p80, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 274 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u15
                    [3] = u42
                    [4] = u50
                    [5] = u51
                --]]
                if p80 == u13.LocalPlayer.Character then
                    u15.StopConsuming:fire(u42.itemType, false)
                    u50:cancelClick()
                    u51()
                end
            end)
            u41.maid:GiveTask(function() --[[ Line: 281 ]]
                --[[
                Upvalues:
                    [1] = u81
                --]]
                u81()
            end)
        end)
    end
    local v83 = {
        ["action"] = "Attack",
        ["actionId"] = "consume-item",
        ["boundFunction"] = function(_, p82, _) --[[ Name: boundFunction, Line 291 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u51
                [3] = u15
                [4] = u42
            --]]
            if p82 == Enum.UserInputState.Begin then
                u77()
            elseif p82 == Enum.UserInputState.End then
                u51()
                u15.StopConsuming:fire(u42.itemType, false)
            end
        end
    }
    local v84 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v83)
    u41.maid:GiveTask(v84)
    if u14.TouchEnabled then
        u41:setupYield(function() --[[ Line: 303 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u11
                [3] = u6
                [4] = u21
                [5] = u2
                [6] = u77
                [7] = u51
                [8] = u15
                [9] = u42
                [10] = u13
            --]]
            u8.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await()
            local u85 = u11.mount(u11.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u11.createElement(u6, {
                    ["Image"] = u21.CONSUME_MOBILE,
                    ["Position"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("Consume"),
                    ["Size"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("Consume"),
                    ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 312 ]]
                        --[[
                        Upvalues:
                            [1] = u77
                        --]]
                        u77()
                    end,
                    ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 315 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                            [2] = u15
                            [3] = u42
                        --]]
                        u51()
                        u15.StopConsuming:fire(u42.itemType, false)
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 321 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u85
                --]]
                u11.unmount(u85)
            end
        end)
    end
end
function u27.onDisable(p86) --[[ Line: 327 ]]
    p86.maid:DoCleaning()
end
return {
    ["ConsumeController"] = u8.CreateController(u27.new())
}