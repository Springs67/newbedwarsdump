-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueGroupType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType;
local QueueSelectionApp = RuntimeLib.import(script, script.Parent, "queue-selection-app").QueueSelectionApp;

return function(p2) -- Line: 9
    -- upvalues: u1 (copy), StoreProvider (copy), ClientStore (copy), QueueSelectionApp (copy), BedwarsAppIds (copy), QueueGroupType (copy)
    local u3 = u1.mount(u1.createElement(StoreProvider, {
        store = ClientStore
    }, { u1.createElement(QueueSelectionApp, {
            AppId = BedwarsAppIds.QUEUE_SELECTION,
            QueueSelectionType = QueueGroupType.BEDWARS_LUCKY_BLOCK
        }) }), p2);

    return function() -- Line: 18
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;