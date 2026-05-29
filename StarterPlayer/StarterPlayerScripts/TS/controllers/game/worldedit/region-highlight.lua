local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "RegionHighlight"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, p8, p9, p10) --[[ Line: 17 ]]
    p7.extraSizeIncrement = 0
    local v11
    if p10 == nil then
        v11 = p10
    else
        v11 = p10.extraSizeIncrement
    end
    if v11 ~= 0 and (v11 == v11 and v11) then
        local v12
        if p10 == nil then
            v12 = p10
        else
            v12 = p10.extraSizeIncrement
        end
        p7.extraSizeIncrement = v12
    end
    local v13 = p7:create(p8, p9, p10)
    local v14 = v13.part
    local v15 = v13.selectionBox
    local v16 = v13.decals
    p7.part = v14
    p7.selectionBox = v15
    p7.decals = v16
end
function u4.updateRegion(p17, p18, p19) --[[ Line: 38 ]]
    p17.part.Size = p17:getRegionSize(p18, p19)
    p17.part.Position = p17:getRegionCenter(p18, p19)
end
function u4.getPart(p20) --[[ Line: 42 ]]
    return p20.part
end
function u4.getSelectionBox(p21) --[[ Line: 45 ]]
    return p21.selectionBox
end
function u4.enable(p22) --[[ Line: 48 ]]
    p22.selectionBox.Visible = true
    for v23, v24 in p22.decals do
        local _ = v23 - 1
        v24.Transparency = 0
        local _ = v24.Transparency
    end
end
function u4.disable(p25) --[[ Line: 59 ]]
    p25.selectionBox.Visible = false
    for v26, v27 in p25.decals do
        local _ = v26 - 1
        v27.Transparency = 1
        local _ = v27.Transparency
    end
end
function u4.destroy(p28) --[[ Line: 70 ]]
    p28.part:Destroy()
    p28.selectionBox:Destroy()
end
function u4.create(u29, p30, p31, u32) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v33 = {}
    local v34
    if u32 == nil then
        v34 = u32
    else
        v34 = u32.name
    end
    v33.Name = v34 == nil and "HighlightBox" or v34
    v33.Size = u29:getRegionSize(p30, p31)
    v33.Position = u29:getRegionCenter(p30, p31)
    v33.Anchored = true
    v33.CanCollide = false
    v33.CanQuery = false
    v33.CanTouch = false
    v33.Parent = u3
    v33.Transparency = 1
    u29.part = u2("Part", v33)
    local v35 = {
        ["Name"] = "SelectionBox",
        ["SurfaceTransparency"] = 0.7,
        ["LineThickness"] = 0.04,
        ["Transparency"] = 0.3,
        ["Adornee"] = u29.part,
        ["Parent"] = u29.part,
        ["Color3"] = Color3.fromRGB(255, 46, 242),
        ["SurfaceColor3"] = Color3.fromRGB(158, 0, 172)
    }
    local v36
    if u32 == nil then
        v36 = u32
    else
        v36 = u32.selectionBox
    end
    if type(v36) == "table" then
        for v37, v38 in v36 do
            v35[v37] = v38
        end
    end
    u29.selectionBox = u2("SelectionBox", v35)
    local u39 = {}
    local v40
    if u32 then
        v40 = u32.decalTexture
    else
        v40 = u32
    end
    if v40 ~= "" and v40 then
        local v41 = Enum.NormalId:GetEnumItems()
        local function v47(p42) --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u29
                [3] = u2
                [4] = u39
            --]]
            local v43 = {
                ["Transparency"] = 0.5,
                ["Name"] = "HighlightDecal" .. p42.Name,
                ["Face"] = p42,
                ["Texture"] = u32.decalTexture
            }
            local v44 = u32
            if v44 ~= nil then
                v44 = v44.selectionBox
                if v44 ~= nil then
                    v44 = v44.Color3
                end
            end
            if v44 == nil then
                v44 = Color3.fromRGB(255, 255, 255)
            end
            v43.Color3 = v44
            v43.Parent = u29.part
            local v45 = u2("Decal", v43)
            local v46 = u39
            table.insert(v46, v45)
        end
        for v48, v49 in v41 do
            v47(v49, v48 - 1, v41)
        end
    end
    u29.decals = u39
    return {
        ["part"] = u29.part,
        ["selectionBox"] = u29.selectionBox,
        ["decals"] = u29.decals
    }
end
function u4.getRegionSize(p50, p51, p52) --[[ Line: 154 ]]
    local v53 = p52.X - p51.X
    local v54 = math.abs(v53) + p50.extraSizeIncrement
    local v55 = p52.Y - p51.Y
    local v56 = math.abs(v55) + p50.extraSizeIncrement
    local v57 = p52.Z - p51.Z
    local v58 = math.abs(v57) + p50.extraSizeIncrement
    return Vector3.new(v54, v56, v58)
end
function u4.getRegionCenter(_, p59, p60) --[[ Line: 160 ]]
    return (p60 + p59) / 2
end
return {
    ["RegionHighlight"] = u4
}