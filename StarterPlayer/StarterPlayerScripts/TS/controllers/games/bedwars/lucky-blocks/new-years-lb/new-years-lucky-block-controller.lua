local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.TweenService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "NewYearsLuckyBlockController"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p14)
    p14.Name = "NewYearsLuckyBlockController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u5
        [4] = u7
        [5] = u6
        [6] = u3
        [7] = u9
        [8] = u2
    --]]
    u8.KnitStart(p15)
    u10.Client:OnEvent("NewYearsLuckyBlockSpawn", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u6
            [4] = u3
            [5] = u9
        --]]
        local u17 = u5.Assets.Effects.NewYearsFireworkRocket:Clone()
        u17.Parent = u7
        u17:PivotTo(CFrame.new(p16.blockPosition))
        u6:Create(u17, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
            ["Transparency"] = 1,
            ["CFrame"] = CFrame.new(p16.fireworkPosition)
        }):Play()
        task.delay(1.5, function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17:Destroy()
        end)
        u3.Controllers.FireworkController:playFireworkEffect(p16.fireworkPosition, u9.NEW_YEARS, {
            ["sizeMultiplier"] = 0.7,
            ["volumeMultiplier"] = 0.25
        })
    end)
    u2("NewYearsLuckyBlock", function(p18) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        for _, v19 in u5.Assets.Effects.NewYearsLuckyBlockParticles:Clone():GetChildren() do
            if v19:IsA("ParticleEmitter") then
                v19.Parent = p18
                v19.Enabled = true
            end
        end
    end)
end
u3.CreateController(u11.new())
return nil