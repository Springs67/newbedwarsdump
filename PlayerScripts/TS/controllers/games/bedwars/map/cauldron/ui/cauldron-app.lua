-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BrewablePotions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "cauldron-types").BrewablePotions;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CauldronCard = RuntimeLib.import(script, script.Parent, "cauldron-card").CauldronCard;
local u3 = u2.Component:extend("CauldronApp");

function u3.init(p4) -- Line: 18
end;

function u3.render(u5) -- Line: 20
    -- upvalues: u2 (copy), DarkBackground (copy), getItemMeta (copy), ItemType (copy), default (copy), SoundManager (copy), GameSound (copy), CauldronCard (copy), BrewablePotions (copy), Empty (copy), SlideIn (copy)
    local v6 = { u2.createElement(DarkBackground, {
            AppId = u5.props.AppId
        }) };
    local v7 = {};

    local function v13(u8, p9) -- Line: 29
        -- upvalues: getItemMeta (ref), ItemType (ref), default (ref), u5 (copy), SoundManager (ref), GameSound (ref), u2 (ref), CauldronCard (ref)
        local v10 = {
            MenuPosition = "main"
        };
        local displayName = getItemMeta(u8).displayName;
        v10.Name = displayName == nil and "brokey" or displayName;
        v10.Price = 3;
        v10.Currency = ItemType.DIAMOND;

        function v10.Purchased() -- Line: 41
            -- upvalues: default (ref), u5 (ref), u8 (copy), SoundManager (ref), GameSound (ref)
            default.Client:WaitFor("BrewPotionInCauldron"):andThen(function(p11) -- Line: 43
                -- upvalues: u5 (ref), u8 (ref), SoundManager (ref), GameSound (ref)
                p11:CallServerAsync({
                    cauldron = u5.props.cauldron,
                    potion = u8
                }):andThen(function(p12) -- Line: 48
                    -- upvalues: SoundManager (ref), GameSound (ref)
                    if p12 == true then
                        SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end);
            end);
        end;

        v10.LayoutOrder = p9;
        v10.ButtonTextOverride = "<b>Buy Potion</b>";
        v10.QueueType = u5.props.store.Game.queueType;
        v10.ObservedInventory = u5.props.store.Inventory.observedInventory;
        v10.AutoSelect = p9 == 0;
        v10.IsHomeBase = false;

        return u2.createElement(CauldronCard, v10);
    end;

    local v14 = table.create(#BrewablePotions);

    for i, v in BrewablePotions do
        v14[i] = v13(v, i - 1, BrewablePotions);
    end;

    local v15 = {
        Size = UDim2.fromScale(0.98, 0.45),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v16 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            Padding = UDim.new(0.008, 0)
        }) };
    local v17 = #v16;

    for i, v in v14 do
        v16[v17 + i] = v;
    end;

    v7[#v7 + 1] = u2.createElement(Empty, v15, v16);
    v6[#v6 + 1] = u2.createElement(SlideIn, {}, v7);

    return u2.createFragment(v6);
end;

return {
    CauldronWrapper = function(p18) -- Line: 95, Name: CauldronWrapper
        -- upvalues: u2 (copy), u3 (ref)
        return u2.createElement("ScreenGui", {}, { u2.createElement(u3, {
                AppId = "CauldronApp",
                store = p18.store,
                cauldron = p18.cauldron
            }) });
    end,

    CauldronApp = u3
};