local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.MathExtras
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InQuad
local u8 = v6.OutBack
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.TweenService
local u14 = v10.Workspace
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "ToiletKillEffect"
    end,
    ["__index"] = u21
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
function u22.constructor(p25, p26) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.constructor(p25, p26)
    p25.totalToiletHeight = 7.9
    p25.topOfToiletSeatOffset = 3.4
    p25.insideToiletRelativePositionOffest = Vector3.new(0, 1.38, 0.38)
    p25.characterFloorOffset = 3
    p25.playerPopUpDuration = 0.4
    p25.toiletRiseDuration = 1
    p25.headRiseDuration = 1.2
    p25.playerGoIntoToiletDuration = 1
    p25.playerSpinSpeed = 0.5
    p25.headSize = 3
    u21.setPlayDefaultKillEffect(p25, false)
end
function u22.onKill(u27, _, p28, p29) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u12
        [4] = u14
        [5] = u18
        [6] = u19
        [7] = u3
        [8] = u17
        [9] = u16
        [10] = u13
        [11] = u1
        [12] = u5
        [13] = u20
        [14] = u15
        [15] = u7
        [16] = u4
        [17] = u8
    --]]
    local u30 = u9.new()
    local v31 = p29.Position
    local v32 = u27.characterFloorOffset
    local v33 = v31 - Vector3.new(0, v32, 0)
    local v34 = u11.LocalPlayer.Character
    if v34 ~= nil then
        v34 = v34.PrimaryPart
        if v34 ~= nil then
            v34 = v34.Position
        end
    end
    if v34 == nil then
        v34 = Vector3.new()
    end
    local v35 = v34.X
    local v36 = v34.Z
    local v37 = Vector3.new(v35, 0, v36)
    local v38 = v33.X
    local v39 = v33.Z
    local v40 = (v37 - Vector3.new(v38, 0, v39)).Unit
    local v41 = v40.X
    local v42 = v40.Z
    local u43 = math.atan2(v41, v42) + 3.141592653589793
    local v44 = u27.totalToiletHeight
    local v45 = v33 - Vector3.new(0, v44, 0)
    local u46 = v33 + Vector3.new(0, 0, 0)
    local v47 = u27.topOfToiletSeatOffset
    local u48 = v33 + Vector3.new(0, v47, 0)
    local u49 = u46 + CFrame.Angles(0, u43, 0) * u27.insideToiletRelativePositionOffest
    local u50 = u12.Assets.Misc.Toilet:Clone()
    u30:GiveTask(u50)
    u50.Parent = u14
    u18.setPositionAndGlobalRotationRadians(u50, v45, (Vector3.new(0, u43, 0)))
    p28.Archivable = true
    local u51 = p28:Clone()
    u51.HumanoidRootPart.Anchored = true
    u30:GiveTask(u51)
    u51.Parent = u14
    if u51.PrimaryPart then
        u51.PrimaryPart.CFrame = p29
    end
    local v52 = u51:FindFirstChild("_DamageHighlight_")
    if v52 then
        v52:Destroy()
    end
    local v53 = u19:getEntity(u51)
    if v53 then
        v53:hideNametag()
    end
    local v54 = u51:FindFirstChild("Head")
    if v54 ~= nil then
        v54 = v54:FindFirstChild("Nametag")
    end
    if v54 then
        v54:Destroy()
    end
    local v55 = u51:FindFirstChild("Head")
    if v55 ~= nil then
        v55 = v55:FindFirstChild("StatusEffectTagGui")
    end
    if v55 then
        v55:Destroy()
    end
    u27:hideCharacter(p28)
    local u56 = u3:playAnimation(u51, u17:getAssetId(u16.ROBLOX_GHOST_FLOATING))
    if u56 then
        u30:GiveTask(u56)
    end
    local u57 = u51.PrimaryPart
    if u57 ~= nil then
        u57 = u57.Position + Vector3.new(0, 7, 0)
    end
    if u57 == nil then
        u57 = Vector3.new()
    end
    local v58 = TweenInfo.new(u27.playerPopUpDuration, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
    local v59 = u13:Create(u51.PrimaryPart, v58, {
        ["CFrame"] = CFrame.new(u57)
    })
    v59:Play()
    u30:GiveTask(v59)
    local u86 = u1.Promise.new(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u13
            [3] = u50
            [4] = u46
            [5] = u30
            [6] = u5
            [7] = u20
            [8] = u48
            [9] = u51
            [10] = u15
            [11] = u7
            [12] = u57
            [13] = u49
            [14] = u4
            [15] = u56
            [16] = u8
            [17] = u43
        --]]
        local v60 = TweenInfo.new(u27.toiletRiseDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local v61 = u13:Create(u50.PrimaryPart, v60, {
            ["CFrame"] = CFrame.new(u46) * u50:GetPivot().Rotation
        })
        v61:Play()
        u30:GiveTask(v61)
        v61.Completed:Wait()
        local v62 = {
            ["volumeMultiplier"] = 5,
            ["position"] = u48
        }
        u30:GiveTask(u5:playSound(u20.TOILET_FLUSH, v62))
        local v63 = u51.PrimaryPart
        if v63 ~= nil then
            v63 = v63.Rotation.Y
        end
        local u64 = v63 == nil and 0 or v63
        local u65 = u51:GetScale()
        u15(u27.playerGoIntoToiletDuration, u7, function(p66) --[[ Line: 181 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u49
                [3] = u64
                [4] = u27
                [5] = u51
                [6] = u4
                [7] = u65
            --]]
            local v67 = u57:Lerp(u49, p66)
            u64 = u64 + u27.playerSpinSpeed * p66
            local v68 = u64
            local v69 = Vector3.new(0, v68, 0)
            local v70 = CFrame.new(v67) * CFrame.Angles(v69.X, v69.Y, v69.Z)
            if u51.PrimaryPart then
                u51.PrimaryPart.CFrame = v70
            end
            u51:ScaleTo(u4:lerp(u65, 0.1, p66))
        end):Play():Wait()
        local u71 = u51:FindFirstChild("Head")
        local u72 = u51:FindFirstChild("3DClothing")
        if u72 ~= nil then
            u72 = u72:FindFirstChild("Head")
        end
        local v73 = u51:GetDescendants()
        local function v75(p74) --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u72
            --]]
            if u71 and (p74:IsDescendantOf(u71) or p74 == u71) then
                return nil
            elseif u72 and (p74:IsDescendantOf(u72) or p74 == u72) then
                return nil
            elseif p74:IsA("BasePart") then
                p74.Transparency = 1
                p74.CanCollide = false
                return
            elseif p74:IsA("Decal") then
                p74.Transparency = 1
            elseif p74:IsA("BillboardGui") then
                p74:Destroy()
            end
        end
        for v76, v77 in v73 do
            v75(v77, v76 - 1, v73)
        end
        task.wait(0.4)
        local v78 = u56
        if v78 ~= nil then
            v78:Destroy()
        end
        local u79 = u49 + Vector3.new(0, 0, 0)
        local u80 = u48 + Vector3.new(0, -2, 0)
        local u85 = u15(u27.headRiseDuration, u8, function(p81) --[[ Line: 238 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u80
                [3] = u43
                [4] = u51
                [5] = u4
            --]]
            local v82 = u79:Lerp(u80, p81)
            local v83 = u43
            local v84 = Vector3.new(0, v83, 0)
            u51:PivotTo(CFrame.new(v82) * CFrame.fromEulerAnglesYXZ(v84.X, v84.Y, v84.Z))
            u51:ScaleTo(u4:lerp(0.1, 2, p81))
        end)
        u30:GiveTask(function() --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u85
            --]]
            return u85:Cancel()
        end)
        u85:Play():Wait()
        task.delay(4, function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:DoCleaning()
        end)
    end)
    u30:GiveTask(function() --[[ Line: 258 ]]
        --[[
        Upvalues:
            [1] = u86
        --]]
        return u86:cancel()
    end)
    return u30
end
return u22