local v1 = {}
local function u14(p2, p3) --[[ Line: 5 ]]
    local v4 = p2:calculate(p3)
    local v5 = p3 + 0.01
    if v5 > 1 then
        local v6 = p2:calculate(p3 - 0.01)
        local v7 = v6.X
        local v8 = v4.Y
        local v9 = v6.Z
        return (v4 - Vector3.new(v7, v8, v9)).Unit
    else
        local v10 = p2:calculate(v5)
        local v11 = v10.X
        local v12 = v4.Y
        local v13 = v10.Z
        return (Vector3.new(v11, v12, v13) - v4).Unit
    end
end
v1.getForwardDirectionFromPoint = u14
function v1.getPerpendicularDirectionFromPoint(p15, p16) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v17 = u14(p15, p16)
    if not v17 then
        return nil
    end
    local v18 = -v17.Z
    local v19 = v17.X
    return Vector3.new(v18, 0, v19)
end
return {
    ["BezierCurveUtil"] = v1
}