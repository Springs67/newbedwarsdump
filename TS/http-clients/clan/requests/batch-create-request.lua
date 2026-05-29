local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u2 = v1.HttpService
local u3 = v1.Workspace
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "BatchCreateRequest"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, p8) --[[ Line: 19 ]]
    p7.creates = p8
end
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BatchCreateRequestBuilder"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 35 ]]
    p12.creates = {}
end
function u9.appendClanCreate(p13, p14, p15) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v16 = -1
    for v17, v18 in p13.creates do
        local _ = v17 - 1
        if v18.clanId == p14.clanId == true then
            v16 = v17 - 1
            break
        end
    end
    if v16 >= 0 then
        table.remove(p13.creates, v16 + 1)
    end
    local v19 = {
        ["actionId"] = "CreateClan",
        ["performedByUserId"] = p15,
        ["timestamp"] = DateTime.fromUnixTimestamp(u3:GetServerTimeNow()):ToIsoDate(),
        ["uuid"] = u2:GenerateGUID(false),
        ["data"] = {
            ["createClan"] = {
                ["name"] = p14.name,
                ["description"] = p14.desc,
                ["tag"] = p14.tag
            }
        }
    }
    local v20 = p13.creates
    local v21 = {}
    for v22, v23 in p14 do
        v21[v22] = v23
    end
    v21.auditLogs = { v19 }
    table.insert(v20, v21)
    return p13
end
function u9.build(p24) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.new(p24.creates)
end
function u9.getCreates(p25) --[[ Line: 82 ]]
    return p25.creates
end
function u9.clear(p26) --[[ Line: 85 ]]
    table.clear(p26.creates)
end
function u9.clearAllExcept(p27, p28) --[[ Line: 88 ]]
    local v29 = 0
    local v30 = {}
    for v31, v32 in p27.creates do
        local _ = v31 - 1
        local v33 = v32.clanId
        if table.find(p28, v33) ~= nil == true then
            v29 = v29 + 1
            v30[v29] = v32
        end
    end
    p27.creates = v30
end
return {
    ["BatchCreateRequest"] = u4,
    ["BatchCreateRequestBuilder"] = u9
}