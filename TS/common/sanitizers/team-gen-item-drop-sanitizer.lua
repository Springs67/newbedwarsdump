local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "TeamGenItemDropSanitizer"
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
function u1.sanitizeOnRetrieve(_, _) --[[ Line: 16 ]]
    return nil
end
function u1.sanitizeOnStore(_, p4) --[[ Line: 19 ]]
    local v5 = p4:GetAttributes().ItemSkin
    if v5 ~= nil and v5 ~= "" then
        return false
    end
    for v6, _ in p4:GetAttributes() do
        p4:SetAttribute(v6, nil)
    end
    for _, v7 in p4:GetTags() do
        p4:RemoveTag(v7)
    end
    p4.CFrame = CFrame.new(Vector3.new(0, 100000000, 0))
    p4.Anchored = true
    local v8 = p4:FindFirstChildOfClass("BodyForce")
    if v8 then
        v8.Force = Vector3.new(0, 0, 0)
    end
    return true
end
return {
    ["TeamGenItemDropSanitizer"] = u1
}