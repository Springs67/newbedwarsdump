-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local StoreProvider = u2.StoreProvider;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent, "store").ClientStore;

return {
    BuildRoduxApp = function(p3, p4, p5, u6) -- Line: 9, Name: BuildRoduxApp
        -- upvalues: u2 (copy), u1 (copy), StoreProvider (copy), ClientStore (copy)
        local u7 = p4 == nil and {} or p4;
        local u8 = p5 == nil and {} or p5;
        local v13 = u2.connect(function(p9) -- Line: 16
            -- upvalues: u6 (copy), u7 (ref)
            local v10 = u6;

            if v10 ~= nil then
                v10 = v10.disableStore;
            end;

            if v10 == false then
                p9 = nil;
            end;

            local v11 = {
                store = p9
            };

            for i, v in u7 do
                v11[i] = v;
            end;

            return v11;
        end, function() -- Line: 29
            -- upvalues: u8 (ref)
            local v12 = {};

            for i, v in u8 do
                v12[i] = v;
            end;

            return v12;
        end)(p3);

        return u1.createElement(StoreProvider, {
            store = ClientStore
        }, { u1.createElement(v13) });
    end,

    CreateRoduxApp = function(p14, p15, p16, p17, u18) -- Line: 42, Name: CreateRoduxApp
        -- upvalues: Players (copy), u2 (copy), u1 (copy), StoreProvider (copy), ClientStore (copy)
        local u19 = p16 == nil and {} or p16;
        local u20 = p17 == nil and {} or p17;
        local v21;

        if u18 == nil then
            v21 = u18;
        else
            v21 = u18.Parent;
        end;

        if v21 == nil then
            v21 = Players.LocalPlayer:WaitForChild("PlayerGui");
        end;

        local v26 = u2.connect(function(p22) -- Line: 58
            -- upvalues: u18 (copy), u19 (ref)
            local v23 = u18;

            if v23 ~= nil then
                v23 = v23.disableStore;
            end;

            if v23 == false then
                p22 = nil;
            end;

            local v24 = {
                store = p22
            };

            for i, v in u19 do
                v24[i] = v;
            end;

            return v24;
        end, function() -- Line: 71
            -- upvalues: u20 (ref)
            local v25 = {};

            for i, v in u20 do
                v25[i] = v;
            end;

            return v25;
        end)(p15);

        return u1.mount(u1.createElement(StoreProvider, {
            store = ClientStore
        }, { u1.createElement(v26) }), v21, p14);
    end
};