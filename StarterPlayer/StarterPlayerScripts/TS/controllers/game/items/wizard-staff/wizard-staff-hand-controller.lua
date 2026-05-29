local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.MobileButton
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, script.Parent, "ui", "wizard-ability-bar-base").WizardAbilityBarBase
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "WizardStaffHandController"
    end,
    ["__index"] = u15
})
u27.__index = u27
function u27.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
    --]]
    u15.constructor(p30)
    p30.Name = "WizardStaffHandController"
    p30.abilitiesMaid = u10.new()
    p30.uiMaid = u10.new()
end
function u27.KnitStart(p31) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.KnitStart(p31)
end
function u27.onDisable(p32) --[[ Line: 54 ]]
    p32:setAbility(nil)
    p32.uiMaid:DoCleaning()
    p32.abilitiesMaid:DoCleaning()
end
function u27.onEnable(u33, u34, _) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u18
        [4] = u26
        [5] = u5
        [6] = u11
        [7] = u6
        [8] = u24
        [9] = u16
        [10] = u14
        [11] = u17
        [12] = u9
        [13] = u22
    --]]
    u33.currentStaff = u34.itemType
    u33:setupDestroyableYield(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
            [3] = u34
            [4] = u18
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u23:getManaId(u34.itemType) or u18.WIZARD_MANA, nil):expect()
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "WizardAbilityBar",
        ["app"] = u26
    }, {
        ["ChangeAbility"] = function(p35) --[[ Name: ChangeAbility, Line 70 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            return u33:changeAbility(p35)
        end,
        ["ChangeNextAbility"] = function() --[[ Name: ChangeNextAbility, Line 73 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            return u33:changeNextAbility()
        end,
        ["Abilities"] = u23:getStaffAbilities(u34.itemType) or {},
        ["ExtraAbilities"] = u23:getStaffExtraAbilities(u34.itemType) or {}
    })
    u33.uiMaid:GiveTask(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("WizardAbilityBar")
    end)
    if u5.isMobileControls() then
        local u36 = u11.mount(u11.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u11.createElement(u6, {
                ["Image"] = u24.SWAP_MOBILE,
                ["Position"] = u16:getActionMobileButtonPosition(),
                ["OnClick"] = function() --[[ Name: OnClick, Line 92 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33:changeNextAbility()
                end
            }) }), u14.LocalPlayer:WaitForChild("PlayerGui"))
        u33.uiMaid:GiveTask(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u36
            --]]
            return u11.unmount(u36)
        end)
    end
    local u38 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "ItemPrimary",
        ["actionId"] = "change-ability",
        ["boundFunction"] = function(_, p37, _) --[[ Name: boundFunction, Line 105 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if p37 == Enum.UserInputState.Begin then
                u33:changeNextAbility()
            end
        end
    })
    u33.abilitiesMaid:GiveTask(function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        return u38
    end)
    u33.abilitiesMaid:GiveTask(u14.LocalPlayer:GetAttributeChangedSignal("WizardAbility"):Connect(function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u33
        --]]
        u17:dispatch({
            ["type"] = "KitWizardSetAbility",
            ["ability"] = u33:getAbility()
        })
    end))
    local v39 = u23:getStaffAbilities(u34.itemType)
    local v40
    if v39 then
        v40 = v39[1]
    else
        v40 = u33:getAbility()
    end
    u33:setAbility(v40)
    local v41 = u14.LocalPlayer
    if not v41 then
        return nil
    end
    if u9.Controllers.KitController:getKitSkin(v41) == u22.DEFAULT then
        u33:setTheme(u34.tool, u33:getAbility())
    end
end
function u27.changeAbility(p42, p43) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u14
        [3] = u19
        [4] = u21
        [5] = u9
        [6] = u22
        [7] = u8
    --]]
    if p43 == p42:getAbility() then
        return nil
    end
    u20:playAnimation(u14.LocalPlayer, u19.WIZARD_ABILITY_SWITCH)
    p42:setAbility(p43)
    local v44 = u21:getEntity(u14.LocalPlayer)
    if not v44 then
        return nil
    end
    local v45 = v44:getInstance()
    if u9.Controllers.KitController:getKitSkin(v45) == u22.DEFAULT then
        local v46 = v44:getItemInHand()
        if v46 then
            p42:setTheme(v46, p43)
        end
        local v47 = u8.Controllers.ViewmodelController:getViewModel()
        if v47 ~= nil then
            for v48, v49 in v47:GetChildren() do
                local _ = v48 - 1
                local v50 = string.find(v49.Name, "wizard_staff")
                if v50 ~= 0 and (v50 == v50 and v50) then
                    p42:setTheme(v49, p43)
                end
            end
        end
    end
end
function u27.changeNextAbility(p51) --[[ Line: 170 ]]
    p51:changeAbility(p51:getNextAbility())
end
function u27.setAbility(_, p52) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.LocalPlayer:SetAttribute("WizardAbility", p52)
end
function u27.getAbility(_) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
    --]]
    return u14.LocalPlayer:GetAttribute("WizardAbility") or u18.LIGHTNING_STRIKE
end
function u27.getNextAbility(p53) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v54 = p53:getAbility()
    local v55 = u23:getStaffAbilities(p53.currentStaff)
    if not v55 then
        return v54
    end
    local v56 = -1
    for v57, v58 in v55 do
        local _ = v57 - 1
        if v58 == v54 == true then
            v56 = v57 - 1
            break
        end
    end
    local v59 = v56 + 1
    return v55[(#v55 <= v59 and 0 or v59) + 1]
end
function u27.getColorTheme(_, p60) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u4
    --]]
    return p60 == u18.LIGHTNING_STRIKE and {
        ["Neon"] = u4.hexColor(6260671),
        ["OuterOrb"] = u4.hexColor(6260671),
        ["CenterOrb"] = u4.hexColor(6260671),
        ["InnerOrb"] = u4.hexColor(6260671)
    } or (p60 == u18.LIGHTNING_STORM and {
        ["Neon"] = u4.hexColor(15191385),
        ["OuterOrb"] = u4.hexColor(15191385),
        ["CenterOrb"] = u4.hexColor(15191385),
        ["InnerOrb"] = u4.hexColor(15191385)
    } or {
        ["Neon"] = u4.hexColor(6260671),
        ["OuterOrb"] = u4.hexColor(6260671),
        ["CenterOrb"] = u4.hexColor(6260671),
        ["InnerOrb"] = u4.hexColor(6260671)
    })
end
function u27.setTheme(p61, p62, p63) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u13
    --]]
    local v64 = p61:getColorTheme(p63)
    for v65, v66 in p62.Handle:GetChildren() do
        local _ = v65 - 1
        if v66:IsA("BasePart") and string.lower(v66.Name) == "neon" then
            v66.Color = v64.Neon
        end
    end
    if p62.Handle:FindFirstChild("Neon") then
        p62.Handle.Neon.Color = v64.Neon
    end
    if p61.currentStaff ~= u25.WIZARD_STAFF then
        if p62.Handle:FindFirstChild("OuterOrb") then
            p62.Handle.OuterOrb.Color = v64.OuterOrb
        end
        if p62.Handle:FindFirstChild("CenterOrb") then
            p62.Handle.CenterOrb.Color = v64.OuterOrb
        end
        if p62.Handle:FindFirstChild("InnerOrb") then
            p62.Handle.InnerOrb.Color = v64.OuterOrb
        end
        for v67, v68 in p62:GetDescendants() do
            local _ = v67 - 1
            if v68:IsA("ParticleEmitter") then
                v68.Color = ColorSequence.new(v64.OuterOrb)
                u13:AddTag(v68, "FirstPersonHidden")
            end
        end
    end
end
function u27.isRelevantItem(_, p69) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23:isWizardStaff(p69.itemType)
end
function u27.onStartCharging(_) --[[ Line: 273 ]] end
function u27.onStopCharging(_) --[[ Line: 275 ]] end
function u27.onLaunch(_) --[[ Line: 277 ]] end
function u27.onStartReload(_) --[[ Line: 279 ]] end
u8.CreateController(u27.new())
return nil