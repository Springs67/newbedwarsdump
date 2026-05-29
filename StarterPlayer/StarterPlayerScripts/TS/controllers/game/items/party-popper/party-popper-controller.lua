local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ContextActionService
local u12 = v10.Debris
local u13 = v10.Players
local u14 = v10.ReplicatedStorage
local u15 = v10.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v21.PARTY_POPPER
local u24 = v19.PARTY_POPPER
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "PartyPopperController"
    end,
    ["__index"] = u17
})
u25.__index = u25
function u25.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
    --]]
    u17.constructor(p28)
    p28.Name = "PartyPopperController"
    p28.abilityMaid = u8.new()
end
function u25.KnitStart(p29) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p29)
    p29:listenForAbility()
end
function u25.onEnable(p30, _, _) --[[ Line: 60 ]]
    p30:setupPopperControls()
end
function u25.onDisable(p31) --[[ Line: 63 ]]
    p31.abilityMaid:DoCleaning()
end
function u25.listenForAbility(u32) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u24
        [3] = u13
        [4] = u6
        [5] = u22
        [6] = u14
        [7] = u15
        [8] = u12
    --]]
    u16.AbilityUsed:connect(function(p33) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u13
            [3] = u32
            [4] = u6
            [5] = u22
            [6] = u14
            [7] = u15
            [8] = u12
        --]]
        if p33:isCancelled() then
            return nil
        end
        if p33.ability ~= u24 then
            return nil
        end
        if p33.ability == u24 and (p33.userCharacter == u13.LocalPlayer.Character and not u32:isPopperInHand()) then
            p33:setCancelled(true)
            return nil
        end
        local v34 = u6
        local v35 = u22.CONFETTI_POPPER
        local v36 = {}
        local v37
        if p33.userCharacter == u13.LocalPlayer.Character then
            v37 = nil
        else
            v37 = p33.userCharacter:GetPivot().Position
        end
        v36.position = v37
        v34:playSound(v35, v36)
        local v38 = u14.Assets.Effects.NewYearsConfetti:Clone()
        v38.CFrame = p33.userCharacter:GetPivot() + p33.userCharacter:GetPivot().LookVector * 5.5
        v38.Parent = u15
        local v39 = v38:FindFirstChildWhichIsA("ParticleEmitter", true)
        if v39 then
            v39:Emit(40)
        end
        u12:AddItem(v38, 1.25)
    end)
end
function u25.setupPopperControls(u40) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u24
        [3] = u11
        [4] = u4
        [5] = u9
        [6] = u5
        [7] = u18
        [8] = u13
    --]]
    u40:setupDestroyableYield(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u24
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u24, nil):expect()
    end)
    u40.abilityMaid:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        return u11:UnbindAction("use-popper")
    end)
    local v42 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-popper",
        ["boundFunction"] = function(_, p41, _) --[[ Name: boundFunction, Line 109 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            if p41 == Enum.UserInputState.Begin then
                u40:tryUseAbility()
            end
        end
    })
    u40.abilityMaid:GiveTask(v42)
    if u4.isMobileControls() then
        u40:setupYield(function() --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u18
                [4] = u40
                [5] = u13
            --]]
            local u43 = u9.mount(u9.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u9.createElement(u5, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u18:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 126 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        return u40:tryUseAbility()
                    end
                }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u43
                --]]
                u9.unmount(u43)
            end
        end)
    end
end
function u25.tryUseAbility(_) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u24
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u24) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u24)
    end
end
function u25.isPopperInHand(p44) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u13
    --]]
    local v45 = u20.getInventory(u13.LocalPlayer).hand
    if v45 then
        return p44:isRelevantItem(v45)
    else
        return false
    end
end
function u25.isRelevantItem(_, p46) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p46.itemType == u23
end
v7.CreateController(u25.new())
return nil