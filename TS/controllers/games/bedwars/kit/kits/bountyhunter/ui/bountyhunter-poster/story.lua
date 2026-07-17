-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BountyHunterPoster = RuntimeLib.import(script, script.Parent, "bountyhunter-poster").BountyHunterPoster;

return function(p2) -- Line: 9
    -- upvalues: ClientStore (copy), Players (copy), BedwarsKit (copy), CreateRoduxApp (copy), BountyHunterPoster (copy), u1 (copy)
    ClientStore:dispatch({
        type = "KitBountyHunterSetTarget",
        bountyHunterTarget = Players.LocalPlayer or {
            UserId = 1,
            Name = "Vulcan"
        }
    });
    ClientStore:dispatch({
        type = "BedwarsSetKits",
        userId = 1,
        kit = BedwarsKit.VULCAN
    });
    local u3 = CreateRoduxApp("BountyHunterPoster", BountyHunterPoster, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 26
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;