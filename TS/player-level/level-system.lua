local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "LevelSystem"
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
function u1.constructor(p4, p5, p6, p7) --[[ Line: 14 ]]
    p4.startingLevel = p5
    p4.maxLevel = p6
    p4.getExperienceForLevel = p7
end
function u1.getLevelFromExperience(p8, p9) --[[ Line: 19 ]]
    local v10 = p8.startingLevel
    local v11 = p8.startingLevel + 1
    local v12 = false
    while true do
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 > p8.maxLevel then
            return v10
        end
        if p9 < p8:getTotalExperienceForLevel(v11) then
            return v10
        end
        v10 = v10 + 1
    end
end
function u1.getTotalExperienceForLevel(p13, p14) --[[ Line: 44 ]]
    local v15 = false
    local v16 = 0
    local v17 = 0
    while true do
        if v15 then
            v16 = v16 + 1
        else
            v15 = true
        end
        if v16 > p14 then
            return v17
        end
        v17 = v17 + p13.getExperienceForLevel(v16)
    end
end
function u1.getCurrExperienceProgression(p18, p19, p20) --[[ Line: 63 ]]
    return p19 - p18:getTotalExperienceForLevel(p20)
end
return {
    ["LevelSystem"] = u1
}