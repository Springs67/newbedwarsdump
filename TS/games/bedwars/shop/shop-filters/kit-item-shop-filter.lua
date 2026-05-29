local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util")
local u3 = v2.areThereAnyMatchesInKitArrays
local u4 = v2.getActiveKits
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "KitItemShopFilter"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10, ...)
end
function u7.apply(p11, p12, p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v14 = p11:getInvalidItemsForKits(u4(p12), p13, p12)
    local v15 = 0
    local v16 = {}
    for v17, v18 in p13 do
        local _ = v17 - 1
        if v14[v18] == nil == true then
            v15 = v15 + 1
            v16[v15] = v18
        end
    end
    return v16
end
function u7.getInvalidItemsForKit(_, u19, p20) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local function v29(p21) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u5
        --]]
        local v22 = #(p21.requiresKit or {}) ~= 0
        if v22 then
            v22 = not u19
            if not v22 then
                local v23 = p21.requiresKit
                local v24 = u19
                local v25 = table.find(v23, v24) ~= nil
                v22 = not v25
            end
        end
        local v26 = p21.ignoredByKit
        if v26 then
            local v27 = p21.ignoredByKit
            local v28 = u19 or u5.NONE
            v26 = table.find(v27, v28) ~= nil
        end
        return v22 or v26
    end
    local v30 = 0
    local v31 = {}
    local v32 = {}
    for v33, v34 in p20 do
        if v29(v34, v33 - 1, p20) == true then
            v30 = v30 + 1
            v31[v30] = v34
        end
    end
    for _, v35 in v31 do
        v32[v35] = true
    end
    return v32
end
function u7.getInvalidItemsForKits(_, u36, p37, u38) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local function v48(p39) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u36
            [3] = u38
        --]]
        local v40 = p39.requiresKit or {}
        local v41
        if #v40 == 0 then
            v41 = false
        else
            v41 = u3(u36, v40)
        end
        local v42 = p39.ignoredByKit or {}
        local v43
        if #v42 == 0 then
            v43 = false
        else
            v43 = u3(u36, v42)
        end
        local v44 = p39.ignoreAttribute
        if v44 ~= "" and v44 then
            v44 = u38:GetAttribute(p39.ignoreAttribute)
        end
        if v44 ~= 0 and (v44 == v44 and (v44 ~= "" and v44)) then
            return true
        end
        local v45 = p39.requireAttribute
        if v45 ~= "" and v45 then
            local v46 = u38:GetAttribute(p39.requireAttribute)
            if v46 == 0 or v46 ~= v46 then
                v46 = false
            elseif v46 == "" then
                v46 = false
            end
            v45 = not v46
        end
        if v45 ~= "" and v45 then
            return true
        end
        local v47 = #v40 > 0 and not v41
        if v47 then
            v43 = v47
        elseif #v42 <= 0 then
            v43 = false
        end
        return v43
    end
    local v49 = 0
    local v50 = {}
    local v51 = {}
    for v52, v53 in p37 do
        if v48(v53, v52 - 1, p37) == true then
            v49 = v49 + 1
            v50[v49] = v53
        end
    end
    for _, v54 in v50 do
        v51[v54] = true
    end
    return v51
end
return {
    ["KitItemShopFilter"] = u7,
    ["default"] = u7.new()
}