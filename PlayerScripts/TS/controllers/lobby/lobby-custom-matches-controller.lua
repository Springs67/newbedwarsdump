-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local ColorUtil = v1.ColorUtil;
local GetTarmacAsset = v1.GetTarmacAsset;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CreateMatchHud = RuntimeLib.import(script, script.Parent, "custom-matches", "ui", "create-match-hud").CreateMatchHud;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "LobbyCustomMatchesController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p7);
    p7.Name = "LobbyCustomMatchesController";
    p7.remotes = default.Client:GetNamespace("CustomMatches");
end;

u5.KnitStart = RuntimeLib.async(function(u8) -- Line: 40
    -- upvalues: CollectionTagAdded (copy), KnitClient2 (copy), Players (copy), ColorUtil (copy), CollectionService (copy)
    CollectionTagAdded("CustomMatchesNpc", function(p9) -- Line: 41
        -- upvalues: KnitClient2 (ref), Players (ref), u8 (copy), ColorUtil (ref), CollectionService (ref)
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            MaxActivationDistance = 17,
            ActionText = "Creative",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            Parent = p9
        }).Triggered:Connect(function(p10) -- Line: 49
            -- upvalues: Players (ref), u8 (ref)
            if p10 == Players.LocalPlayer then
                u8:openCustomMatchApp();
            end;
        end);
        local PrimaryPart = p9.PrimaryPart;
        local u11 = string.split("Creative", "");
        local u12 = ColorUtil.hexColor(16756669);
        local u13 = ColorUtil.hexColor(16761760);

        local function _(p14, p15) -- Line: 59
            -- upvalues: u12 (copy), u13 (copy), u11 (copy), ColorUtil (ref)
            local v16 = u12:Lerp(u13, p15 / (#u11 - 1));

            return "<font color=\"" .. ColorUtil.richTextColor(v16) .. "\">" .. p14 .. "</font>";
        end;

        local v17 = table.create(#u11);

        for i, v in u11 do
            local v18 = u12:Lerp(u13, (i - 1) / (#u11 - 1));
            v17[i] = "<font color=\"" .. ColorUtil.richTextColor(v18) .. "\">" .. v .. "</font>";
        end;

        PrimaryPart:SetAttribute("BillboardTitle", table.concat(u11, ""));
        PrimaryPart:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
        PrimaryPart:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
        CollectionService:AddTag(PrimaryPart, "Billboard");
    end);
end);

function u5.openCustomMatchApp(u19) -- Line: 75
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CUSTOM_MATCHES, {
        OnJoinMatch = RuntimeLib.async(function(p20) -- Line: 77
            -- upvalues: RuntimeLib (ref), u19 (copy)
            if p20 == "" or not p20 then
                return nil;
            end;

            local v21 = RuntimeLib.await(u19.remotes:WaitFor("JoinByCode"));

            if v21 then
                RuntimeLib.await(v21:CallServerAsync(p20));
            end;
        end),

        OnCreateMatch = function(...) -- Line: 87, Name: OnCreateMatch
            -- upvalues: u19 (copy)
            return u19:createMatch(unpack({ ... }));
        end,

        OnClose = function() -- Line: 91, Name: OnClose
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CUSTOM_MATCHES);
        end
    });
    SoundManager:playSound(GameSound.UI_OPEN_2);
end;

function u5.createMatch(u22, ...) -- Line: 97
    -- upvalues: GetTarmacAsset (copy), u3 (copy), CreateMatchHud (copy), Players (copy), KnitClient (copy)
    local v23 = { ... };
    local v24 = v23[3];

    if v24 ~= nil then
        v24 = v24.mapName;
    end;

    local v25 = v23[3];

    if v25 ~= nil then
        v25 = v25.mapThumbnail;
    end;

    if v25 == nil then
        v25 = GetTarmacAsset("NoImage").Image;
    end;

    u22.customMatchHudTree = u3.mount(u3.createElement(CreateMatchHud, {
        mapName = v24 == nil and "" or v24,
        mapImage = v25
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    local v26 = KnitClient.Controllers.LobbyCustomMatchesController.remotes:WaitFor("CreateCustomMatch"):expect():CallServerAsync(unpack(v23)):expect();
    task.delay(3, function() -- Line: 125
        -- upvalues: u22 (copy), u3 (ref)
        if u22.customMatchHudTree then
            u3.unmount(u22.customMatchHudTree);
        end;
    end);

    return v26;
end;

KnitClient.CreateController(u5.new());

return nil;