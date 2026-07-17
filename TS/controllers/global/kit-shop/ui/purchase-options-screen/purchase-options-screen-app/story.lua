-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local PurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local PurchaseOptionsScreenApp = RuntimeLib.import(script, script.Parent, "purchase-options-screen-app").PurchaseOptionsScreenApp;

return function(p2) -- Line: 9
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), CreateRoduxApp (copy), PurchaseOptionsScreenApp (copy), u1 (copy), PurchaseButton (copy)
    local v3 = getBedwarsKitMeta(BedwarsKit.JELLYFISH);
    local u4 = CreateRoduxApp("PurchaseOptionScreenApp", PurchaseOptionsScreenApp, {}, {
        Description = "Please select your payment method.",
        Title = "Purchase " .. v3.name .. " Kit",
        Image = v3.renderImage,
        Buttons = { u1.createElement(PurchaseButton, {
                Size = UDim2.new(0.4, 0, 1, 0),
                Cost = { {
                        robux = 100
                    } },

                OnClick = function() -- Line: 21, Name: OnClick
                end
            }), u1.createElement(PurchaseButton, {
                Size = UDim2.new(0.4, 0, 1, 0),
                Cost = { {
                        bedcoin = 100
                    } },

                OnClick = function() -- Line: 27, Name: OnClick
                end
            }) },

        OnExit = function() -- Line: 29, Name: OnExit
            print("Exit");
        end,

        OnBack = function() -- Line: 32, Name: OnBack
            print("Back");
        end
    }, {
        Parent = p2
    });

    return function() -- Line: 38
        -- upvalues: u1 (ref), u4 (copy)
        u1.unmount(u4);
    end;
end;