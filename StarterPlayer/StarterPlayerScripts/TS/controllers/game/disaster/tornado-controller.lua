local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "TornadoController"
    end,
    ["__index"] = u15
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
        [1] = u15
    --]]
    u15.constructor(p23)
    p23.Name = "TornadoController"
    p23.random = Random.new()
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u4
        [4] = u18
        [5] = u3
        [6] = u12
        [7] = u8
        [8] = u14
        [9] = u13
        [10] = u6
        [11] = u17
        [12] = u16
        [13] = u7
        [14] = u11
        [15] = u19
    --]]
    u15.KnitStart(u24)
    u10:GetInstanceAddedSignal("Tornado"):Connect(function(u25) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u18
            [3] = u3
            [4] = u12
            [5] = u8
            [6] = u14
            [7] = u13
            [8] = u6
        --]]
        local u26 = u4:playSound(u18.DISASTER_TORNADO_LOOP, {
            ["playbackSpeedMultiplier"] = 2,
            ["rollOffMaxDistance"] = 1000,
            ["looped"] = true,
            ["parent"] = u25,
            ["position"] = u25.Position
        })
        u3:setQueryIgnored(u25, true)
        local u27 = u12.Assets.Effects.Tornado:Clone()
        for _, v28 in u27:GetDescendants() do
            if v28:IsA("Weld") then
                v28:Destroy()
            end
            if v28:IsA("BasePart") then
                v28.Anchored = true
                u3:setQueryIgnored(v28, true)
            end
        end
        u8(u27, 0.1)
        u27:PivotTo(u25.CFrame)
        u27.Parent = u14
        local u29 = u25:GetAttribute("EndScalingTime")
        local u30 = u14:GetServerTimeNow()
        local v31 = u27:GetDescendants()
        local function v33(p32) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            if p32:IsA("BasePart") then
                return {
                    p32,
                    {
                        ["size"] = p32.Size,
                        ["positionOffset"] = p32.Position - u25.Position
                    }
                }
            end
        end
        local v34 = 0
        local v35 = {}
        local u36 = 0
        for v37, v38 in v31 do
            local v39 = v33(v38, v37 - 1, v31)
            if v39 ~= nil then
                v34 = v34 + 1
                v35[v34] = v39
            end
        end
        local u40 = {}
        for _, v41 in v35 do
            u40[v41[1]] = v41[2]
        end
        local u42 = math.random() * 5000
        local u56 = u13.Heartbeat:Connect(function(p43) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u14
                [3] = u30
                [4] = u29
                [5] = u6
                [6] = u27
                [7] = u40
                [8] = u25
                [9] = u42
            --]]
            u36 = u36 + p43
            local v44 = (u14:GetServerTimeNow() - u30) / (u29 - u30)
            local v45 = math.min(v44, 1)
            u6(v45, 6, 54, 1)
            for _, v46 in u27:GetDescendants() do
                if v46:IsA("BasePart") then
                    local v47 = u40[v46]
                    if v47 ~= nil then
                        local v48 = u6(v45, 1, 9, 1)
                        v46.Position = u25.Position:Lerp(u25.Position + v47.positionOffset, v48)
                        v46.Size = v47.size * v48
                    end
                end
            end
            local v49 = u27
            local v50 = u25.CFrame
            local v51 = CFrame.Angles
            local v52 = math.noise(u36, u42) * 15
            local v53 = math.rad(v52)
            local v54 = u36 * 20
            local v55 = math.noise(u36, -u42) * 15
            v49:PivotTo(v50 * v51(v53, v54, (math.rad(v55))))
        end)
        u25.AncestryChanged:Connect(function(_, p57) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u26
                [3] = u27
            --]]
            if p57 == nil then
                u56:Disconnect()
                local v58 = u26
                if v58 ~= nil then
                    v58:Destroy()
                end
                u27:Destroy()
            end
        end)
    end)
    u17.Client:GetNamespace("Disaster"):OnEvent("TornadoSucked", function(u59, p60) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u14
            [3] = u7
            [4] = u11
            [5] = u24
            [6] = u13
            [7] = u6
            [8] = u19
        --]]
        local u61 = u16:getLocalPlayerEntity()
        if u61 == nil then
            return nil
        end
        local u62 = u59:GetAttribute("EndScalingTime")
        local u63 = u14:GetServerTimeNow()
        local u64 = u7("BodyPosition", {
            ["D"] = 100,
            ["MaxForce"] = Vector3.new(50000000, 50000000, 50000000),
            ["Position"] = u59.Position,
            ["Parent"] = u11.LocalPlayer.Character.PrimaryPart
        })
        u61:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        local u65 = u24.random:NextNumber(-5000, 5000)
        local u66 = p60 - u14:GetServerTimeNow()
        local u67 = 0
        local u85 = u13.Heartbeat:Connect(function(p68) --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u14
                [3] = u63
                [4] = u62
                [5] = u6
                [6] = u66
                [7] = u65
                [8] = u59
                [9] = u64
            --]]
            u67 = u67 + p68
            local v69 = (u14:GetServerTimeNow() - u63) / (u62 - u63)
            local v70 = u6(math.min(v69, 1), 6, 30, 1)
            local v71 = u6(u67, 0, v70, u66)
            local v72 = math.noise(u67 * 3, 0, u65) * 8
            local v73 = math.noise(u67 * 1, 0, -u65) * 4
            local v74 = math.noise(u67 * 3, 0, u65 + u65) * 8
            local v75 = math.noise(u67, u65, 0) * 4
            local v76 = math.noise(u67, -u65, 0) * 4
            local v77 = u59.Position
            local v78 = u67 * 7
            local v79 = math.sin(v78) * (v70 + v75)
            local v80 = u67 * 7
            local v81 = math.cos(v80) * (v70 + v76)
            local v82 = Vector3.new(v79, 0, v81)
            local v83 = v71 + v73
            local v84 = Vector3.new(v72, v83, v74)
            u64.Position = v77 + v82 + v84
        end)
        task.delay(u66, function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u64
                [3] = u61
                [4] = u19
            --]]
            u85:Disconnect()
            u64:Destroy()
            local v86 = u61:getInstance().HumanoidRootPart
            if v86 == nil then
                return nil
            end
            v86:ApplyImpulse(u19.randomUnitVector(Vector3.new(0, 1, 0), 6.283185307179586) * v86.AssemblyMass * 10)
            task.wait(1)
            u61:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end)
    end)
end
v5.CreateController(u20.new())
return nil