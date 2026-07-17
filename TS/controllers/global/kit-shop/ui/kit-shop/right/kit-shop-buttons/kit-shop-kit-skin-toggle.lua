-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Checkbox = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Checkbox;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    KitShopKitSkinToggle = v2.new(u1)(function(p3, p4) -- Line: 9
        -- upvalues: u1 (copy), Checkbox (copy), UserInputService (copy), default (copy), ClientStore (copy)
        local _ = p4.useState;

        return u1.createElement(Checkbox, {
            AspectRatio = 4.85,
            Selectable = false,
            Text = "<b>USE KIT SKIN" .. (UserInputService.GamepadEnabled and " (X)" or "") .. "</b>",
            Value = p3.UseKitSkin,

            SetValue = function(p5) -- Line: 14, Name: SetValue
                -- upvalues: default (ref), ClientStore (ref)
                default.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                    useKitSkin = p5
                }):andThen(function() -- Line: 18
                end):catch(function(p6) -- Line: 19
                    warn(p6);
                end);
                ClientStore:dispatch({
                    type = "SetUseKitSkin",
                    useKitSkin = p5
                });
            end,

            Size = p3.Size,
            LayoutOrder = p3.LayoutOrder
        });
    end)
};