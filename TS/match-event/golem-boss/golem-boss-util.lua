local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.TOP = 0
v8[0] = "TOP"
v9.BOTTOM = 1
v8[1] = "BOTTOM"
v9.LEFT = 2
v8[2] = "LEFT"
v9.RIGHT = 3
v8[3] = "RIGHT"
v9.TOP_RIGHT = 4
v8[4] = "TOP_RIGHT"
v9.TOP_LEFT = 5
v8[5] = "TOP_LEFT"
v9.BOTTOM_RIGHT = 6
v8[6] = "BOTTOM_RIGHT"
v9.BOTTOM_LEFT = 7
v8[7] = "BOTTOM_LEFT"
local u10 = {
    [v9.TOP] = Vector3.new(0, 0, 1),
    [v9.BOTTOM] = Vector3.new(0, 0, -1),
    [v9.LEFT] = Vector3.new(-1, 0, 0),
    [v9.RIGHT] = Vector3.new(1, 0, 0),
    [v9.TOP_RIGHT] = Vector3.new(1, 0, 1),
    [v9.TOP_LEFT] = Vector3.new(-1, 0, 1),
    [v9.BOTTOM_RIGHT] = Vector3.new(1, 0, -1),
    [v9.BOTTOM_LEFT] = Vector3.new(-1, 0, -1)
}
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
        return "GolemBossUtil"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(_) --[[ Line: 56 ]] end
function u11.getBlocksAroundOrigin(_, u14, u15) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
        [3] = u10
        [4] = u11
    --]]
    if u15 <= 0 then
        return nil
    else
        return u1.Promise.new(function(u16) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u3
                [3] = u10
                [4] = u15
                [5] = u11
            --]]
            task.spawn(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u3
                    [3] = u10
                    [4] = u15
                    [5] = u11
                    [6] = u16
                --]]
                local v17 = {
                    {
                        [u14] = true
                    }
                }
                local v18 = {}
                local v19 = {}
                for v20, v21 in u3.values(u10) do
                    local _ = v20 - 1
                    local v22 = u14 + v21
                    v18[v22] = true
                    v19[v22] = true
                end
                table.insert(v17, v19)
                local v23 = false
                local v24 = 1
                while true do
                    if v23 then
                        v24 = v24 + 1
                    else
                        v23 = true
                    end
                    if v24 >= u15 then
                        u16(v17)
                        return
                    end
                    v19 = u11:getBlockPositionsForNextLayer(v19)
                    local v25 = {}
                    for v26 in v19 do
                        if v18[v26] ~= nil then
                            v25[v26] = true
                        else
                            v18[v26] = true
                        end
                    end
                    for v27 in v25 do
                        local _ = v19[v27] == nil
                        v19[v27] = nil
                    end
                    table.insert(v17, v19)
                end
            end)
        end)
    end
end
function u11.getBlockPositionsForNextLayer(_, p28) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
    --]]
    local u29 = {}
    local function v33(p30) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u29
        --]]
        for v31, v32 in u3.values(u10) do
            local _ = v31 - 1
            u29[p30 + v32] = true
        end
    end
    for v34 in p28 do
        v33(v34, v34, p28)
    end
    return u29
end
function u11.createDummyBlockAt(_, p35, p36) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    local v37 = u2:getHandlerRegistry():getHandler(p36):place(p35, 0)
    v37.CanCollide = false
    v37.CanQuery = false
    v37.CastShadow = false
    v37.Parent = u7
    return v37
end
function u11.toggleDummyBlockVisibility(_, p38, p39) --[[ Line: 164 ]]
    local v40 = p39 and 0 or 1
    p38.Transparency = v40
    p38.CastShadow = false
    for v41, v42 in p38:GetChildren() do
        local _ = v41 - 1
        if v42:IsA("Texture") then
            v42.Transparency = v40
        end
    end
end
function u11.createBlockDangerIndicatorAt(_, p43, p44) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u7
        [4] = u4
    --]]
    if p44 == nil then
        p44 = Vector3.new()
    end
    local v45 = u6.Assets.Misc.DangerBlockIndicator:Clone()
    for v46, v47 in v45:GetDescendants() do
        local _ = v46 - 1
        if v47:IsA("BasePart") then
            v47.CanQuery = false
            v47.CastShadow = false
        end
    end
    local v48 = u2:getWorldPosition(p43)
    v45:PivotTo(CFrame.new(v48) + p44)
    v45.Parent = u7:FindFirstChild("TitanDangerBlocks") or u4("Folder", {
        ["Name"] = "TitanDangerBlocks",
        ["Parent"] = u7
    })
    return v45
end
function u11.toggleBlockDangerIndicatorVisibility(_, p49, p50) --[[ Line: 212 ]]
    local v51 = p50 and 0.85 or 1
    local v52 = p50 and 0 or 1
    for v53, v54 in p49:GetDescendants() do
        local _ = v53 - 1
        if v54:IsA("BasePart") and (v54.Name ~= "BaseIndicator" and v54.Name ~= "UpperIndicator") then
            local v55 = v54.Parent
            if v55 ~= nil then
                v55 = v55.Name
            end
            if v55 == "BaseIndicator" then
                v54.Transparency = v52
            end
            local v56 = v54.Parent
            if v56 ~= nil then
                v56 = v56.Name
            end
            if v56 == "UpperIndicator" then
                v54.Transparency = v51
            end
        end
    end
end
return {
    ["GolemBossUtil"] = u11
}