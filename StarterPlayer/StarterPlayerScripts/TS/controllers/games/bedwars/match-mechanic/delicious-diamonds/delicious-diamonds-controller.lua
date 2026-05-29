local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "DeliciousDiamondsController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p16)
    p16.Name = "DeliciousDiamondsController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u9
        [4] = u5
        [5] = u2
        [6] = u11
        [7] = u6
        [8] = u7
        [9] = u12
    --]]
    u8.KnitStart(p17)
    u10.Client:Get("DiamondShieldGet"):Connect(function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u2
            [4] = u11
            [5] = u6
            [6] = u7
            [7] = u12
        --]]
        local v18 = u9:getEntity(u5.LocalPlayer)
        if not v18 then
            return nil
        end
        local v19 = v18:getInstance()
        if v19 == nil then
            return nil
        end
        u2:playSound(u11.DIAMOND_SHIELD, {
            ["position"] = v19.HumanoidRootPart.Position
        })
        local u20 = u6.Assets.Effects.DiamondShieldEffect:Clone()
        u20.Parent = u7
        u12:playEffects({ u20 }, nil)
        u20.CFrame = CFrame.new(v19.HumanoidRootPart.Position)
        task.delay(2, function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:Destroy()
        end)
    end)
end
v3.CreateController(u13.new())
return nil