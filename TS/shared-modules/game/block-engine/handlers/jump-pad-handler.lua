local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u2 = v1.BlockEngine
local u3 = v1.PrefabBlockHandler
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "JumpPadBlockHandler"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, ...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7, ...)
end
function u4.createNewInstance(p8, p9) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3.createNewInstance(p8, p9)
end
function u4.place(p10, p11, p12, p13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v14 = u3.place(p10, p11, p12)
    if p13 ~= nil then
        p13 = p13.player
        if p13 ~= nil then
            p13 = p13.Character
            if p13 ~= nil then
                p13 = p13:GetPivot()
            end
        end
    end
    if p13 then
        local v15 = (p11 - u2:getBlockPosition(p13.Position)).Unit * Vector3.new(1, 0, 1)
        if v15 ~= v15 or v15.Magnitude == 0 then
            v15 = p13.LookVector
        end
        local v16 = v14.Position
        local v17 = v14.Position
        local v18 = v15 * 5
        v14.CFrame = CFrame.new(v16, v17 + v18)
        local v19 = v15.X
        local v20 = v15.Z
        v14:SetAttribute("Direction", (Vector3.new(v19, 0.5, v20)))
        v14:SetAttribute("IgnoreTeam", true)
    end
    return v14
end
function u4.getContainedPositions(_, p21) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return { (u2:getBlockPosition(p21.Position)) }
end
return {
    ["JumpPadBlockHandler"] = u4
}