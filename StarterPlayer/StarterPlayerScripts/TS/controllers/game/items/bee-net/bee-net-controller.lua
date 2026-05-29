local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "BeeNetController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    u8.constructor(p17, ...)
    p17.Name = "BeeNetController"
    p17.maid = u4.new()
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p18)
end
function u14.isRelevantItem(_, p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p19.itemType == u11.BEE_NET
end
function u14.trigger(_, p20, p21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u9
        [4] = u2
        [5] = u13
        [6] = u12
    --]]
    if p20 == u7.LocalPlayer then
        u10:playAnimation(u7.LocalPlayer, u9.NET_CATCH)
        u2:playSound(u13.BEE_NET_SWING)
        u12.Client:Get("PickUpBee"):SendToServer({
            ["beeId"] = p21:GetAttribute("BeeId")
        })
    end
end
function u14.onEnable(u22) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    for _, v23 in u6:GetTagged("bee") do
        u22:toggleBeehivePrompts(v23, true)
    end
    u22.maid:GiveTask(u6:GetInstanceAddedSignal("bee"):Connect(function(p24) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:toggleBeehivePrompts(p24, true)
    end))
end
function u14.onDisable(p25) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    for _, v26 in u6:GetTagged("bee") do
        p25:toggleBeehivePrompts(v26, false)
    end
    p25.maid:DoCleaning()
end
function u14.toggleBeehivePrompts(_, p27, p28) --[[ Line: 64 ]]
    local v29 = p27.Root:FindFirstChildOfClass("ProximityPrompt")
    if v29 and v29.Enabled ~= p28 then
        v29.Enabled = p28
    end
end
v3.CreateController(u14.new())
return nil