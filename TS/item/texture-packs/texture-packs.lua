local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = "default"
v1.default = "DEFAULT"
v2.OG = "og"
v1.og = "OG"
local u3 = {
    [v2.DEFAULT] = {
        ["tarmacAssetPath"] = "blocks",
        ["materialVariantsFolderName"] = "MaterialVariants"
    },
    [v2.OG] = {
        ["tarmacAssetPath"] = "og_blocks",
        ["materialVariantsFolderName"] = "MaterialVariants_OG"
    }
}
return {
    ["TexturePack"] = v2,
    ["TexturePackMeta"] = u3,
    ["getTexturePackMeta"] = function(p4) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end
}