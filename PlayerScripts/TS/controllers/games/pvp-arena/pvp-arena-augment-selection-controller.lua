-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local CollectorPlayer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "collector", "collector-player").CollectorPlayer;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PvPArenaAugmentIcon = RuntimeLib.import(script, script.Parent, "ui", "pvp-arena-augment-icon").PvPArenaAugmentIcon;
local PvPArenaAugmentSelectionInterface = RuntimeLib.import(script, script.Parent, "ui", "pvp-arena-augment-selection-interface").PvPArenaAugmentSelectionInterface;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "PvpArenaAugmentSelectionController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.PVP_ARENA });
    p6.Name = "PvpArenaAugmentSelectionController";
end;

function u4.KnitStart(p7) -- Line: 38
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 41
    -- upvalues: default (copy), ClientStore (copy), Players (copy)
    u8.selectedAugments = {};
    default.Client:Get("PvPArenaStartAugmentSelection"):Connect(function(p9) -- Line: 43
        -- upvalues: u8 (copy)
        u8.selectedAugment = nil;
        u8:mountAugmentSelectionInterface(p9.augments, p9.endTime, p9.rerolls);
    end);
    default.Client:Get("PvPArenaAugmentForceSelect"):Connect(function(p10) -- Line: 47
        -- upvalues: u8 (copy)
        u8:selectAugment(p10.augment);
    end);
    default.Client:Get("PvPArenaAugmentUserIdSelected"):Connect(function(p11) -- Line: 50
        -- upvalues: ClientStore (ref), Players (ref), u8 (copy)
        ClientStore:dispatch({
            type = "BedwarsSetPvPArenaAugmentSelection",
            userId = p11.userId,
            augment = p11.augment
        });

        if p11.userId == Players.LocalPlayer.UserId then
            u8.selectedAugments[p11.augment] = true;
        end;
    end);
end;

function u4.selectAugment(p12, p13) -- Line: 63
    -- upvalues: SoundManager (copy), default (copy), ClientSyncEvents (copy), Flamework (copy)
    if p12.selectedAugment then
        return nil;
    end;

    p12.selectedAugment = p13;
    SoundManager:playSound("rbxassetid://10977862000");
    default.Client:Get("PvPArenaAugmentSelected"):SendToServer({
        augment = p13
    });
    ClientSyncEvents.PvPArenaAugmentClientSelected:fire(p13);
    p12:setupAugmentInfoIcon(p13);
    task.delay(1, function() -- Line: 74
        -- upvalues: Flamework (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvpArenaAugmentSelectionInterface");
    end);
end;

function u4.mountAugmentSelectionInterface(p14, p15, p16, p17) -- Line: 78
    -- upvalues: Flamework (copy), PvPArenaAugmentSelectionInterface (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvpArenaAugmentSelectionInterface") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvpArenaAugmentSelectionInterface");
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "PvpArenaAugmentSelectionInterface",
        app = PvPArenaAugmentSelectionInterface
    }, {
        SelectionEndTime = p16,
        Augments = p15,
        Rerolls = p17
    });
end;

function u4.setupAugmentInfoIcon(p18, p19) -- Line: 91
    -- upvalues: KnitClient (copy), u2 (copy), PvPArenaAugmentIcon (copy), Workspace (copy), u1 (copy), CollectorPlayer (copy)
    p18.augmentInfoIcon = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(PvPArenaAugmentIcon, {
        EnableTooltip = true,
        Augment = p19,
        FrameProps = {
            Size = UDim2.fromScale(1, 1)
        }
    }), "Left", "AugmentInfoIcon", UDim2.fromScale(0.1, 1));
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera and KnitClient.Controllers.StatusInfoListController:getList() then
        local v20 = u1("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.03, 0.03)
        });
        u2.mount(u2.createElement(PvPArenaAugmentIcon, {
            Augment = p19
        }), v20);
        local v21 = KnitClient.Controllers.StatusInfoListController:getList();

        if v21 ~= nil then
            v21 = v21:WaitForChild("AugmentInfoIcon");
        end;

        if v21 ~= nil then
            v21 = v21:FindFirstChildWhichIsA("GuiObject");
        end;

        local v22;

        if v21 == nil then
            v22 = v21;
        else
            v22 = v21:IsA("GuiObject");
        end;

        if v22 then
            local v23 = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2);
            local v24;

            if v21 == nil then
                v24 = v21;
            else
                v24 = v21.AbsolutePosition.X;
            end;

            CollectorPlayer:create(v20, v23, Vector2.new(v24, v21.AbsolutePosition.Y + v21.AbsoluteSize.Y / 2), {
                amount = 1,
                disableSounds = true
            }).play();
        end;
    end;
end;

function u4.getLocalPlayerAugmentSelections(p25) -- Line: 139
    return p25.selectedAugments;
end;

KnitClient.CreateController(u4.new());

return nil;