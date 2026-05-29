local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.Linear
local u5 = v3.OutCirc
local u6 = v3.OutExpo
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.RunService
local u12 = v9.ServerStorage
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
return function(_) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u13
        [4] = u8
        [5] = u12
        [6] = u16
        [7] = u15
        [8] = u10
        [9] = u2
        [10] = u18
        [11] = u14
        [12] = u4
        [13] = u6
        [14] = u17
        [15] = u5
    --]]
    local u19 = u7.new()
    task.spawn(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:Run()
    end)
    local v20 = CFrame.new(30.913, 300.437, 469.703)
    local v21 = u8("Part", {
        ["Name"] = "Baseplate",
        ["Size"] = Vector3.new(30, 1, 30),
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Position"] = v20.Position - Vector3.new(0, 8, 0),
        ["Anchored"] = true,
        ["Parent"] = u13
    })
    v21.Parent = u13
    u19:GiveTask(v21)
    local u22 = u12.Assets.Villagers.alchemist:Clone()
    u22.PrimaryPart.Anchored = true
    u22.Name = "AnimatedEmoteCharacter"
    u22.Parent = u13
    u22:PivotTo(v20)
    u19:GiveTask(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:Destroy()
    end)
    local u23 = u16:getAssetId(u15.GRIM_REAPER_DEAD_TO_ME_EMOTE)
    local v24 = u22.Humanoid.Animator
    if not u22.PrimaryPart then
        return nil
    end
    local v25 = u22.Humanoid
    if not v25 then
        return nil
    end
    local u26 = u10.Assets.Misc.ReaperScythe:Clone()
    u26.Parent = u22
    for v27, v28 in u26:GetDescendants() do
        local _ = v27 - 1
        if v28:IsA("BasePart") then
            u2:setQueryIgnored(v28, true)
            v28.Transparency = 1
        end
    end
    u18:weldCharacterAccessories(u22)
    local u29 = nil
    u19:GiveTask((v24.AnimationPlayed:Connect(function(p30) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u19
            [3] = u14
            [4] = u4
            [5] = u26
            [6] = u6
            [7] = u29
        --]]
        local v31 = p30.Animation
        if v31 ~= nil then
            v31 = v31.AnimationId
        end
        if v31 ~= u23 then
            return nil
        end
        local v32 = u19
        local v33
        if p30 == nil then
            v33 = p30
        else
            v33 = p30:GetMarkerReachedSignal("scythe_spawn"):Connect(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u4
                    [3] = u26
                    [4] = u19
                --]]
                u14(1, u4, function(p34) --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    for v35, v36 in u26:GetDescendants() do
                        local _ = v35 - 1
                        if v36:IsA("BasePart") then
                            v36.Transparency = p34
                        end
                    end
                end, 1, 0)
                u19:GiveTask(u26)
            end)
        end
        v32:GiveTask(v33)
        local v37 = u19
        if p30 ~= nil then
            p30 = p30:GetMarkerReachedSignal("scythe_hide"):Connect(function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u6
                    [3] = u26
                    [4] = u4
                    [5] = u29
                --]]
                u14(0.3, u6, function(p38) --[[ Line: 108 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    for v39, v40 in u26:GetDescendants() do
                        local _ = v39 - 1
                        if v40:IsA("BasePart") then
                            v40.Transparency = p38
                        end
                    end
                end, 0, 1)
                u14(1, u4, function(p41) --[[ Line: 119 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    for v42, v43 in u29:GetDescendants() do
                        local _ = v42 - 1
                        if v43:IsA("BasePart") and v43.Transparency ~= 1 then
                            v43.Transparency = p41
                        elseif v43:IsA("TextLabel") then
                            v43.TextTransparency = p41
                        end
                    end
                end, 0, 1)
            end)
        end
        v37:GiveTask(p30)
    end)))
    local v44 = u22.PrimaryPart.CFrame
    local v45 = u22.PrimaryPart.CFrame.RightVector * 5
    local v46 = u22.PrimaryPart.CFrame.LookVector * 1.2
    local v47 = -v25.HipHeight + 0.5
    local v48 = Vector3.new(0, v47, 0)
    local v49 = v44 + v45 - v46 + v48
    local v50 = u17
    local v51 = v49 - Vector3.new(0, v50, 0)
    u29 = u10.Assets.Misc.Gravestone:Clone()
    u29:PivotTo(v51)
    local v52 = u29.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText
    v52.RichText = true
    v52.Text = "Your Name Here"
    u29.Parent = u13
    u19:GiveTask(u29)
    u14(1, u4, function(p53) --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        for v54, v55 in u29:GetDescendants() do
            local _ = v54 - 1
            if v55:IsA("BasePart") and v55.Transparency ~= 1 then
                v55.Transparency = p53
            elseif v55:IsA("TextLabel") then
                v55.TextTransparency = p53
            end
        end
    end, 1, 0)
    local u56 = 0
    u19:GiveTask(u11.Heartbeat:Connect(function(p57) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56 = u56 + p57
    end))
    u14(2, u5, function(p58) --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u56
        --]]
        local v59 = u29
        local v60 = u56 * 60
        local v61 = (math.sin(v60) - 1) / 20
        local v62 = u56 * 70
        local v63 = (math.sin(v62) - 1) / 20
        local v64 = u56 * 80
        local v65 = (math.cos(v64) - 1) / 20
        v59:PivotTo(p58 + Vector3.new(v61, v63, v65))
    end, v51, v49)
    v24:LoadAnimation((u8("Animation", {
        ["AnimationId"] = u23
    }))):Play()
    u19:GiveTask(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        task.spawn(function() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            u11:Stop()
        end)
    end)
    return function() --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:DoCleaning()
    end
end