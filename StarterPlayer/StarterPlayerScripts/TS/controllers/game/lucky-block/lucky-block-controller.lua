local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "LuckyBlockController"
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
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "LuckyBlockController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u8
        [4] = u5
        [5] = u2
        [6] = u6
        [7] = u10
    --]]
    u7.KnitStart(p15)
    u9.Client:OnEvent("OpenLuckyBlock", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u2
            [4] = u6
            [5] = u10
        --]]
        local v17 = nil
        local v18 = p16.rarity
        if v18 == u8.COMMON then
            v17 = u5.Assets.Effects.LuckyBlock.OpenCommon:Clone()
        elseif v18 == u8.UNCOMMON then
            v17 = u5.Assets.Effects.LuckyBlock.OpenUncommon:Clone()
        elseif v18 == u8.RARE then
            v17 = u5.Assets.Effects.LuckyBlock.OpenRare:Clone()
        elseif v18 == u8.EPIC then
            v17 = u5.Assets.Effects.LuckyBlock.OpenEpic:Clone()
        elseif v18 == u8.LEGENDARY then
            v17 = u5.Assets.Effects.LuckyBlock.OpenLegendary:Clone()
        end
        if not v17 then
            return nil
        end
        v17.Transparency = 1
        v17.Anchored = true
        local v19 = u2:getWorldPosition(p16.blockPosition)
        v17.CFrame = CFrame.new(v19)
        v17.Parent = u6
        u10:playEffects({ v17 }, nil, {
            ["destroyAfterSec"] = 5,
            ["disableEffectsAfterSec"] = 4
        })
    end)
end
v3.CreateController(u11.new())
return nil