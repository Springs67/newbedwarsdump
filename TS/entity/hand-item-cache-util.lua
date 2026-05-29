local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "HandItemCacheUtil"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
function u4.getParentFolder(p7) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if p7.folder then
        return p7.folder
    end
    p7.folder = u2("Folder", {
        ["Name"] = "HandItemCache",
        ["Parent"] = u3.Terrain
    })
    return p7.folder
end
function u4.cacheItem(p8, p9, p10) --[[ Line: 30 ]]
    local v11 = p8.cacheMap[p9]
    if v11 then
        v11[p10.Name] = p10
    else
        local v12 = {
            [p10.Name] = p10
        }
        p8.cacheMap[p9] = v12
    end
    p10.Parent = nil
end
function u4.fetchItem(p13, p14, p15) --[[ Line: 50 ]]
    if not p14 then
        return nil
    end
    local v16 = p13.cacheMap[p14]
    local v17
    if v16 == nil then
        v17 = v16
    else
        v17 = v16[p15.Name]
    end
    if v17 then
        if v16 ~= nil then
            v16[p15.Name] = nil
        end
        return v17
    end
end
u4.cacheMap = {}
return {
    ["HandItemCacheUtil"] = u4
}