local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").GreedyBlockHandler
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.RandomUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitServer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MaterialService
local u12 = v10.RunService
local u13 = v10.ServerStorage
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-packs").getTexturePackMeta
local u16 = {
    Enum.NormalId.Top,
    Enum.NormalId.Bottom,
    Enum.NormalId.Left,
    Enum.NormalId.Front,
    Enum.NormalId.Right,
    Enum.NormalId.Back
}
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "BedwarsGreedyBlockHandler"
    end,
    ["__index"] = u2
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, ...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p20, ...)
end
function u17.createNewInstance(p21, p22) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u4
        [4] = u9
        [5] = u12
        [6] = u7
        [7] = u8
        [8] = u15
    --]]
    local v23 = {
        ["Name"] = p21:getBlockType()
    }
    local v24 = u14
    local v25 = u14
    local v26 = u14
    v23.Size = Vector3.new(v24, v25, v26)
    v23.Material = p21.blockMeta.greedyMesh.material or Enum.Material.Fabric
    local v27 = p21.blockMeta.greedyMesh
    if v27 ~= nil then
        local v28 = v27.materialColor
        v27 = v28 ~= nil and #v28 or v28
    end
    if v27 == nil then
        v27 = false
    end
    local v29
    if v27 == 0 or (v27 ~= v27 or not v27) then
        v29 = u4.WHITE
    else
        local v30 = u5.fromList
        local v31 = p21.blockMeta.greedyMesh.materialColor
        v29 = v30(unpack(v31))
    end
    v23.Color = v29
    v23.CanCollide = true
    v23.Anchored = true
    local v32 = u9("Part", v23)
    local v33
    if u12:IsClient() then
        v33 = u7.Controllers.TexturePackController:getTexturePack()
    else
        v33 = u8.Services.TexturePackService:getServerTexturePack()
    end
    local v34 = u15(v33).blockTextures
    if v34 ~= nil then
        v34 = v34[p21.blockType]
    end
    if v34 == nil then
        v34 = p21.blockMeta.greedyMesh.textures
    end
    local v35 = true
    local v36 = v35
    for v37, v38 in v34 do
        local v39 = v37 - 1
        if v39 ~= #v34 - 1 then
            if v38 ~= v34[v39 + 1 + 1] then
                v35 = false
                v36 = v35
            end
        end
    end
    local v40 = false
    if v36 then
        local v41 = v34[1]
        if p21:getMaterialVariant(v41) then
            v32.MaterialVariant = v41
            v40 = true
        end
    end
    if not v40 then
        v32.Transparency = 1
        v32:SetAttribute("BlockCamera", true)
        for _, v42 in Enum.NormalId:GetEnumItems() do
            local v43 = p21:createFace(v32, p22, v42)
            if v43 then
                v43.Parent = v32
            end
        end
    end
    return v32
end
function u17.getMaterialVariant(_, p44) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u8
        [4] = u15
        [5] = u13
    --]]
    local v45 = u11:FindFirstChild(p44)
    if not v45 and u12:IsServer() then
        local v46 = u8.Services.TexturePackService:getServerTexturePack()
        local v47
        if v46 then
            local v48 = u15(v46).materialVariantsFolderName
            v47 = v48 == nil and "MaterialVariants" or v48
        else
            v47 = "MaterialVariants"
        end
        v45 = u13:FindFirstChild("Assets")
        if v45 ~= nil then
            v45 = v45:FindFirstChild(v47)
            if v45 ~= nil then
                v45 = v45:FindFirstChild(p44)
            end
        end
        if v45 == nil then
            v45 = u13:FindFirstChild("Assets")
            if v45 ~= nil then
                v45 = v45:FindFirstChild("MaterialVariants")
                if v45 ~= nil then
                    v45 = v45:FindFirstChild(p44)
                end
            end
        end
        if v45 then
            v45.Parent = u11
        end
    end
    return v45
end
function u17.getTextureId(p49, p50) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u8
        [4] = u15
        [5] = u16
    --]]
    local v51
    if u12:IsClient() then
        v51 = u7.Controllers.TexturePackController:getTexturePack()
    else
        v51 = u8.Services.TexturePackService:getServerTexturePack()
    end
    local v52
    if v51 then
        v52 = u15(v51).blockTextures
        if v52 ~= nil then
            v52 = v52[p49.blockType]
        end
        if v52 == nil then
            v52 = p49.blockMeta.greedyMesh
            if v52 ~= nil then
                v52 = v52.textures
            end
        end
    else
        v52 = p49.blockMeta.greedyMesh
        if v52 ~= nil then
            v52 = v52.textures
        end
    end
    if v52 then
        if #v52 > 1 then
            return v52[(table.find(u16, p50) or 0) - 1 + 1]
        else
            return v52[1]
        end
    else
        return nil
    end
end
return {
    ["BedwarsGreedyBlockHandler"] = u17
}