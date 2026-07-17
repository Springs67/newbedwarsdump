-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local items = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local SetupItemMetaBlockTextures = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta-block-textures").SetupItemMetaBlockTextures;
local TexturePackHandler = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-pack-handler").TexturePackHandler;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-packs");
local getTexturePackMeta = v1.getTexturePackMeta;
local TexturePack = v1.TexturePack;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TexturePackController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy), TexturePack (copy)
    KnitController.constructor(p4);
    p4.Name = "TexturePackController";
    p4.texturePack = TexturePack.DEFAULT;
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), default (copy), getTexturePackMeta (copy), TexturePack (copy), TexturePackHandler (copy), SetupItemMetaBlockTextures (copy), items (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("SetPlayerTexturePack"):Connect(function(p6) -- Line: 33
        -- upvalues: getTexturePackMeta (ref), TexturePack (ref), TexturePackHandler (ref), SetupItemMetaBlockTextures (ref), items (ref), u5 (copy)
        local v7 = getTexturePackMeta(p6);

        if p6 ~= TexturePack.DEFAULT then
            TexturePackHandler.setupTexturePack(p6);
            SetupItemMetaBlockTextures(items, v7.tarmacAssetPath);
        end;

        u5.texturePack = p6;
    end);
end;

function u2.getTexturePack(p8) -- Line: 44
    return p8.texturePack;
end;

KnitClient.CreateController(u2.new());

return nil;