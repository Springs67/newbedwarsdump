local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "EntityHighlightController"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10)
    p10.Name = "EntityHighlightController"
    p10.entityCleanup = {}
end
function u7.KnitStart(p11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p11)
end
function u7.highlight(p12, p13, p14) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u5
    --]]
    local u15 = p14 == nil and {} or p14
    local v16 = p12.entityCleanup[p13]
    if v16 ~= nil then
        v16:DoCleaning()
    end
    local u17 = u3.new()
    p12.entityCleanup[p13] = u17
    local u18 = true
    u17:GiveTask(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18 = false
    end)
    local v19 = {}
    local v20 = #v19
    local v21 = p13:GetDescendants()
    local v22 = #v21
    table.move(v21, 1, v22, v20 + 1, v19)
    v19[v20 + v22 + 1] = p13
    local u23 = u18
    local u24 = {}
    for _, v25 in v19 do
        if v25:IsA("BasePart") and (not u15.shouldApplyToPart or u15.shouldApplyToPart(v25)) and v25.Transparency ~= 1 then
            for _, v26 in p12:highlightPart(v25, u15.color, u15.textureId) do
                table.insert(u24, v26)
            end
        end
    end
    local v27 = u15.transparency
    local u28 = v27 == nil and 0.4 or v27
    local v29 = u15.fadeInTime
    local u30 = (v29 == nil and 0 or v29) > 0
    local u31 = u4("NumberValue", {
        ["Value"] = u30 and 1 or u28
    })
    local function u34() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u31
        --]]
        for _, v32 in u24 do
            if v32.Parent then
                v32.Transparency = u31.Value
            else
                local v33 = (table.find(u24, v32) or 0) - 1
                table.remove(u24, v33 + 1)
            end
        end
    end
    local u35 = u31.Changed:Connect(function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34()
    end)
    u34()
    u17:GiveTask(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u31
        --]]
        u35:Disconnect()
        u31:Destroy()
    end)
    task.spawn(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u23
            [3] = u5
            [4] = u15
            [5] = u31
            [6] = u28
            [7] = u17
        --]]
        if u30 and u23 then
            local v36 = u5
            local v37 = u15.fadeInTime
            local v38 = v37 == nil and 0 or v37
            local v39 = {
                ["Value"] = u28
            }
            local u40 = v36:Create(u31, TweenInfo.new(v38, Enum.EasingStyle.Quad, Enum.EasingDirection.In), v39)
            u40:Play()
            u17:GiveTask(function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40:Cancel()
            end)
            u40.Completed:Wait()
        end
        if u15.lastsForever then
            return nil
        end
        if u15.duration ~= nil and u23 then
            task.wait(u15.duration)
        end
        if u15.fadeOutTime == nil or not u23 then
            if u15.fadeOutTime == nil and u23 then
                u31.Value = 1
            end
        else
            local u41 = u5:Create(u31, TweenInfo.new(u15.fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ["Value"] = 1
            })
            u41:Play()
            u17:GiveTask(function() --[[ Line: 130 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:Cancel()
            end)
            u41.Completed:Wait()
        end
        u17:DoCleaning()
    end)
    return u17
end
function u7.highlightPart(_, p42, p43, p44) --[[ Line: 141 ]]
    local v45 = {}
    for _, v46 in Enum.NormalId:GetEnumItems() do
        local v47 = v46.Value
        local v48 = "entity-highlight-texture:" .. tostring(v47)
        local v49 = p42:FindFirstChild(v48)
        if not v49 then
            v49 = Instance.new("Texture")
            v49.Name = v48
            v49.Face = v46
            v49.Parent = p42
        end
        v49.Texture = p44 == nil and "rbxassetid://5090332523" or p44
        v49.Color3 = p43 or Color3.new(1, 0, 0)
        v49.Transparency = 0.4
        table.insert(v45, v49)
    end
    return v45
end
v2.CreateController(u7.new())
return nil