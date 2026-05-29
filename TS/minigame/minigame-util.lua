local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "MinigameUtil"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(_) --[[ Line: 16 ]] end
function u1.getMinigameTeamIdByPlayer(_, p4) --[[ Line: 18 ]]
    return p4:GetAttribute("MinigameTeamId")
end
u1.INFO_SCREEN_DURATION = 10
u1.MINIGAME_COUNTDOWN = 10
return {
    ["MinigameUtil"] = u1
}