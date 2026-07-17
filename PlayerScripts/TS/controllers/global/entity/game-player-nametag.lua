-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local StatefulEntityHpBar = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar").StatefulEntityHpBar;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local NametagConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local v46 = v4.new(u3)(function(u6, p7) -- Line: 21
    -- upvalues: u3 (copy), u2 (copy), KnitClient (copy), QueueType (copy), CollectionService (copy), DeviceUtil (copy), getQueueMeta (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), GamePlayerUtil (copy), BedwarsKitMeta (copy), NametagConfig (copy), Empty (copy), ColorUtil (copy), StatefulEntityHpBar (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, u9 = useState(u6.EntityInstance.Name);
    local v10, u11 = useState(nil);
    local v12, u13 = useState(false);
    local v14, u15 = useState(false);
    local v16, u17 = useState(nil);
    local u18 = u3.createRef();
    local v19 = (u6.EggCount == nil or u6.EggCount == 0) and 0 or u6.EggCount;
    useEffect(function() -- Line: 34
        -- upvalues: u2 (ref), KnitClient (ref), QueueType (ref), u13 (copy), u15 (copy), u17 (copy), u18 (copy), CollectionService (ref), u6 (copy), DeviceUtil (ref), getQueueMeta (ref), u11 (copy), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), GamePlayerUtil (ref), u9 (copy), BedwarsKitMeta (ref)
        local u20 = u2.new();
        local _, v21 = KnitClient.Controllers.MatchController:getQueueTypeAsync():await();

        if v21 == QueueType.EGG_HUNT then
            u13(true);
        end;

        if v21 == QueueType.SUMMER_WARS then
            u15(true);
            u17(Color3.fromRGB(4, 74, 209));
        end;

        local u22 = u18:getValue();

        if u22 then
            CollectionService:AddTag(u22, "EntityNameTag");
            u22.Adornee = u6.EntityInstance.Head;
            u20:GiveTask(u6.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() -- Line: 49
                -- upvalues: u6 (ref), u22 (copy)
                local v23 = u6.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace");

                if v23 then
                    u22.StudsOffsetWorldSpace = v23;
                end;
            end));
        end;

        if not DeviceUtil.isHoarceKat() then
            local u24 = u6.EntityInstance:GetAttribute("Team");
            KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p25) -- Line: 60
                -- upvalues: getQueueMeta (ref), u24 (copy), u11 (ref)
                local function _(p26) -- Line: 62
                    -- upvalues: u24 (ref)
                    return tonumber(p26.id) == tonumber(u24);
                end;

                local v27 = nil;

                for i, v in getQueueMeta(p25).teams do
                    local _ = i - 1;

                    if tonumber(v.id) == tonumber(u24) == true then
                        v27 = v;
                        break;
                    end;
                end;

                if v27 then
                    u11(v27);
                end;
            end);
        end;

        u20:GiveTask(u6.EntityInstance:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 82
            -- upvalues: u6 (ref), KnitClient (ref), getQueueMeta (ref), u11 (ref)
            local u28 = u6.EntityInstance:GetAttribute("Team");
            KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p29) -- Line: 85
                -- upvalues: getQueueMeta (ref), u28 (copy), u11 (ref)
                local function _(p30) -- Line: 87
                    -- upvalues: u28 (ref)
                    return tonumber(p30.id) == tonumber(u28);
                end;

                local v31 = nil;

                for i, v in getQueueMeta(p29).teams do
                    local _ = i - 1;

                    if tonumber(v.id) == tonumber(u28) == true then
                        v31 = v;
                        break;
                    end;
                end;

                if v31 then
                    u11(v31);
                end;
            end);
        end));
        local v32 = EntityUtil:getEntity(u6.EntityInstance);

        if RuntimeLib.instanceof(v32, PlayerEntity) then
            local v33 = v32:getPlayer();
            local u34 = GamePlayerUtil.getGamePlayer(v33);
            u9(u34:getDisplayName());
            v33:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(p35) -- Line: 113
                -- upvalues: u9 (ref), u34 (copy)
                u9(u34:getDisplayName());
            end);
        end;

        local v36 = u6.EntityInstance:GetAttribute("KitEntityType");

        if v36 ~= nil then
            u9(BedwarsKitMeta[v36].name);
        end;

        local v37 = u6.EntityInstance:GetAttribute("CustomEntityName");

        if v37 ~= "" and v37 then
            u9(v37);
        end;

        u20:GiveTask(u6.EntityInstance:GetAttributeChangedSignal("CustomEntityName"):Connect(function() -- Line: 126
            -- upvalues: u6 (ref), u9 (ref)
            local v38 = u6.EntityInstance:GetAttribute("CustomEntityName");

            if v38 ~= "" and v38 then
                u9(v38);
            end;
        end));

        return function() -- Line: 132
            -- upvalues: u20 (copy)
            u20:DoCleaning();
        end;
    end, {});
    local v39 = {
        Adornee = u6.EntityInstance:FindFirstChild("Head") or u6.EntityInstance,
        Size = UDim2.fromScale(5, 0.65),
        StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0),
        AlwaysOnTop = true,
        MaxDistance = NametagConfig.BillboardMaxDistanceGame,
        ResetOnSpawn = false,
        AutoLocalize = false,
        [u3.Ref] = u18
    };
    local v40 = {};
    local v41 = #v40;

    if v12 then
        v12 = u3.createFragment({
            EggCount = u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                AutoLocalize = false,
                TextXAlignment = "Center",
                Text = v19 == 1 and "1 EGG" or tostring(v19) .. " EGGS",
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, -0.03),
                AnchorPoint = Vector2.new(0.5, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.LuckiestGuy
            }, { u3.createElement("UIStroke", {
                    Color = Color3.fromRGB(0, 0, 0)
                }) })
        });
    end;

    if v12 then
        v40[v41 + 1] = v12;
    end;

    local _ = #v40;
    v40.DisplayNameContainer = u3.createElement(Empty, {
        Size = UDim2.fromScale(1, 0.46)
    }, {
        DisplayName = u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            AutoLocalize = false,
            TextXAlignment = "Center",
            Text = v8,
            Size = UDim2.fromScale(1, 1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u3.createElement("UIStroke", {
                Color = Color3.fromRGB(0, 0, 0)
            }) })
    });
    local createElement = u3.createElement;
    local v42 = {
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(1, 0.5)
    };
    local v43 = {};
    local createElement2 = u3.createElement;
    local v44 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(1.25, 1.25),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5)
    };
    local v45;

    if v10 then
        v45 = ColorUtil.hexColor(v10.colorHex);
    else
        v45 = nil;
    end;

    v44.BackgroundColor3 = v45;
    v44.BackgroundTransparency = v10 and 0 or 1;
    v43.MatchLevelBox = createElement2("Frame", v44, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), u3.createElement("UIStroke", {
            Thickness = 1,
            Color = Color3.fromRGB(0, 0, 0)
        }) });
    v43[1] = u3.createElement(StatefulEntityHpBar, {
    size = UDim2.fromScale(0.8, 1),
    anchorPoint = Vector2.new(0.5, 0.5),
    position = UDim2.fromScale(0.5, 0.5),
    gameEntity = u6.EntityInstance,
    serverInstance = u6.EntityInstance,
    barColor = v16,
    invertHp = v14,
    AppId = "StatefulEntityHpBar_" .. u6.EntityInstance.Name
});
    v40.EntityStateInfo = createElement(Empty, v42, v43);

    return u3.createFragment({
        Nametag = u3.createElement("BillboardGui", v39, v40)
    });
end);

return {
    GamePlayerNametag = v5.connect(function(p47, p48) -- Line: 226
        -- upvalues: EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy)
        local v49 = EntityUtil:getEntity(p48.EntityInstance);
        local v50;

        if RuntimeLib.instanceof(v49, PlayerEntity) then
            v50 = p47.Game.eggCountMap[v49:getPlayer().UserId];
        else
            v50 = nil;
        end;

        local v51 = {};

        for i, v in p48 do
            v51[i] = v;
        end;

        v51.EggCount = v50;
        v51.LocalPlayerTeam = p47.Game.myTeam;

        return v51;
    end)(v46)
};