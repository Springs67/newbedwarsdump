local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "InstanceCache"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, p6, p7, p8, p9, p10) --[[ Line: 16 ]]
    local v11 = p8 == nil and 100 or p8
    local v12 = p9 == nil and 1 or p9
    local v13 = p10 == nil and {} or p10
    p5.cacheFolder = p6
    p5.sanitizer = p7
    p5.totalCacheSizeLimit = v11
    p5.identifierLimit = v12
    p5.dissallowList = v13
    p5.instancesByIdentifier = {}
end
function u2.getInstance(p14, p15) --[[ Line: 33 ]]
    local v16 = p14.instancesByIdentifier[p15]
    local v17
    if v16 == nil then
        v17 = v16
    else
        local v18 = #v16
        v17 = v16[v18]
        v16[v18] = nil
    end
    if v17 then
        p14.sanitizer:sanitizeOnRetrieve(v17)
    end
    return v17
end
function u2.cacheOrDestroyInstance(p19, p20, p21) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p19.dissallowList[p21] ~= nil then
        p20:Destroy()
        return nil
    end
    if p20.Parent == p19.cacheFolder then
        u1.Warn("Attempted to cache a cached instance with identifier " .. p21)
        return nil
    end
    local v22 = 0
    for _ in p19.instancesByIdentifier do
        v22 = v22 + 1
    end
    if p19.totalCacheSizeLimit <= v22 then
        p20:Destroy()
        return nil
    end
    local v23 = p19.instancesByIdentifier[p21]
    local v24 = v23 == nil and {} or v23
    if #v24 >= p19.identifierLimit then
        p20:Destroy()
        return nil
    end
    p20.Parent = p19.cacheFolder
    if not p19.sanitizer:sanitizeOnStore(p20) then
        p20:Destroy()
        return nil
    end
    table.insert(v24, p20)
    p19.instancesByIdentifier[p21] = v24
end
return {
    ["InstanceCache"] = u2
}