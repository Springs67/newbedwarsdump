-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local SurvivalEndedModal = RuntimeLib.import(script, script.Parent, "survival-ended-modal").SurvivalEndedModal;

return function(p3) -- Line: 8
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), SurvivalEndedModal (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(SurvivalEndedModal, {
            AppId = "SurvivalEndedModal"
        }) }), p3);

    return function() -- Line: 19
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;