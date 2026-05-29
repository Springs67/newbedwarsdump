local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "StatusEffectUtil"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(_) --[[ Line: 18 ]] end
function u5.getAttributeName(_, p8) --[[ Line: 20 ]]
    return "StatusEffect_" .. p8
end
function u5.getAllActive(p9, p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v11 = 0
    local v12 = {}
    for v13, v14 in u2.values(u4) do
        local _ = v13 - 1
        local v15 = p9:getActive(p10, v14)
        if v15 ~= nil then
            v11 = v11 + 1
            v12[v11] = v15
        end
    end
    return v12
end
function u5.getActive(p16, p17, p18) --[[ Line: 41 ]]
    local v19 = p16:getAttributeName(p18)
    local v20 = p17:GetAttribute(v19)
    local v21 = p17:GetAttribute(v19 .. "_stacks")
    local v22 = p17:GetAttribute(v19 .. "_extraNumbers")
    local v23 = {}
    if v22 ~= nil then
        for v24, v25 in string.split(v22, ",") do
            local _ = v24 - 1
            if v25 ~= nil then
                if v25 ~= "" then
                    local v26 = tonumber(v25)
                    if v26 ~= nil then
                        table.insert(v23, v26)
                    end
                end
            end
        end
    end
    local v27 = p17:GetAttribute(v19 .. "_extraBooleans")
    local v28 = {}
    if v27 ~= nil then
        for v29, v30 in string.split(v27, ",") do
            local _ = v29 - 1
            if v30 ~= nil then
                if v30 ~= "" then
                    local v31 = v30 == "1"
                    table.insert(v28, v31)
                end
            end
        end
    end
    if v20 == nil then
        return nil
    end
    local v32 = {
        ["statusEffect"] = p18
    }
    if v20 == -1 then
        v20 = nil
    end
    v32.expireTime = v20
    v32.stacks = v21
    if #v23 <= 0 then
        v23 = nil
    end
    v32.extraNumbers = v23
    if #v28 <= 0 then
        v28 = nil
    end
    v32.extraBooleans = v28
    return v32
end
function u5.isActive(p33, p34, p35) --[[ Line: 89 ]]
    return p34:GetAttribute(p33:getAttributeName(p35)) ~= nil
end
function u5.hasAnyActive(p36, p37, p38) --[[ Line: 92 ]]
    for _, v39 in p38 do
        if p36:isActive(p37, v39) then
            return true
        end
    end
    return false
end
function u5.getStacks(p40, p41, p42) --[[ Line: 100 ]]
    local v43 = p40:getActive(p41, p42)
    if v43 ~= nil then
        v43 = v43.stacks
    end
    return v43 == nil and 0 or v43
end
function u5.getStrengthLevel(p44, p45, p46) --[[ Line: 112 ]]
    local v47 = false
    local v48 = 0
    while true do
        if v47 then
            v48 = v48 + 1
        else
            v47 = true
        end
        if v48 >= #p46 then
            return 0
        end
        if p44:isActive(p45, p46[v48 + 1]) then
            return v48 + 1
        end
    end
end
function u5.getEntityInstances(p49, p50) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v51 = 0
    local v52 = {}
    for v53, v54 in u3:getAliveEntityInstances() do
        local _ = v53 - 1
        if p49:isActive(v54, p50) == true then
            v51 = v51 + 1
            v52[v51] = v54
        end
    end
    return v52
end
return {
    ["StatusEffectUtil"] = u5
}