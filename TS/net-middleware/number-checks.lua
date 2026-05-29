local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = nil
local function v8() --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
    --]]
    return function(u5, _) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        return function(p6, ...) --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u4
                [3] = u5
                [4] = u2
            --]]
            local v7 = { ... }
            if not p6 then
                return nil
            end
            if not u3:IsServer() then
                return nil
            end
            if not u4(unpack(v7)) then
                return u5(p6, unpack(v7))
            end
            u2.Error("{namespace}: player {userId} attempted to send a remote with a too-big number or NaN", "CheckNumbersMiddleware", p6.UserId)
        end
    end
end
u4 = function(...) --[[ Name: shouldBlockNumericalData, Line 36 ]]
    local function u26(p9) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        if type(p9) == "number" then
            return p9 ~= p9 or math.abs(p9) == (1 / 0)
        end
        if type(p9) == "string" then
            local v10 = tonumber(p9)
            if v10 ~= nil then
                return v10 ~= v10 or math.abs(v10) == (1 / 0)
            end
        else
            if typeof(p9) == "Vector3" then
                local v11 = p9.X
                local v12 = v11 ~= v11 or math.abs(v11) == (1 / 0)
                if not v12 then
                    local v13 = p9.Y
                    v12 = v13 ~= v13 or math.abs(v13) == (1 / 0)
                    if not v12 then
                        local v14 = p9.Z
                        v12 = v14 ~= v14 or math.abs(v14) == (1 / 0)
                    end
                end
                return v12
            end
            if typeof(p9) == "Vector2" then
                local v15 = p9.X
                local v16 = v15 ~= v15 or math.abs(v15) == (1 / 0)
                if not v16 then
                    local v17 = p9.Y
                    v16 = v17 ~= v17 or math.abs(v17) == (1 / 0)
                end
                return v16
            end
            if typeof(p9) == "Color3" then
                local v18 = p9.R
                local v19 = v18 ~= v18 or math.abs(v18) == (1 / 0)
                if not v19 then
                    local v20 = p9.G
                    v19 = v20 ~= v20 or math.abs(v20) == (1 / 0)
                    if not v19 then
                        local v21 = p9.B
                        v19 = v21 ~= v21 or math.abs(v21) == (1 / 0)
                    end
                end
                return v19
            end
            if typeof(p9) == "UDim" then
                local v22 = p9.Scale
                local v23 = v22 ~= v22 or math.abs(v22) == (1 / 0)
                if not v23 then
                    local v24 = p9.Offset
                    v23 = v24 ~= v24 or math.abs(v24) == (1 / 0)
                end
                return v23
            end
            if typeof(p9) == "UDim2" then
                return u26(p9.X) or u26(p9.Y)
            end
            if typeof(p9) == "CFrame" then
                return u26(p9.Position)
            end
            if type(p9) == "table" then
                for _, v25 in pairs(p9) do
                    if u26(v25) then
                        return true
                    end
                end
            end
        end
        return false
    end
    local v27 = false
    for _, v28 in { ... } do
        v27 = u26(v28)
        if v27 then
            break
        end
    end
    return v27
end
return {
    ["CheckNumberArgs"] = v8,
    ["isNaN"] = function(p29) --[[ Name: isNaN, Line 27 ]]
        return p29 ~= p29
    end,
    ["isInf"] = function(p30) --[[ Name: isInf, Line 30 ]]
        return math.abs(p30) == (1 / 0)
    end,
    ["isInvalidNum"] = function(p31) --[[ Name: isInvalidNum, Line 33 ]]
        return p31 ~= p31 or math.abs(p31) == (1 / 0)
    end,
    ["shouldBlockNumericalData"] = u4
}