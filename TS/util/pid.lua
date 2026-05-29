local u1 = game:GetService("CollectionService")
local u2 = game:GetService("RunService")
local u3 = {}
u3.__index = u3
function u3.new(p4, p5, p6, p7, p8) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v9 = u3
    local v10 = setmetatable({}, v9)
    v10._min = p4
    v10._max = p5
    v10._kp = p6
    v10._kd = p7
    v10._ki = p8
    v10._preError = 0
    v10._integral = 0
    return v10
end
function u3.Reset(p11) --[[ Line: 42 ]]
    p11._preError = 0
    p11._integral = 0
end
function u3.Calculate(p12, p13, p14, p15) --[[ Line: 48 ]]
    local v16 = p14 - p15
    local v17 = p12._kp * v16
    p12._integral = p12._integral + v16 * p13
    local v18 = p12._ki * p12._integral
    local v19 = (v16 - p12._preError) / p13
    local v20 = p12._kd * v19
    local v21 = v17 + v18 + v20
    local v22 = p12._min
    local v23 = p12._max
    local v24 = math.clamp(v21, v22, v23)
    p12._preError = v16
    if p12._out then
        p12._out.Value = v24
    end
    return v24
end
function u3.SetMinMax(p25, p26, p27) --[[ Line: 66 ]]
    p25._min = p26
    p25._max = p27
end
function u3.Debug(u28, p29, p30) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    if not u28._debug and u2:IsStudio() then
        local v31 = Instance.new("Folder")
        v31.Name = p29
        local u32 = Instance.new("NumberValue")
        u32.Name = "Min"
        u32.Value = u28._min
        u32.Parent = v31
        local u33 = "_min"
        u32.Changed:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u33
                [3] = u32
            --]]
            u28[u33] = u32.Value
            u28:Reset()
        end)
        local u34 = Instance.new("NumberValue")
        u34.Name = "Max"
        u34.Value = u28._max
        u34.Parent = v31
        local u35 = "_max"
        u34.Changed:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u35
                [3] = u34
            --]]
            u28[u35] = u34.Value
            u28:Reset()
        end)
        local u36 = Instance.new("NumberValue")
        u36.Name = "KP"
        u36.Value = u28._kp
        u36.Parent = v31
        local u37 = "_kp"
        u36.Changed:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u37
                [3] = u36
            --]]
            u28[u37] = u36.Value
            u28:Reset()
        end)
        local u38 = Instance.new("NumberValue")
        u38.Name = "KI"
        u38.Value = u28._ki
        u38.Parent = v31
        local u39 = "_ki"
        u38.Changed:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u39
                [3] = u38
            --]]
            u28[u39] = u38.Value
            u28:Reset()
        end)
        local u40 = Instance.new("NumberValue")
        u40.Name = "KD"
        u40.Value = u28._kd
        u40.Parent = v31
        local u41 = "_kd"
        u40.Changed:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u41
                [3] = u40
            --]]
            u28[u41] = u40.Value
            u28:Reset()
        end)
        local v42 = Instance.new("NumberValue")
        v42.Name = "Output"
        v42.Value = 0
        v42.Parent = v31
        u28._out = v42
        u28._debug = v31
        u1:AddTag(v31, "__pidebug__")
        v31.Parent = p30
    end
end
function u3.Destroy(p43) --[[ Line: 109 ]]
    if p43._debug then
        p43._debug:Destroy()
    end
end
return u3