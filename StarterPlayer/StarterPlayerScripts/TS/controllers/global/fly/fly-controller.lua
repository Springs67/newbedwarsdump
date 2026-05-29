local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.MobileButton
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ContextActionService
local u13 = v11.Players
local u14 = v11.RunService
local u15 = v11.UserInputService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "FlyController"
    end,
    ["__index"] = u17
})
u23.__index = u23
function u23.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u7
    --]]
    u17.constructor(p26)
    p26.Name = "FlyController"
    p26.flyEnabled = false
    p26.isFlying = false
    p26.flyEnabledMaid = u8.new()
    p26.flyingMaid = u8.new()
    p26.upHeld = false
    p26.downHeld = false
    p26.targetVerticalVelocity = u7.SingleMotor.new(0)
    p26.forceFlying = false
    p26.lastMobileJumpRequest = 0
end
function u23.KnitStart(u27) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
        [3] = u15
        [4] = u12
    --]]
    u17.KnitStart(u27)
    u22.Client:Get("SetFlyEnabled"):Connect(function(p28) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:setFlyEnabled(p28.enabled, p28.forceFlying)
    end)
    u15.InputBegan:Connect(function(p29, p30) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if p30 then
            return nil
        end
        if p29.KeyCode == Enum.KeyCode.Space then
            u27.upHeld = true
        end
    end)
    u15.InputEnded:Connect(function(p31) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if p31.KeyCode == Enum.KeyCode.Space then
            u27.upHeld = false
        end
    end)
    u12:BindActionAtPriority("fly-downward", function(_, p32, _) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if p32 == Enum.UserInputState.Begin then
            u27.downHeld = true
        elseif p32 == Enum.UserInputState.End then
            u27.downHeld = false
        end
        return Enum.ContextActionResult.Pass
    end, false, 10, Enum.KeyCode.LeftShift)
    if u27.flyEnabled then
        u27:handleEnabledFly()
    end
end
function u23.setFlyEnabled(p33, p34, p35) --[[ Line: 82 ]]
    if p33.flyEnabled == p34 then
        return nil
    else
        local v36
        if p35 == nil then
            v36 = false
        else
            v36 = p35
        end
        p33.forceFlying = v36
        if p35 then
            if p34 then
                p33:setFlying(true)
            else
                p33:setFlying(false)
            end
        end
        p33.flyEnabled = p34
        if p34 then
            p33:handleEnabledFly()
        else
            p33.flyEnabledMaid:DoCleaning()
            p33.flyingMaid:DoCleaning()
        end
    end
end
function u23.handleEnabledFly(u37) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
    --]]
    local u38 = 0
    u37.flyEnabledMaid:GiveTask(u15.InputBegan:Connect(function(p39, p40) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u38
        --]]
        if p40 then
            return nil
        elseif u37.forceFlying then
            return nil
        elseif p39.KeyCode == Enum.KeyCode.Space then
            if os.clock() - u38 < 0.25 then
                u37:setFlying(not u37.isFlying)
                u38 = 0
            else
                u38 = os.clock()
            end
        else
            return nil
        end
    end))
    u37.flyEnabledMaid:GiveTask(u15.JumpRequest:Connect(function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u37
        --]]
        if not u4.isMobileControls() then
            return nil
        end
        if u37.forceFlying then
            return nil
        end
        if os.time() - u37.lastMobileJumpRequest < 0.25 then
            return nil
        end
        u37.lastMobileJumpRequest = os.time()
        u37:setFlying(not u37.isFlying)
    end))
end
function u23.setFlying(u41, p42) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u3
        [4] = u20
        [5] = u19
        [6] = u9
        [7] = u16
        [8] = u4
        [9] = u10
        [10] = u5
        [11] = u21
        [12] = u18
        [13] = u6
        [14] = u14
    --]]
    if u41.isFlying == p42 then
        return nil
    end
    u41.isFlying = p42
    if not p42 then
        u41.flyingMaid:DoCleaning()
        return nil
    end
    local v43 = u13.LocalPlayer.Character
    if v43 ~= nil then
        v43 = v43.PrimaryPart
        if v43 ~= nil then
            v43 = v43.AssemblyLinearVelocity.Y
        end
    end
    local v44 = v43 == nil and 0 or v43
    u41.targetVerticalVelocity = u7.SingleMotor.new(v44)
    local u45 = u3:playAnimation(u13.LocalPlayer, u20:getAssetId(u19.ROBLOX_GHOST_FLOATING))
    if u45 then
        u41.flyingMaid:GiveTask(function() --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            u45:Stop()
            u45:Destroy()
        end)
    end
    local u46 = u13.LocalPlayer.Character
    if u46 ~= nil then
        u46 = u46.PrimaryPart
    end
    if u46 then
        local v47 = u9
        local v48 = {
            ["Parent"] = u46
        }
        local v49 = u46.AssemblyMass * u16.Gravity
        v48.Force = Vector3.new(0, v49, 0)
        local u50 = v47("BodyForce", v48)
        u41.flyingMaid:GiveTask(function() --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u50
            --]]
            if not u46.Parent then
                return nil
            end
            u50:Destroy()
        end)
    end
    if u4.isMobileControls() then
        local u51 = u10.mount(u10.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u10.createElement(u5, {
                ["Image"] = u21.UP_MOBILE,
                ["Position"] = u18:getActionMobileButtonPosition(),
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 199 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                    --]]
                    u41.upHeld = true
                    u41.downHeld = false
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 203 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                    --]]
                    u41.upHeld = false
                    u41.downHeld = false
                end
            }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
        local v52 = u10
        local v53 = {}
        local v54 = #v53
        local v55 = {
            ["Image"] = u21.DOWN_MOBILE,
            ["Position"] = u18:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
            ["OnPressDown"] = function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41.upHeld = false
                u41.downHeld = true
            end,
            ["OnPressUp"] = function() --[[ Line: 225 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41.upHeld = false
                u41.downHeld = false
            end
        }
        v53[v54 + 1] = u10.createElement(u5, v55)
        local u56 = v52.mount(u10.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, v53), u13.LocalPlayer:WaitForChild("PlayerGui"))
        u41.flyingMaid:GiveTask(function() --[[ Line: 231 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u51
            --]]
            return u10.unmount(u51)
        end)
        u41.flyingMaid:GiveTask(function() --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u56
            --]]
            return u10.unmount(u56)
        end)
    end
    local v57 = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["constantSpeedMultiplier"] = 2
    })
    u41.flyingMaid:GiveTask(v57)
    u41.flyingMaid:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u7
            [3] = u13
        --]]
        if u41.upHeld and not u41.downHeld then
            u41.targetVerticalVelocity:setGoal(u7.Spring.new(40, {
                ["frequency"] = 1,
                ["dampingRatio"] = 0.45
            }))
        elseif u41.upHeld or not u41.downHeld then
            u41.targetVerticalVelocity:setGoal(u7.Spring.new(0, {
                ["frequency"] = 1,
                ["dampingRatio"] = 0.45
            }))
        else
            u41.targetVerticalVelocity:setGoal(u7.Spring.new(-40, {
                ["frequency"] = 1,
                ["dampingRatio"] = 0.45
            }))
        end
        local v58 = u13.LocalPlayer.Character
        local v59
        if v58 == nil then
            v59 = v58
        else
            v59 = v58.PrimaryPart
        end
        if not v59 then
            return nil
        end
        local v60 = v58.PrimaryPart.AssemblyLinearVelocity
        local v61 = u41.targetVerticalVelocity:getValue()
        local v62 = Vector3.new(0, v61, 0)
        v58.PrimaryPart.AssemblyLinearVelocity = v60 * Vector3.new(1, 0, 1) + v62
    end))
end
u6.CreateController(u23.new())
return nil