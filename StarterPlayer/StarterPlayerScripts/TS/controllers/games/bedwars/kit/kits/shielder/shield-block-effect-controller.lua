local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Debris
local u9 = v7.Players
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v3.registerConstants(script, {
    ["velX"] = 5,
    ["velY"] = 12,
    ["velZ"] = 5,
    ["gravity"] = 0.8
})
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "ShieldBlockEffectController"
    end,
    ["__index"] = u12
})
u18.__index = u18
function u18.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "ShieldBlockEffectController"
end
function u18.KnitStart(u22) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u13
        [4] = u15
        [5] = u14
        [6] = u11
        [7] = u5
        [8] = u16
        [9] = u9
    --]]
    u12.KnitStart(u22)
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = { u13.KNIGHT_SHIELD_RAISE_SHIELD }
    })
    u15.Client:OnEvent("ShieldBlocked", function(p23) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u11
            [3] = u22
            [4] = u5
            [5] = u16
            [6] = u9
        --]]
        local v24 = p23.entity:FindFirstChild(u14.INFERNAL_SHIELD)
        if v24 and (v24.Handle.BlockEffectAttachment.WorldCFrame.Position - u11.CurrentCamera.CFrame.Position).Magnitude <= 150 then
            u22:spawnShieldBlockParticles(v24.Handle.BlockEffectAttachment.WorldCFrame.Position, {
                ["amount"] = 5
            })
            local v25 = u5
            local v26 = u16.SHIELD_BLOCKED
            local v27 = {}
            local v28
            if p23.entity == u9.LocalPlayer.Character then
                v28 = nil
            else
                v28 = p23.entity:GetPrimaryPartCFrame().Position
            end
            v27.position = v28
            v25:playSound(v26, v27)
        end
    end)
end
function u18.spawnShieldBlockParticles(_, p29, p30) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u1
        [3] = u4
        [4] = u11
        [5] = u10
        [6] = u8
    --]]
    local v31 = false
    local v32 = 0
    while true do
        if v31 then
            v32 = v32 + 1
        else
            v31 = true
        end
        local v33
        if p30 == nil then
            v33 = p30
        else
            v33 = p30.amount
        end
        if v32 >= (v33 == nil and 1 or v33) then
            return
        end
        local v34 = math.random(-100, 100) / 100 * u17.velX
        local v35 = math.random(50, 100) / 100 * u17.velY
        local v36 = math.random(-100, 100) / 100 * u17.velZ
        local v37 = Vector3.new(v34, v35, v36) * 0.75
        local v38 = 0.18 * math.random(80, 150) / 100
        local v39 = Color3.fromRGB(195, 43, 43)
        local u40 = Instance.new("Part")
        u40.Size = Vector3.new(v38, v38, v38)
        u40.CFrame = CFrame.new(p29)
        u40.AssemblyLinearVelocity = v37
        u40.Transparency = 0
        u40.Material = Enum.Material.Neon
        u40.Color = v39
        u40.CanCollide = false
        u1.Promise.defer(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            task.wait(0.05)
            u40.CanCollide = true
        end)
        u40.CollisionGroup = "BlockParticles"
        u4:setQueryIgnored(u40)
        local v41 = Instance.new("BodyForce")
        local v42 = u40:GetMass() * u11.Gravity * u17.gravity
        v41.Force = Vector3.new(0, v42, 0)
        v41.Parent = u40
        local v43 = Instance.new("BoolValue")
        v43.Name = "Targettable"
        v43.Value = false
        v43.Parent = u40
        u40.Parent = u11
        u1.Promise.delay(0.3 + math.random() * 0.15):andThen(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u40
            --]]
            u10:Create(u40, TweenInfo.new(0.18), {
                ["Size"] = Vector3.new(0, 0, 0),
                ["Transparency"] = 1
            }):Play()
        end)
        u8:AddItem(u40, 1.3)
    end
end
u6.CreateController(u18.new())
return nil