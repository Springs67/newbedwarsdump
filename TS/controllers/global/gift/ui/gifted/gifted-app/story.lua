-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local GiftedApp = RuntimeLib.import(script, script.Parent, "gifted-app").GiftedApp;

return function(p2) -- Line: 9
    -- upvalues: CreateRoduxApp (copy), GiftedApp (copy), u1 (copy), KitViewport (copy), BedwarsKit (copy), OfflinePlayerUtil (copy)
    local u3 = CreateRoduxApp("GiftedApp", GiftedApp, {
        giftName = "Grim Reaper",
        message = "Happy birthday buddy xd 🎂",
        giftCustomImage = u1.createElement(KitViewport, {
            BackgroundTransparency = 1,
            SizeConstraint = "RelativeYY",
            Kit = BedwarsKit.GRIM_REAPER,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }),
        fromPlayer = OfflinePlayerUtil.Dummy.LongNameMan
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 25
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;