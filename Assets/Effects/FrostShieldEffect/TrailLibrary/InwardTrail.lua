local u1 = game:GetService("RunService")
local u2 = require(script.Bezier)
local v3 = {}
local function u6(p4, p5) --[[ Line: 7 ]]
    return Random.new():NextNumber(p4, p5)
end
local u12 = {
    ["easeOutQuint"] = function(p7) --[[ Name: easeOutQuint, Line 14 ]]
        local v8 = 1 - p7
        return 1 - math.pow(v8, 5)
    end,
    ["easeOutCubic"] = function(p9) --[[ Name: easeOutCubic, Line 18 ]]
        local v10 = 1 - p9
        return 1 - math.pow(v10, 3)
    end,
    ["Linear"] = function(p11) --[[ Name: Linear, Line 22 ]]
        return p11
    end
}
function v3.Init(_, p13, p14) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
        [3] = u12
        [4] = u2
    --]]
    local v15 = p13.StartPoint
    local u16 = p13.EndPoint
    local u17 = p14.Duration or 0.3
    local _ = p14.Radius or 15
    local v18 = p14.Offset or 15
    local v19 = p14.Interval or 0.1
    local v20 = p14.Count or 1
    local v21 = p14.CurveOffset or 14
    local v22 = p14.BaseProjectile or script.BaseProjectile
    local u23 = p14.Easing or "Linear"
    for _ = 1, v20 do
        local u24 = nil
        local u25 = os.clock()
        local v26 = -v21
        local v27 = Random.new():NextNumber(v26, v21)
        local v28 = -v21
        local v29 = Random.new():NextNumber(v28, v21)
        local v30 = u6
        local v31 = -v21
        local u32 = Vector3.new(v27, v29, v30(v31, v21))
        if not u32 then
            local v33 = Random.new():NextNumber(-15, 15)
            local v34 = Random.new():NextNumber(-5, 10)
            local v35 = u6
            u32 = Vector3.new(v33, v34, v35(-15, 15))
        end
        local v36 = -v18
        local v37 = Random.new():NextNumber(v36, v18)
        local v38 = -v18
        local v39 = Random.new():NextNumber(v38, v18)
        local v40 = u6
        local v41 = -v18
        local v42 = Vector3.new(v37, v39, v40(v41, v18))
        local v43
        if typeof(u16) == "Vector3" then
            v43 = u16
        elseif u16:IsA("BasePart") then
            v43 = u16.Position
        else
            v43 = nil
        end
        local u44 = v15 or v43 + v42
        local u45 = v22:Clone()
        u45.Position = u44
        u45.Trail.Enabled = true
        u45.Parent = workspace
        local _ = u1.RenderStepped:Connect(function(_) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u17
                [3] = u12
                [4] = u23
                [5] = u16
                [6] = u44
                [7] = u32
                [8] = u2
                [9] = u45
                [10] = u24
            --]]
            local v46 = (os.clock() - u25) / u17
            if u12[u23] then
                v46 = u12[u23](v46)
            end
            local v47 = u16
            local v48
            if typeof(v47) == "Vector3" then
                v48 = u16
            elseif u16:IsA("BasePart") then
                v48 = u16.Position
            else
                v48 = nil
            end
            local v49 = u44:Lerp(v48, 0.45) + u32
            local v50 = u2.QuadBezier(v46, u44, v49, v48)
            if v46 >= 1 then
                u45.Position = v48
                task.delay(u45.Trail.Lifetime, function() --[[ Line: 80 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    u45.Trail.Enabled = false
                    u45:Destroy()
                end)
                u24:Disconnect()
            else
                u45.Position = v50
            end
        end)
        task.wait(v19)
    end
end
return v3