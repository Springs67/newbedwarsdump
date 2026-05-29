local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u10 = {
    v8.FISH_TANK_TINKER,
    v8.FISH_TANK_IRON_TINKER,
    v8.FISH_TANK_DIAMOND_TINKER,
    v8.FISH_TANK_EMERALD_TINKER,
    v8.FISH_TANK_VOID_TINKER
}
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "FishTankTinkerSkinController"
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
    p14.Name = "FishTankTinkerSkinController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u10
        [4] = u3
        [5] = u9
        [6] = u7
        [7] = u6
    --]]
    u5.KnitStart(p15)
    u4.GenericMountMounted:connect(function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
            [3] = u9
            [4] = u7
            [5] = u6
        --]]
        local v17 = p16.mountType
        if table.find(u10, v17) ~= nil then
            local v18 = u3.Assets.Effects.GoldFish:Clone()
            v18.Parent = p16.model
            u9:weldAccessory(p16.model, v18)
            local v19 = v18:WaitForChild("Handle", 1)
            if v19 ~= nil then
                v19 = v19:WaitForChild("rig", 1)
                if v19 ~= nil then
                    v19 = v19:WaitForChild("AnimationController", 1)
                    if v19 ~= nil then
                        v19 = v19:WaitForChild("Animator", 1)
                    end
                end
            end
            if v19 then
                u7:playAnimation(v19, u6.GOLD_FISH_SWIM)
            end
        end
    end)
end
v2.CreateController(u11.new())
return nil