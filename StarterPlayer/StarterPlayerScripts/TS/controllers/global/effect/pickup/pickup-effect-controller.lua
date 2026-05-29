local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.RunService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PickupEffectController"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p12)
    p12.Name = "PickupEffectController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p13)
end
function u9.playEffect(_, u14, u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u6
        [4] = u7
    --]]
    if u15 == nil then
        u15 = u5.LocalPlayer.Character
    end
    local u16 = u3.new()
    local u17 = u14.CFrame
    local v18 = math.random() * 3.141592653589793 * 2
    local v19 = math.cos(v18)
    local v20 = math.sin(v18)
    local u21 = Vector3.new(v19, 0, v20) * 3
    if u15 ~= nil then
        local v22 = u15.PrimaryPart
    end
    if not v22 then
        return nil
    end
    local u23 = u15:GetPrimaryPartCFrame()
    local u24 = 0
    u16:GiveTask(u6.Heartbeat:Connect(function(p25) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u23
            [4] = u7
            [5] = u24
            [6] = u21
            [7] = u17
            [8] = u14
        --]]
        local v26 = u15
        if v26 ~= nil then
            v26 = v26.PrimaryPart
            if v26 ~= nil then
                v26 = v26.CFrame
            end
        end
        if not v26 then
            u16:DoCleaning()
            return nil
        end
        local v27 = p25 * 80
        local v28 = (u23.Position - v26.Position).Magnitude
        local v29 = v27 / v28
        if v28 > 20 then
            v29 = (v28 - 20 + v27) / v28
        end
        u23 = u23:Lerp(v26, (math.clamp(v29, 0, 1)))
        local v30 = u7.CurrentCamera
        if v30 ~= nil then
            v30 = v30.CFrame
        end
        if not v30 then
            u16:DoCleaning()
            return nil
        end
        u24 = u24 + p25
        local v31 = 0
        local v32 = u24
        v31 = v31 + 0.14
        if v32 < v31 then
            local v33 = (u24 - (v31 - 0.14)) / 0.14
            local v34 = v26 + (u21 + Vector3.new(0, 8, 0))
            local v35 = CFrame.new(v34.Position)
            local v36 = v34.Position
            local v37 = CFrame.new(v36, v30.Position).LookVector
            local v38 = v37.X
            local v39 = v37.Z
            local v40 = Vector3.new(v38, 0, v39)
            local v41 = (v40.Magnitude == 0 and Vector3.new(1, 0, 0) or v40).Unit
            u14.CFrame = u17:Lerp(v35 * CFrame.new(Vector3.new(0, 0, 0), v41), (math.pow(v33, 0.4)))
        else
            local v42 = u24
            v31 = v31 + 0.12
            if v42 < v31 then
                local v43 = (u24 - (v31 - 0.12)) / 0.12
                local v44 = u21 + Vector3.new(0, 6, 0)
                local v45 = (u21 + Vector3.new(0, 8, 0)):Lerp(v44, (math.pow(v43, 0.25)))
                local v46 = u23.Position
                u14.CFrame = CFrame.new(v45 + v46)
            else
                local v47 = u24
                v31 = v31 + 0.08
                if v47 < v31 then
                    local v48 = u21 + Vector3.new(0, 6, 0)
                    local v49 = u23.Position
                    u14.CFrame = CFrame.new(v48 + v49)
                else
                    local v50 = u24
                    v31 = v31 + 0.06
                    if v50 >= v31 then
                        u16:DoCleaning()
                        return nil
                    end
                    local v51 = (u24 - (v31 - 0.06)) / 0.06
                    local v52 = u21 + Vector3.new(0, 3, 0)
                    local v53 = (u21 + Vector3.new(0, 6, 0)):Lerp(v52, v51)
                    local v54 = u23.Position
                    u14.CFrame = CFrame.new(v53 + v54)
                    u14.Size = u14.Size:Lerp(Vector3.new(0, 0, 0), v51)
                end
            end
        end
    end))
    return u16
end
v2.CreateController(u9.new())
return nil