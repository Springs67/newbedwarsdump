-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ComponentUtil = v1.ComponentUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local GameTheme = v1.GameTheme;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v19 = v3.new(u2)(function(p5, p6) -- Line: 18
    -- upvalues: GameCoreClientSyncEvents (copy), BedwarsAppIds (copy), GameTheme (copy), ColorUtil (copy), u2 (copy), ComponentUtil (copy), default (copy), Flamework (copy), SoundManager (copy), GameSound (copy), ShineEffect (copy), ShineEffectVariation (copy)
    local useEffect = p6.useEffect;
    local v7, u8 = p6.useState(false);
    useEffect(function() -- Line: 22
        -- upvalues: GameCoreClientSyncEvents (ref), BedwarsAppIds (ref), u8 (copy)
        GameCoreClientSyncEvents.AppClose:connect(function(p9) -- Line: 23
            -- upvalues: BedwarsAppIds (ref), u8 (ref)
            if p9.appId ~= BedwarsAppIds.BEDWARS_ITEM_SHOP then
                return nil;
            end;

            u8(false);
        end);
        GameCoreClientSyncEvents.AppOpen:connect(function(p10) -- Line: 29
            -- upvalues: BedwarsAppIds (ref), u8 (ref)
            if p10.appId ~= BedwarsAppIds.BEDWARS_ITEM_SHOP then
                return nil;
            end;

            u8(true);
        end);
    end, {});
    local mcGold = GameTheme.mcGold;
    local WHITE = ColorUtil.WHITE;
    local v11 = {
        ResetOnSpawn = false,
        DisplayOrder = 900
    };
    local v12 = {};
    local v13 = #v12;
    local v18 = not v7 and u2.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(200, 50),
        Position = UDim2.fromScale(0.5, 0.8),
        AnchorPoint = Vector2.new(0.5, 1)
    }, { u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.new(0.5, 0, 0.5, 10),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = ColorUtil.darken(mcGold, 0.5)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }) }), u2.createElement("ImageButton", {
            Size = UDim2.new(1, -4, 1, -4),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = mcGold,

            [u2.Event.MouseButton1Click] = function() -- Line: 67
                -- upvalues: ComponentUtil (ref), default (ref), Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
                local v14 = ComponentUtil:getAllComponents(default);

                if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.BEDWARS_ITEM_SHOP) then
                    local v15 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                    local BEDWARS_ITEM_SHOP = BedwarsAppIds.BEDWARS_ITEM_SHOP;
                    local v16 = {};
                    local v17 = v14[1];

                    if v17 ~= nil then
                        v17 = v17.attributes.Id;
                    end;

                    v16.shopId = v17;
                    v16.IsHomeBase = false;
                    v15:openApp(BEDWARS_ITEM_SHOP, v16);
                    SoundManager:playSound(GameSound.UI_CLICK_2);
                end;
            end,

            [u2.Event.MouseEnter] = function() -- Line: 84
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_HOVER);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 87
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_HOVER);
            end,

            LayoutOrder = 2
        }, {
            u2.createElement(ShineEffect, {
                OnHover = true,
                ZIndex = 100,
                Variation = ShineEffectVariation.solid
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }),
            u2.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.brighten(mcGold, 0.5)
            }),
            u2.createElement("TextLabel", {
                Text = "<b>Purchase Items</b>",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                Size = UDim2.fromScale(0.8, 0.45),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = WHITE
            })
        }) });

    if v18 then
        v12[v13 + 1] = v18;
    end;

    return u2.createElement("ScreenGui", v11, v12);
end);

return {
    PvPArenaShopButton = v4.connect(function(p20, p21) -- Line: 124
        local v22 = {};

        for i, v in p21 do
            v22[i] = v;
        end;

        return v22;
    end)(v19)
};