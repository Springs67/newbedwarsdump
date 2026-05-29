local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.Linear
local u8 = v6.OutSine
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u16 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = Random.new()
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "KnifeRainKillEffect"
    end,
    ["__index"] = u16
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p21, p22)
    u16.setPlayDefaultKillEffect(p21, false)
end
function u18.getTargetCFrame(_, p23, p24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u12
    --]]
    local v25 = nil
    local v26 = 0
    while v25 == nil and v26 < 20 do
        v26 = v26 + 1
        local v27 = p23:GetPivot() * CFrame.new(u17:NextNumber(-2, 2), u17:NextNumber(-3, 3), 0)
        local v28 = RaycastParams.new()
        v28.FilterType = Enum.RaycastFilterType.Whitelist
        v28.FilterDescendantsInstances = { p23 }
        local v29 = u12:Raycast(p24, (v27.Position - p24).Unit * 40, v28)
        local v30
        if v29 == nil then
            v30 = v29
        else
            v30 = v29.Instance
        end
        if v30 then
            v25 = CFrame.new(v29.Position)
        end
    end
    return v25
end
function u18.onKill(p31, _, p32, p33) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u16
        [4] = u5
        [5] = u14
        [6] = u11
        [7] = u15
        [8] = u17
        [9] = u3
        [10] = u4
        [11] = u13
        [12] = u8
        [13] = u7
    --]]
    local u34 = u9.new()
    p32.Archivable = true
    local v35 = p32:Clone()
    v35.HumanoidRootPart.Anchored = true
    v35:PivotTo(p33)
    v35.Parent = u12
    u16.hideCharacter(p31, p32)
    u34:GiveTask(v35)
    u34:GiveTask(u5:playSound(u14.KNIFE_RAIN_EFFECT, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p33.Position
    }))
    local v36 = { u11.Assets.Misc.KillEffectKnives.KillEffectKnife, u11.Assets.Misc.KillEffectKnives.KillEffectRod }
    local v37 = 0
    local v38 = 0
    local u39 = {}
    while true do
        if v37 >= 5 or v38 >= 100 then
            for u40 in u39 do
                task.spawn(function() --[[ Line: 141 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u13
                        [3] = u8
                        [4] = u40
                        [5] = u7
                        [6] = u34
                    --]]
                    local v41 = 0.7 + u17:NextNumber(0.1, 0.35)
                    local v51 = u13(v41, u8, function(p42) --[[ Line: 144 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        local v43 = u40.model
                        local v44 = CFrame
                        local v45 = u40.origin
                        local v46 = u40.origin
                        local v47 = (u40.targetPosition - u40.origin).Unit * 3
                        local v48 = v44.lookAt(v45:Lerp(v46 + v47, p42), u40.targetPosition)
                        local v49 = CFrame.Angles
                        local v50 = u40.angle
                        v43:PivotTo(v48 * v49(0, 0, (math.rad(v50))))
                    end, 0, 1)
                    task.wait(v41 - u17:NextNumber(0.1, 0.2))
                    v51:Cancel()
                    local u52 = u40.model:GetPivot().Position
                    local u64 = u13(u17:NextNumber(0.1, 0.15), u7, function(p53) --[[ Line: 160 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                            [2] = u52
                        --]]
                        local v54 = not u40.model.PrimaryPart and 1.3 or u40.model.PrimaryPart.Size.Z / 2 - 0.3
                        local v55 = (u40.targetPosition - u40.origin).Unit
                        local v56 = u40.model
                        local v57 = CFrame
                        local v58 = u52:Lerp(u40.targetPosition - v55 * v54, p53)
                        local v59 = u40.targetPosition
                        local v60 = v55 * 0.1
                        local v61 = v57.lookAt(v58, v59 + v60)
                        local v62 = CFrame.Angles
                        local v63 = u40.angle
                        v56:PivotTo(v61 * v62(0, 0, (math.rad(v63))))
                    end, 0, 1)
                    u34:GiveTask(function() --[[ Line: 177 ]]
                        --[[
                        Upvalues:
                            [1] = u64
                        --]]
                        u64:Cancel()
                    end)
                end)
            end
            u34:GiveTask(function() --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                for v65 in u39 do
                    v65.model:Destroy()
                end
            end)
            task.delay(2.5, function() --[[ Line: 187 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                u34:DoCleaning()
            end)
            return u34
        end
        local v66 = u15.randomUnitVector(p33.LookVector * -1, 1.2217304763960306)
        local v67 = p33.Position + v66 * u17:NextNumber(13, 25)
        local v68 = (p33.Position - v67).Unit
        v38 = v38 + 1
        if v68.Y <= 0 then
            local v69 = p31:getTargetCFrame(v35, v67)
            if v69 ~= nil then
                v37 = v37 + 1
                local v70 = u11.Assets.Misc.KillEffectKnives.KillEffectSpear:Clone()
                v70:PivotTo(CFrame.lookAt(v67, v69.Position))
                v70.Parent = u12
                u3:setQueryIgnored(v70, true)
                u39[{
                    ["model"] = v70,
                    ["origin"] = v67,
                    ["targetPosition"] = v69.Position,
                    ["angle"] = u17:NextNumber(0, 360)
                }] = true
                local v71 = false
                local v72 = 0
                while true do
                    if true then
                        if v71 then
                            v72 = v72 + 1
                        else
                            v71 = true
                        end
                    end
                    if v72 >= 4 then
                        break
                    end
                    local v73 = u17:NextNumber(-2.5, 2.5)
                    local v74 = u17:NextNumber(-2.5, 2.5)
                    local v75 = u17
                    local v76 = Vector3.new(v73, v74, v75:NextNumber(-2.5, 2.5))
                    local v77 = p31:getTargetCFrame(v35, v67 + v76)
                    if v77 ~= nil then
                        local v78 = u4.fromList(unpack(v36)):Clone()
                        v78:PivotTo(CFrame.lookAt(v67 + v76, v77.Position))
                        v78.Parent = u12
                        u3:setQueryIgnored(v78, true)
                        u39[{
                            ["model"] = v78,
                            ["origin"] = v78:GetPivot().Position,
                            ["angle"] = u17:NextNumber(0, 360),
                            ["targetPosition"] = v77.Position
                        }] = true
                    end
                end
            end
        end
    end
end
return u18