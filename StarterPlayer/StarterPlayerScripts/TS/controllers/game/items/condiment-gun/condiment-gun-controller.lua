local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "condiment-gun", "condiment-gun-config").CondimentGunConfigs
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent, "condiment-ammo-component").CondimentAmmoComponent
local u26 = { u24.CONDIMENT_GUN_SHOT_1, u24.CONDIMENT_GUN_SHOT_2, u24.CONDIMENT_GUN_SHOT_3 }
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "CondimentGunController"
    end,
    ["__index"] = u15
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u11
        [3] = u23
    --]]
    u15.constructor(p30)
    p30.Name = "CondimentGunController"
    p30.maid = u11.new()
    p30.condimentGunToggle = u23.Client:Get("CondimentGunToggle")
    p30.condimentGunToggleEffects = u23.Client:Get("CondimentGunToggleEffects")
    p30.condimentGunCycleModes = u23.Client:Get("CondimentGunCycleModes")
    p30.soundMaid = u11.new()
end
function u27.KnitStart(u31) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
        [3] = u21
        [4] = u17
        [5] = u26
        [6] = u19
        [7] = u13
    --]]
    u15.KnitStart(u31)
    u9.Controllers.PreloadController:preloadForItemType(u21.CONDIMENT_GUN, {
        ["animations"] = { u17.FLAMETHROWER_IDLE },
        ["sounds"] = u26
    })
    u31.condimentGunToggleEffects:Connect(function(p32, p33, p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u31
            [3] = u13
            [4] = u9
        --]]
        local v35 = u19:getEntity(p32)
        if v35 ~= nil then
            v35 = v35:getHandItemInstanceFromCharacter()
        end
        if not v35 then
            return nil
        end
        u31:toggleEffects(v35, p33, p34)
        if p32 == u13.LocalPlayer then
            local v36 = v35:Clone()
            u31:updateEffects(v36)
            u9.Controllers.ViewmodelController:setHeldItem(v36)
        end
    end)
end
function u27.isRelevantItem(_, p37) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return p37.itemType == u21.CONDIMENT_GUN
end
function u27.onEnable(u38, p39, _) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u13
        [3] = u17
        [4] = u2
        [5] = u16
        [6] = u20
        [7] = u14
        [8] = u4
        [9] = u10
        [10] = u12
        [11] = u5
        [12] = u25
        [13] = u19
    --]]
    u38:setupYield(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u13
            [3] = u17
        --]]
        local u40 = u18:playAnimation(u13.LocalPlayer, u17.FLAMETHROWER_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            local v41 = u40
            if v41 ~= nil then
                v41:Stop()
            end
        end
    end)
    u38.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-condiment-gun",
        ["boundFunction"] = function(_, p42, _) --[[ Name: boundFunction, Line 92 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            if p42 == Enum.UserInputState.Begin then
                u38:toggleCondimentGun(true)
            elseif p42 == Enum.UserInputState.End then
                u38:toggleCondimentGun(false)
            end
        end
    }))
    local v43 = u38.maid
    local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v45 = u16.CONDIMENT_GUN_CYCLE
    local v46 = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = u20.CONDIMENT_GUN_ICON
        }
    }
    v43:GiveTask(v44:enableAbility(v45, v46):expect())
    u38.maid:GiveTask(u14.AbilityUsed:connect(function(p47) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u38
        --]]
        if p47.userCharacter == u13.LocalPlayer.Character then
            u38:cycleCondimentGunMode()
        end
    end))
    if u4.isMobileControls() then
        u38:setupYield(function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u12
                [3] = u5
                [4] = u20
                [5] = u2
                [6] = u38
                [7] = u13
            --]]
            u10.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await()
            local u48 = u12.mount(u12.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u12.createElement(u5, {
                    ["Image"] = u20.CONDIMENT_GUN_ICON,
                    ["Position"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("ItemSecondary"),
                    ["Size"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("ItemSecondary"),
                    ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 121 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        u38:toggleCondimentGun(true)
                    end,
                    ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 124 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        u38:toggleCondimentGun(false)
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u48
                --]]
                u12.unmount(u48)
            end
        end)
    end
    u38.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u25, {
        ["item"] = p39.tool
    })))
    local v49 = u19:getEntity(u13.LocalPlayer)
    if v49 ~= nil then
        v49 = v49:getHandItemInstanceFromCharacter()
    end
    if not v49 then
        return nil
    end
    u38:updateEffects(v49)
end
function u27.onDisable(p50) --[[ Line: 147 ]]
    p50.maid:DoCleaning()
end
function u27.toggleCondimentGun(p51, p52) --[[ Line: 150 ]]
    p51.condimentGunToggle:CallServerAsync({
        ["enabled"] = p52
    })
end
function u27.cycleCondimentGunMode(p53) --[[ Line: 155 ]]
    p53.condimentGunCycleModes:CallServerAsync()
end
function u27.updateEffects(p54, p55) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    p54:toggleEffects(p55, p55:GetAttribute("Enabled"), (p55:GetAttribute("Mode")))
    if u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local v56 = p55:Clone()
        u9.Controllers.ViewmodelController:setHeldItem(v56)
    end
end
function u27.toggleEffects(p57, p58, p59, p60) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u26
        [3] = u7
        [4] = u24
        [5] = u22
    --]]
    local v61 = u26
    u7:playSound(u6.fromList(unpack(v61)), {
        ["volumeMultiplier"] = 0.2,
        ["parent"] = p58.Handle
    })
    if p59 then
        local v62 = u7:playSound(u24.CONDIMENT_GUN_LOOP, {
            ["looped"] = true,
            ["volumeMultiplier"] = 0.2,
            ["parent"] = p58.Handle
        })
        if v62 then
            p57.soundMaid:GiveTask(v62)
        end
    else
        p57.soundMaid:DoCleaning()
    end
    local v63 = p58.Handle
    for _, v64 in v63.Emitter:GetDescendants() do
        if v64:IsA("Attachment") then
            local v65
            if v64.Name == p60 then
                v65 = p59
            else
                v65 = false
            end
            for _, v66 in v64:GetDescendants() do
                if v66:IsA("ParticleEmitter") then
                    v66.Enabled = v65
                end
            end
        end
    end
    local v67 = u22.condiments[p60].color
    local v68 = v67.light
    local v69 = v67.dark
    v63.liquid.Color = v68
    v63.band.Color = v69
    v63.bottle_cap.Color = v69
end
u9.CreateController(u27.new())
return nil