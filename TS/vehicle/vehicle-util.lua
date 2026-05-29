local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "VehicleUtil"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(_) --[[ Line: 14 ]] end
function u1.isInVehicle(_, p4, p5) --[[ Line: 16 ]]
    for _, v6 in p5:GetDescendants() do
        if v6:IsA("Seat") and (v6.Occupant and v6.Occupant:IsDescendantOf(p4)) then
            return true
        end
    end
    return false
end
function u1.getOccupants(_, p7) --[[ Line: 26 ]]
    local v8 = {}
    for _, v9 in p7:GetDescendants() do
        if v9:IsA("Seat") and v9.Occupant then
            local v10 = v9.Occupant
            table.insert(v8, v10)
        end
    end
    return v8
end
function u1.getSeats(_, p11) --[[ Line: 38 ]]
    local v12 = {}
    for _, v13 in p11:GetDescendants() do
        if v13:IsA("Seat") then
            table.insert(v12, v13)
        end
    end
    return v12
end
function u1.isDriver(_, p14, p15) --[[ Line: 48 ]]
    return p14.Character and (p15.Driver.Occupant ~= nil and p15.Driver.Occupant:IsDescendantOf(p14.Character)) and true or false
end
return {
    ["VehicleUtil"] = u1
}