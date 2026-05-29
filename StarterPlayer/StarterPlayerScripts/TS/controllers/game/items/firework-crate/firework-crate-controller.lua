local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "FireworkCrateController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "FireworkCrateController"
end
function u13.KnitStart(u17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u2
        [4] = u12
    --]]
    u9.KnitStart(u17)
    u11.Client:Get("FireworkLaunch"):Connect(function(p18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:launchFirework(p18.block.Position)
    end)
    u11.Client:Get("FireworkCratePlaced"):Connect(function(p19) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        u2:playSound(u12.TNT_HISS_1, {
            ["fadeOutTime"] = 2,
            ["position"] = p19.position
        })
    end)
end
function u13.launchFirework(_, u20) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u8
        [4] = u4
        [5] = u2
        [6] = u12
        [7] = u3
        [8] = u10
    --]]
    local u21 = u20 + Vector3.new(0, 48, 0)
    local u22 = u6.Assets.Effects.NewYearsFireworkRocket:Clone()
    u22.Parent = u7
    u22:PivotTo(CFrame.new(u20))
    u8(1, u4, function(p23) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u21
            [3] = u22
        --]]
        local v24 = u20:Lerp(u21, p23)
        u22:PivotTo(CFrame.new(v24))
        u22.Transparency = p23
    end):Play()
    u2:playSound(u12.FIREWORK_LAUNCH, {
        ["position"] = u20
    })
    local u25 = u2:playSound(u12.FIREWORK_TRAIL, {
        ["looped"] = true,
        ["position"] = u22.CFrame.Position
    })
    task.delay(1, function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u22
            [3] = u3
            [4] = u21
            [5] = u10
        --]]
        local v26 = u25
        if v26 ~= nil then
            v26:Destroy()
        end
        u22:Destroy()
        u3.Controllers.FireworkController:playFireworkEffect(u21, u10.FIREWORK_CRATE, {
            ["sizeMultiplier"] = 0.9,
            ["volumeMultiplier"] = 0.6,
            ["popSoundPlaybackSpeedMultiplier"] = 1
        })
    end)
end
u3.CreateController(u13.new())
return nil