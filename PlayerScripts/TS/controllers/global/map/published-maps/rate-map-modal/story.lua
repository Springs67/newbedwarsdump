-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local RateMapModal = RuntimeLib.import(script, script.Parent, "rate-map-modal").RateMapModal;

return function(p3) -- Line: 8
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), RateMapModal (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(RateMapModal, {
            AppId = "RateMapModal",
            mapData = {
                mapEntityId = "",
                mapId = "",
                joinCode = "D9S3BG95LPZ0",
                creatorUserId = 1234,
                mapTitle = "5v5 Castlegrounds",
                mapDescription = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                thumbnailImage = "rbxassetid://13915009106"
            }
        }) }), p3);

    return function() -- Line: 29
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;