local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta-block-textures").SetupItemMetaBlockTextures
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-pack-handler").TexturePackHandler
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-packs")
local u8 = v7.getTexturePackMeta
local u9 = v7.TexturePack
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "TexturePackController"
    end,
    ["__index"] = u3
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
    --]]
    u3.constructor(p14)
    p14.Name = "TexturePackController"
    p14.texturePack = u9.DEFAULT
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u8
        [4] = u9
        [5] = u6
        [6] = u5
        [7] = u4
    --]]
    u3.KnitStart(u15)
    u10.Client:Get("SetPlayerTexturePack"):Connect(function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u6
            [4] = u5
            [5] = u4
            [6] = u15
        --]]
        local v17 = u8(p16)
        if p16 ~= u9.DEFAULT then
            u6.setupTexturePack(p16)
            u5(u4, v17.tarmacAssetPath)
        end
        u15.texturePack = p16
    end)
end
function u11.getTexturePack(p18) --[[ Line: 44 ]]
    return p18.texturePack
end
v2.CreateController(u11.new())
return nil