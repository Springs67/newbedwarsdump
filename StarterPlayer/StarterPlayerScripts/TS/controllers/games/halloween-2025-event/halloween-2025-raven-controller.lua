local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "maps", "halloween-2025", "halloween-2025-map-config").Halloween2025MapConfig
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "Halloween2025RavenController"
    end,
    ["__index"] = u12
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u18
    --]]
    u12.constructor(p23, { u16.BEDWARS })
    p23.Name = "Halloween2025RavenController"
    p23.setRavenGroupAmbient = u18.Client:Get("SetRavenGroupAmbient")
    p23.getAllRavenGroupsAmbient = u18.Client:Get("GetAllRavenGroupsAmbient")
    p23.ravenGroupMap = {}
end
function u20.KnitStart(p24) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
    --]]
    u12.KnitStart(p24)
    if not u17.ENABLED_RAVEN_SPAWNS then
        return nil
    end
    for v25, v26 in p24.getAllRavenGroupsAmbient:CallServer() do
        p24:spawnRavenGroup(v25, v26.otherPositions)
    end
end
function u20.onGameInit(u27) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u5
        [3] = u7
        [4] = u13
        [5] = u19
        [6] = u4
        [7] = u3
        [8] = u14
        [9] = u15
        [10] = u11
        [11] = u6
    --]]
    if not u17.ENABLED_RAVEN_SPAWNS then
        return nil
    end
    if u5.Controllers.MatchController:getCustomMatchConfig() then
        return nil
    end
    u27.maid = u7.new()
    u5.Controllers.PreloadController:runPreload({
        ["animations"] = { u13.HALLOWEEN_RAVEN_FLIGHT_LOOP },
        ["sounds"] = { u19.HALLOWEEN_RAVENS_1, u19.HALLOWEEN_RAVENS_2 }
    })
    u27.maid:GiveTask(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        table.clear(u27.ravenGroupMap)
    end)
    u27.maid:GiveTask(u27.setRavenGroupAmbient:Connect(function(p28, u29, p30) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u4
            [3] = u3
            [4] = u19
            [5] = u14
            [6] = u13
            [7] = u15
            [8] = u11
            [9] = u6
        --]]
        if p28 then
            u27:spawnRavenGroup(u29, p30 or {})
        else
            local u31 = u27.ravenGroupMap[u29]
            if not u31 then
                return nil
            end
            u31.maid:GiveTask(task.delay(2.5, function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u27
                    [3] = u29
                --]]
                u31.maid:Destroy()
                u27.ravenGroupMap[u29] = nil
            end))
            u4:playSound(u3.fromList(u19.HALLOWEEN_RAVENS_1, u19.HALLOWEEN_RAVENS_2), {
                ["rollOffMaxDistance"] = 120,
                ["volumeMultiplier"] = 0.7,
                ["position"] = u29
            })
            local v32 = u31.models
            local function v53(u33) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u13
                    [3] = u31
                    [4] = u15
                    [5] = u11
                    [6] = u6
                --]]
                local u34 = u14:playAnimation(u33.AnimationController.Animator, u13.HALLOWEEN_RAVEN_FLIGHT_LOOP)
                if u34 then
                    u34:Play()
                    u31.maid:GiveTask(function() --[[ Line: 98 ]]
                        --[[
                        Upvalues:
                            [1] = u34
                        --]]
                        u34:Stop()
                        u34:Destroy()
                    end)
                end
                local u35 = u33:GetPivot()
                local v36 = u35.Position
                local v37 = u35.LookVector * ((35 + math.random() * 15) * u15)
                local v38 = 35 + math.random() * 15
                local v39 = Vector3.new(0, v38, 0)
                local v40 = v36 + v37 + v39
                local v41 = u35.LookVector
                local u42 = CFrame.new(v40, v40 + v41)
                local u44 = u11(2.5, u6, function(p43) --[[ Line: 112 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u35
                        [3] = u42
                    --]]
                    u33:PivotTo(u35:Lerp(u42, p43))
                end)
                u44:Play()
                u31.maid:GiveTask(function() --[[ Line: 116 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                    --]]
                    u44:Cancel()
                end)
                u31.maid:GiveTask(task.delay(2, function() --[[ Line: 119 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u11
                        [3] = u6
                        [4] = u31
                    --]]
                    local v45 = u33:GetDescendants()
                    local function v50(u46) --[[ Line: 121 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u6
                            [3] = u31
                        --]]
                        if not u46:IsA("BasePart") then
                            return nil
                        end
                        local u47 = u46.Transparency
                        if u47 == 1 then
                            return nil
                        end
                        local u49 = u11(0.5, u6, function(p48) --[[ Line: 129 ]]
                            --[[
                            Upvalues:
                                [1] = u46
                                [2] = u47
                            --]]
                            if u46.Parent ~= nil then
                                u46.Transparency = p48 * 1 + (1 - p48) * u47
                            end
                        end)
                        u49:Play()
                        u31.maid:GiveTask(function() --[[ Line: 135 ]]
                            --[[
                            Upvalues:
                                [1] = u49
                            --]]
                            u49:Cancel()
                        end)
                    end
                    for v51, v52 in v45 do
                        v50(v52, v51 - 1, v45)
                    end
                end))
            end
            for v54, v55 in v32 do
                v53(v55, v54 - 1, v32)
            end
        end
    end))
end
function u20.spawnRavenGroup(p56, p57, p58) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v59 = u7.new()
    local v60 = { p56:spawnRavenModel(p57, v59) }
    local v61 = #v60
    local v62 = table.create(#p58)
    for v63, v64 in p58 do
        local _ = v63 - 1
        v62[v63] = p56:spawnRavenModel(v64, v59)
    end
    table.move(v62, 1, #v62, v61 + 1, v60)
    for v65, v66 in v60 do
        local _ = v65 - 1
        v59:GiveTask(v66)
    end
    p56.ravenGroupMap[p57] = {
        ["otherPositions"] = p58,
        ["models"] = v60,
        ["maid"] = v59
    }
end
function u20.spawnRavenModel(_, p67, p68) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u14
        [4] = u13
    --]]
    local v69 = u9.Assets.Misc.Raven:Clone()
    local v70 = CFrame.new(p67 - Vector3.new(0, 0.8, 0))
    local v71 = CFrame.Angles
    local v72 = 360 * math.random()
    v69:PivotTo(v70 * v71(0, math.rad(v72), 0))
    v69.Parent = u10
    local u73 = u14:playAnimation(v69.AnimationController.Animator, u13.HALLOWEEN_RAVEN_IDLE_LOOP)
    if u73 then
        u73:Play()
        p68:GiveTask(function() --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73:Stop()
            u73:Destroy()
        end)
    end
    return v69
end
u5.CreateController(u20.new())
return nil