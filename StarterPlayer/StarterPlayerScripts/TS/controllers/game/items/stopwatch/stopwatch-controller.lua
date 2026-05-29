local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "catrom", "src")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutCubic
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.RunService
local u15 = v10.Workspace
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "stopwatch", "stopwatch-constants").StopwatchConstants
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "StopwatchController"
    end,
    ["__index"] = u17
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p25)
    p25.Name = "StopwatchController"
    p25.stopwatchAbilities = {}
end
function u22.KnitStart(u26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
        [3] = u20
        [4] = u12
        [5] = u3
        [6] = u21
        [7] = u8
        [8] = u2
        [9] = u18
        [10] = u19
        [11] = u1
        [12] = u11
        [13] = u15
        [14] = u6
        [15] = u16
        [16] = u7
    --]]
    u17.KnitStart(u26)
    u14.Heartbeat:Connect(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        for v27, v28 in u26.stopwatchAbilities do
            if v27.PrimaryPart and time() > v28.nextCaptureCheckpoint then
                local v29 = u26:getCurrentAnimationOfCharacter(v27)
                if v29 ~= nil then
                    v28.nextCaptureCheckpoint = time() + 1
                    local v30 = v28.checkpoints
                    local v31 = {
                        ["cframe"] = v27:GetPrimaryPartCFrame(),
                        ["animation"] = v29
                    }
                    table.insert(v30, v31)
                end
            end
        end
    end)
    u20.Client:OnEvent("StopwatchActivated", function(p32) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u12
            [3] = u3
            [4] = u21
            [5] = u8
            [6] = u2
            [7] = u18
            [8] = u19
        --]]
        local v33 = p32.character
        local v34 = u26:createOriginMarker(p32.cframe)
        local v35 = u12:GetPlayerFromCharacter(v33)
        local v36 = u26:getCurrentAnimationOfCharacter(v33)
        if v36 == nil then
            return nil
        end
        local v37 = u3
        local v38 = u21.STOPWATCH_ACTIVATED
        local v39 = {}
        local v40 = v33.PrimaryPart
        if v40 ~= nil then
            v40 = v40.Position
        end
        v39.position = v40
        v39.parent = v33.PrimaryPart
        v39.rollOffMaxDistance = 150
        v39.volumeMultiplier = 1.5
        local v41 = v37:playSound(v38, v39)
        local v42 = u3
        local v43 = u21.STOPWATCH_TICKING
        local v44 = {}
        local v45 = v33.PrimaryPart
        if v45 ~= nil then
            v45 = v45.Position
        end
        v44.position = v45
        v44.parent = v33.PrimaryPart
        v44.rollOffMaxDistance = 150
        v44.looped = true
        local v46 = v42:playSound(v43, v44)
        if v46 and v41 then
            local v47 = u8.new()
            v47:GiveTask(v46)
            v47:GiveTask(u26:attachActiveEffects(v33))
            if u12.LocalPlayer == v35 then
                v47:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u18.STOPWATCH))
                local v48 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
                local v49 = u18.STOPWATCH
                local v50 = u19.DURATION
                local v51 = {
                    ["cooldownBar"] = {
                        ["color"] = Color3.fromRGB(81, 134, 180)
                    }
                }
                v48:setOnCooldown(v49, v50, v51)
            end
            local v52 = u26.stopwatchAbilities
            local v53 = {
                ["marker"] = v34,
                ["nextCaptureCheckpoint"] = time() + 1,
                ["activeMaid"] = v47,
                ["checkpoints"] = {
                    {
                        ["cframe"] = p32.cframe,
                        ["animation"] = v36
                    }
                }
            }
            v52[v33] = v53
        end
    end)
    u20.Client:OnEvent("StopwatchExpired", u1.async(function(p54) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u11
            [3] = u15
            [4] = u12
            [5] = u3
            [6] = u21
            [7] = u6
            [8] = u16
            [9] = u7
        --]]
        local v55 = p54.character
        local v56 = u26:getCurrentAnimationOfCharacter(v55)
        if v56 == nil then
            return nil
        end
        local v57 = u26.stopwatchAbilities[v55]
        if v57 == nil then
            return nil
        end
        v57.activeMaid:DoCleaning()
        if p54.effect == false then
            u26:clearAbility(v55)
            return nil
        end
        local v58 = v57.checkpoints
        local v59 = {
            ["cframe"] = v55:GetPrimaryPartCFrame(),
            ["animation"] = v56
        }
        table.insert(v58, v59)
        local u60 = u26:cleanCheckpoints(v57.checkpoints)
        v55.Archivable = true
        local u61 = v55:Clone()
        u61.HumanoidRootPart.Anchored = true
        u11:RemoveTag(u61, "entity")
        u11:RemoveTag(u61, "inventory-entity")
        local v62 = u61:FindFirstChildOfClass("Shirt")
        if v62 ~= nil then
            v62:Destroy()
        end
        local v63 = u61:FindFirstChildOfClass("Pants")
        if v63 ~= nil then
            v63:Destroy()
        end
        for _, v64 in u61:GetDescendants() do
            if v64:IsA("BasePart") and v64 ~= u61.PrimaryPart then
                v64.Color = Color3.fromRGB(81, 134, 180)
                v64.Material = Enum.Material.Neon
                v64.Transparency = 0.7
                if v64:IsA("MeshPart") then
                    v64.TextureID = ""
                end
            elseif v64:IsA("Decal") and v64.Name ~= "face" or (v64:IsA("Texture") or (v64:IsA("BillboardGui") or (v64:IsA("Beam") or v64:IsA("ParticleEmitter")))) then
                v64:Destroy()
            elseif v64:IsA("SpecialMesh") then
                v64.TextureId = ""
            end
        end
        u61.Parent = u15
        local u65 = nil
        local u66 = {}
        local u67 = u61.Humanoid.Animator
        v55:SetAttribute("Transparency", 1)
        local v68 = p54.teleportBackTime - u15:GetServerTimeNow() + 0.1
        if p54.player == u12.LocalPlayer then
            if u61.Humanoid == nil then
                return nil
            end
            u15.CurrentCamera.CameraSubject = u61.Humanoid
            u3:playSound(u21.STOPWATCH_REWINDING, {
                ["volumeMultiplier"] = 2,
                ["playbackSpeedMultiplier"] = 1 / v68
            })
        end
        local u69 = #u60
        local v70 = table.create(#u60)
        for v71, v72 in u60 do
            local _ = v71 - 1
            v70[v71] = v72.cframe
        end
        local u73 = u6.new(v70, 0.5, 0)
        local v74, _ = pcall(function() --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73:SolvePosition(0.5)
        end)
        if v74 == true then
            u16(v68, u7, function(p75) --[[ Line: 202 ]]
                --[[
                Upvalues:
                    [1] = u73
                    [2] = u61
                    [3] = u65
                    [4] = u66
                    [5] = u60
                    [6] = u69
                    [7] = u67
                --]]
                local v76 = math.clamp(p75, 0, 1)
                local v77 = u73:SolvePosition(v76)
                local v78 = v77 + u73:SolveVelocity(v76) * Vector3.new(1, 0, 1)
                u61:PivotTo(CFrame.lookAt(v77, v78))
                if u65 then
                    local v79 = u66[u65]
                    if v79 ~= nil then
                        v79:AdjustSpeed(v76 * 2)
                    end
                end
                local v80 = u60[u69 - 1 + 1]
                if v80 == nil then
                    return nil
                end
                if (v77 - v80.cframe.Position).Magnitude < 3 then
                    u69 = u69 - 1
                    if u65 == v80.animation then
                        return nil
                    end
                    if u65 then
                        local v81 = u66[u65]
                        if v81 ~= nil then
                            v81:Stop()
                        end
                    end
                    local v82
                    if u66[v80.animation] == nil then
                        v82 = u67:LoadAnimation(v80.animation)
                        u66[v80.animation] = v82
                    else
                        v82 = u66[v80.animation]
                    end
                    if v82 ~= nil then
                        v82:Play()
                    end
                    u65 = v80.animation
                end
            end, 1, 0):Wait()
        end
        u61:Destroy()
        v55.Archivable = false
        v55:SetAttribute("Transparency", 0)
        if p54.player == u12.LocalPlayer then
            u15.CurrentCamera.CameraSubject = v55.Humanoid
        end
        u26:clearAbility(v55)
    end))
end
function u22.clearAbility(p83, p84) --[[ Line: 267 ]]
    local v85 = p83.stopwatchAbilities[p84]
    if v85 == nil then
        error("cannot clear ability that doesn\'t exist")
    end
    v85.marker:Destroy()
    v85.activeMaid:DoCleaning()
    p83.stopwatchAbilities[p84] = nil
end
function u22.cleanCheckpoints(_, p86) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v87 = u5.copy(p86)
    for v88, v89 in pairs(p86) do
        local v90 = p86[v88 + 1]
        if v90 ~= nil and (v89.cframe.Position - v90.cframe.Position).Magnitude < 0.25 then
            table.remove(v87, v88 + 1)
        end
    end
    return v87
end
function u22.getCurrentAnimationOfCharacter(_, p91) --[[ Line: 295 ]]
    local v92 = p91.Humanoid.Animator:GetPlayingAnimationTracks()
    table.sort(v92, function(p93, p94) --[[ Line: 297 ]]
        return p93.WeightCurrent > p94.WeightCurrent
    end)
    return v92[1].Animation
end
function u22.createOriginMarker(_, p95) --[[ Line: 305 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
    --]]
    local v96 = u13.Assets.Effects.StopwatchEffects.StopwatchMarker:Clone()
    v96.Position = (p95 * CFrame.new(0, -2, 0)).Position
    v96.Parent = u15
    return v96
end
function u22.attachActiveEffects(_, p97) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u19
        [4] = u8
    --]]
    local v98 = u9("Attachment", {
        ["Position"] = Vector3.new(0, -1.65, 0),
        ["Parent"] = p97.HumanoidRootPart
    })
    local v99 = u9("Attachment", {
        ["Position"] = Vector3.new(0, 1.1, 0),
        ["Parent"] = p97.HumanoidRootPart
    })
    local v100 = u13.Assets.Effects.StopwatchEffects.Trail:Clone()
    v100.Lifetime = u19.DURATION
    v100.Parent = p97.HumanoidRootPart
    v100.Attachment0 = v98
    v100.Attachment1 = v99
    local v101 = u13.Assets.Effects.StopwatchEffects.TrailParticles:Clone()
    v101.Parent = p97.HumanoidRootPart
    local v102 = u8.new()
    v102:GiveTask(v98)
    v102:GiveTask(v99)
    v102:GiveTask(v100)
    v102:GiveTask(v101)
    return v102
end
v4.CreateController(u22.new())
return nil