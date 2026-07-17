-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local RewardList = RuntimeLib.import(script, script.Parent, "reward-list").RewardList;
local RewardShowcase = RuntimeLib.import(script, script.Parent, "reward-showcase").RewardShowcase;

return function(p3) -- Line: 11
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), RewardList (copy), RewardShowcase (copy), BedwarsKit (copy), KillEffectType (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(RewardList, {}, { u1.createElement(RewardShowcase, {
                Reward = {
                    paid = false,
                    kit = BedwarsKit.AERY
                }
            }), u1.createElement(RewardShowcase, {
                Reward = {
                    paid = false,
                    killEffect = KillEffectType.SNOWBALL
                }
            }), u1.createElement(RewardShowcase, {
                Reward = {
                    paid = false,
                    clanShopContribution = 1000
                }
            }) }) }), p3);

    return function() -- Line: 39
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;