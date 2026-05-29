local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.HttpService
local u11 = v9.Players
local u12 = v9.UserInputService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "PaintShotgunController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    u14.constructor(p25)
    p25.Name = "PaintShotgunController"
    p25.maid = u7.new()
end
function u22.KnitStart(p26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p26)
end
function u22.isRelevantItem(_, p27) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return p27.itemType == u20.PAINT_SHOTGUN
end
function u22.onEnable(u28, _, _) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
        [3] = u16
        [4] = u12
        [5] = u8
        [6] = u3
        [7] = u15
        [8] = u10
        [9] = u2
    --]]
    u28:setupYield(function() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u11
            [3] = u16
            [4] = u28
        --]]
        local u29 = u17:playAnimation(u11.LocalPlayer, u16.PAINT_SHOTGUN_IDLE)
        if u29 then
            u28.maid:GiveTask(function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29:Stop()
            end)
        end
        return function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v30 = u29
            if v30 ~= nil then
                v30:Stop()
            end
        end
    end)
    if u12.TouchEnabled then
        u28.maid:GiveTask(u12.TouchTapInWorld:Connect(function(_, p31) --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            if not p31 then
                u28:fire()
            end
        end))
        u28:setupYield(function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u3
                [3] = u15
                [4] = u28
                [5] = u11
            --]]
            local u32 = u8.mount(u8.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u8.createElement(u3, {
                    ["Image"] = "rbxassetid://6862310392",
                    ["Position"] = u15:getActionMobileButtonPosition(),
                    ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 77 ]]
                        --[[
                        Upvalues:
                            [1] = u28
                        --]]
                        u28:fire()
                    end
                }) }), u11.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u32
                --]]
                u8.unmount(u32)
            end
        end)
    end
    local v34 = {
        ["action"] = "Attack",
        ["actionId"] = "shoot-shotgun:" .. u10:GenerateGUID(false),
        ["boundFunction"] = function(_, p33, _) --[[ Name: boundFunction, Line 92 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            if p33 == Enum.UserInputState.Begin then
                u28:fire()
            end
        end
    }
    local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v34)
    u28.maid:GiveTask(v35)
end
function u22.onDisable(p36) --[[ Line: 100 ]]
    p36.maid:DoCleaning()
end
function u22.fire(u37) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
        [3] = u19
        [4] = u11
        [5] = u13
        [6] = u21
        [7] = u6
        [8] = u5
        [9] = u16
        [10] = u17
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u18.PAINT_SHOTGUN) then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u18.PAINT_SHOTGUN) < 0.2 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u18.PAINT_SHOTGUN, "buffered-paint-shot", function() --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37:fire()
            end)
        end
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u18.PAINT_SHOTGUN, u19.COOLDOWN)
    local u38 = u11.LocalPlayer.Character
    if u38 then
        local v39 = u13.CurrentCamera
        if v39 ~= nil then
            v39 = v39.CFrame.LookVector
        end
        if not v39 then
            return nil
        end
        local v40 = u38:GetPrimaryPartCFrame().Position
        local v41 = u38:GetPrimaryPartCFrame().Position
        local v42 = v39 * Vector3.new(1, 0, 1)
        u38:PivotTo(CFrame.new(v40, v41 + v42))
        local u43 = u38:GetPrimaryPartCFrame()
        u21.Client:Get("ShootShotgun"):SendToServer(u43.Position, v39)
        local function u44() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u6
                [3] = u5
                [4] = u16
                [5] = u17
                [6] = u11
                [7] = u38
            --]]
            if u43 then
                u6.Controllers.ScreenShakeController:shake(u43.Position, u43 * Vector3.new(-0.25, 0, -1) - u43.Position, {
                    ["magnitude"] = 0.07,
                    ["duration"] = 0.15,
                    ["cycles"] = 2
                })
            end
            u5.Controllers.ViewmodelController:playAnimation(u16.FP_PAINT_SHOTGUN_SHOOT)
            u17:playAnimation(u11.LocalPlayer, u16.PAINT_SHOTGUN_SHOOT)
            u6.Controllers.PaintShotgunEffectsController:playShotgunEffect(u38)
        end
        u44()
        task.delay(0.15, function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44()
        end)
    end
end
u5.CreateController(u22.new())
return nil