local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCharacter
local u7 = v2.WatchCollectionTag
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.RunService
local u16 = v11.TweenService
local u17 = v11.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-state").SheepState
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "SheepController"
    end,
    ["__index"] = u23
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u20
        [3] = u10
        [4] = u17
    --]]
    u23.constructor(p27, u20.SHEEP_HERDER)
    p27.Name = "SheepController"
    p27.sheepModelFolder = u10("Folder", {
        ["Name"] = "SheepModel",
        ["Parent"] = u17
    })
    p27.untamedSheep = {}
    p27.highlightedSheep = {}
end
function u24.KnitStart(p28) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.KnitStart(p28)
end
function u24.onKitLocalActivated(_, _) --[[ Line: 52 ]] end
function u24.onKitLocalDeactivated(_) --[[ Line: 54 ]] end
function u24.onKitReplicationActivated(u29, _) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7("SheepData", function(p30) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:createSheepModel(p30)
    end)
end
function u24.onKitReplicationDeactivated(_) --[[ Line: 61 ]] end
function u24.onInnateAbilityEnabled(_, _, _) --[[ Line: 63 ]] end
function u24.onAbilityUsed(_, _, _) --[[ Line: 65 ]] end
function u24.createSheepModel(u31, u32) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u3
        [3] = u16
        [4] = u10
        [5] = u12
        [6] = u9
        [7] = u21
        [8] = u13
    --]]
    u32:WaitForChild("SheepModel")
    u32:WaitForChild("Owner")
    if u32.Parent == nil then
        return nil
    end
    local u33 = u14.Assets.Misc.Sheep.Sheep1:Clone()
    u33.PrimaryPart.Anchored = true
    for _, v34 in u33:GetDescendants() do
        if v34:IsA("BasePart") then
            v34.CanCollide = false
            u3:setQueryIgnored(v34, true)
            if v34.Transparency == 0 then
                u16:Create(v34, TweenInfo.new(0.3), {
                    ["Transparency"] = 0
                })
            end
        end
    end
    u32.SheepModel.Value = u33
    u10("ObjectValue", {
        ["Name"] = "SheepData",
        ["Value"] = u32,
        ["Parent"] = u33
    })
    u33.Parent = u31.sheepModelFolder
    u12:AddTag(u33, "SheepModel")
    local u35 = u9.new()
    u32.AncestryChanged:Connect(function(_, p36) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        if p36 == nil then
            u35:DoCleaning()
        end
    end)
    u35:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Destroy()
    end)
    local u37 = u9.new()
    local u38 = u32:GetAttribute("SheepState")
    u32:GetAttributeChangedSignal("SheepState"):Connect(function(_) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u37
            [3] = u21
            [4] = u31
            [5] = u33
            [6] = u38
        --]]
        local v39 = u32:GetAttribute("SheepState")
        u37:DoCleaning()
        if v39 == u21.IDLE then
            u37 = u31:idleSheep(u32, u33)
        elseif v39 == u21.TAMED then
            u37 = u31:tameSheep(u32, u33, u38 ~= u21.TAMED)
        end
    end)
    local v40 = u32:GetAttribute("SheepState")
    u37:DoCleaning()
    if v40 == u21.IDLE then
        u37 = u31:idleSheep(u32, u33)
    elseif v40 == u21.TAMED then
        u37 = u31:tameSheep(u32, u33, u38 ~= u21.TAMED)
    end
    if u32:GetAttribute("SheepOwnerUserId") == u13.LocalPlayer.UserId then
        u31.untamedSheep[u32] = true
        u31:highlightRandomUntamedSheeps()
    end
    return u33
end
function u24.highlightRandomUntamedSheeps(u41) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u4
        [3] = u21
        [4] = u10
    --]]
    if u41.thread then
        task.cancel(u41.thread)
        u41.thread = nil
    end
    u41.thread = task.delay(20, function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u24
            [3] = u4
            [4] = u21
            [5] = u10
        --]]
        local v42 = 0
        while true do
            local v43 = 0
            for _ in u41.highlightedSheep do
                v43 = v43 + 1
            end
            local v44 = v43 < u24.MAX_HIGHLIGHTED_SHEEP
            if v44 then
                local v45 = 0
                for _ in u41.untamedSheep do
                    v45 = v45 + 1
                end
                v44 = v45 > 0
                if v44 then
                    if v42 < 2 then
                        v44 = true
                    else
                        v44 = false
                    end
                end
            end
            if not v44 then
                u41.thread = nil
                return
            end
            v42 = v42 + 1
            local v46 = u4
            local v47 = 0
            local v48 = {}
            for v49 in u41.untamedSheep do
                v47 = v47 + 1
                v48[v47] = v49
            end
            local u50 = v46.fromList(unpack(v48))
            u41.untamedSheep[u50] = nil
            local v51 = u50.SheepModel.Value
            if v51 and u50:GetAttribute("SheepState") ~= u21.TAMED then
                u41.highlightedSheep[u50] = true
                local u52 = u10("Highlight", {
                    ["Name"] = "SheepHighlight",
                    ["FillTransparency"] = 1,
                    ["OutlineTransparency"] = 0,
                    ["Parent"] = v51,
                    ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
                    ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
                })
                u50:GetAttributeChangedSignal("SheepState"):Connect(function() --[[ Line: 186 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                        [2] = u21
                        [3] = u41
                        [4] = u52
                    --]]
                    if u50:GetAttribute("SheepState") == u21.TAMED then
                        u41.highlightedSheep[u50] = nil
                        u52:Destroy()
                        u41:highlightRandomUntamedSheeps()
                    end
                end)
                u50.AncestryChanged:Connect(function(_, p53) --[[ Line: 192 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u50
                        [3] = u52
                    --]]
                    if p53 == nil then
                        u41.highlightedSheep[u50] = nil
                        u52:Destroy()
                        u41:highlightRandomUntamedSheeps()
                    end
                end)
            end
        end
    end)
end
function u24.idleSheep(_, p54, u55) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u8
        [4] = u19
        [5] = u18
    --]]
    local u56 = true
    local u57 = u9.new()
    u57:GiveTask(function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56 = false
    end)
    p54.AncestryChanged:Connect(function(_, p58) --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        if p58 == nil then
            u57:DoCleaning()
        end
    end)
    u55:PivotTo(CFrame.new(p54:GetAttribute("SheepIdlePosition")) * CFrame.Angles(0, p54:GetAttribute("RandomFloat") * 3.141592653589793 * 2, 0))
    if u13.LocalPlayer.UserId ~= p54:GetAttribute("SheepOwnerUserId") then
        for _, v59 in u55:GetDescendants() do
            if v59:IsA("BasePart") then
                v59.Transparency = 1
            end
        end
    end
    task.spawn(function() --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u13
            [3] = u55
            [4] = u8
        --]]
        local v60 = 0
        while true do
            local v61 = task.wait(0.2)
            if v61 ~= 0 and (v61 == v61 and v61) then
                v61 = u56
            end
            if v61 == 0 or (v61 ~= v61 or not v61) then
                return
            end
            local v62 = u13.LocalPlayer.Character
            if v62 ~= nil then
                v62 = v62.PrimaryPart
            end
            if v62 and (u55.PrimaryPart and ((v62.Position - u55.PrimaryPart.Position).Magnitude <= 10 and tick() >= v60 + 2)) then
                v60 = tick()
                task.spawn(function() --[[ Line: 252 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u55
                    --]]
                    u8.Controllers.SheepHerderKitController:tameSheep(u55)
                end)
            end
        end
    end)
    local v63 = u19:getAnimation(u18.SHEEP_IDLE)
    local u64 = u55.AnimationController.Animator:LoadAnimation(v63)
    u64:Play()
    u57:GiveTask(function() --[[ Line: 261 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64:Stop()
        u64:Destroy()
    end)
    return u57
end
function u24.tameSheep(_, u65, u66, p67) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u4
        [4] = u22
        [5] = u19
        [6] = u18
        [7] = u9
        [8] = u6
        [9] = u15
        [10] = u3
    --]]
    local u68 = tick()
    local u69 = u66.PrimaryPart.Position
    local v70 = u65:GetAttribute("SheepOwnerUserId") == u13.LocalPlayer.UserId
    if p67 then
        local v71 = u5
        local v72 = u4.fromList(u22.SHEEP_TAME_1, u22.SHEEP_TAME_2, u22.SHEEP_TAME_3)
        local v73 = {}
        local v74
        if v70 then
            v74 = nil
        else
            v74 = u69
        end
        v73.position = v74
        local v75
        if v70 then
            v75 = nil
        else
            v75 = u66.PrimaryPart
        end
        v73.parent = v75
        v71:playSound(v72, v73)
        if v70 then
            u19:playAnimation(u13.LocalPlayer, u18.TAME_SHEEP)
        end
    end
    local u76 = true
    local u77 = u9.new()
    u77:GiveTask(function() --[[ Line: 282 ]]
        --[[
        Upvalues:
            [1] = u76
        --]]
        u76 = false
    end)
    u65.AncestryChanged:Connect(function(_, p78) --[[ Line: 285 ]]
        --[[
        Upvalues:
            [1] = u77
        --]]
        if p78 == nil then
            u77:DoCleaning()
        end
    end)
    local v79 = u13.LocalPlayer.Character
    if v79 ~= nil then
        v79 = v79.PrimaryPart
    end
    local u80 = v79
    u77:GiveTask(u6(function(p81, p82, _) --[[ Line: 295 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u80
        --]]
        if p81 ~= u13.LocalPlayer then
            return nil
        end
        if not p82.PrimaryPart then
            p82:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        u80 = p82.PrimaryPart
    end))
    local u83 = u65:GetAttribute("SheepIndex")
    u77:GiveTask(u65:GetAttributeChangedSignal("SheepIndex"):Connect(function() --[[ Line: 305 ]]
        --[[
        Upvalues:
            [1] = u83
            [2] = u65
        --]]
        u83 = u65:GetAttribute("SheepIndex")
    end))
    local u84 = u65:GetAttribute("RandomFloat")
    local u85 = u69.Y
    local u86 = 0
    u77:GiveTask(u15.Heartbeat:Connect(function(p87) --[[ Line: 311 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u80
            [3] = u83
            [4] = u3
            [5] = u85
            [6] = u84
            [7] = u68
            [8] = u69
            [9] = u66
        --]]
        u86 = u86 + p87
        if u80 == nil then
            return nil
        end
        local v88 = u83 % 2 == 0
        if u83 == 0 then
            v88 = false
        end
        local v89 = Vector3.new(0, -0.5, 3)
        if u83 > 0 then
            local v90 = (u83 + 1) / 2
            local v91 = math.floor(v90) * 2.1 * (v88 and 1 or -1)
            local v92 = v89 + Vector3.new(v91, 0, 0)
            local v93 = (u83 + 1) / 2
            local v94 = math.floor(v93) * 2.7
            v89 = v92 + Vector3.new(0, 0, v94)
        end
        local v95 = u80.CFrame * v89
        local v96 = RaycastParams.new()
        v96.CollisionGroup = "Players"
        local v97 = u3:raycast(v95 + Vector3.new(0, 9, 0), Vector3.new(0, -60, 0), v96)
        local v98 = v95.Y
        local v99
        if v97 == nil then
            v99 = v97
        else
            v99 = v97.Position
        end
        if v99 then
            v98 = v97.Position.Y + 2
        end
        local v100 = v98 - u85
        local v101 = math.abs(v100) / 3
        local v102 = math.max(v101, 1)
        local v103 = p87 * -40 * v102
        local v104 = p87 * 40 * v102
        local v105 = math.clamp(v100, v103, v104)
        local v106 = v95.X
        local v107 = u85 + v105
        local v108 = v95.Z
        local v109 = Vector3.new(v106, v107, v108)
        u85 = v109.Y
        local v110 = u86 * 2 + 6.283185307179586 * u84
        local v111 = math.sin(v110) * 0.8
        local v112 = v109 + Vector3.new(0, v111, 0)
        local v113 = u80.CFrame.LookVector
        local v114 = CFrame.new(v112, v112 + v113)
        if tick() - u68 < 1 then
            local v115 = u80.CFrame.LookVector
            local v116 = CFrame.new(u69, u69 + v115)
            local v117 = v114.Position
            local v118 = v116:Lerp(v114, (tick() - u68) / 1)
            v114 = CFrame.new(v118.Position, v117)
        end
        u66:PivotTo(v114)
    end))
    local v119 = u19:getAnimation(u18.SHEEP_WALK)
    local u120 = u66.AnimationController.Animator:LoadAnimation(v119)
    u120:Play()
    u120:AdjustSpeed(0.5)
    u120.TimePosition = u84 * u120.Length
    u77:GiveTask(function() --[[ Line: 377 ]]
        --[[
        Upvalues:
            [1] = u120
        --]]
        u120:Stop()
        u120:Destroy()
    end)
    return u77
end
u24.MAX_HIGHLIGHTED_SHEEP = 2
u8.CreateController(u24.new())
return nil