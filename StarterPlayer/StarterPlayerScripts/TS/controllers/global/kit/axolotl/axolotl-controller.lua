local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.TweenService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-kit").AxolotlKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-state").AxolotlState
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "AxolotlController"
    end,
    ["__index"] = u15
})
u25.__index = u25
function u25.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u14
    --]]
    u15.constructor(p28)
    p28.Name = "AxolotlController"
    p28.axolotlModelFolder = u8("Folder", {
        ["Name"] = "AxolotlModel",
        ["Parent"] = u14
    })
end
function u25.KnitStart(u29) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u24
        [3] = u14
        [4] = u8
        [5] = u3
    --]]
    u15.KnitStart(u29)
    if u24.isGameServer() then
        u29.axolotlDataFolder = u14:WaitForChild("AxolotlData")
    else
        u29.axolotlDataFolder = u8("Folder", {
            ["Name"] = "AxolotlData",
            ["Parent"] = u14
        })
    end
    u3("axolotl_data", function(p30) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:createAxolotlModel(p30)
    end)
    u3("axolotl_model", function(_) --[[ Line: 66 ]] end)
end
function u25.createAxolotlModel(u31, u32) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u18
        [3] = u11
        [4] = u22
        [5] = u19
        [6] = u8
        [7] = u10
        [8] = u16
        [9] = u17
        [10] = u21
        [11] = u13
        [12] = u23
        [13] = u5
        [14] = u4
        [15] = u12
        [16] = u20
    --]]
    u32:WaitForChild("AttachedTo")
    u32:WaitForChild("AxolotlModel")
    u32:WaitForChild("Owner")
    local v33 = u32.AxolotlModel.Value
    if v33 and v33.Parent then
        return v33
    end
    local u34 = u32:GetAttribute("AxolotlSkin")
    if u32.Parent == nil then
        return nil
    end
    u32:GetAttribute("RandomFloat")
    local u35 = u32:GetAttribute("AxolotlType")
    local u36 = u7.new()
    u32.AncestryChanged:Connect(function(_, p37) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        if p37 == nil then
            u36:DoCleaning()
        end
    end)
    local u38
    if u34 == u18.AXOLOTL_REINDEER then
        u38 = u11.Assets.Misc.Axolotl.ReindeerAxolotl:Clone()
    elseif u34 == u18.AXOLOTL_EASTER_BUNNY then
        if u35 == u22.BREAK_SPEED then
            u38 = u11.Assets.Misc.AxolotlEaster.BreakSpeedAxolotl:Clone()
        elseif u35 == u22.DAMAGE then
            u38 = u11.Assets.Misc.AxolotlEaster.DamageAxolotl:Clone()
        elseif u35 == u22.HEALTH_REGEN then
            u38 = u11.Assets.Misc.AxolotlEaster.HealthRegenAxolotl:Clone()
        else
            local _ = u35 == u22.SHIELD
            u38 = u11.Assets.Misc.AxolotlEaster.ShieldAxolotl:Clone()
        end
    elseif u34 and u19[u34].amy then
        local v39 = u19[u34].amy
        if u35 == u22.BREAK_SPEED then
            u38 = v39.breakAxolotl:Clone()
            if v39.applyVariantAxolotlTextures then
                u38.gills_mesh.TextureID = "rbxassetid://7773885647"
                u38.torso_mesh.TextureID = "rbxassetid://7773885647"
                u38.mouth_mesh.TextureID = "rbxassetid://7773885647"
                u38.legs_mesh.TextureID = "rbxassetid://7773885647"
                u38.eye_lids_mesh.Color = Color3.fromRGB(124, 124, 124)
            end
        elseif u35 == u22.DAMAGE then
            u38 = v39.damageAxolotl:Clone()
            if v39.applyVariantAxolotlTextures then
                u38.gills_mesh.TextureID = "rbxassetid://7773885833"
                u38.torso_mesh.TextureID = "rbxassetid://7773885833"
                u38.mouth_mesh.TextureID = "rbxassetid://7773885833"
                u38.legs_mesh.TextureID = "rbxassetid://7773885833"
                u38.eye_lids_mesh.Color = Color3.fromRGB(255, 95, 55)
            end
        elseif u35 == u22.HEALTH_REGEN then
            u38 = v39.healthRegenAxolotl:Clone()
            if v39.applyVariantAxolotlTextures then
                u38.gills_mesh.TextureID = "rbxassetid://7774076826"
                u38.torso_mesh.TextureID = "rbxassetid://7774076826"
                u38.mouth_mesh.TextureID = "rbxassetid://7774076826"
                u38.legs_mesh.TextureID = "rbxassetid://7774076826"
                u38.eye_lids_mesh.Color = Color3.fromRGB(255, 57, 202)
            end
        elseif u35 == u22.SHIELD then
            u38 = v39.shieldAxolotl:Clone()
            if v39.applyVariantAxolotlTextures then
                u38.gills_mesh.TextureID = "rbxassetid://7773886109"
                u38.torso_mesh.TextureID = "rbxassetid://7773886109"
                u38.mouth_mesh.TextureID = "rbxassetid://7773886109"
                u38.legs_mesh.TextureID = "rbxassetid://7773886109"
                u38.eye_lids_mesh.Color = Color3.fromRGB(58, 101, 255)
            end
        else
            u38 = v39.shieldAxolotl:Clone()
            if v39.applyVariantAxolotlTextures then
                u38.gills_mesh.TextureID = "rbxassetid://7773886109"
                u38.torso_mesh.TextureID = "rbxassetid://7773886109"
                u38.mouth_mesh.TextureID = "rbxassetid://7773886109"
                u38.legs_mesh.TextureID = "rbxassetid://7773886109"
                u38.eye_lids_mesh.Color = Color3.fromRGB(58, 101, 255)
            end
        end
    elseif u35 == u22.BREAK_SPEED then
        u38 = u11.Assets.Misc.Axolotl.BreakSpeedAxolotl:Clone()
    elseif u35 == u22.DAMAGE then
        u38 = u11.Assets.Misc.Axolotl.DamageAxolotl:Clone()
    elseif u35 == u22.HEALTH_REGEN then
        u38 = u11.Assets.Misc.Axolotl.HealthRegenAxolotl:Clone()
    else
        local _ = u35 == u22.SHIELD
        u38 = u11.Assets.Misc.Axolotl.ShieldAxolotl:Clone()
    end
    for v40, v41 in u38:GetDescendants() do
        local _ = v40 - 1
        if v41:IsA("BasePart") then
            v41.CastShadow = false
        end
    end
    u8("ObjectValue", {
        ["Name"] = "AxolotlData",
        ["Value"] = u32,
        ["Parent"] = u38
    })
    u32.AxolotlModel.Value = u38
    u38.Parent = u31.axolotlModelFolder
    u10:AddTag(u38, "axolotl_model")
    u36:GiveTask(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u38
        --]]
        if u32.Parent and u32.AxolotlModel.Value == u38 then
            u32.AxolotlModel.Value = nil
        end
        u38:Destroy()
    end)
    u36:GiveTask(u38.AncestryChanged:Connect(function(_, p42) --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u31
        --]]
        if p42 == nil and u32.Parent then
            task.defer(function() --[[ Line: 215 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u32
                --]]
                return u31:createAxolotlModel(u32)
            end)
        end
    end))
    local v43 = u38.AnimationController.Animator
    u36:GiveTask(function() --[[ Line: 221 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:Destroy()
    end)
    for v44, v45 in u38:GetDescendants() do
        local _ = v44 - 1
        if v45:IsA("BasePart") then
            u36:GiveTask(v45.AncestryChanged:Connect(function(_, p46) --[[ Line: 227 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                if p46 == nil then
                    u36:DoCleaning()
                end
            end))
        end
    end
    local v47 = u16.AXOLOTL_IDLE
    local v48 = u16.AXOLOTL_SWIM
    local v49 = u16.AXOLOTL_ABILITY
    if u34 == u18.AXOLOTL_REINDEER then
        v47 = u16.AXOLOTL_REINDEER_IDLE
        v48 = u16.AXOLOTL_REINDEER_SWIM
        v49 = u16.AXOLOTL_REINDEER_ABILITY
    elseif u34 == u18.AXOLOTL_EASTER_BUNNY then
        v47 = u16.AXOLOTL_EASTER_IDLE
        v48 = u16.AXOLOTL_EASTER_SWIM
        v49 = u16.AXOLOTL_EASTER_ABILITY
    end
    local u50 = nil
    local u51 = nil
    local u52
    if v47 then
        u52 = v43:LoadAnimation(u17:getAnimation(v47))
        u52.Priority = Enum.AnimationPriority.Movement
    else
        u52 = nil
    end
    if v48 then
        u50 = v43:LoadAnimation(u17:getAnimation(v48))
        u50.Priority = Enum.AnimationPriority.Movement
        u50:AdjustSpeed(2)
    end
    if v49 then
        u51 = v43:LoadAnimation(u17:getAnimation(v49))
        u51.Priority = Enum.AnimationPriority.Action
    end
    local u53 = 0
    local u54 = u38.PrimaryPart
    if u54 ~= nil then
        u54 = u54.CFrame
    end
    if u54 == nil then
        u54 = CFrame.new()
    end
    local u55 = 0
    local u56 = u34 == u18.AXOLOTL_EASTER_BUNNY and "egg" or "torso.001"
    local u57 = u32:GetAttribute("AxolotlState")
    local u58 = u7.new()
    local function u82(p59) --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u57
            [3] = u38
            [4] = u54
            [5] = u58
            [6] = u21
            [7] = u52
            [8] = u50
            [9] = u51
            [10] = u32
            [11] = u13
            [12] = u56
            [13] = u8
            [14] = u35
            [15] = u22
            [16] = u23
            [17] = u34
            [18] = u19
            [19] = u55
            [20] = u5
        --]]
        u53 = tick()
        u57 = p59
        local v60 = u38.PrimaryPart
        if v60 ~= nil then
            v60 = v60.CFrame
        end
        if v60 == nil then
            v60 = CFrame.new()
        end
        u54 = v60
        u58:DoCleaning()
        if p59 == u21.IDLE then
            if u52 then
                u52:Play()
                u52.TimePosition = math.random() * 5
                u58:GiveTask(function() --[[ Line: 300 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                    --]]
                    local v61 = u52
                    if v61 ~= nil then
                        v61:Stop()
                    end
                end)
            end
        elseif p59 == u21.SWIMMING_TO_ATTACHED then
            local v62 = u50
            if v62 ~= nil then
                v62:Play()
            end
            u58:GiveTask(function() --[[ Line: 312 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                local v63 = u50
                if v63 ~= nil then
                    v63:Stop()
                end
            end)
        elseif p59 == u21.ACTIVE then
            local v64 = u51
            if v64 ~= nil then
                v64:Play()
            end
            local v65 = u52
            if v65 ~= nil then
                v65:Play()
            end
            if u32.AttachedTo.Value then
                local v66 = u32.AttachedTo.Value
                u38.Beam.Attachment1 = v66.UpperTorso.BodyFrontAttachment
                u38.Beam.Enabled = true
                local u67 = true
                u58:GiveTask(function() --[[ Line: 332 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u38
                    --]]
                    u67 = false
                    u38.Beam.Enabled = false
                end)
                task.spawn(function() --[[ Line: 336 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u13
                        [3] = u38
                    --]]
                    local v68 = 1
                    while u67 do
                        local v69 = 0.4 + 0.2 * math.random()
                        local v70 = u13:Create(u38.Beam, TweenInfo.new(v69), {
                            ["CurveSize0"] = v68 * -0.3,
                            ["CurveSize1"] = v68 * 0.3
                        })
                        v70:Play()
                        v70.Completed:Wait()
                        v68 = v68 * -1
                    end
                end)
            end
            u58:GiveTask(function() --[[ Line: 350 ]]
                --[[
                Upvalues:
                    [1] = u52
                --]]
                local v71 = u52
                if v71 ~= nil then
                    v71:Stop()
                end
            end)
            local v72 = nil
            for v73, v74 in u38:GetDescendants() do
                local _ = v73 - 1
                if v74.Name == u56 == true then
                    v72 = v74
                    break
                end
            end
            local v75 = u8("BillboardGui", {
                ["LightInfluence"] = 0,
                ["MaxDistance"] = 60,
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.2, 0),
                ["Parent"] = u38.PrimaryPart,
                ["Adornee"] = v72,
                ["Size"] = UDim2.fromScale(5, 0.55)
            })
            local v76 = u35 == u22.DAMAGE and "Damage!" or (u35 == u22.BREAK_SPEED and "Break Speed!" or (u35 == u22.HEALTH_REGEN and "Health Regen!" or "Shield!"))
            local u77 = u8("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Parent"] = v75,
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.LuckiestGuy,
                ["Text"] = v76
            })
            task.spawn(function() --[[ Line: 397 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u77
                --]]
                task.wait(1.1)
                u13:Create(u77, TweenInfo.new(1), {
                    ["TextTransparency"] = 1
                }):Play()
            end)
        end
        local v78 = u23.AXOLOTL_SWITCH_TARGETS
        if u34 and u19[u34].amy then
            v78 = u19[u34].amy.buffSound
        end
        if (p59 == u21.SWIMMING_TO_ATTACHED or p59 == u21.ACTIVE) and tick() - u55 > 1 then
            u55 = tick()
            local v79 = u5
            local v80 = {}
            local v81 = u38.PrimaryPart
            if v81 ~= nil then
                v81 = v81.Position
            end
            if v81 == nil then
                v81 = Vector3.new()
            end
            v80.position = v81
            v80.parent = u38.PrimaryPart
            v79:playSound(v78, v80)
        end
    end
    u36:GiveTask(u32:GetAttributeChangedSignal("AxolotlState"):Connect(function() --[[ Line: 429 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u32
        --]]
        u82(u32:GetAttribute("AxolotlState"))
    end))
    u82(u32:GetAttribute("AxolotlState"))
    local u83 = u32.AttachedTo.Value
    u32.AttachedTo.Changed:Connect(function() --[[ Line: 435 ]]
        --[[
        Upvalues:
            [1] = u83
            [2] = u32
        --]]
        u83 = u32.AttachedTo.Value
    end)
    local u84 = u8("Part", {
        ["Size"] = Vector3.new(0, 0, 0),
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Parent"] = u38,
        ["Children"] = { u8("Attachment", {
                ["Name"] = "Attachment"
            }) }
    })
    u38:WaitForChild("Beam")
    u38.Beam.Attachment0 = u84:FindFirstChild("Attachment")
    u4:setQueryIgnored(u84, true)
    local u85 = u57
    local u86 = u83
    local v87 = u56
    local u88 = nil
    for v89, v90 in u38:GetDescendants() do
        local _ = v89 - 1
        if v90.Name == v87 == true then
            u88 = v90
            break
        end
    end
    u36:GiveTask(u12.RenderStepped:Connect(function(_) --[[ Line: 466 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u38
            [3] = u31
            [4] = u35
            [5] = u53
            [6] = u85
            [7] = u21
            [8] = u54
            [9] = u20
            [10] = u88
            [11] = u84
        --]]
        local v91 = u86
        if v91 ~= nil then
            v91 = v91.PrimaryPart
        end
        if v91 then
            v91 = u38.PrimaryPart
        end
        if v91 then
            local v92 = u31:getAngleFromAxolotlType(u35) + tick() % 6 / 6 * -6.283185307179586
            local v93 = math.cos(v92) * 3.5
            local v94 = math.sin(v92) * 3.5
            local v95 = Vector3.new(v93, 0.1, v94)
            local v96 = u86.PrimaryPart.CFrame + v95
            local v97 = tick() - u53
            if u85 == u21.IDLE then
                local v98 = u54
                local v99 = v97 / 0.3
                u38:PivotTo((v98:Lerp(v96, (math.clamp(v99, 0, 1)))))
            elseif u85 == u21.SWIMMING_TO_ATTACHED then
                local v100 = u54
                local v101 = v97 / u20.SWIM_TO_CHARACTER_TIME
                local v102 = v100:Lerp(v96, (math.clamp(v101, 0, 1)))
                if (v102.Position - v96.Position).Magnitude > 0.01 then
                    v102 = CFrame.new(v102.Position, v96.Position)
                end
                u38:PivotTo(v102)
            elseif u85 == u21.ACTIVE then
                local v103 = v96 + Vector3.new(0, 1.8, 0)
                local v104 = u54
                local v105 = v97 / 0.3
                u38:PivotTo((v104:Lerp(v103, (math.clamp(v105, 0, 1)))))
            end
            u84.CFrame = u88.TransformedWorldCFrame
        end
    end))
    return u38
end
function u25.getAngleFromAxolotlType(_, p106) --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    return p106 == u22.SHIELD and 0 or (p106 == u22.DAMAGE and 1.5707963267948966 or (p106 == u22.BREAK_SPEED and 3.141592653589793 or (p106 == u22.HEALTH_REGEN and 4.71238898038469 or 0)))
end
function u25.createClientOnlyAxolotlData(p107, p108, p109) --[[ Line: 530 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u21
        [3] = u10
    --]]
    local v110 = u8
    local v111 = {
        ["Name"] = p108.Name .. "_Axolotl",
        ["Parent"] = p107.axolotlDataFolder,
        ["Children"] = { u8("ObjectValue", {
                ["Name"] = "AxolotlModel"
            }), u8("ObjectValue", {
                ["Name"] = "Owner",
                ["Value"] = p108
            }), u8("ObjectValue", {
                ["Name"] = "AttachedTo",
                ["Value"] = p108
            }) }
    }
    local v112 = v110("ObjectValue", v111)
    v112:SetAttribute("AxolotlState", u21.IDLE)
    v112:SetAttribute("RandomFloat", math.random())
    v112:SetAttribute("AxolotlType", p109)
    v112:SetAttribute("AxolotlLastActiveTime", 0)
    u10:AddTag(v112, "axolotl_data")
    return v112
end
function u25.getAttachedAxolotls(_, p113) --[[ Line: 552 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v114 = 0
    local v115 = {}
    for v116, v117 in u10:GetTagged("axolotl_data") do
        local _ = v116 - 1
        if v117.AttachedTo.Value == p113 == true then
            v114 = v114 + 1
            v115[v114] = v117
        end
    end
    return v115
end
function u25.getOwnedAxolotls(_, p118) --[[ Line: 569 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v119 = 0
    local v120 = {}
    for v121, v122 in u10:GetTagged("axolotl_data") do
        local _ = v121 - 1
        if v122.Owner.Value == p118 == true then
            v119 = v119 + 1
            v120[v119] = v122
        end
    end
    return v120
end
v6.CreateController(u25.new())
return nil