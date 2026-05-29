local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v3.registerConstants(script, {
    ["RotationSpeed"] = 15,
    ["ExplosionSoundMaxDistance"] = 150,
    ["RandomSizeOffset"] = 10,
    ["RandomPositionOffset"] = 2
})
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "SpiritController"
    end,
    ["__index"] = u13
})
u19.__index = u19
function u19.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, ...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p22, ...)
    p22.Name = "SpiritController"
    p22.spiritToMaid = {}
end
function u19.KnitStart(u23) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u9
        [4] = u16
        [5] = u1
        [6] = u4
        [7] = u17
        [8] = u18
        [9] = u7
    --]]
    u13.KnitStart(u23)
    u11:GetInstanceAddedSignal("spirit"):Connect(function(u24) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u23
        --]]
        local v25 = u9.new()
        u23.spiritToMaid[u24] = v25
        local u26 = u23:setupSpiritAnimationTracks(u24)
        u26.idle:Play()
        v25:GiveTask(u24:GetAttributeChangedSignal("State"):Connect(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u26
                [3] = u23
            --]]
            local v27 = u24:GetAttribute("State")
            if v27 == 1 then
                u26.idle:Stop()
                u26.run:Play()
            elseif v27 == 2 then
                u23:tweenOutSpirit(u24)
            end
        end))
        v25:GiveTask(u26.idle)
        v25:GiveTask(u26.run)
    end)
    u11:GetInstanceRemovedSignal("spirit"):Connect(function(p28) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v29 = u23.spiritToMaid[p28]
        if v29 ~= nil then
            v29:DoCleaning()
        end
        u23.spiritToMaid[p28] = nil
    end)
    u16.Client:OnEvent("SpiritExplosion", u1.async(function(p30) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u17
            [3] = u18
            [4] = u1
            [5] = u7
        --]]
        u4:playSound(u17.SPIRIT_EXPLODE, {
            ["position"] = p30.position,
            ["rollOffMaxDistance"] = u18.ExplosionSoundMaxDistance
        })
        u1.await(u7.Controllers.FancyExplosionController:createExplosion({
            ["position"] = p30.position,
            ["radius"] = p30.radius,
            ["randomSizeOffset"] = u18.RandomSizeOffset,
            ["randomPositionOffset"] = u18.RandomPositionOffset,
            ["rotationSpeed"] = u18.RotationSpeed
        }))
    end))
end
function u19.setupSpiritAnimationTracks(_, p31) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u14
    --]]
    local v32 = Instance.new("AnimationController")
    v32.Parent = p31
    local v33 = Instance.new("Animator")
    v33.Parent = v32
    return {
        ["idle"] = v33:LoadAnimation(u10("Animation", {
            ["AnimationId"] = u15:getAssetId(u14.ROBLOX_GHOST_FLOATING)
        })),
        ["run"] = v33:LoadAnimation(u10("Animation", {
            ["AnimationId"] = u15:getAssetId(u14.ROBLOX_GHOST_RUN)
        }))
    }
end
u19.tweenOutSpirit = u1.async(function(_, u34) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
    --]]
    u12(0.2, u8, function(p35) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        for _, v36 in u34:GetChildren() do
            if v36:IsA("BasePart") then
                v36.Transparency = p35
            end
        end
    end, 0.9, 1):Wait()
end)
v6.CreateController(u19.new())
return nil