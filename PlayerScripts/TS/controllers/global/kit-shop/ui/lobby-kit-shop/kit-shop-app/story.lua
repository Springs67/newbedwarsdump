-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KitShopApp = RuntimeLib.import(script, script.Parent, "kit-shop-app").KitShopApp;

return function(p3) -- Line: 10
    -- upvalues: u1 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), ClientStore (copy), CreateRoduxApp (copy), KitShopApp (copy), u2 (copy)
    ClientStore:dispatch({
        type = "SetEquippedKitSkins",
        equippedKitSkins = (function() -- Line: 11
            -- upvalues: u1 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
            local v4 = u1.values(BedwarsKit);

            local function v6(p5) -- Line: 13
                -- upvalues: BedwarsKit (ref), BedwarsKitSkin (ref)
                return p5 == BedwarsKit.FROSTY_HAMMER and { p5, BedwarsKitSkin.VOID_ADETUNDE } or { p5, BedwarsKitSkin.DEFAULT };
            end;

            local v7 = table.create(#v4);

            for i, v in v4 do
                v7[i] = v6(v, i - 1, v4);
            end;

            return u1.fromEntries(v7);
        end)()
    });
    ClientStore:dispatch({
        type = "AddOwnedKits",
        kits = {
            BedwarsKit.FROSTY_HAMMER,
            BedwarsKit.CYBER,
            BedwarsKit.NAZAR,
            BedwarsKit.AERY,
            BedwarsKit.FARMER_CLETUS,
            BedwarsKit.SKELETON,
            BedwarsKit.VOID_DRAGON,
            BedwarsKit.EMBER
        }
    });
    ClientStore:dispatch({
        type = "BedwarsSetSome",
        data = {
            playerLevel = 20,
            freeKitLevel = 20,
            favoriteKits = {
                [BedwarsKit.CYBER] = true,
                [BedwarsKit.NAZAR] = true,
                [BedwarsKit.FROSTY_HAMMER] = true
            },
            kit = BedwarsKit.FROSTY_HAMMER
        }
    });
    local u8 = CreateRoduxApp("KitShop", KitShopApp, {
        SelectedKit = BedwarsKit.FROSTY_HAMMER
    }, {}, {
        Parent = p3
    });

    return function() -- Line: 55
        -- upvalues: u2 (ref), u8 (copy)
        u2.unmount(u8);
    end;
end;