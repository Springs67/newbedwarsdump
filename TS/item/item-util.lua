local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v8 = {}
local u9 = nil
local u10 = nil
function v8.createItemInstance(u11, p12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u10
        [4] = u4
    --]]
    local v14 = p12 == nil and 1 or p12
    local u15 = p13 == nil and "" or p13
    u9():timeout(5):catch(function(p16) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
            [3] = u15
        --]]
        u3:default():Warn("CreateItemInstance failed to create for " .. u11 .. " " .. u15 .. ". " .. tostring(p16))
    end):expect()
    local v17 = u10(u11)
    if u15 ~= "" and u15 ~= nil then
        v17 = u10(u11, u15) or v17
    end
    local v18
    if v17 then
        v18 = v17:Clone()
    else
        v18 = u4("Accessory", {})
    end
    v18.Name = u11
    v18:SetAttribute("Amount", v14)
    if u15 ~= "" and u15 ~= nil then
        v18:SetAttribute("ItemSkin", u15)
    end
    return v18
end
function v8.isItemsSetupReady() --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5:FindFirstChild("ItemsReady").Value
end
u9 = function() --[[ Name: waitForItemsSetupAsync, Line 44 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u5
    --]]
    return u1.Promise.new(function(p19) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v20 = u5:WaitForChild("ItemsReady")
        if v20.Value then
            p19(v20.Value)
        else
            p19((v20.Changed:Wait()))
        end
    end)
end
v8.waitForItemsSetupAsync = u9
u10 = function(p21, p22) --[[ Name: getItemInstance, Line 55 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v23 = u5:FindFirstChild("Items")
    if v23 ~= nil then
        if p22 ~= nil then
            p21 = p22
        end
        v23 = v23:FindFirstChild(p21)
    end
    return v23
end
v8.getItemInstance = u10
function v8.waitForItemInstance(p24, p25) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v26 = u5:WaitForChild("Items", 3)
    if v26 ~= nil then
        if p25 ~= nil then
            p24 = p25
        end
        v26 = v26:WaitForChild(p24, 3)
    end
    return v26
end
function v8.getDisplayName(p27) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v28 = u7(p27).displayName
    if v28 == nil then
        v28 = tostring(p27)
    end
    return v28
end
local u29 = {
    v6.WOOL_BLUE,
    v6.WOOL_CYAN,
    v6.WOOL_GREEN,
    v6.WOOL_ORANGE,
    v6.WOOL_PINK,
    v6.WOOL_PURPLE,
    v6.WOOL_RED,
    v6.WOOL_WHITE,
    v6.WOOL_YELLOW
}
function v8.getRandomWoolColor() --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u29
    --]]
    local v30 = u29
    return u2.fromList(unpack(v30))
end
function v8.cloneItemIntoModel(p31) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v32 = u4("Model", {
        ["Name"] = p31.Name
    })
    for v33, v34 in p31:GetChildren() do
        local _ = v33 - 1
        v34:Clone().Parent = v32
    end
    for v35, v36 in v32:GetDescendants() do
        local _ = v35 - 1
        if v36:IsA("Trail") then
            v36.Enabled = true
        end
        if v36:IsA("BasePart") then
            v36.Anchored = false
            v36.CanCollide = false
        end
    end
    v32.PrimaryPart = v32:FindFirstChildWhichIsA("BasePart")
    return v32
end
return {
    ["ItemUtil"] = v8
}