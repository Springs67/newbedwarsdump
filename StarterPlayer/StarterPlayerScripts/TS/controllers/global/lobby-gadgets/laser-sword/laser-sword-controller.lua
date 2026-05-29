local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "laser-sword", "laser-sword-table").laserColorSelect
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "LaserSwordController"
    end,
    ["__index"] = u5
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p14)
    p14.Name = "LaserSwordController"
end
function u11.isRelevantItem(_, p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return p15.itemType == u8.LASER_SWORD
end
function u11.onEnable(p16, u17, _) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
        [3] = u7
        [4] = u4
        [5] = u6
        [6] = u9
    --]]
    u2:playSound(u10.LASER_SWORD_EQUIP)
    p16:setupYield(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u6
            [4] = u9
            [5] = u17
        --]]
        local u18 = u7:playAnimation(u4.LocalPlayer, u6.WIZARD_BALL_CAST, {})
        task.spawn(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u17
            --]]
            local v19 = u9:selectRandom()
            for _, v20 in u17.tool:GetDescendants() do
                if v20:IsA("BasePart") then
                    if v20.Name == "Inner" then
                        v20.Color = v19.inner
                    end
                    if v20.Name == "Outer" then
                        v20.Color = v19.outer
                    end
                end
                if v20:IsA("Trail") then
                    v20.Color = v19.trail
                end
                if v20:IsA("Beam") then
                    v20.Color = v19.trail
                end
            end
        end)
        return function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            local v21 = u18
            if v21 ~= nil then
                v21:Stop()
            end
        end
    end)
end
function u11.onDisable(_) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    u2:playSound(u10.LASER_SWORD_DEEQUIP)
end
function u11.KnitStart(p22) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u8
        [4] = u6
        [5] = u10
    --]]
    u5.KnitStart(p22)
    u3.Controllers.PreloadController:preloadForItemType(u8.LASER_SWORD, {
        ["animations"] = { u6.LASER_SWORD_SWING_2, u6.LASER_SWORD_SWING_1, u6.WIZARD_BALL_CAST },
        ["sounds"] = { u10.LASER_SWORD_SWING_1, u10.LASER_SWORD_SWING_2, u10.LASER_SWORD_SWING_3 }
    })
end
u3.CreateController(u11.new())
return nil