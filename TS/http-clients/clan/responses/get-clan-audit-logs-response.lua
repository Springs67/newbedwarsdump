local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 6 ]]
        return "GetClanAuditLogsResponse"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(p4, p5, p6) --[[ Line: 15 ]]
    p4.auditLogs = p5
    p4.cursor = p6
end
return {
    ["GetClanAuditLogsResponse"] = u1
}