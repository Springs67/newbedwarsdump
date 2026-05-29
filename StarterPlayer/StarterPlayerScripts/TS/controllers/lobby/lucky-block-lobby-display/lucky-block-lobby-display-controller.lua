local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-rotation-util").LuckyBlockRotationUtil
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "LuckyBlockLobbyDisplayController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "LuckyBlockLobbyDisplayController"
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.KnitStart(u11)
    for v12, v13 in u4:GetTagged("LuckyBlockDisplay") do
        local _ = v12 - 1
        if v13:IsA("Model") and v13.PrimaryPart then
            u11:setUpLuckyBlockTextures(v13.PrimaryPart)
        end
    end
    u4:GetInstanceAddedSignal("LuckyBlockDisplay"):Connect(function(p14) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        if p14:IsA("Model") and p14.PrimaryPart then
            u11:setUpLuckyBlockTextures(p14.PrimaryPart)
        end
    end)
end
function u7.setUpLuckyBlockTextures(_, p15) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    local v16 = u6.getCurrentRotation()
    local v17 = u6.getLuckyBlockTextures(v16)
    if not v17 then
        return nil
    end
    for v18, v19 in p15:GetChildren() do
        local _ = v18 - 1
        if v19:IsA("Texture") and v19.Name == "Normal" then
            v19:Destroy()
        end
    end
    u3("Texture", {
        ["Name"] = "Top",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Top,
        ["Texture"] = v17[1],
        ["Parent"] = p15
    })
    local v20 = u3
    local v21 = "Texture"
    local v22 = {
        ["Name"] = "Bottom",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Bottom
    }
    local v23
    if #v17 == 1 then
        v23 = v17[1]
    else
        v23 = v17[2]
    end
    v22.Texture = v23
    v22.Parent = p15
    v20(v21, v22)
    local v24 = u3
    local v25 = "Texture"
    local v26 = {
        ["Name"] = "Left",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Left
    }
    local v27
    if #v17 == 1 then
        v27 = v17[1]
    else
        v27 = v17[3]
    end
    v26.Texture = v27
    v26.Parent = p15
    v24(v25, v26)
    local v28 = u3
    local v29 = "Texture"
    local v30 = {
        ["Name"] = "Front",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Front
    }
    local v31
    if #v17 == 1 then
        v31 = v17[1]
    else
        v31 = v17[4]
    end
    v30.Texture = v31
    v30.Parent = p15
    v28(v29, v30)
    local v32 = u3
    local v33 = "Texture"
    local v34 = {
        ["Name"] = "Right",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Right
    }
    local v35
    if #v17 == 1 then
        v35 = v17[1]
    else
        v35 = v17[5]
    end
    v34.Texture = v35
    v34.Parent = p15
    v32(v33, v34)
    local v36 = u3
    local v37 = "Texture"
    local v38 = {
        ["Name"] = "Back",
        ["StudsPerTileU"] = 6,
        ["StudsPerTileV"] = 6,
        ["Face"] = Enum.NormalId.Back
    }
    local v39
    if #v17 == 1 then
        v39 = v17[1]
    else
        v39 = v17[6]
    end
    v38.Texture = v39
    v38.Parent = p15
    v36(v37, v38)
end
v2.CreateController(u7.new())
return nil