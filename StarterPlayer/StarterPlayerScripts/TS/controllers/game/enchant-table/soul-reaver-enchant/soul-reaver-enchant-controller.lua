local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.RunService
local u9 = v5.TweenService
local u10 = v5.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SoulReaverEnchantController"
    end,
    ["__index"] = u13
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
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p21)
    p21.Name = "SoulReaverEnchantController"
    p21.effectMap = {}
    p21.effectEndTime = {}
end
function u18.KnitStart(u22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u17
        [4] = u6
        [5] = u15
        [6] = u10
        [7] = u14
        [8] = u4
        [9] = u7
        [10] = u3
        [11] = u12
        [12] = u2
        [13] = u16
        [14] = u9
        [15] = u8
    --]]
    u13.KnitStart(u22)
    u11.StatusEffectAdded:connect(function(p23) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u6
            [3] = u22
        --]]
        if p23.statusEffect ~= u17.INVISIBILITY and (p23.statusEffect ~= u17.SMOKE_INVISIBILITY and p23.statusEffect ~= u17.NINJA_INVISIBLE) then
            return nil
        end
        local v24 = u6:GetPlayerFromCharacter(p23.entityInstance)
        if not v24 then
            return nil
        end
        u22.effectEndTime[v24] = nil
    end)
    u15.Client:Get("SoulReaverEnchantEffect"):Connect(function(u25) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u14
            [3] = u22
            [4] = u4
            [5] = u7
            [6] = u6
            [7] = u3
            [8] = u12
            [9] = u2
            [10] = u16
            [11] = u9
            [12] = u8
        --]]
        local v26 = u25.player.Character
        if v26 ~= nil then
            v26 = v26.PrimaryPart
            if v26 ~= nil then
                v26 = v26.CFrame
            end
        end
        if not v26 then
            return nil
        end
        local v27 = u10:GetServerTimeNow() + u14.SOUL_REAVER_DURATION
        u22.effectEndTime[u25.player] = v27
        local u28 = u22.effectMap[u25.player]
        local u29 = u4.new()
        local u30, v31
        if u28 then
            u30 = 1
            v31 = false
        else
            u28 = u7.Assets.Effects.SoulReaverAura:Clone()
            u28.Parent = u25.player.Character
            u28:PivotTo(v26 - Vector3.new(0, 3, 0))
            u22.effectMap[u25.player] = u28
            if u25.player == u6.LocalPlayer then
                u3.Controllers.VignetteController:createVignette(u12.SOUL_REAVER)
            end
            u29:GiveTask(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u25
                    [3] = u6
                    [4] = u3
                    [5] = u12
                --]]
                u22.effectMap[u25.player] = nil
                if u25.player == u6.LocalPlayer then
                    u3.Controllers.VignetteController:destroyVignette(u12.SOUL_REAVER)
                end
            end)
            u30 = u25.stacks
            local u32 = u2:playModifiableSound(u16.SOUL_REAVER_LOOP, {
                ["looped"] = true,
                ["volumeMultiplier"] = 0.75,
                ["position"] = v26.Position,
                ["parent"] = u25.player.Character
            })
            u29:GiveTask(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u32
                --]]
                u9:Create(u32, TweenInfo.new(0.25), {
                    ["Volume"] = 0
                }):Play()
                task.delay(0.4, function() --[[ Line: 108 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    return u32:Destroy()
                end)
            end)
            v31 = true
        end
        u29:GiveTask(u28)
        local v33 = u25.stacks
        if v33 ~= 0 and (v33 == v33 and v33) then
            local v34 = u28.Size.X + u30 * 0.8
            local v35 = u28.Size.Y
            local v36 = u28.Size.Z + u30 * 0.8
            u28.Size = Vector3.new(v34, v35, v36)
            local v37 = u28:GetDescendants()
            local function v46(p38) --[[ Line: 118 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                if p38:IsA("Beam") then
                    p38.Width0 = p38.Width0 + u30 * 0.2
                    p38.Width1 = p38.Width1 + u30 * 0.2
                    if p38.CurveSize0 ~= 0 then
                        local v39 = p38.CurveSize0 < 0 and -1 or 1
                        p38.CurveSize0 = p38.CurveSize0 + u30 * 0.2 * v39
                    end
                    if p38.CurveSize1 ~= 0 then
                        local v40 = p38.CurveSize1 < 0 and -1 or 1
                        p38.CurveSize1 = p38.CurveSize1 + u30 * 0.2 * v40
                    end
                end
                if p38:IsA("ParticleEmitter") then
                    local v41 = string.match(p38.Name, "Pulse")
                    if v41 ~= 0 and (v41 == v41 and (v41 ~= "" and v41)) then
                        local v42 = p38.Size.Keypoints[1]
                        local v43 = p38.Size.Keypoints[2]
                        p38.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, v42.Value + u30 * 0.5), NumberSequenceKeypoint.new(1, v43.Value + u30 * 1.2) })
                        return
                    end
                    local v44 = string.match(p38.Name, "Smoke")
                    if v44 ~= 0 and (v44 == v44 and (v44 ~= "" and v44)) then
                        p38.Rate = p38.Rate + u30 * 3
                        return
                    end
                    local v45 = string.match(p38.Name, "Souls")
                    if v45 ~= 0 and (v45 == v45 and (v45 ~= "" and v45)) then
                        p38.Rate = p38.Rate + u30
                    end
                end
            end
            for v47, v48 in v37 do
                v46(v48, v47 - 1, v37)
            end
        end
        if v31 then
            local u49 = nil
            u49 = u8.Heartbeat:Connect(function() --[[ Line: 156 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u49
                    [3] = u22
                    [4] = u25
                    [5] = u10
                    [6] = u28
                --]]
                u29:GiveTask(u49)
                local v50 = u22.effectEndTime[u25.player]
                if v50 == 0 or (v50 ~= v50 or (not v50 or v50 < u10:GetServerTimeNow())) then
                    u29:DoCleaning()
                    return nil
                end
                local v51 = u25.player.Character
                if v51 ~= nil then
                    v51 = v51.PrimaryPart
                end
                if not v51 then
                    u29:DoCleaning()
                    return nil
                end
                if not u28 then
                    return nil
                end
                u28:PivotTo(v51.CFrame - Vector3.new(0, 3, 0))
            end)
        end
    end)
end
u3.CreateController(u18.new())
return nil