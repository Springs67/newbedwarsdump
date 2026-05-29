local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.RunService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "EffectUtil"
    end
})
u12.__index = u12
function u12.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(_) --[[ Line: 25 ]] end
function u12.playEffects(u15, u16, p17, p18) --[[ Line: 27 ]]
    for _, u19 in u16 do
        u15:playEffect(u19, p17, p18)
        local v20
        if p18 == nil then
            v20 = p18
        else
            v20 = p18.destroyAfterSec
        end
        if v20 ~= nil then
            task.delay(p18.destroyAfterSec, function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:Destroy()
            end)
        end
        local v21
        if p18 == nil then
            v21 = p18
        else
            v21 = p18.disableEffectsAfterSec
        end
        if v21 ~= nil then
            task.delay(p18.disableEffectsAfterSec, function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u16
                --]]
                u15:disableEffects(u16)
            end)
        end
    end
end
function u12.playEffect(p22, u23, p24, p25) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u5
        [4] = u9
        [5] = u4
    --]]
    local v26
    if p25 == nil then
        v26 = p25
    else
        v26 = p25.sizeMultiplier
    end
    if v26 ~= nil then
        local v27
        if p25 == nil then
            v27 = p25
        else
            v27 = p25.sizeMultiplier
        end
        p22:scaleInstance(u23, v27)
    end
    local v28
    if u10:IsClient() and not u3.isHoarceKat() then
        if u5.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and p24 ~= nil then
            v28 = u9.LocalPlayer.Character == p24
        else
            v28 = false
        end
    else
        v28 = false
    end
    if u23:IsA("ParticleEmitter") then
        if v28 then
            return nil
        end
        local v29 = u23:GetAttribute("EmitCount")
        local v30 = v29 == nil and 1 or v29
        local v31
        if p25 == nil then
            v31 = p25
        else
            v31 = p25.particleMultiplier
        end
        if v31 ~= 0 and (v31 == v31 and (v31 and v30 > 0)) then
            local v32 = v30 * p25.particleMultiplier
            v30 = math.max(1, v32)
        end
        u23:Emit(v30)
    elseif u23:IsA("BasePart") then
        u4:setQueryIgnored(u23, true)
        u23.CanCollide = false
    elseif u23:IsA("Light") then
        local v33 = u23:GetAttribute("Duration")
        local v34 = v33 == nil and 0.12 or v33
        task.delay(v34, function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Enabled = false
        end)
    elseif u23:IsA("Beam") then
        local v35 = u23:GetAttribute("Duration")
        local v36 = v35 == nil and 0.12 or v35
        task.delay(v36, function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Enabled = false
        end)
    elseif u23:IsA("Trail") then
        local v37 = u23:GetAttribute("Duration")
        local v38 = v37 == nil and 0.12 or v37
        task.delay(v38, function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Enabled = false
        end)
    end
    for v39, v40 in u23:GetChildren() do
        local _ = v39 - 1
        p22:playEffect(v40, p24, p25)
    end
end
function u12.playInstanceEffects(p41, p42, p43) --[[ Line: 126 ]]
    local v44
    if p43 == nil then
        v44 = p43
    else
        v44 = p43.sizeMultiplier
    end
    if v44 ~= nil then
        local v45
        if p43 == nil then
            v45 = p43
        else
            v45 = p43.sizeMultiplier
        end
        p41:scaleEffect(p42, v45)
    end
    for _, u46 in p42 do
        p41:playInstanceEffect(u46, p43)
        local v47
        if p43 == nil then
            v47 = p43
        else
            v47 = p43.destroyAfterSec
        end
        if v47 ~= nil then
            task.delay(p43.destroyAfterSec, function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                u46:Destroy()
            end)
        end
    end
end
function u12.enableInstanceEffect(_, p48) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v49 = u7.new()
    for _, u50 in p48:GetDescendants() do
        if u50:IsA("ParticleEmitter") and not u50.Enabled then
            u50.Enabled = true
            v49:GiveTask(function() --[[ Line: 159 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50.Enabled = false
            end)
        end
        if u50:IsA("Light") and not u50.Enabled then
            u50.Enabled = true
            v49:GiveTask(function() --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50.Enabled = false
            end)
        end
        if u50:IsA("Beam") and not u50.Enabled then
            u50.Enabled = true
            v49:GiveTask(function() --[[ Line: 175 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50.Enabled = false
            end)
        end
        if u50:IsA("Trail") and not u50.Enabled then
            u50.Enabled = true
            v49:GiveTask(function() --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50.Enabled = false
            end)
        end
    end
    return v49
end
function u12.playInstanceEffect(p51, u52, p53) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v54
    if p53 == nil then
        v54 = p53
    else
        v54 = p53.sizeMultiplier
    end
    if v54 ~= nil then
        local v55
        if p53 == nil then
            v55 = p53
        else
            v55 = p53.sizeMultiplier
        end
        p51:scaleInstance(u52, v55)
    end
    if u52:IsA("ParticleEmitter") then
        local v56 = u52:GetAttribute("EmitCount")
        local u57 = v56 == nil and 1 or v56
        local v58 = u52:GetAttribute("EmitDelay")
        local v59 = u52:GetAttribute("EmitDuration")
        if v59 == 0 or (v59 ~= v59 or not v59) then
            if v58 == 0 or (v58 ~= v58 or not v58) then
                u52:Emit(u57)
            else
                task.delay(v58, function() --[[ Line: 225 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                        [2] = u57
                    --]]
                    u52:Emit(u57)
                end)
            end
        else
            u52.Rate = u57
            u52.Enabled = true
            task.delay(v59, function() --[[ Line: 220 ]]
                --[[
                Upvalues:
                    [1] = u52
                --]]
                u52.Enabled = false
            end)
        end
    elseif u52:IsA("BasePart") then
        u4:setQueryIgnored(u52)
        u52.CanQuery = false
        u52.CanCollide = false
    elseif u52:IsA("Light") then
        local v60 = u52:GetAttribute("Duration")
        local v61 = v60 == nil and 0.12 or v60
        task.delay(v61, function() --[[ Line: 242 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52.Enabled = false
        end)
    elseif u52:IsA("Beam") then
        local v62 = u52:GetAttribute("Duration")
        local v63 = v62 == nil and 0.12 or v62
        task.delay(v63, function() --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52.Enabled = false
        end)
    elseif u52:IsA("Trail") then
        local v64 = u52:GetAttribute("Duration")
        local v65 = v64 == nil and 0.12 or v64
        task.delay(v65, function() --[[ Line: 260 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52.Enabled = false
        end)
    end
    for v66, v67 in u52:GetChildren() do
        local _ = v66 - 1
        p51:playInstanceEffect(v67, p53)
    end
end
function u12.scaleEffect(p68, p69, p70) --[[ Line: 272 ]]
    for _, v71 in p69 do
        p68:scaleInstance(v71, p70)
        for v72, v73 in v71:GetDescendants() do
            local _ = v72 - 1
            p68:scaleInstance(v73, p70)
        end
    end
end
function u12.scaleInstance(_, p74, p75) --[[ Line: 284 ]]
    if p74:IsA("ParticleEmitter") then
        local v76 = p74.Size.Keypoints
        local v77 = table.create(#v76)
        for v78, v79 in v76 do
            local _ = v78 - 1
            v77[v78] = NumberSequenceKeypoint.new(v79.Time, v79.Value * p75, v79.Envelope * p75)
        end
        p74.Size = NumberSequence.new(v77)
        p74.Speed = NumberRange.new(p74.Speed.Min * p75, p74.Speed.Max * p75)
        p74.Acceleration = p74.Acceleration * p75
        return
    elseif p74:IsA("Beam") then
        p74.Width0 = p74.Width0 * p75
        p74.Width1 = p74.Width1 * p75
        p74.CurveSize0 = p74.CurveSize0 * p75
        p74.CurveSize1 = p74.CurveSize1 * p75
    elseif p74:IsA("Trail") then
        local v80 = p74.WidthScale.Keypoints
        local v81 = table.create(#v80)
        for v82, v83 in v80 do
            local _ = v82 - 1
            v81[v82] = NumberSequenceKeypoint.new(v83.Time, v83.Value * p75, v83.Envelope * p75)
        end
        p74.WidthScale = NumberSequence.new(v81)
    end
end
function u12.disableEffects(_, p84) --[[ Line: 320 ]]
    local function v86(p85) --[[ Line: 322 ]]
        if p85:IsA("ParticleEmitter") then
            p85.Enabled = false
            return
        elseif p85:IsA("Light") then
            p85.Enabled = false
            return
        elseif p85:IsA("Beam") then
            p85.Enabled = false
        elseif p85:IsA("Trail") then
            p85.Enabled = false
        end
    end
    for v87, v88 in p84 do
        v86(v88, v87 - 1, p84)
    end
end
function u12.toggleEffects(_, p89, u90, u91) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    local v92 = p89:GetDescendants()
    local function v113(u93) --[[ Line: 339 ]]
        --[[
        Upvalues:
            [1] = u91
            [2] = u11
            [3] = u6
            [4] = u90
        --]]
        if u93:IsA("Beam") or (u93:IsA("ParticleEmitter") or u93:IsA("Trail")) then
            if u93:GetAttribute("originalNumberSequence") == nil then
                u93:SetAttribute("originalNumberSequence", u93.Transparency)
            end
            if u91 ~= nil and u91 > 0 then
                u11(0.5, u6, function(u94) --[[ Line: 345 ]]
                    --[[
                    Upvalues:
                        [1] = u93
                        [2] = u90
                    --]]
                    local v95 = u93.Transparency.Keypoints
                    local function v104(p96) --[[ Line: 347 ]]
                        --[[
                        Upvalues:
                            [1] = u90
                            [2] = u94
                            [3] = u93
                        --]]
                        local v97 = p96.Time
                        local v98 = math
                        local v99
                        if u90 then
                            v99 = 1 - u94
                        else
                            v99 = u94
                        end
                        local v100 = nil
                        for v101, v102 in u93:GetAttribute("originalNumberSequence").Keypoints do
                            local _ = v101 - 1
                            if v102.Time == p96.Time == true then
                                v100 = v102
                                break
                            end
                        end
                        if v100 ~= nil then
                            v100 = v100.Value
                        end
                        local v103 = v100 == nil and 0 or v100
                        return NumberSequenceKeypoint.new(v97, v98.clamp(v99, v103, 1), p96.Envelope)
                    end
                    local v105 = table.create(#v95)
                    for v106, v107 in v95 do
                        v105[v106] = v104(v107, v106 - 1, v95)
                    end
                    u93.Transparency = NumberSequence.new(v105)
                end)
                return
            end
            local v108
            if u90 then
                v108 = u93:GetAttribute("originalNumberSequence")
            else
                local v109 = u93:GetAttribute("originalNumberSequence").Keypoints
                local v110 = table.create(#v109)
                for v111, v112 in v109 do
                    local _ = v111 - 1
                    v110[v111] = NumberSequenceKeypoint.new(v112.Time, 1, v112.Envelope)
                end
                v108 = NumberSequence.new(v110)
            end
            u93.Transparency = v108
        end
    end
    for v114, v115 in v92 do
        v113(v115, v114 - 1, v92)
    end
end
function u12.tweenEffectTransparency(_, u116, u117, p118, p119) --[[ Line: 407 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
    --]]
    if p119 == nil then
        p119 = u6
    end
    u11(p118, p119, function(u120) --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u116
            [2] = u117
        --]]
        for _, v121 in u116 do
            local v122 = v121:GetDescendants()
            local function v125(p123) --[[ Line: 414 ]]
                --[[
                Upvalues:
                    [1] = u120
                    [2] = u117
                --]]
                if p123:IsA("Beam") or (p123:IsA("Trail") or p123:IsA("ParticleEmitter")) then
                    p123.Transparency = NumberSequence.new(u120 * u117)
                elseif p123:IsA("BasePart") or (p123:IsA("Decal") or p123:IsA("Texture")) then
                    local v124 = u120 * u117
                    if p123.Transparency ~= v124 then
                        p123.Transparency = v124
                    end
                end
            end
            for v126, v127 in v122 do
                v125(v127, v126 - 1, v122)
            end
        end
    end, 0, 1)
end
function u12.setEffectTransparencyStrength(_, p128, p129) --[[ Line: 431 ]]
    local u130 = math.clamp(p129, 0, (1 / 0))
    for _, v131 in p128 do
        local v132 = v131:GetDescendants()
        local function v140(p133) --[[ Line: 436 ]]
            --[[
            Upvalues:
                [1] = u130
            --]]
            if p133:IsA("Beam") or (p133:IsA("Trail") or p133:IsA("ParticleEmitter")) then
                local v134 = p133:GetAttribute("OriginalTransparency")
                if not v134 then
                    p133:SetAttribute("OriginalTransparency", p133.Transparency)
                    v134 = p133.Transparency
                end
                local v135 = v134.Keypoints
                local v136 = table.create(#v135)
                for v137, v138 in v135 do
                    local _ = v137 - 1
                    v136[v137] = NumberSequenceKeypoint.new(v138.Time, v138.Value * u130)
                end
                p133.Transparency = NumberSequence.new(v136)
            elseif p133:IsA("Decal") or p133:IsA("Texture") then
                local v139 = p133:GetAttribute("OriginalTransparency")
                if v139 == 0 or (v139 ~= v139 or not v139) then
                    p133:SetAttribute("OriginalTransparency", p133.Transparency)
                    v139 = p133.Transparency
                end
                p133.Transparency = v139 * u130
            end
        end
        for v141, v142 in v132 do
            v140(v142, v141 - 1, v132)
        end
    end
end
return {
    ["EffectUtil"] = u12
}