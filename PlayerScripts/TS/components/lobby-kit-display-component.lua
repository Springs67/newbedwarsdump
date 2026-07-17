-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsArmorSet = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit");
local AngelKitUtil = v4.AngelKitUtil;
local AngelType = v4.AngelType;
local AxolotlType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local BarbarianKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "LobbyKitDisplayComponent";
    end
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, u8) -- Line: 37
    -- upvalues: u2 (copy), getBedwarsKitMeta (copy), BedwarsKitShop (copy), KnitClient (copy), Players (copy), Flamework (copy), BedwarsAppIds (copy), RuntimeLib (copy), ReplicatedStorage (copy), BedwarsArmorSet (copy), AccessoryUtil (copy), WeldUtil (copy), BedwarsKit (copy), AngelType (copy), AngelKitUtil (copy), BarbarianKit (copy), u1 (copy), AxolotlType (copy), GameQueryUtil (copy), Workspace (copy), CollectionService (copy)
    p7.maid = u2.new();

    if u8:IsA("BasePart") then
        u8.Transparency = 1;
    end;

    local u9 = u8:GetAttribute("Kit");
    local u10 = getBedwarsKitMeta(u9);
    local u11 = table.find(BedwarsKitShop.BattlePassPodiumKits, u9) ~= nil;
    KnitClient.Controllers.ProximityPromptController:createProximityPrompt({
        RequiresLineOfSight = false,
        MaxActivationDistance = 11,
        HoldDuration = 0,
        ActionText = u10.name,
        ObjectText = u11 and "View Battle Pass" or "View Kit",
        Parent = u8
    }).Triggered:Connect(function(p12) -- Line: 53
        -- upvalues: Players (ref), u11 (copy), Flamework (ref), BedwarsAppIds (ref), u9 (copy)
        if p12 == Players.LocalPlayer then
            if u11 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                SelectedKit = u9
            });
        end;
    end);
    RuntimeLib.Promise.defer(function() -- Line: 64
        -- upvalues: u8 (copy), u9 (copy), u10 (copy), ReplicatedStorage (ref), BedwarsArmorSet (ref), AccessoryUtil (ref), WeldUtil (ref), BedwarsKit (ref), AngelType (ref), AngelKitUtil (ref), BarbarianKit (ref), u1 (ref), AxolotlType (ref), KnitClient (ref), GameQueryUtil (ref), Workspace (ref), CollectionService (ref)
        local u13 = u8:WaitForChild(u9);
        local previewLobbyDisplayConfig = u10.previewLobbyDisplayConfig;

        if previewLobbyDisplayConfig ~= nil then
            previewLobbyDisplayConfig = previewLobbyDisplayConfig.armorSet;
        end;

        local Assets = ReplicatedStorage:FindFirstChild("Assets");

        if Assets ~= nil then
            Assets = Assets:FindFirstChild("Armor");
        end;

        local v14;

        if previewLobbyDisplayConfig == nil then
            v14 = nil;
        else
            v14 = BedwarsArmorSet[previewLobbyDisplayConfig];
        end;

        if Assets and v14 then
            for _, v in v14 do
                local v15 = Assets:FindFirstChild(v);

                if v15 then
                    for _, child in v15:GetChildren() do
                        if child:IsA("Accessory") then
                            AccessoryUtil:addAccessory(u13, child:Clone());
                        end;
                    end;
                end;
            end;
        end;

        local v16 = u10;

        if v16 ~= nil then
            v16 = v16.kitItems;
        end;

        if v16 ~= nil then
            for _, v in v16 do
                if v.previewOnLobbyDisplayModel then
                    local Items = ReplicatedStorage:FindFirstChild("Items");

                    if Items ~= nil then
                        Items = Items:FindFirstChild(v.itemType);

                        if Items ~= nil then
                            Items = Items:Clone();
                        end;
                    end;

                    if Items then
                        Items.Parent = u13;
                    end;
                end;
            end;

            WeldUtil:weldCharacterAccessories(u13);
        end;

        if u9 == BedwarsKit.ANGEL then
            task.defer(function() -- Line: 120
                -- upvalues: AngelType (ref), AngelKitUtil (ref), u13 (copy)
                local v17 = true;

                while true do
                    local v18;

                    if v17 then
                        v18 = AngelType.LIGHT;
                    else
                        v18 = AngelType.VOID;
                    end;

                    AngelKitUtil.changeAngelAppearance(u13, v18);
                    local v19 = task.wait(3);

                    if v19 == 0 or (v19 ~= v19 or not v19) then
                        return;
                    end;

                    v17 = not v17;
                end;
            end);

            return;
        end;

        if u9 == BedwarsKit.BARBARIAN then
            BarbarianKit.updateAppearance(u13, BarbarianKit.FULL_RAGE);

            return;
        end;

        if u9 == BedwarsKit.AXOLOTL then
            for _, v in u1.values(AxolotlType) do
                KnitClient.Controllers.AxolotlController:createClientOnlyAxolotlData(u13, v);
            end;

            return;
        end;

        if u9 == BedwarsKit.CYBER then
            local v20 = false;
            local v21 = 0;
            local v22 = { Vector3.new(2, 3, 2), Vector3.new(-2.5, 5, -2), Vector3.new(2, 1, -3.4), Vector3.new(-2.9, -1.3, 2.4) };

            while true do
                if true then
                    if v20 then
                        v21 = v21 + 1;
                    else
                        v20 = true;
                    end;
                end;

                if v21 >= #v22 then
                    break;
                end;

                local v23 = v22[v21 + 1];
                local v24 = ReplicatedStorage.Assets:WaitForChild("Projectiles"):WaitForChild("drone"):Clone();
                local Humanoid = v24:FindFirstChild("Humanoid");

                if Humanoid ~= nil then
                    Humanoid:Destroy();
                end;

                for _, descendant in v24:GetDescendants() do
                    if descendant:IsA("BasePart") then
                        descendant.Anchored = true;
                        descendant.CanCollide = false;
                        descendant.CastShadow = false;
                        GameQueryUtil:setQueryIgnored(descendant, true);
                    end;
                end;

                v24:PivotTo(u13:GetPrimaryPartCFrame() + v23);
                v24.Parent = Workspace;
                CollectionService:AddTag(v24, "LobbyDrone");
            end;
        end;
    end);
end;

function u5.Destroy(p25) -- Line: 173
    p25.maid:DoCleaning();
end;

u5.Tag = "LobbyKitDisplayComponent";

return u5;