local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.InExpo
local u10 = v8.OutQuad
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out")
local u12 = v11.scaleModel
local u13 = v11.scalePart
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.ReplicatedStorage
local u16 = v14.TweenService
local u17 = v14.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "BlackholeBombController"
    end,
    ["__index"] = u18
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p27)
    p27.Name = "BlackholeBombController"
end
function u24.KnitStart(p28) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
        [3] = u4
        [4] = u21
        [5] = u23
        [6] = u10
        [7] = u9
        [8] = u16
        [9] = u15
        [10] = u13
        [11] = u17
        [12] = u22
        [13] = u19
        [14] = u12
        [15] = u3
        [16] = u7
    --]]
    u18.KnitStart(p28)
    u20.Client:OnEvent("BlackholeBombEffect", function(u29) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u21
            [3] = u23
            [4] = u10
            [5] = u9
            [6] = u16
        --]]
        local v30 = u29.growTime + u29.implosionTime
        local u31 = u4:playSound(u21.BLACKHOLE_LOOP, {
            ["rollOffMaxDistance"] = 100,
            ["looped"] = true,
            ["position"] = u29.position
        })
        u23.tweenModelSize(u29.blackhole, u29.growTime, u10, u29.growthGoal)
        task.delay(u29.growTime, function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u4
                [3] = u21
                [4] = u29
                [5] = u23
                [6] = u9
            --]]
            local v32 = u31
            if v32 ~= nil then
                v32:Stop()
            end
            local v33 = u31
            if v33 ~= nil then
                v33:Destroy()
            end
            u4:playSound(u21.BLACKHOLE_COLLAPSE, {
                ["rollOffMaxDistance"] = 100,
                ["position"] = u29.position
            })
            u23.tweenModelSize(u29.blackhole, u29.implosionTime, u9, 0)
        end)
        local v34 = 1
        for _, v35 in u29.blackhole:GetDescendants() do
            local v36 = v35:IsA("BasePart")
            if v36 then
                v36 = string.match(v35.Name, "ring")
            end
            if v36 ~= 0 and (v36 == v36 and (v36 ~= "" and v36)) then
                local v37 = u16
                local v38 = TweenInfo.new(v30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local v39 = {}
                local v40 = v34 * 1000
                v39.Orientation = Vector3.new(0, v40, 0)
                v37:Create(v35, v38, v39):Play()
                v34 = v34 + 1
            end
        end
    end)
    u20.Client:OnEvent("BlackholeBombExplode", function(p41) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u13
            [3] = u17
            [4] = u22
        --]]
        local u42 = u15.Assets.Effects.Explosion:Clone()
        u13(u42, 3.5)
        u42.Parent = u17
        u22:playEffects({ u42 }, nil)
        u42.CFrame = CFrame.new(p41.position)
        task.delay(2, function() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42:Destroy()
        end)
    end)
    u20.Client:OnEvent("BlackholeBombPull", function(u43) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u19
            [3] = u12
            [4] = u4
            [5] = u3
            [6] = u21
            [7] = u7
        --]]
        local v44 = u15:WaitForChild("Items"):WaitForChild(u43.blockType)
        local v45 = u19.cloneItemIntoModel(v44)
        u12(v45, 2)
        local v46 = u4
        local v47 = u3.fromList
        local v48 = {
            u21.BLACKHOLE_BLOCKPULL_1,
            u21.BLACKHOLE_BLOCKPULL_2,
            u21.BLACKHOLE_BLOCKPULL_3,
            u21.BLACKHOLE_BLOCKPULL_4
        }
        v46:playSound(v47(unpack(v48)), {
            ["volumeMultiplier"] = 0.5,
            ["rollOffMaxDistance"] = 100,
            ["position"] = u43.startPosition
        })
        u7.Controllers.ReceiveItemEffectController:playEffect(v45, u43.startPosition, function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            return CFrame.new(u43.endPosition)
        end, 1)
    end)
end
v6.CreateController(u24.new())
return nil