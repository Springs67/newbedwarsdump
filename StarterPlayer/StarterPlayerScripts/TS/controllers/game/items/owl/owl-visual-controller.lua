local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent, "owl-util").OwlUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "OwlVisualController"
    end,
    ["__index"] = u15
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
    --]]
    u15.constructor(p29)
    p29.Name = "OwlVisualController"
    p29.defaultSpeed = u18.OWL_DEFAULT_MOVEMENT_SPEED
    p29.animationMap = {}
end
function u26.KnitStart(u30) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u23
        [3] = u13
        [4] = u25
        [5] = u11
        [6] = u18
        [7] = u21
        [8] = u6
    --]]
    u15.KnitStart(u30)
    u23.Client:Get("OwlSummoned"):Connect(function(u31, p32, p33) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:createClientOwl(p32, u31, p33)
        task.delay(0.5, function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            u30:startMeditateAnimation(u31)
        end)
    end)
    u23.Client:Get("OwlDeattached"):Connect(function(p34) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:removeClientOwl(p34)
        u30:endMeditateAnimation(p34)
    end)
    u13.Heartbeat:Connect(function(p35) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
            [3] = u30
            [4] = u18
            [5] = u21
        --]]
        for v36, v37 in u25.userOwlMap do
            local v38 = u11:GetPlayerByUserId(v36)
            if v38 then
                local v39 = u25:getOwlTarget(v38)
                if v39 then
                    local v40 = v39.Character
                    if v40 ~= nil then
                        v40 = v40.PrimaryPart
                        if v40 ~= nil then
                            v40 = v40.Position
                        end
                    end
                    if v40 then
                        local v41 = v39.Character
                        if v41 ~= nil then
                            v41 = v41:FindFirstChild("LeftUpperArm")
                            if v41 ~= nil then
                                v41 = v41:FindFirstChild("LeftShoulderAttachment")
                            end
                        end
                        local v42 = v40 + Vector3.new(1, 3, 1)
                        local v43 = v37:GetAttribute("Interacting")
                        if v43 ~= 0 and (v43 == v43 and (v43 ~= "" and v43)) then
                            v42 = v41.WorldPosition + Vector3.new(0, 0.5, 0)
                        end
                        local v44 = v37.PrimaryPart
                        if v44 then
                            local v45
                            if v42 == nil then
                                v45 = v42
                            else
                                v45 = (v42 - v44.Position).Unit
                            end
                            if v45 ~= Vector3.new(nil, nil, nil) and (v45 and v42) then
                                local v46 = u30.defaultSpeed
                                local v47 = v38:GetAttribute("OwlAiming")
                                if v47 ~= 0 and (v47 == v47 and (v47 ~= "" and v47)) then
                                    v46 = u18.OWL_AIMING_MOVEMENT_SPEED
                                end
                                if v37:GetAttribute("Status") == u21.LIFTING then
                                    v46 = u18.OWL_LIFTING_MOVEMENT_SPEED
                                end
                                if (v37.PrimaryPart.Position - v42).Magnitude > 20 then
                                    v46 = u18.OWL_LIFTING_MOVEMENT_SPEED
                                end
                                local v48 = v44.Position + v45 * (v46 * p35)
                                local v49 = (v48 - v44.Position).Magnitude
                                if v49 == 0 then
                                    v49 = false
                                elseif v49 ~= v49 then
                                    v49 = false
                                end
                                if not v49 or (v48 - v44.Position).Magnitude > (v42 - v44.Position).Magnitude then
                                    v48 = v42
                                end
                                v44.Position = v48
                                local v50 = v39.Character
                                if v50 ~= nil then
                                    v50 = v50:GetPrimaryPartCFrame().LookVector.Unit
                                end
                                local v51 = v37:GetAttribute("Status")
                                local v52 = v37:GetAttribute("FirstPerson")
                                if (v51 == u21.DEFAULT or v51 == u21.LIFTING) and (v52 == 0 or (v52 ~= v52 or (v52 == "" or not v52))) then
                                    local v53 = v44.Position
                                    local v54 = v40 + Vector3.new(1, 3, 1)
                                    local v55 = v50 * 6
                                    v44.CFrame = CFrame.new(v53, v54 + v55)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    u6("Owl", function(p56) --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u21
        --]]
        task.wait(0.5)
        local v57 = u25:getClientOwlFromServerOwl(p56)
        if not v57 then
            return nil
        end
        local v58 = p56:GetAttribute("Status")
        if v58 == 0 or (v58 ~= v58 or (v58 == "" or not v58)) then
            p56:SetAttribute("Status", u21.DEFAULT)
            v57:SetAttribute("Status", u21.DEFAULT)
        end
    end)
end
function u26.createClientOwl(p59, p60, p61, p62) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u24
        [4] = u8
        [5] = u14
        [6] = u25
        [7] = u3
        [8] = u17
        [9] = u16
    --]]
    local v63 = p60.Character
    if v63 ~= nil then
        v63 = v63.PrimaryPart
    end
    if not (v63 and p61.Character) then
        return nil
    end
    local v64 = p59:getKitSkinData(p61.Character)
    local v65
    if v64 == nil then
        v65 = v64
    else
        v65 = v64.owlModel
    end
    local u66
    if v65 then
        u66 = v64.owlModel:Clone()
    else
        u66 = u12.Assets.Effects.OwlShooter:Clone()
    end
    u10:AddTag(u66, "FirstPersonHidden")
    u66.Name = "ClientOwl"
    local v67 = p59:getKitSkinData(p61.Character)
    local v68 = {}
    local v69
    if v67 == nil then
        v69 = v67
    else
        v69 = v67.owlFlySound
    end
    local v70
    if v69 == "" or not v69 then
        v70 = u24.OWL_FLY
    else
        v70 = v67.owlFlySound
    end
    v68.SoundId = v70
    v68.RollOffMinDistance = 20
    v68.RollOffMaxDistance = 40
    v68.Volume = 0.1
    v68.Playing = true
    v68.Parent = u66.PrimaryPart
    v68.Looped = true
    u8("Sound", v68)
    local v71 = v63.Position
    u66.PrimaryPart.Position = v71 + Vector3.new(1, 3, 1)
    local v72 = u8
    local v73 = {
        ["Name"] = "OwlForce"
    }
    local v74 = u14.Gravity * u66.PrimaryPart.AssemblyMass
    v73.Force = Vector3.new(0, v74, 0)
    v73.Parent = u66.PrimaryPart
    v72("BodyForce", v73)
    u25:setOwlClientModel(p61, u66)
    u25:setOwlTarget(p61, p60)
    u25:linkOwls(p62, u66)
    task.wait(0.45)
    u66.Parent = u14
    local v75 = u3:playAnimation(u66, u17:getAssetId(u16.OWL_INTERACTION))
    p59:playCuteOwlSound(u66, p61)
    u66:SetAttribute("Interacting", true)
    if v75 ~= nil then
        v75.Stopped:Connect(function() --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u66
                [3] = u17
                [4] = u16
            --]]
            u3:playAnimation(u66, u17:getAssetId(u16.OWL_FLY))
            u66:SetAttribute("Interacting", false)
        end)
    end
end
function u26.removeClientOwl(_, p76) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u13
    --]]
    local u77 = u25:getOwlClientModelByUser(p76)
    if not u77 then
        return nil
    end
    local v78 = 0
    local u79 = {}
    for v80, v81 in u77:GetDescendants() do
        local _ = v80 - 1
        if v81:IsA("MeshPart") == true then
            v78 = v78 + 1
            u79[v78] = v81
        end
    end
    u25:deattachOwl(p76)
    local u82 = 0
    for v83, v84 in u77:GetDescendants() do
        local _ = v83 - 1
        if v84:IsA("ParticleEmitter") then
            v84:Emit(30)
        end
    end
    local u85 = nil
    u85 = u13.Heartbeat:Connect(function(p86) --[[ Line: 264 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u77
            [3] = u85
            [4] = u79
        --]]
        u82 = u82 + p86
        if u82 >= 1 then
            local v87 = u77
            if v87 ~= nil then
                v87:Destroy()
            end
            u85:Disconnect()
            return nil
        end
        for v88, v89 in u79 do
            local _ = v88 - 1
            if v89:IsA("MeshPart") then
                v89.Transparency = u82
            end
        end
    end)
end
function u26.startMeditateAnimation(p90, p91) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u3
        [3] = u17
        [4] = u16
        [5] = u22
        [6] = u12
    --]]
    if not u19:getEntity(p91) then
        return nil
    end
    local v92 = u3:playAnimation(p91, u17:getAssetId(u16.ZEN_HOVER), {
        ["looped"] = true
    })
    if v92 then
        p90.animationMap[p91] = v92
    end
    local v93 = u22.getInventory(p91).hand
    if v93 ~= nil then
        v93 = v93.itemType
    end
    if v93 then
        local v94 = p91.Character
        if v94 ~= nil then
            local v95 = v94:WaitForChild(v93, 3)
            if v95 ~= nil then
                v95:Destroy()
            end
        end
    end
    local v96 = u12.Assets.Effects.MeditateAura:Clone()
    local v97 = p91.Character
    if v97 ~= nil then
        v97 = v97.PrimaryPart
        if v97 ~= nil then
            v97 = v97.Position + Vector3.new(0, -2, 0)
        end
    end
    if v97 then
        v96.PrimaryPart.Position = v97
        v96.Parent = p91.Character
    end
end
function u26.endMeditateAnimation(p98, p99) --[[ Line: 327 ]]
    local v100 = p98.animationMap[p99]
    if v100 then
        v100:Stop()
        v100:Destroy()
    end
    local v101 = p99.Character
    if v101 ~= nil then
        v101 = v101:WaitForChild("MeditateAura")
    end
    if v101 ~= nil then
        v101:Destroy()
    end
end
function u26.playCuteOwlSound(_, p102, p103) --[[ Line: 345 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u25
        [3] = u5
    --]]
    local v104 = u25
    local v105 = u4.fromList(unpack(v104:getOwlCuteSound(p103)))
    local v106 = u5
    local v107 = {}
    local v108 = p102.PrimaryPart
    if v108 ~= nil then
        v108 = v108.Position
    end
    v107.position = v108
    v107.rollOffMaxDistance = 220
    v106:playSound(v105, v107)
end
function u26.getKitSkinData(_, p109) --[[ Line: 358 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u20
    --]]
    local v110 = u20[u7.Controllers.KitSkinController:getKitSkin(p109)]
    if v110.owl then
        return v110.owl
    end
end
u7.CreateController(u26.new())
return nil