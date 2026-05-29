local function u5(p1, p2) --[[ Line: 13 ]]
    local v3 = p1:GetAttribute(p2.Name)
    if v3 == 0 or (v3 ~= v3 or (v3 == "" or not v3)) then
        local v4 = p1:FindFirstChild("Attributes")
        if v4 ~= nil then
            v4 = v4:FindFirstChild(p2.Name)
        end
        if not (v4 and v4:IsA("ValueBase")) then
            v4 = nil
        end
        if v4 then
            v3 = v4.Value
        end
    end
    if not p2.Guard(v3) then
        error("Invalid type (" .. typeof(v3) .. ") for attribute " .. p2.Name)
    end
    return v3
end
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 58 ]]
        return "Attribute"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, p10, p11) --[[ Line: 67 ]]
    p9.Name = p10
    p9.Guard = p11
end
return {
    ["GetAttribute"] = u5,
    ["SetAttribute"] = function(p12, p13, p14) --[[ Name: SetAttribute, Line 29 ]]
        if not p13.Guard(p14) then
            error(tostring(p14) .. " (" .. typeof(p14) .. ") for attribute " .. p13.Name .. " is incorrect type")
        end
        p12:SetAttribute(p13.Name, p14)
    end,
    ["GetAttributeChangedSignal"] = function(u15, u16, u17) --[[ Name: GetAttributeChangedSignal, Line 37 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local function v19(p18) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u17
            --]]
            if not u16.Guard(p18) then
                error("Invalid type (" .. typeof(p18) .. ") for attribute " .. u16.Name)
            end
            u17(p18)
        end
        local v20 = u15:FindFirstChild("Attributes")
        if v20 ~= nil then
            v20 = v20:FindFirstChild(u16.Name)
        end
        if not (v20 and v20:IsA("ValueBase")) then
            v20 = nil
        end
        if v20 then
            return v20.Changed:Connect(v19)
        else
            return u15:GetAttributeChangedSignal(u16.Name):Connect(function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u15
                    [3] = u16
                    [4] = u17
                --]]
                local v21 = u5(u15, u16)
                if not u16.Guard(v21) then
                    error("Invalid type (" .. typeof(v21) .. ") for attribute " .. u16.Name)
                end
                u17(v21)
            end)
        end
    end,
    ["Attribute"] = u6
}