-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getSkinsForKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").getSkinsForKit;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GiftType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local GiftUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "GiftController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "GiftController";
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: default (copy), PlaceUtil (copy), GiftUtils (copy), u2 (copy), KitViewport (copy), GiftType (copy), Flamework (copy), BedwarsAppIds (copy), u1 (copy), BedwarsKit (copy), getSkinsForKit (copy), UILayers (copy)
    default.Client:GetNamespace("Gift"):WaitFor("GiftReceived"):andThen(function(p7) -- Line: 39
        -- upvalues: PlaceUtil (ref), GiftUtils (ref), u2 (ref), KitViewport (ref), GiftType (ref), Flamework (ref), BedwarsAppIds (ref), u1 (ref), BedwarsKit (ref), getSkinsForKit (ref), UILayers (ref)
        p7:Connect(function(u8) -- Line: 40
            -- upvalues: PlaceUtil (ref), GiftUtils (ref), u2 (ref), KitViewport (ref), GiftType (ref), Flamework (ref), BedwarsAppIds (ref), u1 (ref), BedwarsKit (ref), getSkinsForKit (ref), UILayers (ref)
            if PlaceUtil.isGameServer() then
                return nil;
            end;

            local v9 = nil;

            if GiftUtils.isKitGift(u8.giftType) then
                v9 = u2.createElement(KitViewport, {
                    SizeConstraint = "RelativeYY",
                    Kit = u8.giftType,
                    Size = UDim2.fromScale(1, 1)
                });
            elseif GiftUtils.isKitSkinGift(u8.giftType) then
                v9 = u2.createElement(KitViewport, {
                    SizeConstraint = "RelativeYY",
                    Skin = u8.giftType,
                    Size = UDim2.fromScale(1, 1)
                });
            end;

            local function v15() -- Line: 59
                -- upvalues: u8 (copy), GiftType (ref), Flamework (ref), BedwarsAppIds (ref), GiftUtils (ref), u1 (ref), BedwarsKit (ref), getSkinsForKit (ref), UILayers (ref)
                if u8.giftType == GiftType.BattlePass then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});

                    return;
                end;

                if GiftUtils.isKitGift(u8.giftType) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                        SelectedKit = u8.giftType
                    });

                    return;
                end;

                if GiftUtils.isKitSkinGift(u8.giftType) then
                    local function _(p10) -- Line: 68
                        -- upvalues: getSkinsForKit (ref), u8 (ref)
                        local v11 = getSkinsForKit(p10);

                        if v11 then
                            return table.find(v11, u8.giftType) ~= nil;
                        end;
                    end;

                    local v12 = nil;

                    for i, v in u1.values(BedwarsKit) do
                        local _ = i - 1;
                        local v13 = getSkinsForKit(v);
                        local v14;

                        if v13 then
                            v14 = table.find(v13, u8.giftType) ~= nil;
                        else
                            v14 = nil;
                        end;

                        if v14 == true then
                            v12 = v;
                            break;
                        end;
                    end;

                    if v12 then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                            SelectedKit = v12
                        });
                    end;
                else
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
                end;
            end;

            local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local GIFTED = BedwarsAppIds.GIFTED;
            local v17 = {
                giftName = u8.gift.name
            };
            local imageId = u8.gift.imageId;

            if imageId == nil then
                imageId = nil;
            end;

            v17.giftImageId = imageId;
            v17.giftCustomImage = v9 or nil;
            v17.fromPlayer = u8.fromPlayer;
            v17.message = u8.message;
            v17.onGiftClick = v15;
            v16:openApp(GIFTED, v17);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;