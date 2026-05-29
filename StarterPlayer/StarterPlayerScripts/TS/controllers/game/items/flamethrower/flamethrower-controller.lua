local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GamepadAction
local u6 = v3.MobileButton
local u7 = v3.UIUtil
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.ContextActionService
local u15 = v13.Players
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v21.FLAMETHROWER_USE
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "FlamethrowerController"
    end,
    ["__index"] = u17
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
function u26.constructor(p29, ...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
    --]]
    u17.constructor(p29, ...)
    p29.Name = "FlamethrowerController"
    p29.maid = u11.new()
    p29.inUse = false
end
function u26.KnitStart(p30) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p30)
end
function u26.useFlamethrower(u31) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u22
        [4] = u16
        [5] = u24
        [6] = u10
        [7] = u20
        [8] = u15
        [9] = u19
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u25) then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u25) < 0.25 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u25, "buffer", function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                if u31:isEnabled() then
                    u31:useFlamethrower()
                end
            end)
        end
        return nil
    end
    local v32 = u22.FLAMETHROWER_COOLDOWN_SEC
    local v33 = u16.ItemCooldownModifierCheck:fire(v32).cooldown
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u25, v33)
    if u31.inUse then
        return nil
    end
    u31.inUse = true
    task.delay(v33, function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31.inUse = false
    end)
    u24.Client:Get("UseFlamethrower"):CallServerAsync()
    local u34 = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0.2
    })
    u31.maid:GiveTask(u34)
    local v35 = u20:playAnimation(u15.LocalPlayer, u19.FLAMETHROWER_USE)
    if v35 then
        u31.maid:GiveTask(v35)
        u31.maid:GiveTask(v35.Destroying:Connect(function() --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34.Destroy()
        end))
    end
end
function u26.upgrade(p36) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u15
        [3] = u19
    --]]
    if p36:isEnabled() then
        local u37 = u20:playAnimation(u15.LocalPlayer, u19.FLAMETHROWER_UPGRADE)
        p36.maid:GiveTask(function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            local v38 = u37
            if v38 ~= nil then
                v38:Stop()
            end
        end)
    end
end
function u26.onEnable(u39, _) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u25
        [4] = u20
        [5] = u15
        [6] = u19
        [7] = u4
        [8] = u12
        [9] = u6
        [10] = u18
        [11] = u7
        [12] = u9
        [13] = u14
        [14] = u5
    --]]
    u39:setupYield(function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u25
        --]]
        local u40 = u11.new()
        u40:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u25))
        return function() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:DoCleaning()
        end
    end)
    u39:setupYield(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u15
            [3] = u19
        --]]
        local u41 = u20:playAnimation(u15.LocalPlayer, u19.FLAMETHROWER_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            local v42 = u41
            if v42 ~= nil then
                v42:Stop()
            end
        end
    end)
    local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-flamethrower",
        ["boundFunction"] = function(_, p43, _) --[[ Name: boundFunction, Line 118 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            if p43 == Enum.UserInputState.Begin then
                u39:useFlamethrower()
            end
        end
    })
    u39.maid:GiveTask(v44)
    if u4.isMobileControls() then
        u39:setupYield(function() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u6
                [3] = u18
                [4] = u39
                [5] = u15
            --]]
            local u45 = u12.mount(u12.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u12.createElement(u6, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u18:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 133 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        u39:useFlamethrower()
                    end
                }) }), u15.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 138 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u45
                --]]
                u12.unmount(u45)
            end
        end)
    end
    local v46 = u4.isGamepadControls() and "[B] " or "[X] "
    local u47 = u4.isMobileControls() and "" or v46
    u39:setupYield(function() --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u9
            [4] = u47
            [5] = u15
        --]]
        local u48 = u12.mount(u12.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u12.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(0.08, 0.1),
                ["Position"] = u7:getActionBarPosition(),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                ["BackgroundTransparency"] = 0.6,
                ["BorderSizePixel"] = 0,
                [u12.Event.MouseButton1Down] = function() --[[ Line: 162 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    u9.Controllers.PyroController:openUpgradeMenu()
                end
            }, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 4.675675675675675
                }), u12.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Font"] = "Roboto",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(0.8, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = "<b>" .. u47 .. "Upgrade Flamethrower</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }) }) }), u15.LocalPlayer:WaitForChild("PlayerGui"))
        return function() --[[ Line: 183 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u48
            --]]
            u12.unmount(u48)
        end
    end)
    u14:BindAction("open-upgrades", function(_, p49, _) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if p49 == Enum.UserInputState.Begin then
            u9.Controllers.PyroController:openUpgradeMenu()
        end
    end, false, Enum.KeyCode.X, u5.Interact)
    u39.maid:GiveTask(function() --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:UnbindAction("open-upgrades")
    end)
end
function u26.onDisable(p50) --[[ Line: 196 ]]
    p50.maid:DoCleaning()
end
function u26.isRelevantItem(_, p51) --[[ Line: 199 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p51.itemType == u23.FLAMETHROWER
end
u9.CreateController(u26.new())
return nil