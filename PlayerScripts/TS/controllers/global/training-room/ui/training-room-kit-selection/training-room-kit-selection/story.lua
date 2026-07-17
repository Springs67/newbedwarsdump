-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local TrainingRoomKitSelectionApp = RuntimeLib.import(script, script.Parent, "training-room-kit-selection-app").TrainingRoomKitSelectionApp;

return function(p3) -- Line: 10
    -- upvalues: u1 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), ClientStore (copy), CreateRoduxApp (copy), TrainingRoomKitSelectionApp (copy), u2 (copy)
    ClientStore:dispatch({
        type = "SetEquippedKitSkins",
        equippedKitSkins = (function() -- Line: 11
            -- upvalues: u1 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
            local v4 = u1.values(BedwarsKit);

            local function _(p5) -- Line: 13
                -- upvalues: BedwarsKitSkin (ref)
                return { p5, BedwarsKitSkin.DEFAULT };
            end;

            local v6 = table.create(#v4);

            for i, v in v4 do
                local _ = i - 1;
                v6[i] = { v, BedwarsKitSkin.DEFAULT };
            end;

            return u1.fromEntries(v6);
        end)()
    });
    ClientStore:dispatch({
        type = "AddOwnedKits",
        kits = { BedwarsKit.FROSTY_HAMMER }
    });
    ClientStore:dispatch({
        type = "BedwarsSetSome",
        data = {
            playerLevel = 20,
            freeKitLevel = 20
        }
    });
    local u7 = CreateRoduxApp("TrainingRoomKitSelectionApp", TrainingRoomKitSelectionApp, {}, {}, {
        Parent = p3
    });

    return function() -- Line: 44
        -- upvalues: u2 (ref), u7 (copy)
        u2.unmount(u7);
    end;
end;