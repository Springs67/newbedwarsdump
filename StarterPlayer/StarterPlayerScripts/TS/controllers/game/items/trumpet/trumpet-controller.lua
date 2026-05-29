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
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "TrumpetController"
    end,
    ["__index"] = u15
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
    --]]
    u15.constructor(p26)
    p26.Name = "TrumpetController"
    p26.abilityMaid = u8.new()
    p26.effectCooldown = {}
end
function u23.isRelevantItem(_, p27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p27.itemType == u19.TRUMPET
end
function u23.onEnable(p28, _, _) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u4
        [4] = u9
        [5] = u5
        [6] = u16
        [7] = u11
    --]]
    p28:setupDestroyableYield(function() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u17.TRUMPET_PLAY, nil):expect()
    end)
    local v30 = {
        ["action"] = "Attack",
        ["actionId"] = "use-trumpet",
        ["boundFunction"] = function(_, p29, _) --[[ Name: boundFunction, Line 56 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u17
            --]]
            if p29 == Enum.UserInputState.Begin then
                if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u17.TRUMPET_PLAY) then
                    return nil
                end
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u17.TRUMPET_PLAY)
            end
        end
    }
    local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v30)
    p28.abilityMaid:GiveTask(v31)
    if u4.isMobileControls() then
        p28:setupYield(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u16
                [4] = u2
                [5] = u17
                [6] = u11
            --]]
            local u32 = u9.mount(u9.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u9.createElement(u5, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u16:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 74 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u17
                        --]]
                        if not u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u17.TRUMPET_PLAY) then
                            return nil
                        end
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u17.TRUMPET_PLAY)
                    end
                }) }), u11.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u32
                --]]
                u9.unmount(u32)
            end
        end)
    end
end
function u23.onDisable(p33) --[[ Line: 88 ]]
    p33.abilityMaid:DoCleaning()
end
function u23.KnitStart(p34) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
        [3] = u19
        [4] = u21
        [5] = u14
        [6] = u17
        [7] = u11
        [8] = u18
        [9] = u6
        [10] = u12
        [11] = u13
        [12] = u22
        [13] = u20
    --]]
    u15.KnitStart(p34)
    u7.Controllers.PreloadController:preloadForItemType(u19.TRUMPET, {
        ["sounds"] = { u21.TRUMPET_PLAY }
    })
    u14.AbilityUsed:connect(function(p35) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u11
            [3] = u18
            [4] = u19
            [5] = u6
            [6] = u21
            [7] = u12
            [8] = u13
            [9] = u22
            [10] = u20
        --]]
        local v36
        if p35.ability == u17.TRUMPET_PLAY then
            v36 = p35.userCharacter == u11.LocalPlayer.Character
        else
            v36 = false
        end
        if v36 then
            local v37 = u18.getInventory(u11.LocalPlayer).hand
            if v37 ~= nil then
                v37 = v37.itemType
            end
            v36 = v37 == u19.TRUMPET
        end
        if v36 then
            local v38 = u6
            local v39 = u21.TRUMPET_PLAY
            local v40 = {}
            local v41
            if p35.userCharacter == u11.LocalPlayer.Character then
                v41 = nil
            else
                v41 = p35.userCharacter:GetPivot().Position
            end
            v40.position = v41
            v38:playSound(v39, v40)
            local v42 = u12.Assets.Effects.Trumpet:Clone()
            v42.CFrame = p35.userCharacter:GetPivot()
            v42.Parent = u13
            u22:playEffects({ v42 }, nil)
            u20.Client:Get("TrumpetPlay"):CallServer()
        end
    end)
end
u7.CreateController(u23.new())
return nil