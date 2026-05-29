local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "CosmicLuckyBlockController"
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
    p21.Name = "CosmicLuckyBlockController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u7
        [4] = u10
        [5] = u9
        [6] = u14
        [7] = u16
        [8] = u4
        [9] = u11
        [10] = u6
        [11] = u17
    --]]
    u13.KnitStart(u22)
    u15.Client:Get("CosmicLuckyBlockSpawn"):Connect(function(p23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u9
            [4] = u14
            [5] = u16
            [6] = u4
            [7] = u11
            [8] = u6
            [9] = u17
            [10] = u22
        --]]
        local v24 = u7.new()
        local v25 = Random.new(p23.randomSeed)
        local v26 = v25:NextNumber() * 3.141592653589793 * 2
        local v27 = v25:NextNumber() < 0.5 and 1 or 2
        local v28 = { p23.position + CFrame.Angles(0, v26, 0) * CFrame.Angles(-1.1344640137963142, 0, 0) * Vector3.new(0, 0, 180), p23.position }
        local v29 = false
        local v30 = 0
        while true do
            if v29 then
                v30 = v30 + 1
            else
                v29 = true
            end
            if v30 >= 5 then
                break
            end
            local v31 = v28[1]
            local v32 = CFrame.Angles
            local v33 = v30 + v27
            local v34 = v32(0, v26 + math.pow(-1, v33) * 0.7853981633974483, 0)
            local v35 = CFrame.Angles
            local v36 = v30 * 3 + -20
            local v37 = v31 + v34 * v35(math.rad(v36), 0, 0) * Vector3.new(0, 0, 120)
            table.insert(v28, 1, v37)
        end
        local v38 = p23.arriveTime - u10:GetServerTimeNow()
        local v39 = false
        local v40 = 0
        local v41 = 0
        while true do
            if v39 then
                v40 = v40 + 1
            else
                v39 = true
            end
            if v40 >= #v28 - 1 then
                break
            end
            v41 = v41 + (v28[v40 + 1] - v28[v40 + 1 + 1]).Magnitude
        end
        local u42 = u9.Assets.Blocks:FindFirstChild(u14.COSMIC_LUCKY_BLOCK)
        if u42 ~= nil then
            u42 = u42:Clone()
        end
        local v43 = u42:FindFirstChild("Root")
        if v43 ~= nil then
            local v44 = v43:FindFirstChild("EntryEffects")
            if v44 ~= nil then
                for v45, v46 in v44:GetDescendants() do
                    local _ = v45 - 1
                    if v46:IsA("ParticleEmitter") then
                        v46.Enabled = true
                    end
                    if v46:IsA("Trail") then
                        v46.Enabled = true
                    end
                end
            end
        end
        u42.Parent = u10
        local u47 = os.clock()
        local _ = { u16.COSMIC_LUCKY_BLOCK_BOUNCE_1, u16.COSMIC_LUCKY_BLOCK_BOUNCE_2, u16.COSMIC_LUCKY_BLOCK_BOUNCE_3 }
        local v48 = u4:playSound(u16.COSMIC_LUCKY_BLOCK_FLY_LOOP, {
            ["rollOffMaxDistance"] = 1200,
            ["rollOffMinDistance"] = 150,
            ["looped"] = true,
            ["parent"] = u42.PrimaryPart
        })
        local v49 = false
        local v50 = 0
        while true do
            if v49 then
                v50 = v50 + 1
            else
                v49 = true
            end
            if v50 >= #v28 - 1 then
                v24:DoCleaning()
                for _, v51 in u42:GetDescendants() do
                    if v51:IsA("Decal") then
                        v51.Transparency = 1
                    end
                    if v51:IsA("BasePart") then
                        v51.Transparency = 1
                        v51.CanCollide = false
                        v51.CanQuery = false
                    end
                    if v51:IsA("ParticleEmitter") then
                        v51.Enabled = false
                    end
                    if v51:IsA("PointLight") then
                        v51.Enabled = false
                    end
                    if v51:IsA("Trail") then
                        v51.Enabled = false
                    end
                end
                if v48 then
                    u4:tweenSoundVolume(v48, 0, 1)
                end
                task.delay(15, function() --[[ Line: 212 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                    --]]
                    u42:Destroy()
                end)
                return
            end
            local u52 = v28[v50 + 1]
            local u53 = v28[v50 + 1 + 1]
            local v54 = (u52 - u53).Magnitude / v41 * v38
            local u55 = (u53 - u52).Unit
            local u56 = nil
            u56 = u11(v54, u6, function(p57) --[[ Line: 140 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u56
                    [3] = u47
                    [4] = u55
                    [5] = u52
                    [6] = u53
                --]]
                local v58 = math.pow(p57, 0.6666666666666666)
                local v59 = u42.PrimaryPart
                if v59 ~= nil then
                    v59 = v59.Parent
                end
                if not v59 then
                    u56:Cancel()
                    return nil
                end
                local _ = os.clock() - u47
                local v60 = CFrame.new(Vector3.new(0, 0, 0), u55)
                local v61 = v58 * 3.141592653589793 * 2 * 2
                local v62 = math.sin(v61) * 5
                local v63 = v60 * Vector3.new(v62, 0, 0)
                u42:PivotTo(CFrame.new(u52):Lerp(CFrame.new(u53) + v63, v58))
            end)
            u56:Wait()
            local v64 = u42:FindFirstChild("Root")
            if v64 ~= nil then
                v64 = v64:FindFirstChild("EntryEffects")
                if v64 ~= nil then
                    v64 = v64:FindFirstChild("Blast")
                end
            end
            if v64 then
                u17:playEffects({ v64 }, nil)
            end
            local v65 = #v28 - 2
            local v66 = u16.COSMIC_LUCKY_BLOCK_BOUNCE_1
            if v65 / 2 < v50 then
                v66 = u16.COSMIC_LUCKY_BLOCK_BOUNCE_2
            end
            if v50 == #v28 - 2 then
                v66 = u16.COSMIC_LUCKY_BLOCK_BOUNCE_3
            end
            local v67 = v66 == u16.COSMIC_LUCKY_BLOCK_BOUNCE_3 and 1 or v50 / (v65 - 1) * 0.2 + 0.9
            u4:playSound(v66, {
                ["rollOffMaxDistance"] = 1200,
                ["rollOffMinDistance"] = 150,
                ["position"] = u42:GetPrimaryPartCFrame().Position,
                ["playbackSpeedMultiplier"] = v67
            })
            u22:attemptScreenShake(u53, u55)
        end
    end)
end
function u18.attemptScreenShake(_, p68, p69) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u12
    --]]
    local v70 = u10.CurrentCamera
    if not v70 then
        return nil
    end
    local v71, v72 = v70:WorldToScreenPoint(p68)
    if not v72 then
        return nil
    end
    local v73 = v71.X
    local v74 = v71.Y
    local v75 = math
    local v76 = (p68 - v70.CFrame.Position).Magnitude - 9
    local v77 = v70:ScreenPointToRay(v73, v74, (v75.max(v76, 0)))
    local v78 = u3:raycast(v77.Origin, v77.Direction)
    if v78 ~= nil then
        v78 = v78.Instance
    end
    if v78 then
        return nil
    end
    local v79 = math
    local v80 = 1 - (p68 - v70.CFrame.Position).Magnitude / 500
    local v81 = v79.clamp(v80, 0, 1)
    u12.shake(p68, p69, {
        ["magnitude"] = v81 * 0.3 + 0.05,
        ["duration"] = v81 * 0.15 + 0.05
    })
end
v5.CreateController(u18.new())
return nil