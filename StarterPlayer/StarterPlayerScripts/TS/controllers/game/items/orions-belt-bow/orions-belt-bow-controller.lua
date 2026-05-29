local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "OrionsBeltBowController"
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
    --]]
    u10.constructor(p17)
    p17.Name = "OrionsBeltBowController"
    p17.prevStar = {}
    p17.starNum = {}
end
function u14.KnitStart(u18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u5
        [4] = u11
        [5] = u7
        [6] = u2
        [7] = u12
        [8] = u8
        [9] = u13
    --]]
    u10.KnitStart(u18)
    u9.ProjectileLaunched:connect(function(p19) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
        --]]
        if p19:isCancelled() then
            return nil
        end
        if p19.projectileType ~= "star_projectile" then
            return nil
        end
        if not p19.shooter then
            return nil
        end
        if u18.starNum[p19.shooter] == nil then
            u18.starNum[p19.shooter] = 0
        end
        local v20 = u18.starNum[p19.shooter]
        local v21 = v20 == nil and 0 or v20
        local v22 = v21 * 3.141592653589793 * 2
        local v23 = math.cos(v22) * 10
        local v24 = math.sin(v22) * 10
        local v25 = Vector3.new(v23, 0, v24)
        if p19.projectile.PrimaryPart then
            p19.projectile.PrimaryPart:ApplyImpulse(v25)
        end
        u18.starNum[p19.shooter] = v21 == 0 and 0.5 or 0
        if u18.prevStar[p19.shooter] == nil then
            if p19.projectile.PrimaryPart then
                u18.prevStar[p19.shooter] = p19.projectile.PrimaryPart
            end
        else
            local v26 = p19.projectile.PrimaryPart
            local v27 = u18.prevStar[p19.shooter]
            if v26 and v27 then
                if (v26.Position - v27.Position).Magnitude < 80 then
                    u5.Controllers.BeamController:createBeam({
                        ["width0"] = 1.5,
                        ["width1"] = 1.5,
                        ["duration"] = 4,
                        ["source"] = v26,
                        ["target"] = v27,
                        ["color"] = Color3.new(255, 255, 255)
                    })
                end
                u18.prevStar[p19.shooter] = v26
                return
            end
        end
    end)
    u11.Client:OnEvent("StarExplode", function(p28) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u12
            [4] = u8
            [5] = u13
        --]]
        local u29 = u7.Assets.Effects.StarExplosion:Clone()
        u2:playSound(u12.STAR_EXPLODE, {
            ["rollOffMaxDistance"] = 200,
            ["volumeMultiplier"] = 2,
            ["position"] = p28.position
        })
        u29.Parent = u8
        u29.Color = Color3.new(255, 255, 255)
        u13:playEffects({ u29 }, nil, {
            ["sizeMultiplier"] = 3
        })
        u29:PivotTo(CFrame.new(p28.position))
        task.delay(2, function() --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:Destroy()
        end)
    end)
end
v4.CreateController(u14.new())
return nil