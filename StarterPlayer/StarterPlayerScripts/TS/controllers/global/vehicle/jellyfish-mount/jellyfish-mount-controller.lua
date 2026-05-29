local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "JellyfishMountController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "JellyfishMountController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u10
        [4] = u5
        [5] = u4
        [6] = u11
        [7] = u9
        [8] = u8
    --]]
    u7.KnitStart(p16)
    u6.StartConsuming:connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
        --]]
        if p17.itemType ~= u10.JELLYFISH_MOUNT_DEPLOY then
            return nil
        end
        if p17:isCancelled() then
            return nil
        end
        if u5.LocalPlayer:GetAttribute("IsInVehicle") == true then
            p17:setCancelled(true)
        end
    end)
    u4:GetInstanceAddedSignal(u11.JELLYFISH_MOUNT):Connect(function(p18) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
        --]]
        local v19 = p18:FindFirstChild("AnimationController") or Instance.new("AnimationController")
        v19.Parent = p18
        local v20 = Instance.new("Animator")
        v20.Parent = v19
        local u21 = v20:LoadAnimation(u9:getAnimation(u8.JELLYFISH_MOUNT_IDLE))
        u21:Play()
        p18.Destroying:Connect(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            u21:Destroy()
        end)
    end)
end
v2.CreateController(u12.new())
return nil