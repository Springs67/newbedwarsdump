local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "MeteorsController"
    end,
    ["__index"] = u10
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
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u9
    --]]
    u10.constructor(p17)
    p17.Name = "MeteorsController"
    p17.meteorsFolder = u5("Folder", {
        ["Name"] = "Meteors",
        ["Parent"] = u9
    })
end
function u14.KnitStart(u18) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u4
        [4] = u7
        [5] = u5
        [6] = u2
        [7] = u12
        [8] = u8
        [9] = u9
        [10] = u13
    --]]
    u10.KnitStart(u18)
    u11.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p19, u20, u21, u22, p23, p24) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u18
            [4] = u5
            [5] = u2
            [6] = u12
            [7] = u8
            [8] = u9
            [9] = u13
        --]]
        local v25 = Random.new(p23)
        local u26 = u4.new()
        local u27 = CFrame.new(p19) * CFrame.Angles(v25:NextNumber() * 3.141592653589793 * 2, v25:NextNumber() * 3.141592653589793 * 2, v25:NextNumber() * 3.141592653589793 * 2)
        local u28 = CFrame.new(u20)
        local u29 = u7.Assets.Effects.Meteor:Clone()
        u29:PivotTo(u27)
        u29.Parent = u18.meteorsFolder
        local u30 = u5("Part", {
            ["Anchored"] = true,
            ["Name"] = "Meteor",
            ["Size"] = Vector3.new(4, 4, 4),
            ["CanCollide"] = false,
            ["CFrame"] = u27,
            ["Color"] = Color3.fromRGB(0, 0, 0),
            ["Material"] = Enum.Material.Rock,
            ["Parent"] = u29
        })
        if p24 then
            u2:playSound(u12.METEOR_LOOP, {
                ["rollOffMinDistance"] = 175,
                ["rollOffMaxDistance"] = 350,
                ["parent"] = u30
            })
        end
        local u31 = v25:NextNumber(0.2, 0.5)
        local u32 = v25:NextNumber(0.2, 0.5)
        local u33 = v25:NextNumber(0.2, 0.5)
        local u34 = 0
        u26:GiveTask(u8.Heartbeat:Connect(function(p35) --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u27
                [3] = u28
                [4] = u9
                [5] = u21
                [6] = u22
                [7] = u20
                [8] = u29
                [9] = u31
                [10] = u32
                [11] = u33
                [12] = u30
                [13] = u26
            --]]
            u34 = u34 + p35
            local v36 = u27:Lerp(u28, (u9:GetServerTimeNow() - u21) / (u22 - u21))
            local v37 = CFrame.new(v36.Position, u20) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
            u29:PivotTo(v37)
            u30.CFrame = v37 * CFrame.Angles(u34 * 3.141592653589793 * 2 * u31, u34 * 3.141592653589793 * 2 * u32, u34 * 3.141592653589793 * 2 * u33)
            if u22 <= u9:GetServerTimeNow() then
                u26:DoCleaning()
            end
        end))
        u26:GiveTask(function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u9
                [3] = u20
                [4] = u7
                [5] = u28
                [6] = u18
                [7] = u13
                [8] = u2
                [9] = u12
            --]]
            task.spawn(function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u9
                    [3] = u20
                    [4] = u7
                    [5] = u28
                    [6] = u18
                    [7] = u13
                    [8] = u2
                    [9] = u12
                --]]
                u29:Destroy()
                local v38 = not u9.CurrentCamera and 0 or (u20 - u9.CurrentCamera.CFrame.Position).Magnitude
                local v39 = u7.Assets.Effects.MeteorHitEffect:Clone()
                v39.CFrame = u28
                v39.Parent = u18.meteorsFolder
                u13:playEffects({ v39 }, nil, {
                    ["destroyAfterSec"] = 3,
                    ["particleMultiplier"] = v38 > 200 and 0.2 or 1
                })
                local v40 = {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u20
                }
                u2:playSound(u12.TNT_EXPLODE_1, v40)
                local v41 = {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u20
                }
                u2:playSound(u12.CARROT_LAUNCHER_IMPACT, v41)
            end)
        end)
    end)
end
v3.CreateController(u14.new())
return nil