local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.TweenService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "MarshmallowRoastEmoteHandlerController"
    end,
    ["__index"] = u10
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p21)
    p21.Name = "MarshmallowRoastEmoteHandlerController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u13
        [4] = u17
        [5] = u6
        [6] = u15
        [7] = u16
        [8] = u8
        [9] = u12
        [10] = u11
        [11] = u2
        [12] = u14
        [13] = u9
        [14] = u4
        [15] = u7
    --]]
    u10.KnitStart(p22)
    local v23 = u3.Controllers.EmoteHandlerController
    local v24 = u13.MARSHMALLOW_ROAST
    local u25 = u17
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(_, _, p30, _, u31) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
            [3] = u16
            [4] = u8
            [5] = u12
            [6] = u11
            [7] = u2
            [8] = u14
            [9] = u9
            [10] = u4
            [11] = u7
        --]]
        if not p30.PrimaryPart then
            return nil
        end
        local u32 = u6.Assets.Misc.MarshmallowRoast.marshmallow:Clone()
        u15:addAccessory(p30, u32)
        u31:GiveTask(u32)
        local u33 = u6.Assets.Misc.MarshmallowRoast.stick:Clone()
        u15:addAccessory(p30, u33)
        u31:GiveTask(u33)
        u16:weldCharacterAccessories(p30)
        local u34 = u6.Assets.Misc.MarshmallowRoast.campfire:Clone()
        local v35 = p30.PrimaryPart.CFrame
        local v36 = p30.Humanoid.HipHeight + p30.PrimaryPart.Size.Y / 2
        local v37 = Vector3.new(0, v36, 0)
        local v38 = p30.PrimaryPart.CFrame.LookVector
        local u39 = v35 - v37 + v38 * Vector3.new(2, 0, 2) - Vector3.new(0, 3, 0)
        for v40, v41 in u34:GetDescendants() do
            local _ = v40 - 1
            if v41:IsA("BasePart") then
                v41.Transparency = 1
            end
        end
        u34:ScaleTo(0.7)
        u34:PivotTo(u39)
        u34.Parent = u8
        u31:GiveTask(u34)
        local u42 = p30:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u12:getAnimation(u11.MARSHMALLOW_ROAST_ACTION))
        u42:Play()
        u31:GiveTask(u42:GetMarkerReachedSignal("marshmallow_stuck"):Connect(function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u16
                [4] = u2
                [5] = u14
            --]]
            local v43 = u32.Handle
            v43.RightGripAttachment:Destroy()
            v43.Parent = u33
            u32:Destroy()
            u16:weldParts(v43, u33.Handle)
            u2:playSound(u14.BAGUETTE_HIT, {
                ["volumeMultiplier"] = 0.5,
                ["playbackSpeedMultiplier"] = 1.5,
                ["position"] = v43.Position
            })
        end))
        u31:GiveTask(u42:GetMarkerReachedSignal("campfire_spawn"):Connect(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u4
                [3] = u34
                [4] = u39
                [5] = u31
                [6] = u7
                [7] = u2
                [8] = u14
            --]]
            local u45 = u9(1, u4, function(p44) --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u39
                --]]
                u34:PivotTo(u39:Lerp(u39 + Vector3.new(0, 3, 0), p44))
            end)
            u31:GiveTask(function() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                return u45:Cancel()
            end)
            local v46 = u34:GetChildren()
            local function v49(p47) --[[ Line: 116 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u31
                --]]
                if p47:IsA("BasePart") then
                    local v48 = u7:Create(p47, TweenInfo.new(1), {
                        ["Transparency"] = 0
                    })
                    v48:Play()
                    u31:GiveTask(v48)
                end
            end
            for v50, v51 in v46 do
                v49(v51, v50 - 1, v46)
            end
            u31:GiveTask(task.spawn(function() --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u34
                    [3] = u31
                    [4] = u2
                    [5] = u14
                --]]
                if u45.Running then
                    u45:Wait()
                end
                for v52, v53 in u34.fire:GetDescendants() do
                    local _ = v52 - 1
                    if v53:IsA("ParticleEmitter") then
                        v53.Enabled = true
                    end
                end
                u31:GiveTask(u2:playSound(u14.FIRE_LOOP, {
                    ["volumeMultiplier"] = 0.5,
                    ["looped"] = true,
                    ["position"] = u34:GetPivot().Position
                }))
            end))
        end))
        u31:GiveTask(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42:Stop()
            u42:Destroy()
        end)
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 153 ]] end
    v23:registerHandler(v24, u26)
end
u3.CreateController(u18.new())
return nil