local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u19 = u1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "FlowerSplosionBedBreakEffect"
    end,
    ["__index"] = u19
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u15
    --]]
    u19.constructor(p23, u15.FLOWER_SPLOSION)
    p23.Name = "FlowerSplosionBedBreakEffect"
    p23.springColors = {
        Color3.fromRGB(249, 150, 174),
        Color3.fromRGB(159, 244, 223),
        Color3.fromRGB(246, 240, 163),
        Color3.fromRGB(107, 206, 238),
        Color3.fromRGB(217, 182, 253),
        Color3.fromRGB(135, 221, 89),
        Color3.fromRGB(4, 118, 7)
    }
end
function u20.KnitStart(p24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p24)
end
function u20.onBedBreak(p25, _, p26, _, _) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u3
        [4] = u12
        [5] = u4
        [6] = u5
        [7] = u16
        [8] = u17
        [9] = u1
    --]]
    local u27 = u7.new()
    p25.maid:GiveTask(u27)
    local v28 = u11.Assets.Effects.FlowerSplosionEffect:Clone()
    u3:setQueryIgnored(v28, true)
    v28.Transparency = 1
    v28.CFrame = p26
    v28.Parent = u12
    u27:GiveTask(v28)
    local v29 = v28.Attachment
    for v30, v31 in {
        v29.Flower,
        v29.Flower1,
        v29.Flower2,
        v29.Flower3
    } do
        local _ = v30 - 1
        local v32 = u4.fromList(p25.springColors)[1]
        v31.Color = ColorSequence.new(v32)
    end
    u27:GiveTask(u5:playSound(u16.STAR_KILL_EFFECT, {
        ["position"] = p26.Position
    }))
    u17:playInstanceEffects({ v28 })
    u1.Promise.delay(4):andThen(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:DoCleaning()
    end)
end
function u20.hookBalloon(_, p33, p34) --[[ Line: 72 ]]
    local v35 = p34:WaitForChild("RopeConstraint")
    v35.Attachment0 = p33
    v35.Attachment1 = p34.Balloon.Attachment
end
function u20.inflateBalloon(_, p36) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u4
        [4] = u11
        [5] = u8
        [6] = u12
        [7] = u10
        [8] = u13
    --]]
    if not (p36 and p36.PrimaryPart) then
        return nil
    end
    local v37 = "InflatedBalloon"
    local v38
    if u18.isLobbyServer() then
        v38 = u14.BALLOON_SKIN_MODELS_LOBBY
    else
        v38 = u14.BALLOON_SKIN_MODELS
    end
    if v38 and #v38 > 0 then
        v37 = u4.fromList(unpack(v38))
    end
    local v39 = u11:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v37):Clone()
    v39.Balloon:SetAttribute("IgnoreProjectileCollision", true)
    v39.Balloon.CFrame = p36:GetPrimaryPartCFrame()
    local v40 = u8
    local v41 = {
        ["Name"] = "BodyForce"
    }
    local v42 = u12.Gravity * v39.Balloon.Mass * 7
    v41.Force = Vector3.new(0, v42, 0)
    v41.Parent = v39.Balloon
    v40("BodyForce", v41)
    if v37 == "InflatedBalloon" then
        u8("BodyGyro", {
            ["D"] = 0,
            ["CFrame"] = v39.Balloon.CFrame,
            ["Parent"] = v39.Balloon
        })
    else
        u8("BodyGyro", {
            ["D"] = 1000,
            ["P"] = 10,
            ["CFrame"] = v39.Balloon.CFrame,
            ["Parent"] = v39.Balloon
        })
    end
    v39.Parent = p36
    u10:AddTag(v39, "InflatedBalloon:" .. p36.Name)
    local v43 = Color3.fromRGB(216, 50, 53)
    local v44 = u13:getState().Game.myTeam
    if v44 then
        if v44 ~= nil then
            v44 = v44.color
        end
    else
        v44 = v43
    end
    v39.Balloon.Color = v44
    v39.Balloon.PopEffect.Color = ColorSequence.new(v44)
    return v39
end
function u20.popBalloon(_, u45) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u5
        [3] = u16
    --]]
    u45.Balloon.BodyForce.Force = Vector3.new(0, 0, 0)
    u45:SetAttribute("DeflatedBalloon", true)
    u1.Promise.delay(2):andThen(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u5
            [3] = u16
        --]]
        u45:Destroy()
        u5:playSound(u16.BALLOON_POP, {
            ["position"] = u45.Balloon.Position
        })
    end)
end
v6.CreateController(u20.new())
return nil