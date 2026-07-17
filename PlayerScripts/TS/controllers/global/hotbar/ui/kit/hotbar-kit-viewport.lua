-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local EmptyButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").EmptyButton;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;

return {
    HotbarKitViewport = v2.new(u1)(function(p3, p4) -- Line: 10
        -- upvalues: Flamework (copy), BedwarsAppIds (copy), ClientStore (copy), u1 (copy), EmptyButton (copy), KitViewport (copy)
        local _ = p4.useState;

        local function _() -- Line: 12
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                SelectedKit = ClientStore:getState().Bedwars.kit
            });
        end;

        local kit = p3.store.Bedwars.kit;
        local v5;

        if kit and p3.store.Bedwars.equippedKitSkins then
            v5 = p3.store.Bedwars.equippedKitSkins[kit];
        else
            v5 = nil;
        end;

        return u1.createElement(EmptyButton, {
            Size = p3.Size or UDim2.fromScale(1, 1),
            AnchorPoint = p3.AnchorPoint,
            Position = p3.Position,
            SizeConstraint = "RelativeYY",

            [u1.Event.MouseButton1Click] = function() -- Line: 27
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                    SelectedKit = ClientStore:getState().Bedwars.kit
                });
            end
        }, { u1.createElement(KitViewport, {
                Kit = kit,
                Skin = v5,
                Size = UDim2.fromScale(1, 1)
            }) });
    end)
};