local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "BeeController"
    end,
    ["__index"] = u13
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
        [1] = u13
        [2] = u11
        [3] = u4
        [4] = u7
    --]]
    u13.constructor(p17, u11.BEEKEEPER)
    p17.Name = "BeeController"
    local v18 = u4("Part", {
        ["Name"] = "Root",
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = false,
        ["CanCollide"] = false
    })
    p17.beelessModel = u4("Model", {
        ["PrimaryPart"] = v18,
        ["Children"] = { v18 },
        ["Parent"] = u7
    })
end
function u14.KnitStart(p19) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p19)
end
function u14.onKitLocalActivated(u20, u21) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u6
    --]]
    u12.Client:OnEvent("BeeSpawn", function(p22) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u7
        --]]
        local v23 = u20
        local v24 = {
            ["maxDistanceFromOrigin"] = 6,
            ["includeProximityPrompt"] = true,
            ["id"] = p22.beeId,
            ["origin"] = p22.position
        }
        local v25
        if p22.useBeeModel then
            v25 = u7.Assets.Effects.Bee:Clone()
        else
            v25 = u20.beelessModel:Clone()
        end
        v24.beeModel = v25
        v23:createLocalBee(v24)
    end):andThen(function(u26) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        return u21:GiveTask(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            return u26:Disconnect()
        end)
    end)
    u12.Client:OnEvent("BeeRemoved", function(p27) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v28 = nil
        for v29, v30 in u6:GetTagged("bee") do
            local _ = v29 - 1
            if v30:GetAttribute("BeeId") == p27.beeId == true then
                v28 = v30
                break
            end
        end
        if v28 ~= nil then
            v28:Destroy()
        end
    end):andThen(function(u31) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        return u21:GiveTask(function() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            return u31:Disconnect()
        end)
    end)
end
function u14.onKitLocalDeactivated(_) --[[ Line: 91 ]] end
function u14.onKitReplicationActivated(_, _) --[[ Line: 93 ]] end
function u14.onKitReplicationDeactivated(_) --[[ Line: 95 ]] end
function u14.onInnateAbilityEnabled(_, _, _) --[[ Line: 97 ]] end
function u14.onAbilityUsed(_, _, _) --[[ Line: 99 ]] end
function u14.createLocalBee(p32, p33) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u3
        [4] = u2
        [5] = u10
        [6] = u9
        [7] = u6
    --]]
    local u34 = p33.beeModel:Clone()
    u34:PivotTo(CFrame.new(p33.origin))
    local v35 = u34.Root
    u4("BodyVelocity", {
        ["Parent"] = v35
    })
    local v36 = u4
    local v37 = {
        ["Parent"] = v35
    }
    local v38 = v35:GetMass() * u8.Gravity
    v37.Force = Vector3.new(0, v38, 0)
    v36("BodyForce", v37)
    u4("BodyGyro", {
        ["MaxTorque"] = Vector3.new(400000, 400000, 400000),
        ["D"] = 600,
        ["Parent"] = v35
    })
    if p33.includeProximityPrompt then
        local v40 = {
            ["ActionText"] = "Pick Up",
            ["ObjectText"] = "Bee",
            ["HoldDuration"] = 0.1,
            ["RequiresLineOfSight"] = false,
            ["Enabled"] = false,
            ["MaxActivationDistance"] = 10,
            ["Triggered"] = function(p39) --[[ Name: Triggered, Line 125 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u34
                --]]
                u3.Controllers.BeeNetController:trigger(p39, u34)
            end,
            ["Parent"] = v35
        }
        u3.Controllers.ProximityPromptController:createProximityPrompt(v40)
    end
    u34.Parent = u8
    u34:SetAttribute("BeeId", p33.id)
    u34:SetAttribute("BeeOrigin", p33.origin)
    u34:SetAttribute("MaxDistanceFromOrigin", p33.maxDistanceFromOrigin)
    u34:SetAttribute("NextUpdateDirection", -1)
    for _, v41 in u34:GetDescendants() do
        if v41:IsA("BasePart") then
            u2:setQueryIgnored(v41, true)
        end
    end
    local v42 = u34:FindFirstChildOfClass("AnimationController")
    if v42 ~= nil then
        local v43 = v42:LoadAnimation(u10:getAnimation(u9.BEE_FLAP))
        v43.Looped = true
        v43:Play()
    end
    local v44 = p32:makePulseEffect()
    v44.Parent = v35
    v44.Enabled = true
    u6:AddTag(u34, "bee")
    return u34
end
function u14.makePulseEffect(_) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4("ParticleEmitter", {
        ["LightEmission"] = 1,
        ["Acceleration"] = Vector3.new(0, 4, 0),
        ["Drag"] = 3.5,
        ["Rate"] = 0.3,
        ["TimeScale"] = 1,
        ["Texture"] = "rbxassetid://10553903882",
        ["ZOffset"] = 0.11,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 189, 0)),
        ["Orientation"] = Enum.ParticleOrientation.FacingCamera,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.265, 6.5, 0.383), NumberSequenceKeypoint.new(1, 9, 0) }),
        ["Transparency"] = NumberSequence.new(0.412, 1),
        ["EmissionDirection"] = Enum.NormalId.Top,
        ["Lifetime"] = NumberRange.new(0.35, 0.55)
    })
end
u3.CreateController(u14.new())
return nil