local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local _ = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "visual-debug-util").VisualDebugUtil
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "MummyKillEffect"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16)
    u11.setPlayDefaultKillEffect(p15, false)
end
function u12.onKill(p17, _, p18, p19) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u11
        [5] = u2
        [6] = u10
        [7] = u1
        [8] = u9
        [9] = u7
        [10] = u3
        [11] = u8
    --]]
    local u20 = u4.new()
    local u21 = u5("Folder", {
        ["Name"] = "MummyKillEffect",
        ["Parent"] = u6
    })
    u20:GiveTask(u21)
    p18.Archivable = true
    local u22 = p18:Clone()
    u22.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u22.HumanoidRootPart.Anchored = true
    u22:PivotTo(p19)
    u22.Parent = u6
    u11.hideCharacter(p17, p18)
    u20:GiveTask(u22)
    local u23 = RaycastParams.new()
    u23.FilterType = Enum.RaycastFilterType.Whitelist
    u23.FilterDescendantsInstances = { u22 }
    local u24 = u22.HumanoidRootPart.Position + Vector3.new(0, -3, 0)
    local u25 = u22.HumanoidRootPart.CFrame.LookVector
    local u26 = u22.HumanoidRootPart.CFrame.RightVector
    local u27 = u22.HumanoidRootPart.CFrame.LookVector * -1
    local u28 = u22.HumanoidRootPart.CFrame.RightVector * -1
    local u29 = u22.HumanoidRootPart.CFrame.UpVector
    local u30 = u22.HumanoidRootPart.CFrame.UpVector * -1
    local u31 = false
    local u32 = false
    local v33 = Color3.fromHex("#eae5ae")
    local u34 = ColorSequence.new(v33, v33)
    u20:GiveTask(u2:playSound(u10.STRING_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 150,
        ["rollOffMinDistance"] = 50,
        ["playbackSpeedMultiplier"] = 0.7,
        ["position"] = p19.Position
    }))
    local u72 = u1.Promise.new(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u24
            [3] = u27
            [4] = u6
            [5] = u23
            [6] = u28
            [7] = u26
            [8] = u5
            [9] = u21
            [10] = u20
            [11] = u34
            [12] = u9
            [13] = u7
            [14] = u3
            [15] = u31
        --]]
        local v35 = 0
        local v36 = {}
        local v37 = false
        local v38, v39
        while true do
            if v35 > 8 then
                v38 = false
                v39 = 0
                break
            end
            local v40 = nil
            local v41 = nil
            local v42 = nil
            local v43 = nil
            local v44 = u24 + (u25 * 5 + Vector3.new(0, v35, 0))
            local v45 = u27
            local v46 = u6:Blockcast(CFrame.new(v44, v44 + v45), Vector3.new(10, 0.5, 0.1), v45 * 20, u23)
            if v46 then
                v40 = v44 + v45 * (v46.Distance - 0.05)
                v37 = true
            elseif v37 then
                v38 = false
                v39 = 0
                break
            end
            local v47 = u24 + (u27 * 5 + Vector3.new(0, v35, 0))
            local v48 = u25
            local v49 = u6:Blockcast(CFrame.new(v47, v47 + v48), Vector3.new(10, 0.5, 0.1), v48 * 20, u23)
            if v49 then
                v41 = v47 + v48 * (v49.Distance - 0.05)
                v37 = true
            elseif v37 then
                v38 = false
                v39 = 0
                break
            end
            local v50 = u24 + (u28 * 5 + Vector3.new(0, v35, 0))
            local v51 = u26
            local v52 = u6:Blockcast(CFrame.new(v50, v50 + v51), Vector3.new(10, 0.5, 0.1), v51 * 20, u23)
            if v52 then
                v42 = v50 + v51 * (v52.Distance - 0.05)
                v37 = true
            elseif v37 then
                v38 = false
                v39 = 0
                break
            end
            local v53 = u24 + (u26 * 5 + Vector3.new(0, v35, 0))
            local v54 = u28
            local v55 = u6:Blockcast(CFrame.new(v53, v53 + v54), Vector3.new(10, 0.5, 0.1), v54 * 20, u23)
            if v55 then
                v43 = v53 + v54 * (v55.Distance - 0.05)
                v37 = true
            elseif v37 then
                v38 = false
                v39 = 0
                break
            end
            if v42 ~= nil then
                v42 = (v42 - (v43 or Vector3.new(0, 0, 0))).Magnitude
            end
            local v56 = v42 == nil and 0 or v42
            local v57
            if v40 == nil then
                v57 = v40
            else
                v57 = (v40 - (v41 or Vector3.new(0, 0, 0))).Magnitude
            end
            local _ = v57 == nil and 0 or v57
            local v58
            if v40 == nil then
                v58 = v40
            else
                v58 = v40 + u28 * (v56 / 2)
            end
            local v59 = v58 == nil and Vector3.new(0, 0, 0) or v58
            if v40 ~= nil then
                v40 = v40 + u26 * (v56 / 2)
            end
            local v60 = v40 == nil and Vector3.new(0, 0, 0) or v40
            local v61
            if v41 == nil then
                v61 = v41
            else
                v61 = v41 + u28 * (v56 / 2)
            end
            local v62 = v61 == nil and Vector3.new(0, 0, 0) or v61
            if v41 ~= nil then
                v41 = v41 + u26 * (v56 / 2)
            end
            local v63 = v41 == nil and Vector3.new(0, 0, 0) or v41
            table.insert(v36, v59)
            table.insert(v36, v60)
            table.insert(v36, v63)
            table.insert(v36, v62)
            v35 = v35 + 0.5
        end
        while true do
            if v38 then
                v39 = v39 + 1
            else
                v38 = true
            end
            if v39 >= #v36 - 1 then
                u31 = true
                return
            end
            local u64 = v36[v39 + 1]
            local u65 = v36[v39 + 1 + 1]
            if u64 ~= nil and u65 ~= nil then
                local v66 = u5("Part", {
                    ["Name"] = "MummyKillEffect_Part",
                    ["Size"] = Vector3.new(0.1, 0.1, 0.1),
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["CanTouch"] = false,
                    ["CanQuery"] = false,
                    ["Transparency"] = 1,
                    ["Position"] = u64,
                    ["Parent"] = u21
                })
                u20:GiveTask(v66)
                local u67 = v66:Clone()
                u20:GiveTask(u67)
                u67.Parent = u21
                local v68 = u5("Attachment", {
                    ["Parent"] = v66
                })
                u20:GiveTask(v68)
                local v69 = u5("Attachment", {
                    ["Parent"] = u67
                })
                u20:GiveTask(v69)
                u20:GiveTask((u5("Beam", {
                    ["Name"] = "MummyKillEffect_BandageBeam",
                    ["Width0"] = 0.75,
                    ["Width1"] = 0.75,
                    ["FaceCamera"] = false,
                    ["Segments"] = 2,
                    ["TextureSpeed"] = 0,
                    ["Attachment0"] = v68,
                    ["Attachment1"] = v69,
                    ["Transparency"] = NumberSequence.new(0),
                    ["Color"] = u34,
                    ["Parent"] = u21,
                    ["Texture"] = u9.MUMMY_BANDAGE_TEXTURE
                })))
                local u71 = u7((u64 - u65).Magnitude / 60, u3, function(p70) --[[ Line: 358 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u64
                        [3] = u65
                    --]]
                    u67.Position = u64:Lerp(u65, p70)
                end, 0, 1)
                u20:GiveTask(function() --[[ Line: 361 ]]
                    --[[
                    Upvalues:
                        [1] = u71
                    --]]
                    return u71:Cancel()
                end)
                u71:Play():Wait()
            end
        end
    end)
    u20:GiveTask(function() --[[ Line: 369 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        return u72:cancel()
    end)
    local u115 = u1.Promise.new(function() --[[ Line: 372 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u28
            [3] = u29
            [4] = u26
            [5] = u30
            [6] = u8
            [7] = u6
            [8] = u23
            [9] = u25
            [10] = u27
            [11] = u5
            [12] = u21
            [13] = u20
            [14] = u34
            [15] = u9
            [16] = u7
            [17] = u3
            [18] = u32
        --]]
        local v73 = u22.HumanoidRootPart.Position + u28 * 3
        CFrame.new()
        local v74 = 0
        local v75 = {}
        while v74 <= 6 do
            local v76 = v73 + (u29 * 5 + u26 * v74)
            local v77 = u30
            local v78 = u8.rotateCframeLocalDegrees(u22.HumanoidRootPart.CFrame, Vector3.new(-90, 0, 0))
            local v79 = u6:Blockcast(u8.setCframePositionWithoutChangingRotation(v78, v76), Vector3.new(0.5, 10, 0.1), v77 * 20, u23)
            local v80 = not v79 and Vector3.new(0, 0, 0) or v76 + v77 * (v79.Distance - 0.03)
            local v81 = v73 + (u30 * 5 + u26 * v74)
            local v82 = u29
            local v83 = u8.rotateCframeLocalDegrees(u22.HumanoidRootPart.CFrame, Vector3.new(-270, 0, 0))
            u8.setCframePositionWithoutChangingRotation(v83, v81)
            local v84 = u6:Blockcast(CFrame.new(v81, v81 + v82), Vector3.new(0.5, 10, 0.1), v82 * 20, u23)
            local v85 = not v84 and Vector3.new(0, 0, 0) or v81 + v82 * (v84.Distance - 0.03)
            local v86 = v73 + (u25 * 5 + u26 * v74)
            local v87 = u27
            local v88 = u8.rotateCframeLocalDegrees(u22.HumanoidRootPart.CFrame, Vector3.new(0, 0, 0))
            u8.setCframePositionWithoutChangingRotation(v88, v86)
            local v89 = u6:Blockcast(CFrame.new(v86, v86 + v87), Vector3.new(0.5, 10, 0.1), v87 * 20, u23)
            local v90 = not v89 and Vector3.new(0, 0, 0) or v86 + v87 * (v89.Distance - 0.03)
            local v91 = v73 + (u27 * 5 + u26 * v74)
            local v92 = u25
            local v93 = u8.rotateCframeLocalDegrees(u22.HumanoidRootPart.CFrame, Vector3.new(-180, 0, 0))
            u8.setCframePositionWithoutChangingRotation(v93, v91)
            local v94 = u6:Blockcast(CFrame.new(v91, v91 + v92), Vector3.new(0.5, 10, 0.1), v92 * 20, u23)
            local v95 = not v94 and Vector3.new(0, 0, 0) or v91 + v92 * (v94.Distance - 0.03)
            local v96
            if v80 == nil then
                v96 = v80
            else
                v96 = (v80 - (v85 or Vector3.new(0, 0, 0))).Magnitude
            end
            local _ = v96 == nil and 0 or v96
            if v90 ~= nil then
                v90 = (v90 - (v95 or Vector3.new(0, 0, 0))).Magnitude
            end
            local v97 = v90 == nil and 0 or v90
            local v98
            if v80 == nil then
                v98 = v80
            else
                v98 = v80 + u25 * (v97 / 2)
            end
            local v99 = v98 == nil and Vector3.new(0, 0, 0) or v98
            if v80 ~= nil then
                v80 = v80 + u27 * (v97 / 2)
            end
            local v100 = v80 == nil and Vector3.new(0, 0, 0) or v80
            local v101
            if v85 == nil then
                v101 = v85
            else
                v101 = v85 + u25 * (v97 / 2)
            end
            local v102 = v101 == nil and Vector3.new(0, 0, 0) or v101
            if v85 ~= nil then
                v85 = v85 + u27 * (v97 / 2)
            end
            local v103 = v85 == nil and Vector3.new(0, 0, 0) or v85
            if v99 ~= Vector3.new(0, 0, 0) then
                table.insert(v75, v99)
            end
            if v100 ~= Vector3.new(0, 0, 0) then
                table.insert(v75, v100)
            end
            if v103 ~= Vector3.new(0, 0, 0) then
                table.insert(v75, v103)
            end
            if v102 ~= Vector3.new(0, 0, 0) then
                table.insert(v75, v102)
            end
            v74 = v74 + 0.5
        end
        local v104 = false
        local v105 = 0
        while true do
            if v104 then
                v105 = v105 + 1
            else
                v104 = true
            end
            if v105 >= #v75 then
                u32 = true
                return
            end
            local u106 = v75[v105 + 1]
            local u107 = v75[v105 + 1 + 1]
            if u106 ~= nil and u107 ~= nil then
                local v108 = CFrame.new(u106, u107)
                local v109 = u5("Part", {
                    ["Name"] = "MummyKillEffect_Part",
                    ["Size"] = Vector3.new(0.1, 0.1, 0.1),
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["CanTouch"] = false,
                    ["CanQuery"] = false,
                    ["Transparency"] = 1,
                    ["CFrame"] = u8.rotateCframeLocalDegrees(v108, Vector3.new(0, 0, 90)),
                    ["Parent"] = u21
                })
                u20:GiveTask(v109)
                local u110 = v109:Clone()
                u110.Parent = u21
                u20:GiveTask(u110)
                local v111 = u5("Attachment", {
                    ["Parent"] = v109
                })
                u20:GiveTask(v111)
                local v112 = u5("Attachment", {
                    ["Parent"] = u110
                })
                u20:GiveTask(v112)
                u20:GiveTask((u5("Beam", {
                    ["Name"] = "MummyKillEffect_BandageBeam",
                    ["Width0"] = 0.75,
                    ["Width1"] = 0.75,
                    ["FaceCamera"] = false,
                    ["Segments"] = 2,
                    ["TextureSpeed"] = 0,
                    ["Attachment0"] = v111,
                    ["Attachment1"] = v112,
                    ["Transparency"] = NumberSequence.new(0),
                    ["Color"] = u34,
                    ["Texture"] = u9.MUMMY_BANDAGE_TEXTURE,
                    ["Parent"] = u21
                })))
                local u114 = u7((u106 - u107).Magnitude / 60, u3, function(p113) --[[ Line: 663 ]]
                    --[[
                    Upvalues:
                        [1] = u110
                        [2] = u106
                        [3] = u107
                    --]]
                    u110.Position = u106:Lerp(u107, p113)
                end, 0, 1)
                u20:GiveTask(function() --[[ Line: 666 ]]
                    --[[
                    Upvalues:
                        [1] = u114
                    --]]
                    return u114:Cancel()
                end)
                u114:Play():Wait()
            end
        end
    end)
    u20:GiveTask(function() --[[ Line: 674 ]]
        --[[
        Upvalues:
            [1] = u115
        --]]
        return u115:cancel()
    end)
    task.delay(10, function() --[[ Line: 677 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:DoCleaning()
    end)
    return u20
end
return u12