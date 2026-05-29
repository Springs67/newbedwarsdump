local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out")
local u11 = v10.scaleModel
local u12 = v10.scalePart
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "FlowerBowController"
    end,
    ["__index"] = u21
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.constructor(p31)
    p31.Name = "FlowerBowController"
    p31.flowers = {}
    p31.count = 0
end
function u28.KnitStart(u32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u26
        [3] = u15
        [4] = u27
        [5] = u6
        [6] = u25
        [7] = u4
        [8] = u5
        [9] = u9
        [10] = u20
        [11] = u7
        [12] = u19
    --]]
    u21.KnitStart(u32)
    u26.Client:Get("FlowerSpawn"):Connect(function(p33) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u15
            [3] = u27
            [4] = u6
            [5] = u25
            [6] = u4
            [7] = u5
            [8] = u9
        --]]
        u32.flowers[p33.flower] = true
        u32:createBee(p33.flower)
        local v34 = p33.flower:GetAttribute("PlacedByUserId")
        if v34 == 0 or (v34 ~= v34 or not v34) then
            return nil
        else
            local v35 = u15:GetPlayerByUserId(v34)
            if v35 then
                local v36 = u27.FLOWER_PLANT
                local v37 = p33.owner.Character
                if v37 then
                    local v38 = u25[u6.Controllers.KitSkinController:getKitSkin(v37)]
                    if v38.lyla then
                        v36 = u4.fromList(v38.lyla.flowerPlantSounds)[1]
                    end
                end
                u5:playSound(v36, {
                    ["rollOffMaxDistance"] = 220,
                    ["position"] = p33.hitCFrame.Position
                })
                if u15.LocalPlayer.UserId ~= v34 then
                    if v35.Team ~= u15.LocalPlayer.Team then
                        local v39 = {}
                        local v40 = p33.flower.PrimaryPart
                        if v40 ~= nil then
                            v40 = v40:FindFirstChild("flower")
                        end
                        v39.Parent = v40
                        v39.OutlineColor = Color3.fromRGB(255, 120, 120)
                        v39.FillColor = Color3.fromRGB(255, 150, 150)
                        v39.FillTransparency = 1
                        v39.OutlineTransparency = 0
                        v39.DepthMode = Enum.HighlightDepthMode.Occluded
                        u9("Highlight", v39)
                    end
                end
            else
                return nil
            end
        end
    end)
    u26.Client:Get("SpawnBeeOnTarget"):Connect(function(p41) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        local v42 = false
        local v43 = 0
        while true do
            if v42 then
                v43 = v43 + 1
            else
                v42 = true
            end
            if v43 >= p41.count then
                return
            end
            u32:createBee(p41.target)
        end
    end)
    u26.Client:Get("BloomEvent"):Connect(function(p44) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:bloomEffect(p44.target, p44.attackerUserId)
    end)
    u26.Client:Get("FlowerTriggered"):Connect(function(u45) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u7
        --]]
        if not u45.flower then
            return nil
        end
        if u45.target then
            local u46 = u45.flower:FindFirstChild("SmallerBee")
            if u46 then
                u46.Parent = u45.target
            end
            local v47 = u45.lastTime
            if v47 ~= 0 and (v47 == v47 and v47) then
                task.delay(u45.lastTime, function() --[[ Line: 130 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                    --]]
                    local v48 = u46
                    if v48 ~= nil then
                        v48:Destroy()
                    end
                end)
            end
        end
        u20(0.9, u7, function(p49) --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            local v50 = u45.flower.PrimaryPart
            if v50 ~= nil then
                v50 = v50:FindFirstChild("flower")
            end
            if v50 then
                v50.Transparency = p49
            end
        end, 0, 1)
    end)
    u26.Client:Get("BloomEnd"):Connect(function(p51) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u7
        --]]
        local v52 = p51.target:GetChildren()
        local function v60(u53) --[[ Line: 152 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u7
            --]]
            if u53.Name == "SmallerBee" then
                u53:SetAttribute("MaxDistanceFromOrigin", 100)
                task.delay(1, function() --[[ Line: 155 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    u53:Destroy()
                end)
            elseif u19.startsWith(u53.Name, "Flower") and (u53:IsA("Model") and u53.PrimaryPart ~= nil) then
                local u54 = u53:FindFirstChild("Root")
                if u54 ~= nil then
                    u54 = u54:FindFirstChild("flower")
                end
                local u55 = u53:FindFirstChild("Root")
                if u55 ~= nil then
                    u55 = u55:FindFirstChild("flower")
                    if u55 ~= nil then
                        u55 = u55:FindFirstChild("BeeSound")
                    end
                end
                if u55 then
                    u55.Volume = 0.5
                    u20(1, u7, function(p56) --[[ Line: 174 ]]
                        --[[
                        Upvalues:
                            [1] = u55
                        --]]
                        u55.Volume = p56
                    end, 0.5, 0)
                end
                u20(0.8, u7, function(p57) --[[ Line: 178 ]]
                    --[[
                    Upvalues:
                        [1] = u54
                    --]]
                    if u54 then
                        u54.Transparency = p57
                    end
                end, 0, 1)
                for v58, v59 in u53.PrimaryPart:GetDescendants() do
                    local _ = v58 - 1
                    if v59:IsA("ParticleEmitter") then
                        v59:Emit(30)
                    end
                end
                task.delay(1, function() --[[ Line: 192 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    u53:Destroy()
                end)
            end
        end
        for v61, v62 in v52 do
            v60(v62, v61 - 1, v52)
        end
    end)
end
function u28.createBee(_, p63) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u11
        [3] = u9
        [4] = u18
        [5] = u3
        [6] = u23
        [7] = u22
        [8] = u14
    --]]
    local v64 = u16.Assets.Effects.SmallerBee:Clone()
    if p63:GetAttribute("Strength") == 2 then
        u11(v64, 2)
    end
    v64:PivotTo(p63:GetPivot())
    local v65 = v64.Root
    u9("BodyVelocity", {
        ["Parent"] = v65
    })
    local v66 = u9
    local v67 = {
        ["Parent"] = v65
    }
    local v68 = v65:GetMass() * u18.Gravity
    v67.Force = Vector3.new(0, v68, 0)
    v66("BodyForce", v67)
    u9("BodyGyro", {
        ["MaxTorque"] = Vector3.new(400000, 400000, 400000),
        ["D"] = 600,
        ["Parent"] = v65
    })
    v64.Parent = p63
    v64:SetAttribute("BeeOrigin", p63:GetPivot().Position)
    v64:SetAttribute("MaxDistanceFromOrigin", 1)
    v64:SetAttribute("NextUpdateDirection", -1)
    for _, v69 in v64:GetDescendants() do
        if v69:IsA("BasePart") then
            u3:setQueryIgnored(v69, true)
        end
    end
    local v70 = v64:FindFirstChildOfClass("AnimationController")
    if v70 ~= nil then
        local v71 = v70:LoadAnimation(u23:getAnimation(u22.BEE_FLAP))
        v71.Looped = true
        v71:Play()
    end
    u14:AddTag(v64, "flower-bee")
end
function u28.bloomEffect(_, u72, p73) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u6
        [4] = u25
        [5] = u11
        [6] = u8
        [7] = u24
        [8] = u27
        [9] = u9
        [10] = u5
        [11] = u17
        [12] = u12
    --]]
    local v74 = u16.Assets.Effects.Lyla.Flower
    local v75 = u15:GetPlayerByUserId(p73)
    if v75 ~= nil then
        v75 = v75.Character
    end
    local v76
    if v75 then
        v76 = u6.Controllers.KitSkinController:getKitSkin(v75)
    else
        v76 = nil
    end
    local v77
    if v76 then
        v77 = u25[v76]
    else
        v77 = nil
    end
    local v78
    if v77 == nil then
        v78 = v77
    else
        v78 = v77.lyla
    end
    if v78 then
        v74 = u16.Assets.Effects.Lyla:FindFirstChild(v77.lyla.customFlowerName)
    end
    local u79 = v74:Clone()
    u11(u79, 0.3)
    u79.Parent = u72
    if u79.PrimaryPart == nil then
        local v80 = u79:FindFirstChildWhichIsA("BasePart")
        if not v80 then
            u8.Error("flower has no primary part")
            return nil
        end
        u79.PrimaryPart = v80
    end
    local v81 = u72:FindFirstChild("Head")
    if v81 ~= nil then
        v81 = v81:FindFirstChild("HairAttachment")
    end
    if not v81 then
        return nil
    end
    local u82 = u24:getEntity(u72)
    local v83 = u27.FLOWER_BLOOM
    local v84 = u27.ANGRY_BEE
    local v85
    if v77 == nil then
        v85 = v77
    else
        v85 = v77.lyla
    end
    if v85 then
        v83 = v77.lyla.flowerBloomSound
        v84 = v77.lyla.angryBeesSound
    end
    u9("Sound", {
        ["RollOffMinDistance"] = 30,
        ["RollOffMaxDistance"] = 45,
        ["Volume"] = 0.5,
        ["Playing"] = true,
        ["SoundId"] = v83,
        ["Parent"] = u79.PrimaryPart
    })
    local v86 = u5:createSound(v84)
    v86.RollOffMinDistance = 30
    v86.RollOffMaxDistance = 45
    v86.Name = "BeeSound"
    u5:playSound(v86, {
        ["looped"] = true,
        ["parent"] = u79.PrimaryPart
    })
    local u87 = nil
    u87 = u17.Heartbeat:Connect(function(p88) --[[ Line: 304 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u12
            [3] = u82
            [4] = u87
            [5] = u72
        --]]
        if u79.PrimaryPart and u79.PrimaryPart.Size.Y < 3 then
            u12(u79.PrimaryPart, 1 + p88 * 4)
        end
        if not u82 or u82:isDead() then
            u87:Disconnect()
            u79:Destroy()
            return nil
        end
        if not u72.PrimaryPart then
            u79:Destroy()
            u87:Disconnect()
            return nil
        end
        u79:PivotTo(u72.PrimaryPart.CFrame + Vector3.new(0, 3.5, 0))
    end)
    u79.Destroying:Connect(function() --[[ Line: 326 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87:Disconnect()
    end)
end
u6.CreateController(u28.new())
return nil