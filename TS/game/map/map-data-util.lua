local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "tarmac", "tarmac-helpers").GetTarmacAsset
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta
local v4 = {}
local u5 = v2("NoImage").Image
v4.DEFAULT_MAP_IMAGE = u5
function v4.getMapDisplayName(p6) --[[ Line: 10 ]]
    return table.concat(string.split(string.split(p6, "_")[2], "-"), " ")
end
function v4.getMapType(p7) --[[ Line: 14 ]]
    return string.split(p7, "_")[1]
end
function v4.getMapImage(p8) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    local v9 = u3(p8)
    local v10 = string.split(p8, "_")[1]
    local v11
    if v9 == nil then
        v11 = v9
    else
        v11 = v9.mapImage
    end
    if not v11 then
        return u5
    end
    local v12
    if v10 then
        v12 = v9.mapImage[v10]
        if v12 ~= nil then
            v12 = v12.Image
        end
        if v12 == nil then
            v12 = u5
        end
    else
        v12 = u5
    end
    return v12
end
function v4.getMapCredits(p13) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v14 = u3(p13)
    local v15 = string.split(p13, "_")[1]
    if v15 then
        if v14 ~= nil then
            v14 = v14.credits
            if v14 ~= nil then
                v14 = v14[v15]
            end
        end
        return v14
    end
end
return {
    ["MapDataUtil"] = v4
}