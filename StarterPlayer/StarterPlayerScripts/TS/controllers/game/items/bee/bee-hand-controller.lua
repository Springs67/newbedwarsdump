local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BeeHandController"
    end,
    ["__index"] = u7
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
function u11.constructor(p14, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
    u7.constructor(p14, ...)
    p14.Name = "BeeHandController"
    p14.maid = u3.new()
end
function u11.KnitStart(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p15)
end
function u11.toggleAllBeehivePrompts(p16, p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u9
        [4] = u8
    --]]
    for _, v18 in u5:GetTagged("beehive") do
        if v18:GetAttribute("PlacedByUserId") == u6.LocalPlayer.UserId then
            local v19 = v18:FindFirstChildOfClass("ProximityPrompt")
            if v19 then
                v19.Enabled = p17
                p16.maid:GiveTask(v19.TriggerEnded:Connect(function(p20) --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u8
                    --]]
                    if p20 == u6.LocalPlayer then
                        u9:playAnimation(p20, u8.PUNCH)
                    end
                end))
            end
        end
    end
end
function u11.onEnable(p21, _) --[[ Line: 51 ]]
    p21:toggleAllBeehivePrompts(true)
end
function u11.onDisable(p22) --[[ Line: 54 ]]
    p22.maid:DoCleaning()
    p22:toggleAllBeehivePrompts(false)
end
function u11.isRelevantItem(_, p23) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p23.itemType == u10.BEE
end
v2.CreateController(u11.new())
return nil