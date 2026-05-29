local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ContextActionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "GlitchTrumpetController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u8
    --]]
    u16.constructor(p27)
    p27.Name = "GlitchTrumpetController"
    p27.maid = u8.new()
    p27.effectCooldown = {}
end
function u24.isRelevantItem(_, p28) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return p28.itemType == u20.GLITCH_TRUMPET
end
function u24.onEnable(p29, _, _) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u11
        [4] = u4
        [5] = u9
        [6] = u5
        [7] = u17
        [8] = u12
    --]]
    p29:setupDestroyableYield(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.GLITCH_TRUMPET_PLAY, nil):expect()
    end)
    p29.maid:GiveTask(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:UnbindAction("use-glitch-trumpet")
    end)
    local v31 = {
        ["action"] = "Attack",
        ["actionId"] = "glitch-infernal-shield-click",
        ["boundFunction"] = function(_, p30, _) --[[ Name: boundFunction, Line 61 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u18
            --]]
            if p30 == Enum.UserInputState.Begin then
                if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u18.GLITCH_TRUMPET_PLAY) then
                    return nil
                end
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.GLITCH_TRUMPET_PLAY)
            end
        end
    }
    local v32 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v31)
    p29.maid:GiveTask(v32)
    if u4.isMobileControls() then
        p29:setupYield(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u17
                [4] = u2
                [5] = u18
                [6] = u12
            --]]
            local u33 = u9.mount(u9.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u9.createElement(u5, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u17:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 79 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u18
                        --]]
                        if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u18.GLITCH_TRUMPET_PLAY) then
                            return nil
                        end
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u18.GLITCH_TRUMPET_PLAY)
                    end
                }) }), u12.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u33
                --]]
                u9.unmount(u33)
            end
        end)
    end
end
function u24.onDisable(p34) --[[ Line: 93 ]]
    p34.maid:DoCleaning()
end
function u24.KnitStart(p35) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u20
        [4] = u22
        [5] = u15
        [6] = u18
        [7] = u12
        [8] = u19
        [9] = u6
        [10] = u13
        [11] = u14
        [12] = u23
        [13] = u21
    --]]
    u16.KnitStart(p35)
    u7.Controllers.PreloadController:preloadForItemType(u20.GLITCH_TRUMPET, {
        ["sounds"] = { u22.TRUMPET_PLAY }
    })
    u15.AbilityUsed:connect(function(p36) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u12
            [3] = u19
            [4] = u20
            [5] = u6
            [6] = u22
            [7] = u13
            [8] = u14
            [9] = u23
            [10] = u21
        --]]
        local v37
        if p36.ability == u18.GLITCH_TRUMPET_PLAY then
            v37 = p36.userCharacter == u12.LocalPlayer.Character
        else
            v37 = false
        end
        if v37 then
            local v38 = u19.getInventory(u12.LocalPlayer).hand
            if v38 ~= nil then
                v38 = v38.itemType
            end
            v37 = v38 == u20.GLITCH_TRUMPET
        end
        if v37 then
            local v39 = u6
            local v40 = u22.TRUMPET_PLAY
            local v41 = {}
            local v42
            if p36.userCharacter == u12.LocalPlayer.Character then
                v42 = nil
            else
                v42 = p36.userCharacter:GetPivot().Position
            end
            v41.position = v42
            v39:playSound(v40, v41)
            local v43 = u13.Assets.Effects.Trumpet:Clone()
            v43.CFrame = p36.userCharacter:GetPivot()
            v43.Parent = u14
            u23:playEffects({ v43 }, nil)
            u21.Client:Get("GlitchTrumpetPlay"):CallServer()
        end
    end)
end
u7.CreateController(u24.new())
return nil