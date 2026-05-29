local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v4.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = nil
local function u20(p10, p11) --[[ Line: 25 ]]
    local v12 = RaycastParams.new()
    v12.FilterType = Enum.RaycastFilterType.Blacklist
    local v13 = {}
    if p11 then
        table.insert(v13, p11)
    end
    if p10.Character then
        local v14 = p10.Character
        table.insert(v13, v14)
        local v15 = p10.Character:FindFirstChildOfClass("Humanoid")
        if v15 and v15.SeatPart then
            local v16 = v15.SeatPart.Parent
            if v16 and v16:IsA("Model") then
                table.insert(v13, v16)
                for _, v17 in v16:GetDescendants() do
                    if v17:IsA("Seat") then
                        local v18 = v17.Occupant
                        if v18 then
                            local v19 = v18.Parent
                            table.insert(v13, v19)
                        end
                    end
                end
            end
        end
    end
    v12.FilterDescendantsInstances = v13
    return v12
end
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 59 ]]
        return "HelicopterMissile"
    end
})
u21.__index = u21
function u21.new(...) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, p25, p26, p27) --[[ Line: 68 ]]
    p24.startPosition = p25
    p24.direction = p26
    p24.owner = p27
end
function u21.fire(p28, p29, u30) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
        [4] = u3
        [5] = u7
        [6] = u2
        [7] = u8
        [8] = u20
    --]]
    local u31 = p28.direction
    local u32 = p28.startPosition
    local u33 = time() - p29
    local u34 = u6:IsClient()
    local u35 = u32
    local u36 = math.random() * 6.283185307179586
    local u37, u38
    if u34 then
        u37 = u5.Assets.Misc.HeliMissile:Clone()
        if not u9 then
            u9 = u3("Folder", {
                ["Name"] = "HeliMissiles",
                ["Parent"] = u7
            })
        end
        u37.Parent = u9
        u2:playSound(u8.GUIDED_MISSILE_FIRE, {
            ["position"] = u32
        })
        u38 = u2:playSound(u8.GUIDED_MISSILE_LOOP, {
            ["looped"] = true,
            ["rollOffMaxDistance"] = 100,
            ["parent"] = u37
        })
    else
        u37 = nil
        u38 = nil
    end
    local u39 = u20(p28.owner, u37)
    local u40 = nil
    local function u44(p41) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u30
            [3] = u37
            [4] = u38
        --]]
        u40:Disconnect()
        u30(p41)
        if u37 then
            u37.Transparency = 1
            u38:Stop()
            for _, v42 in u37:GetDescendants() do
                if v42:IsA("Beam") or (v42:IsA("Trail") or v42:IsA("ParticleEmitter")) then
                    v42.Enabled = false
                end
            end
            task.delay(4, function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                local v43 = u37
                if v43 ~= nil then
                    v43 = v43:Destroy()
                end
                return v43
            end)
        end
        task.spawn(u30, p41)
    end
    local function u50(p45, p46) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u7
            [3] = u35
            [4] = u39
            [5] = u50
            [6] = u44
            [7] = u32
            [8] = u34
            [9] = u36
            [10] = u37
        --]]
        local v47 = u7:Raycast(u35, u31 * (100 * p45), u39)
        if v47 == nil then
            u35 = u32 + u31 * (100 * p46)
        else
            if not v47.Instance.CanCollide then
                local v48 = u39.FilterDescendantsInstances
                local v49 = v47.Instance
                table.insert(v48, v49)
                u39.FilterDescendantsInstances = v48
                u50(p45, p46)
                return nil
            end
            u35 = v47.Position
            u44(v47)
        end
        if u34 then
            u36 = (u36 + 12.566370614359172 * p45) % 6.283185307179586
            u37.CFrame = CFrame.lookAt(u35, u35 + u31) * CFrame.Angles(0, 0, u36)
        end
    end
    local function v53(p51) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u44
            [3] = u50
        --]]
        debug.profilebegin("HelicopterMissileUpdate")
        local v52 = time() - u33
        if v52 > 3 then
            u44()
            debug.profileend()
            return nil
        end
        u50(p51, v52)
        debug.profileend()
    end
    u40 = u6.Heartbeat:Connect(v53)
    u50(p29, p29)
end
return {
    ["MISSILE_FIRE_RATE"] = 0.75,
    ["HelicopterMissile"] = u21
}