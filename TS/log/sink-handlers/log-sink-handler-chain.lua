local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "LogSinkHandlerChain"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(p4, p5, p6) --[[ Line: 20 ]]
    p4.sink = p5
    p4.useNamespacePrefix = p6
    p4.handlers = {}
end
function u1.Emit(p7, p8) --[[ Line: 25 ]]
    local v9 = p7:runHandlers(p8)
    if v9.success then
        local v10
        if p7.useNamespacePrefix then
            v10 = {}
            for v11, v12 in v9.logEvent do
                v10[v11] = v12
            end
            v10.Template = "[{namespace}]: " .. v9.logEvent.Template
        else
            v10 = v9.logEvent
        end
        p7.sink:Emit(v10)
    end
end
function u1.withHandler(p13, p14) --[[ Line: 43 ]]
    local v15 = p13.handlers
    table.insert(v15, p14)
    return p13
end
function u1.runHandlers(p16, p17) --[[ Line: 49 ]]
    local v18 = {
        ["success"] = true,
        ["logEvent"] = p17
    }
    for _, v19 in p16.handlers do
        v18 = v19:handle(v18.logEvent)
        if not v18.success then
            break
        end
    end
    return v18
end
return {
    ["LogSinkHandlerChain"] = u1
}