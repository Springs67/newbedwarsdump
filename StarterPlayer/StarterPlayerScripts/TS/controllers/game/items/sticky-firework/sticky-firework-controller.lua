local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "sticky-firework", "sticky-firework-constants").StickyFireworkConstants
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "StickyFireworkController"
    end,
    ["__index"] = u11
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
        [1] = u11
    --]]
    u11.constructor(p21)
    p21.Name = "StickyFireworkController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
        [3] = u6
        [4] = u10
        [5] = u14
        [6] = u3
        [7] = u17
        [8] = u13
        [9] = u9
        [10] = u4
        [11] = u16
    --]]
    u11.KnitStart(u22)
    u15.Client:OnEvent("FireworkStickEvent", function(p23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u14
            [4] = u3
            [5] = u17
            [6] = u13
            [7] = u9
            [8] = u22
            [9] = u4
            [10] = u16
        --]]
        local v24 = u6.new()
        local v25 = u10:FindFirstChild("Items")
        if v25 ~= nil then
            v25 = v25:FindFirstChild(u14.STICKY_FIREWORK)
            if v25 ~= nil then
                v25 = v25:FindFirstChild("Handle")
                if v25 ~= nil then
                    v25 = v25:Clone()
                end
            end
        end
        if v25 then
            v24:GiveTask(v25)
            v25.Name = "Firework"
            if p23.hitEntity then
                v25.Parent = p23.hitEntity
            end
            if p23.hitEntity then
                local v26 = RaycastParams.new()
                local v27 = {}
                local v28 = #v27
                local v29 = 0
                local v30 = {}
                for v31, v32 in p23.hitEntity:GetChildren() do
                    local _ = v31 - 1
                    if v32.Name ~= "Firework" == true then
                        v29 = v29 + 1
                        v30[v29] = v32
                    end
                end
                table.move(v30, 1, #v30, v28 + 1, v27)
                v26.FilterDescendantsInstances = v27
                v26.FilterType = Enum.RaycastFilterType.Whitelist
                local v33 = u3:raycast(v25.Position, p23.hitPart.Position - v25.Position, v26)
                local v34
                if v33 == nil then
                    v34 = v33
                else
                    v34 = v33.Position
                end
                if v34 then
                    local v35 = v33.Position
                    local v36 = v33.Position
                    local v37 = v33.Normal
                    v25.CFrame = CFrame.new(v35, v36 + v37)
                end
            end
            v24:GiveTask(u17:weldParts(p23.hitPart, v25))
            task.wait(u13.TIME_TO_LAUNCH_SEC)
            local v38
            if p23.hitEntity == u9.LocalPlayer.Character then
                u22:getLaunched()
                v38 = true
            else
                v38 = false
            end
            local v39 = u4
            local v40 = u16.FIREWORK_LAUNCH
            local v41 = {}
            local v42
            if v38 then
                v42 = nil
            else
                v42 = v25.CFrame.Position
            end
            v41.position = v42
            v39:playSound(v40, v41)
            local v43 = u4
            local v44 = u16.FIREWORK_TRAIL
            local v45 = {
                ["looped"] = true
            }
            local v46
            if v38 then
                v46 = nil
            else
                v46 = v25.CFrame.Position
            end
            v45.position = v46
            local v47 = v43:playSound(v44, v45)
            if v47 then
                v24:GiveTask(v47)
            end
            local v48 = v25:FindFirstChildWhichIsA("ParticleEmitter")
            if v48 then
                v48.Enabled = true
            end
            task.wait(u13.LAUNCH_DURATION_SEC)
            u22:playEffect(v25.CFrame)
            v24:DoCleaning()
        end
    end)
end
function u18.getLaunched(_) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u13
    --]]
    local u49 = u9.LocalPlayer.Character
    if u49 ~= nil then
        u49 = u49.PrimaryPart
    end
    if not u49 then
        return nil
    end
    local u50 = u9.LocalPlayer.Character
    if u50 ~= nil then
        u50 = u50:FindFirstChild("Humanoid")
    end
    local v51 = u7
    local v52 = {
        ["Parent"] = u49
    }
    local v53 = u13.FIREWORK_VERTICAL_FORCE * u49.AssemblyMass
    v52.Force = Vector3.new(0, v53, 0)
    local u54 = v51("BodyForce", v52)
    if u50 then
        u50.PlatformStand = true
        task.delay(0.2, function() --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u50
            --]]
            u50.PlatformStand = false
        end)
    end
    u49.AssemblyLinearVelocity = u49.AssemblyLinearVelocity * Vector3.new(1, 20, 1)
    task.delay(u13.LAUNCH_DURATION_SEC, function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u49
        --]]
        if u54.Parent then
            u54:Destroy()
        end
        u49.AssemblyLinearVelocity = u49.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
    end)
end
function u18.playEffect(_, p55) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u5
        [4] = u12
    --]]
    u4:playSound(u16.GOO_SPLAT, {
        ["rollOffMaxDistance"] = 45,
        ["position"] = p55.Position
    })
    u5.Controllers.FireworkController:playFireworkEffect(p55.Position, u12.NORMAL)
end
u5.CreateController(u18.new())
return nil