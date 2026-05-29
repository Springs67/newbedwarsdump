local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.PlayerUtil
local u6 = v2.RandomUtil
local u7 = v2.SoundManager
local u8 = v2.WatchCharacter
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v12.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-types").PetAnimationPriority
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "PetController"
    end,
    ["__index"] = u16
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p24)
    p24.Name = "PetController"
    p24.playerMaidMap = {}
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
    --]]
    u16.KnitStart(u25)
    u8(function(u26, _, p27) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v28 = u26:GetAttribute("PetType")
        if v28 then
            u25:setupPlayerPet(u26, v28)
        end
        p27:GiveTask(u26:GetAttributeChangedSignal("PetType"):Connect(function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u25
            --]]
            local v29 = u26
            local v30 = v29:GetAttribute("PetType")
            if v30 then
                u25:setupPlayerPet(v29, v30)
            end
        end))
        p27:GiveTask(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u26
            --]]
            u25:removePlayerPet(u26)
        end)
    end)
end
function u21.removePlayerPet(p31, p32) --[[ Line: 59 ]]
    local v33 = p31.playerMaidMap[p32]
    if v33 ~= nil then
        v33:Destroy()
    end
    p31.playerMaidMap[p32] = nil
end
function u21.setupPlayerPet(u34, u35, p36) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u18
        [4] = u10
        [5] = u15
        [6] = u20
        [7] = u13
        [8] = u3
        [9] = u17
        [10] = u14
        [11] = u4
    --]]
    local u37 = u5.waitForCharacter(u35)
    if not u37 then
        return nil
    end
    u34:removePlayerPet(u35)
    local v38 = u11.new()
    local u39 = u18[p36]
    local v40 = u39.model
    if v40 == nil or v40.PrimaryPart == nil then
        u10.Error("Error creating pet {petType}. model not found", p36)
        return nil
    end
    local u41 = v40:Clone()
    u41.PrimaryPart.Anchored = true
    local v42 = u39.scaleMultiplier
    if v42 ~= 0 and (v42 == v42 and v42) then
        u41:ScaleTo(u39.scaleMultiplier * u41:GetScale())
    end
    u41:PivotTo(u37:GetPivot())
    u41.Parent = u15
    v38:GiveTask(u41)
    for v43, v44 in u41:GetDescendants() do
        local _ = v43 - 1
        if v44:IsA("BasePart") then
            v44.CanCollide = false
        end
    end
    local u45 = u37:WaitForChild("Humanoid")
    if not u45 then
        v38:Destroy()
        return nil
    end
    local u46 = u41:FindFirstChildWhichIsA("Animator", true)
    if not u46 then
        v38:Destroy()
        return nil
    end
    local u47 = Vector3.new()
    local u48 = nil
    local u49 = nil
    local u50 = nil
    v38:GiveTask(u20.Client:Get("EmotePlaying"):Connect(function(p51) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u37
            [3] = u48
            [4] = u39
            [5] = u50
            [6] = u3
            [7] = u46
            [8] = u17
        --]]
        local v52 = u13:GetPlayerFromCharacter(u37)
        if not v52 then
            return nil
        end
        if p51 == v52 then
            local v53 = u48
            if v53 then
                v53 = u39.animations.dance
            end
            if v53 ~= 0 and (v53 == v53 and v53) then
                u50 = u3:playAnimation(u46, u17:getAssetId(u39.animations.dance), {
                    ["looped"] = true
                })
            end
        end
    end))
    local u54 = 0
    local v55 = u37:GetPivot()
    local v56 = -u45.HipHeight - u41:GetExtentsSize().Y / 2
    local v57 = u39.heightOffset
    local v58 = v56 + (v57 == nil and 0 or v57)
    local v59 = u39.spawnHeightOffset
    local v60 = v59 == nil and 0 or v59
    local u61 = v55 * CFrame.new(0, v58 + v60, 3)
    local u62 = u37:GetPivot().Position
    v38:GiveTask(u14.Heartbeat:Connect(function(p63) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u61
            [3] = u54
            [4] = u4
            [5] = u37
            [6] = u62
            [7] = u39
            [8] = u45
            [9] = u47
            [10] = u49
            [11] = u48
            [12] = u3
            [13] = u46
            [14] = u17
            [15] = u50
        --]]
        u41:PivotTo(u41:GetPivot():Lerp(u61, 0.04))
        u54 = u54 + p63
        if u54 < 0.1 then
            return nil
        end
        u54 = 0
        local v64 = RaycastParams.new()
        v64.CollisionGroup = "Players"
        local v65 = {}
        local v66 = #v65
        local v67 = u41:GetDescendants()
        table.move(v67, 1, #v67, v66 + 1, v65)
        v64.FilterDescendantsInstances = v65
        v64.FilterType = Enum.RaycastFilterType.Exclude
        local v68 = u4:raycast((u37:GetPivot() * CFrame.new(0, 0, 3)).Position, Vector3.new(0, -10, 0), v64)
        if (u37:GetPivot().Position - u62).Magnitude > 0.05 then
            if v68 then
                local v69 = v68.Position
                local v70 = u41:GetExtentsSize().Y / 2
                local v71 = u39.heightOffset
                local v72 = v70 + (v71 == nil and 0 or v71)
                local v73 = Vector3.new(0, v72, 0)
                local v74 = CFrame.new(v69 + v73)
                local v75 = CFrame
                local v76 = select(2, CFrame.new(u41:GetPivot().Position, u37:GetPivot().Position):ToOrientation())
                local v77 = u39.rotationOffset
                local v78 = v75.Angles
                local v79 = 0
                local v80
                if v77 == 0 or (v77 ~= v77 or not v77) then
                    v80 = 0
                else
                    local v81 = u39.rotationOffset
                    v80 = math.rad(v81)
                end
                u61 = v74 * v78(v79, v76 + v80, 0)
            else
                local v82 = u37:GetPivot()
                local v83 = -u45.HipHeight - u41:GetExtentsSize().Y / 2
                local v84 = u39.heightOffset
                local v85 = v84 == nil and 0 or v84
                u61 = v82 * CFrame.new(0, v83 + v85, 3)
            end
        end
        u62 = u37:GetPivot().Position
        if (u41:GetPivot().Position - u47).Magnitude < 0.05 then
            if u49 then
                u49:Stop()
                u49 = nil
            end
            if not u48 then
                u48 = u3:playAnimation(u46, u17:getAssetId(u39.animations.idle), {
                    ["looped"] = true
                })
            end
        else
            if u48 then
                u48:Stop()
                u48 = nil
            end
            if u50 then
                u50:Stop()
                u50 = nil
            end
            if not u49 then
                u49 = u3:playAnimation(u46, u17:getAssetId(u39.animations.walk), {
                    ["looped"] = true
                })
            end
        end
        u47 = u41:GetPivot().Position
    end))
    v38:GiveTask(u34:setupPetPassiveAnims(u39, u46, u50, u48))
    v38:GiveTask(function() --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u35
        --]]
        local v86 = u34.playerMaidMap
        local v87 = u35
        local v88 = v86[v87] ~= nil
        v86[v87] = nil
        return v88
    end)
    u34.playerMaidMap[u35] = v38
    return v38
end
function u21.setupPetPassiveAnims(_, u89, u90, u91, u92) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u6
        [4] = u19
        [5] = u3
        [6] = u17
        [7] = u7
    --]]
    local v93 = u11.new()
    local u94 = time() + math.random(5, 15)
    local u95 = u89.animations.passiveActions
    if u95 then
        v93:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 241 ]]
            --[[
            Upvalues:
                [1] = u94
                [2] = u91
                [3] = u92
                [4] = u6
                [5] = u19
                [6] = u95
                [7] = u3
                [8] = u90
                [9] = u17
                [10] = u7
                [11] = u89
            --]]
            if u94 < time() then
                if u91 then
                    return nil
                end
                local v96
                if u92 then
                    v96 = u6.fromList(u19.OVERRIDE, u19.OVERLAY)
                else
                    v96 = u19.OVERLAY
                end
                local v97 = 0
                local v98 = {}
                for v99, v100 in u95 do
                    local _ = v99 - 1
                    if v100.type == v96 == true then
                        v97 = v97 + 1
                        v98[v97] = v100
                    end
                end
                local v101 = table.create(#v98)
                for v102, v103 in v98 do
                    local _ = v102 - 1
                    v101[v102] = v103.id
                end
                local v104 = 0
                local v105 = {}
                for v106, v107 in u95 do
                    local _ = v106 - 1
                    if v107.type == v96 == true then
                        v104 = v104 + 1
                        v105[v104] = v107
                    end
                end
                if #v105 == 0 then
                    return nil
                end
                local v108 = u6.fromList(unpack(v105))
                local v109 = u3:playAnimation(u90, u17:getAssetId(v108.id))
                local v110 = v108.sound
                if v110 ~= "" and v110 then
                    local v111 = u90.Parent
                    if v111 ~= nil then
                        v111 = v111.Parent
                    end
                    if v111 and v111.PrimaryPart then
                        u7:playSound(v108.sound, {
                            ["rollOffMaxDistance"] = 220,
                            ["position"] = v111.PrimaryPart.Position
                        })
                    end
                end
                if v109 ~= nil then
                    v109.Stopped:Once(function() --[[ Line: 311 ]]
                        --[[
                        Upvalues:
                            [1] = u92
                            [2] = u3
                            [3] = u90
                            [4] = u17
                            [5] = u89
                        --]]
                        if not u92 then
                            u92 = u3:playAnimation(u90, u17:getAssetId(u89.animations.idle), {
                                ["looped"] = true
                            })
                        end
                    end)
                end
                u94 = time() + math.random(5, 15)
            end
        end))
    end
    return v93
end
v9.CreateController(u21.new())
return nil