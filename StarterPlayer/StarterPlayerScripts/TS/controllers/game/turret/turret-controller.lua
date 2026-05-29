local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TurretController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "TurretController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
    --]]
    u6.KnitStart(p12)
    u4:GetInstanceRemovedSignal("Turret"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if u7:getState().Game.selectedTurret ~= p13 then
            return nil
        end
        u7:dispatch({
            ["type"] = "SetSpectatedTurret",
            ["selectedTurret"] = nil
        })
    end)
end
function u8.getNextTurret(p14, p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v16 = p14:getTurrets(p15)
    local v17 = u7:getState().Game.selectedTurret
    if v17 == nil then
        return v16[1]
    else
        local v18 = (table.find(v16, v17) or 0) - 1
        local v19 = v16[(v18 == -1 and 0 or v18) + 1 + 1]
        if v19 == nil then
            return v16[1]
        else
            return v19
        end
    end
end
function u8.getBackTurret(p20, p21) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v22 = p20:getTurrets(p21)
    local v23 = u7:getState().Game.selectedTurret
    if v23 == nil then
        return v22[1]
    else
        local v24 = v22[(table.find(v22, v23) or 0) - 1 - 1 + 1]
        if v24 == nil then
            return v22[#v22 - 1 + 1]
        else
            return v24
        end
    end
end
function u8.getTurrets(_, p25) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v26 = 0
    local v27 = {}
    for v28, v29 in u4:GetTagged(p25) do
        local _ = v28 - 1
        if v29:GetAttribute("PlacedByUserId") == u5.LocalPlayer.UserId == true then
            v26 = v26 + 1
            v27[v26] = v29
        end
    end
    return v27
end
v2.CreateController(u8.new())
return nil