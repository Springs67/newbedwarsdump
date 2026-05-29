local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.TweenService
local u15 = v10.Workspace
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v3.registerConstants(script, {
    ["C0"] = -5,
    ["C1"] = 0,
    ["YAngleRod"] = 1.0471975511965976,
    ["YAngleBobber"] = 1.0471975511965976
})
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "FishingRodEffectsController"
    end,
    ["__index"] = u17
})
u24.__index = u24
function u24.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p27)
    p27.Name = "FishingRodEffectsController"
end
function u24.KnitStart(p28) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u21
        [3] = u12
        [4] = u15
        [5] = u4
        [6] = u14
        [7] = u5
        [8] = u22
        [9] = u11
        [10] = u20
        [11] = u1
        [12] = u8
        [13] = u16
        [14] = u18
        [15] = u19
        [16] = u9
        [17] = u23
        [18] = u13
    --]]
    u17.KnitStart(p28)
    u21.Client:WaitFor("FishCaught"):andThen(function(p29) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u15
            [3] = u4
            [4] = u14
            [5] = u5
            [6] = u22
            [7] = u11
            [8] = u20
            [9] = u1
            [10] = u8
        --]]
        p29:Connect(function(u30) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u15
                [3] = u4
                [4] = u14
                [5] = u5
                [6] = u22
                [7] = u11
                [8] = u20
                [9] = u1
                [10] = u8
            --]]
            local v31 = u30.catchingPlayer.Character
            if v31 ~= nil then
                v31 = v31.PrimaryPart
                if v31 ~= nil then
                    v31 = v31.Position
                end
            end
            if not v31 then
                return nil
            end
            local v32 = u12.Assets.Misc.Fisherman[u30.dropData.fishModel]:Clone()
            local v33 = v32.Size
            local v34 = u30.dropData.fishSizeMultiplier
            v32.Size = v33 * (v34 == nil and 1 or v34)
            v32.Parent = u15
            u4:setQueryIgnored(v32, true)
            v32.Position = u30.catchPosition
            local v35 = u14
            local v36 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
            local v37 = {}
            local v38 = u30.catchingPlayer.Character
            if v38 ~= nil then
                v38 = v38.PrimaryPart
                if v38 ~= nil then
                    v38 = v38.Position
                end
            end
            if v38 ~= nil then
                v31 = v38
            end
            v37.Position = v31 + Vector3.new(0, 6, 0)
            local v39 = v35:Create(v32, v36, v37)
            v39:Play()
            v39.Completed:Wait()
            task.wait(0.25)
            local u40 = v32.Position
            v32:Destroy()
            if not u15.CurrentCamera or (u15.CurrentCamera.CFrame - u40).Position.Magnitude > 180 then
                return nil
            end
            local v41 = u5
            local v42 = u22.CONFETTI
            local v43 = {}
            local v44
            if u30.catchingPlayer == u11.LocalPlayer then
                v44 = nil
            else
                v44 = u30.catchingPlayer.Character
                if v44 ~= nil then
                    v44 = v44.PrimaryPart
                    if v44 ~= nil then
                        v44 = v44.Position
                    end
                end
            end
            v43.position = v44
            v43.volumeMultiplier = 0.8
            v41:playSound(v42, v43)
            local u45 = 0
            for _, v46 in u30.dropData.drops do
                local v47 = v46.amount
                local v48 = math.min(8, v47)
                if v46.amount > 8 then
                    local v49 = v46.amount - 8 + 1
                    v48 = v48 + math.log(v49, 2)
                end
                local v50 = u12:WaitForChild("Items"):WaitForChild(v46.itemType)
                local u51 = u20.cloneItemIntoModel(v50)
                local v52 = false
                local v53 = 0
                while true do
                    if true then
                        if v52 then
                            v53 = v53 + 1
                        else
                            v52 = true
                        end
                    end
                    if v53 >= math.ceil(v48) then
                        break
                    end
                    task.spawn(function() --[[ Line: 142 ]]
                        --[[
                        Upvalues:
                            [1] = u1
                            [2] = u8
                            [3] = u51
                            [4] = u40
                            [5] = u30
                            [6] = u5
                            [7] = u22
                            [8] = u11
                            [9] = u45
                        --]]
                        u1.Promise.delay(math.random() * 0.2):await()
                        u8.Controllers.ReceiveItemEffectController:playEffect(u51, u40, function() --[[ Line: 144 ]]
                            --[[
                            Upvalues:
                                [1] = u30
                            --]]
                            local v54 = u30.catchingPlayer.Character
                            if v54 ~= nil then
                                v54 = v54.PrimaryPart
                                if v54 ~= nil then
                                    v54 = v54.CFrame
                                end
                            end
                            return v54
                        end, 0.5 + math.random() * 0.2):andThen(function(p55) --[[ Line: 154 ]]
                            --[[
                            Upvalues:
                                [1] = u5
                                [2] = u22
                                [3] = u30
                                [4] = u11
                                [5] = u45
                            --]]
                            if p55 then
                                local v56 = u5
                                local v57 = u22.PICKUP_ITEM_DROP
                                local v58 = {}
                                local v59
                                if u30.catchingPlayer == u11.LocalPlayer then
                                    v59 = nil
                                else
                                    v59 = u30.catchingPlayer.Character
                                    if v59 ~= nil then
                                        v59 = v59.PrimaryPart
                                        if v59 ~= nil then
                                            v59 = v59.Position
                                        end
                                    end
                                end
                                v58.position = v59
                                v58.volumeMultiplier = 0.8
                                local v60 = u45
                                u45 = u45 + 1
                                v58.playbackSpeedMultiplier = v60 / 50 + 1
                                v56:playSound(v57, v58)
                            end
                        end)
                    end)
                end
            end
        end)
    end)
    u16.ProjectileLaunched:connect(function(p61) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u18
            [3] = u19
            [4] = u9
            [5] = u23
            [6] = u13
            [7] = u1
        --]]
        if p61.projectileType ~= "fisherman_bobber" then
            return nil
        end
        local v62 = p61.projectile:GetAttribute("ProjectileShooter")
        if v62 == 0 or (v62 ~= v62 or not v62) then
            return nil
        end
        local v63 = u11:GetPlayerByUserId(v62)
        if not v63 then
            return nil
        end
        local v64 = u18:getEntity(v63)
        if not v64 then
            return nil
        end
        local u65 = v64:getHandItemInstanceFromCharacter()
        if not u65 or u65.Name ~= u19.FISHING_ROD then
            return nil
        end
        local u66 = p61.projectile
        local u67 = u9("Beam", {
            ["Width0"] = 0.06,
            ["Width1"] = 0.06,
            ["LightEmission"] = 0.95,
            ["LightInfluence"] = 0.95,
            ["FaceCamera"] = true,
            ["Segments"] = 100,
            ["Parent"] = p61.projectile,
            ["Attachment0"] = u66.Handle.LineAttachment,
            ["Attachment1"] = u65.Handle.LineAttachment,
            ["CurveSize0"] = u23.C0,
            ["CurveSize1"] = u23.C1,
            ["Transparency"] = NumberSequence.new(0),
            ["Color"] = ColorSequence.new(Color3.fromRGB(120, 120, 120))
        })
        local u68 = nil
        u68 = u13.Heartbeat:Connect(function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u66
                [3] = u68
                [4] = u67
                [5] = u23
            --]]
            if not (u65.Parent and u66.Parent) then
                u68:Disconnect()
                return nil
            end
            local v69 = math
            local v70 = (u65.Handle.LineAttachment.WorldPosition - u66.Handle.LineAttachment.WorldPosition).Magnitude / 15
            local v71 = v69.min(1, v70)
            u67.CurveSize0 = u23.C0 * v71
            u67.CurveSize1 = u23.C1 * v71
            local v72 = CFrame.new(u65.Handle.LineAttachment.WorldCFrame.Position, u66.Handle.LineAttachment.WorldPosition)
            local v73 = CFrame.Angles(0, u23.YAngleRod, 1.5707963267948966)
            u65.Handle.LineAttachment.WorldCFrame = v72 * v73
            local v74 = CFrame.new(u66.Handle.LineAttachment.WorldCFrame.Position, u65.Handle.LineAttachment.WorldPosition)
            local v75 = CFrame.Angles(0, u23.YAngleBobber, 1.5707963267948966)
            u66.Handle.LineAttachment.WorldCFrame = v74 * v75
        end)
        task.spawn(function() --[[ Line: 246 ]]
            --[[
            Upvalues:
                [1] = u66
                [2] = u1
                [3] = u13
            --]]
            if not u66:GetAttribute("WaitingForFish") then
                u66:GetAttributeChangedSignal("WaitingForFish"):Wait()
            end
            u1.Promise.delay(0.5):await()
            local v76 = u66
            if v76 ~= nil then
                v76 = v76.PrimaryPart
                if v76 ~= nil then
                    v76 = v76.Parent
                end
            end
            if v76 == nil then
                return nil
            end
            local u77 = os.clock()
            local u78 = u66:GetPrimaryPartCFrame().Position
            local u79 = u66:GetPrimaryPartCFrame() - u78
            local u80 = nil
            u80 = u13.Heartbeat:Connect(function() --[[ Line: 265 ]]
                --[[
                Upvalues:
                    [1] = u66
                    [2] = u80
                    [3] = u77
                    [4] = u78
                    [5] = u79
                --]]
                if not u66.Parent then
                    u80:Disconnect()
                    return nil
                end
                local v81 = (os.clock() - u77) * 3.141592653589793
                local v82 = math.sin(v81) * 0.5
                local v83 = u78 + Vector3.new(0, v82, 0)
                u66:PivotTo(CFrame.new(v83) * u79)
            end)
        end)
    end)
end
v7.CreateController(u24.new())
return nil