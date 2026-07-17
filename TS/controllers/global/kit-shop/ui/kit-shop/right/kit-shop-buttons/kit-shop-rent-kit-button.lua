-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta");
local ConsumableTypeMeta = v5.ConsumableTypeMeta;
local getConsumableMeta = v5.getConsumableMeta;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v18 = v3.new(u2)(function(u6, p7) -- Line: 25
    -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), Button (copy), getConsumableMeta (copy), ColorUtil (copy), Theme (copy), StringUtil (copy), getBedwarsKitMeta (copy), Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy), UILayers (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), ConsumableTypeMeta (copy)
    local _ = p7.useState;
    local u8 = u2.createRef();
    local u9;

    if DeviceUtil.isHoarceKat() then
        u9 = nil;
    else
        u9 = KnitClient.Controllers.KitRentalController:getEligibleRentalPass(u6.SelectedKit);
    end;

    return u2.createFragment({
        RentKitButton = u2.createElement(Button, {
            Size = u6.Size,
            BackgroundTransparency = 1,
            Selectable = true,
            [u2.Ref] = u8,

            OnClick = function() -- Line: 38, Name: OnClick
                -- upvalues: u9 (ref), getConsumableMeta (ref), ColorUtil (ref), Theme (ref), StringUtil (ref), getBedwarsKitMeta (ref), u6 (copy), Flamework (ref), BedwarsAppIds (ref), u8 (copy), SoundManager (ref), GameSound (ref), UILayers (ref)
                local function v13() -- Line: 39
                    -- upvalues: u9 (ref), getConsumableMeta (ref), ColorUtil (ref), Theme (ref), StringUtil (ref), getBedwarsKitMeta (ref), u6 (ref)
                    if not u9 then
                        return "You don\'t have any kit rental passes for " .. getBedwarsKitMeta(u6.SelectedKit).name .. ". You can receive rental passes by opening crates";
                    end;

                    local v10 = getConsumableMeta(u9.consumable);
                    local v11 = ColorUtil.richTextColor(Theme.mcAqua);
                    local displayName = v10.displayName;
                    local v12 = ColorUtil.richTextColor(Theme.mcAqua);
                    local activeDuration = v10.activeDuration;

                    return "Are you sure you want to use <font color=\"" .. v11 .. "\" transparency=\"0\"><b>1 " .. displayName .. "</b></font> to rent this kit for <font color=\"" .. v12 .. "\" transparency=\"0\"><b>" .. ((activeDuration == 0 or (activeDuration ~= activeDuration or not activeDuration)) and "7 days" or StringUtil.fromNow(os.time() + 1 + v10.activeDuration, {
                        hideIfZero = true,
                        long = true
                    })) .. "</b></font>?";
                end;

                local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v15 = {
                    Title = "Rent Kit?",
                    Body = v13()
                };
                local v16 = {
                    Text = "RENT"
                };
                local v17;

                if u9 then
                    v17 = Theme.backgroundSuccess;
                else
                    v17 = Theme.backgroundError;
                end;

                v16.BackgroundColor3 = v17;
                v15.PrimaryBtnProps = v16;
                v15.SecondaryBtnProps = {
                    Text = "CANCEL"
                };
                v15.PreviouslySelected = u8:getValue();

                function v15.OnPrimaryBtnClick() -- Line: 64
                    -- upvalues: u6 (ref), SoundManager (ref), GameSound (ref)
                    if u6.RentKit() then
                        SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);
                    end;
                end;

                function v15.OnSecondaryBtnClick() -- Line: 70
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v14:openApp(CONFIRMATION_MODAL, v15);
            end,

            LayoutOrder = u6.LayoutOrder
        }, {
            u2.createElement("UIStroke", {
                Color = Color3.fromRGB(45, 147, 240),
                Thickness = DeviceUtil.isSmallScreen() and 1 or 2,
                Transparency = u9 and 0 or 0.75
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(1000, 0)
            }),
            u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                Image = BedwarsImageId.KIT_RENTAL_PASS_ALL,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0.75, 0.75),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ImageTransparency = u9 and 0 or 0.75
            }),
            u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Rent Kit",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = not u9 and "NO PASS FOUND" or ConsumableTypeMeta[u9.consumable].displayName,
                    Font = Enum.Font.SourceSansSemibold,
                    Limits = Vector2.new(300, 500),
                    TextColor3 = Color3.fromRGB(130, 41, 255)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = getBedwarsKitMeta(u6.SelectedKit).name,
                    Font = Enum.Font.SourceSans,
                    Limits = Vector2.new(300, 500)
                }) })
        })
    });
end);

return {
    KitShopRentKitButton = v4.connect(function(p19, p20) -- Line: 122
        local v21 = {};

        for i, v in p20 do
            v21[i] = v;
        end;

        return v21;
    end)(v18)
};