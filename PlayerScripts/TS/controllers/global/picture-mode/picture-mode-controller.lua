-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ContextActionService = v2.ContextActionService;
local Players = v2.Players;
local StarterGui = v2.StarterGui;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = { "TopBarAppGui", "PacketProfiler", "PacketChart", "MatchDraftApp", "CombinedKitDraftApp", "AllRandomKitDraftApp" };
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "PictureModeController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "PictureModeController";
    p6.pictureModeEnabled = false;
    p6.shouldShowPlayerList = true;
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), PlaceUtil (copy), ContextActionService (copy), ClientSyncEvents (copy), Setting (copy)
    KnitController.KnitStart(u7);
    local v8 = { Enum.KeyCode.F1 };

    if not PlaceUtil.isAfkServer() then
        ContextActionService:BindAction("picture-mode-toggle", function(p9, p10, p11) -- Line: 41
            -- upvalues: u7 (copy)
            if p10 == Enum.UserInputState.Begin then
                task.spawn(function() -- Line: 43
                    -- upvalues: u7 (ref)
                    u7:togglePictureMode();
                end);
            end;
        end, false, unpack(v8));
    end;

    ClientSyncEvents.SettingChanged:connect(function(p12) -- Line: 50
        -- upvalues: Setting (ref), u7 (copy)
        if p12.setting ~= Setting.PICTURE_MODE then
            return nil;
        end;

        local value = p12.value;

        if value == 0 or (value ~= value or not value) then
            u7:disablePictureMode(false);

            return;
        end;

        u7:enablePictureMode(false);
    end);
end;

function u4.enablePictureMode(p13, p14) -- Line: 62
    -- upvalues: Players (copy), KnitClient (copy), Setting (copy), u3 (copy), StarterGui (copy), CollectionService (copy), WatchCollectionTag (copy), Workspace (copy), u1 (copy)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");

    if p13.pictureModeEnabled then
        return nil;
    end;

    p13.pictureModeEnabled = true;

    if p14 then
        KnitClient.Controllers.SettingsController:setSetting(Setting.PICTURE_MODE, true);
    end;

    local function _(p15) -- Line: 74
        -- upvalues: u3 (ref)
        local v16 = p15:IsA("ScreenGui");

        if v16 then
            local v17 = table.find(u3, p15.Name) ~= nil;
            v16 = not v17;
        end;

        if v16 then
            p15.Enabled = false;
        end;
    end;

    for i, child in PlayerGui:GetChildren() do
        local _ = i - 1;
        local v18 = child:IsA("ScreenGui");

        if v18 then
            local v19 = table.find(u3, child.Name) ~= nil;
            v18 = not v19;
        end;

        if v18 then
            child.Enabled = false;
        end;
    end;

    p13.shouldShowPlayerList = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false);

    local function _(p20) -- Line: 94
        local v21 = p20:FindFirstChildWhichIsA("BillboardGui");

        if v21 then
            v21.Enabled = false;
        end;
    end;

    for i, v in CollectionService:GetTagged("Billboard") do
        local _ = i - 1;
        local v22 = v:FindFirstChildWhichIsA("BillboardGui");

        if v22 then
            v22.Enabled = false;
        end;
    end;

    p13.tagConnection = WatchCollectionTag("EntityNameTag", function(p23) -- Line: 104
        p23.Enabled = false;
    end);
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera then
        u1("DepthOfFieldEffect", {
            Name = "PictureDepthOfFieldEffect",
            InFocusRadius = 15,
            Parent = CurrentCamera
        });
    end;
end;

function u4.disablePictureMode(p24, p25) -- Line: 117
    -- upvalues: Players (copy), KnitClient (copy), Setting (copy), u3 (copy), StarterGui (copy), CollectionService (copy), Workspace (copy)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");

    if not p24.pictureModeEnabled then
        return nil;
    end;

    p24.pictureModeEnabled = false;

    if p25 then
        KnitClient.Controllers.SettingsController:setSetting(Setting.PICTURE_MODE, false);
    end;

    local function _(p26) -- Line: 128
        -- upvalues: u3 (ref)
        local v27 = p26:IsA("ScreenGui");

        if v27 then
            local v28 = table.find(u3, p26.Name) ~= nil;
            v27 = not v28;
        end;

        if v27 then
            p26.Enabled = true;
        end;
    end;

    for i, child in PlayerGui:GetChildren() do
        local _ = i - 1;
        local v29 = child:IsA("ScreenGui");

        if v29 then
            local v30 = table.find(u3, child.Name) ~= nil;
            v29 = not v30;
        end;

        if v29 then
            child.Enabled = true;
        end;
    end;

    if p24.shouldShowPlayerList then
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
    end;

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true);

    local function _(p31) -- Line: 149
        local v32 = p31:FindFirstChildWhichIsA("BillboardGui");

        if v32 then
            v32.Enabled = true;
        end;
    end;

    for i, v in CollectionService:GetTagged("Billboard") do
        local _ = i - 1;
        local v33 = v:FindFirstChildWhichIsA("BillboardGui");

        if v33 then
            v33.Enabled = true;
        end;
    end;

    local tagConnection = p24.tagConnection;

    if tagConnection ~= nil then
        tagConnection:Disconnect();
    end;

    p24.tagConnection = nil;

    local function _(p34) -- Line: 165
        p34.Enabled = true;
    end;

    for i, v in CollectionService:GetTagged("EntityNameTag") do
        local _ = i - 1;
        v.Enabled = true;
    end;

    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera then
        local PictureDepthOfFieldEffect = CurrentCamera:FindFirstChild("PictureDepthOfFieldEffect");

        if PictureDepthOfFieldEffect ~= nil then
            PictureDepthOfFieldEffect:Destroy();
        end;
    end;
end;

function u4.togglePictureMode(p35) -- Line: 181
    if p35.pictureModeEnabled then
        p35:disablePictureMode(true);

        return;
    end;

    p35:enablePictureMode(true);
end;

KnitClient.CreateController(u4.new());

return nil;