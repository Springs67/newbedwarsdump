-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local resolve = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "Promise").resolve;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    shopPurchaseItem = function(u1, p2) -- Line: 9, Name: shopPurchaseItem
        -- upvalues: KnitClient (copy), resolve (copy), default (copy), SoundManager (copy), GameSound (copy), ClientStore (copy)
        local function _() -- Line: 10
        end;

        if KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[u1.itemType] ~= nil then
            return resolve(false);
        end;

        return default.Client:Get("BedwarsPurchaseItem"):CallServerAsync({
            shopItem = u1,
            shopId = p2
        }):andThen(function(p3) -- Line: 22
            -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), u1 (copy)
            if not p3 then
                return false;
            end;

            SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);
            ClientStore:dispatch({
                type = "BedwarsAddItemPurchased",
                itemType = u1.itemType
            });

            return true;
        end);
    end
};