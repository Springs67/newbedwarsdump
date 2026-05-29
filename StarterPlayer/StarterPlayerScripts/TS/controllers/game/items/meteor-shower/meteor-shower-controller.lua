local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "MeteorShowerService"
    end,
    ["__index"] = u13
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p21)
    p21.Name = "MeteorShowerService"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u5
        [4] = u9
        [5] = u14
        [6] = u11
        [7] = u10
        [8] = u6
        [9] = u2
        [10] = u16
        [11] = u12
        [12] = u4
        [13] = u8
        [14] = u3
        [15] = u17
    --]]
    u13.KnitStart(p22)
    u15.Client:OnEvent("MeteorSummon", function(u23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u14
            [4] = u11
            [5] = u10
            [6] = u6
            [7] = u2
            [8] = u16
            [9] = u12
            [10] = u4
            [11] = u8
            [12] = u3
            [13] = u17
        --]]
        local u24 = u5.new()
        local v25 = u9.Assets.Effects.CosmicMeteorIndicator:Clone()
        local v26 = u23.position
        local v27 = u14
        local v28 = -u14 / 2
        local v29 = u14
        local u30 = v26 + Vector3.new(v27, v28, v29)
        local v31 = u14 / 2
        v25.Position = u30 + Vector3.new(0, v31, 0)
        v25.Parent = u11
        v25.Size = Vector3.new(0, 0, 0)
        u10:Create(v25, TweenInfo.new(u23.duration, Enum.EasingStyle.Linear), {
            ["Size"] = Vector3.new(9, 0, 9)
        }):Play()
        u24:GiveTask(v25)
        local u32 = u9.Assets.Misc.CosmicMeteor:Clone()
        u24:GiveTask(u32)
        u6(u32, 0.8 + math.random(0, 2) * 0.2)
        local v33 = math.random() * 3.141592653589793 * 2
        local v34 = CFrame.new(u23.position)
        local v35 = math.cos(v33) * 15
        local v36 = math.sin(v33) * 15
        local v37 = Vector3.new(v35, 450, v36)
        local v38 = math.random(-90, 90)
        local v39 = math.random
        local v40 = Vector3.new(v38, 0, v39(-90, 90))
        local u41 = v34 + v37 + v40
        u32:PivotTo(u41)
        u32.Parent = u11
        local v42 = u2:playSound(u16.METEOR_COSMIC_LOOP, {
            ["looped"] = true,
            ["position"] = u23.position
        })
        if v42 then
            u2:tweenSoundVolume(v42, 5, u23.duration)
            u24:GiveTask(v42)
        end
        local u43 = nil
        u43 = u12(u23.duration, u4, function(p44) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u43
                [3] = u41
                [4] = u23
            --]]
            local v45 = u32.PrimaryPart
            if v45 ~= nil then
                v45 = v45.Parent
            end
            if not v45 then
                u43:Cancel()
                return nil
            end
            u32:PivotTo(u41:Lerp(CFrame.new(u23.position), (math.pow(p44, 2) + math.pow(p44, 8)) / 2))
        end)
        task.delay(u23.duration, function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u32
                [3] = u24
                [4] = u8
                [5] = u30
                [6] = u3
                [7] = u2
                [8] = u16
                [9] = u9
                [10] = u11
                [11] = u17
            --]]
            u6(u32, 0)
            task.delay(0.1, function() --[[ Line: 92 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end)
            local v46 = u8.LocalPlayer.Character
            if v46 ~= nil then
                v46 = (v46:GetPrimaryPartCFrame().Position - u30).Magnitude
            end
            local v47 = v46 == nil and 250 or v46
            if v47 < 200 then
                u3.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    ["magnitude"] = 0.4 * v47 / 200
                })
            end
            local v48 = {
                ["rollOffMaxDistance"] = 200,
                ["position"] = u30
            }
            u2:playSound(u16.METEOR_HITS, v48)
            local v49 = u9.Assets.Effects.CosmicMeteorExplosion:Clone()
            v49.Position = u30
            v49.Parent = u11
            u17:playEffects({ v49 }, nil, {
                ["sizeMultiplier"] = 1.3,
                ["destroyAfterSec"] = 3
            })
        end)
    end)
end
u3.CreateController(u18.new())
return nil