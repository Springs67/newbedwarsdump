local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction
local u7 = {
    [u6.HERO] = "rbxassetid://16113637804",
    [u6.VILLAIN] = "rbxassetid://16113637996"
}
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "MagicalHeroLbTextureController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "MagicalHeroLbTextureController"
end
function u8.KnitStart(u12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u3
        [4] = u6
    --]]
    u5.KnitStart(u12)
    u2("MagicalHeroLuckyBlock", function(u13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u3
            [3] = u6
        --]]
        if not u13:IsA("Part") then
            return nil
        end
        task.delay(0.001, function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u13
                [3] = u3
                [4] = u6
            --]]
            u12:updateLuckyBlockTexture(u13, u3.Controllers.HeroVillainAssignmentController:getLocalHeroVillainAssignment() or u6.HERO)
        end)
    end)
end
function u8.updateAllLuckyBlockTextures(p14, p15) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for v16, v17 in u4:GetTagged("MagicalHeroLuckyBlock") do
        local _ = v16 - 1
        if v17:IsA("Part") then
            p14:updateLuckyBlockTexture(v17, p15)
        end
    end
end
function u8.updateLuckyBlockTexture(_, p18, u19) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v20 = p18:GetDescendants()
    local function v22(p21) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u19
            [3] = u6
        --]]
        if p21:IsA("Texture") then
            p21.Texture = u7[u19]
            p21.Color3 = Color3.fromRGB(255, 255, 255)
        elseif p21:IsA("ParticleEmitter") and u19 == u6.VILLAIN then
            p21.Color = ColorSequence.new(Color3.fromRGB(222, 217, 224), Color3.fromRGB(97, 18, 112))
        end
    end
    for v23, v24 in v20 do
        v22(v24, v23 - 1, v20)
    end
end
u3.CreateController(u8.new())
return nil