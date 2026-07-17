-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local HttpService = v5.HttpService;
local Players = v5.Players;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local GamePlayerNametag = RuntimeLib.import(script, script.Parent.Parent, "entity", "game-player-nametag").GamePlayerNametag;
local NameTag = RuntimeLib.import(script, script.Parent, "ui", "nametag").NameTag;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "NametagController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "NametagController";
    p8.forceRescaleMaid = {};
    p8.nametagUUID = {};
    p8.nametagChangedConnectionMaid = {};
    p8.nametagDataCache = {};
end;

function u6.KnitStart(u9) -- Line: 49
    -- upvalues: PlaceUtil (copy), ClientStore (copy), RuntimeLib (copy), Players (copy), EntityUtil (copy), WatchCharacter (copy), Workspace (copy), u4 (copy), NameTag (copy), CollectionService (copy), u2 (copy), PlayerEntity (copy), KnitClient2 (copy)
    if PlaceUtil.isLobbyServer() then
        ClientStore.changed:connect(function(u10, p11) -- Line: 51
            -- upvalues: RuntimeLib (ref), Players (ref), EntityUtil (ref), u9 (copy)
            if u10.Party.members ~= p11.Party.members or u10.Party.leader ~= p11.Party.leader then
                local v12 = { p11.Party.leader };
                local members = p11.Party.members;
                table.move(members, 1, #members, #v12 + 1, v12);

                local function _(p13) -- Line: 57
                    -- upvalues: u10 (copy)
                    return table.find(u10.Party.members, p13) == nil;
                end;

                local v14 = 0;
                local v15 = {};

                for i, v in v12 do
                    local _ = i - 1;

                    if table.find(u10.Party.members, v) == nil == true then
                        v14 = v14 + 1;
                        v15[v14] = v;
                    end;
                end;

                local function _(p16) -- Line: 72
                    return p16.userId;
                end;

                local u17 = table.create(#v15);

                for i, v in v15 do
                    local _ = i - 1;
                    u17[i] = v.userId;
                end;

                local v18 = { u10.Party.leader };
                local members2 = u10.Party.members;
                table.move(members2, 1, #members2, #v18 + 1, v18);

                local function _(p19) -- Line: 86
                    return p19.userId;
                end;

                local u20 = table.create(#v18);

                for i, v in v18 do
                    local _ = i - 1;
                    u20[i] = v.userId;
                end;

                RuntimeLib.Promise.defer(function() -- Line: 96
                    -- upvalues: u17 (copy), Players (ref), EntityUtil (ref), u9 (ref), u20 (copy)
                    for _, v in u17 do
                        local v21 = Players:GetPlayerByUserId(v);

                        if v21 then
                            local v22 = EntityUtil:getEntity(v21);

                            if v22 ~= nil then
                                v22:setNametag(u9:getNewNametagTextForPlayer(v21));
                            end;
                        end;
                    end;

                    for _, v in u20 do
                        local v23 = Players:GetPlayerByUserId(v);

                        if v23 then
                            local v24 = EntityUtil:getEntity(v23);

                            if v24 ~= nil then
                                v24:setNametag(u9:getNewNametagTextForPlayer(v23), Color3.fromRGB(85, 255, 85));
                            end;
                        end;
                    end;
                end);
            end;
        end);
        Players.PlayerRemoving:Connect(function(p25) -- Line: 120
            -- upvalues: u9 (copy)
            u9.nametagDataCache[p25] = nil;
        end);
        WatchCharacter(function(u26, u27) -- Line: 125
            -- upvalues: Workspace (ref), u4 (ref), NameTag (ref), ClientStore (ref), EntityUtil (ref), u9 (copy)
            task.spawn(function() -- Line: 126
                -- upvalues: u27 (copy), Workspace (ref), u4 (ref), NameTag (ref), ClientStore (ref), u26 (copy), EntityUtil (ref), u9 (ref)
                local Head = u27:WaitForChild("Head");

                if not u27:IsDescendantOf(Workspace) then
                    u27.AncestryChanged:Wait();
                end;

                local v28 = u27:FindFirstChildWhichIsA("Humanoid");

                if v28 then
                    v28.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                end;

                u4.mount(u4.createElement(NameTag, {
                    EntityInstance = u27
                }), Head, "Nametag");
                local v29 = { ClientStore:getState().Party.leader };
                local members = ClientStore:getState().Party.members;
                table.move(members, 1, #members, #v29 + 1, v29);

                local function _(p30) -- Line: 142
                    return p30.userId;
                end;

                local v31 = table.create(#v29);

                for i, v in v29 do
                    local _ = i - 1;
                    v31[i] = v.userId;
                end;

                local v32 = table.find(v31, u26.UserId) ~= nil and EntityUtil:getEntity(u26);

                if v32 then
                    v32:getInstance():WaitForChild("Humanoid").NameDisplayDistance = 0;

                    if v32 ~= nil then
                        v32:setNametag(u9:getNewNametagTextForPlayer(u26), Color3.fromRGB(85, 255, 85));
                    end;
                end;
            end);
        end);
    end;

    if PlaceUtil.isGameServer() then
        CollectionService:GetInstanceAddedSignal("entity"):Connect(function(p33) -- Line: 169
            -- upvalues: u2 (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u9 (copy)
            local v34 = u2.new();
            local u35 = EntityUtil:getEntity(p33);

            if not u35 then
                return nil;
            end;

            if RuntimeLib.instanceof(u35, PlayerEntity) then
                return nil;
            end;

            u9:addGameNametag(u35:getInstance());
            v34:GiveTask((u35:getInstance():GetAttributeChangedSignal("NoNametag"):Connect(function() -- Line: 179
                -- upvalues: u35 (copy), u9 (ref)
                if u35:shouldShowNametag() then
                    u9:addGameNametag(u35:getInstance());

                    return;
                end;

                u9:removeGameNametag(u35:getInstance());
            end)));
            u9.nametagChangedConnectionMaid[p33] = v34;
        end);
        CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p36) -- Line: 191
            -- upvalues: EntityUtil (ref), u9 (copy)
            if not EntityUtil:getEntity(p36) then
                return nil;
            end;

            local v37 = u9.nametagChangedConnectionMaid[p36];

            if v37 ~= nil then
                v37:Destroy();
            end;

            u9.nametagChangedConnectionMaid[p36] = nil;
        end);
        WatchCharacter(function(p38, p39, p40) -- Line: 207
            -- upvalues: EntityUtil (ref), u9 (copy)
            local Humanoid = p39:WaitForChild("Humanoid");
            Humanoid.NameDisplayDistance = 0;
            Humanoid.HealthDisplayDistance = 0;
            Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff;
            local u41 = EntityUtil:getEntity(p39);

            if not u41 then
                return nil;
            end;

            local u42 = u41:getInstance();
            u9:addGameNametag(u42);
            p40:GiveTask((u42:GetAttributeChangedSignal("NoNametag"):Connect(function() -- Line: 221
                -- upvalues: u41 (copy), u9 (ref), u42 (copy)
                if u41:shouldShowNametag() then
                    u9:addGameNametag(u42);

                    return;
                end;

                u9:removeGameNametag(u42);
            end)));
        end);
        KnitClient2.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p43) -- Line: 231
            -- upvalues: EntityUtil (ref), u9 (copy)
            local v44 = EntityUtil:getLocalPlayerEntity();

            if v44 ~= nil then
                v44 = v44:getInstance();
            end;

            if not v44 then
                return nil;
            end;

            if p43 == 0 then
                u9:removeGameNametag(v44);

                return;
            end;

            u9:addGameNametag(v44);
        end);
    end;
end;

function u6.hideNametag(p45, p46) -- Line: 248
    local Nametag = p46:FindFirstChild("Nametag", true);

    if Nametag then
        Nametag.Enabled = false;
    end;
end;

function u6.requestNametagData(p47, p48) -- Line: 254
    -- upvalues: RuntimeLib (copy), default (copy)
    local u49 = p47.nametagDataCache[p48];

    if u49 then
        return RuntimeLib.Promise.new(function(p50) -- Line: 259
            -- upvalues: u49 (copy)
            return p50(u49);
        end);
    end;

    return default.Client:Get("NametagDataRequest"):CallServerAsync(p48.UserId);
end;

function u6.addGameNametag(p51, u52) -- Line: 266
    -- upvalues: EntityUtil (copy), KnitClient2 (copy), HttpService (copy), Workspace (copy), Flamework (copy), GamePlayerNametag (copy)
    local v53 = u52:GetAttribute("NoNametag");

    if v53 ~= 0 and (v53 == v53 and (v53 ~= "" and v53)) then
        return nil;
    end;

    local v54 = EntityUtil:getLocalPlayerEntity();

    if v54 ~= nil then
        v54 = v54:getInstance();
    end;

    if u52 == v54 and KnitClient2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        return nil;
    end;

    local v55 = EntityUtil:getEntity(u52);

    if v55 ~= nil then
        v55 = v55:shouldShowNametag();
    end;

    if not v55 then
        return nil;
    end;

    local v56 = p51.nametagUUID[u52];

    if v56 == "" or not v56 then
        v56 = HttpService:GenerateGUID();
        p51.nametagUUID[u52] = v56;
    end;

    local u57 = "GameNametag_" .. u52.Name .. v56;
    task.spawn(function() -- Line: 301
        -- upvalues: u52 (copy), Workspace (ref), Flamework (ref), u57 (copy), EntityUtil (ref), GamePlayerNametag (ref)
        if not u52:IsDescendantOf(Workspace) then
            u52.AncestryChanged:Wait();
        end;

        local Head = u52:WaitForChild("Head");

        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u57) then
            return nil;
        end;

        local v58 = EntityUtil:getEntity(u52);

        if v58 ~= nil then
            v58 = v58:shouldShowNametag();
        end;

        if not v58 then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = GamePlayerNametag,
            appId = u57
        }, {
            EntityInstance = u52
        }, nil, Head);
    end);
end;

function u6.removeGameNametag(p59, p60) -- Line: 324
    -- upvalues: Flamework (copy)
    local v61 = p59.nametagUUID[p60];
    local v62 = "GameNametag_" .. p60.Name .. (v61 == nil and "" or v61);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(v62);
end;

function u6.updateTeam(u63, u64, u65) -- Line: 335
    -- upvalues: Players (copy), ClientStore (copy), PlaceUtil (copy), EntityUtil (copy), Theme (copy)
    task.spawn(function() -- Line: 336
        -- upvalues: u65 (copy), u63 (copy), u64 (copy), Players (ref), ClientStore (ref), PlaceUtil (ref), EntityUtil (ref), Theme (ref)
        local Head = u65:WaitForChild("Head", 5);

        if Head ~= nil then
            Head = Head:WaitForChild("Nametag", 5);
        end;

        if Head ~= nil then
            local DisplayNameContainer = Head:WaitForChild("DisplayNameContainer", 5);

            if DisplayNameContainer ~= nil then
                DisplayNameContainer:WaitForChild("DisplayName", 5);
            end;
        end;

        if not Head then
            return nil;
        end;

        u63:rescaleNametag(Head);

        if u64 == Players.LocalPlayer then
            for _, v in Players:GetPlayers() do
                if v.Character and v ~= Players.LocalPlayer then
                    u63:updateTeam(v, v.Character);
                end;
            end;
        end;

        local u66 = u65:GetAttribute("Team");
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetAttribute("Team");
        end;

        local v67;

        if u66 == "" or not u66 then
            v67 = nil;
        else
            local function _(p68) -- Line: 371
                -- upvalues: u66 (copy)
                return p68.id == u66;
            end;

            v67 = nil;

            for i, v in ClientStore:getState().Game.teams do
                local _ = i - 1;

                if v.id == u66 == true then
                    v67 = v;
                    break;
                end;
            end;
        end;

        if u64 == Players.LocalPlayer then
            if PlaceUtil.isLobbyServer() then
                local v69 = EntityUtil:getEntity(u64);

                if v69 ~= nil then
                    v69:hideLobbyDisplayName();
                end;

                if v69 ~= nil then
                    v69:centerLobbyNameTag();
                end;
            else
                u65:WaitForChild("Head"):WaitForChild("Nametag").PlayerToHideFrom = Players.LocalPlayer;
            end;
        end;

        if PlaceUtil.isGameServer() and v67 then
            local TeamIndicator = u65:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("TeamIndicator");
            TeamIndicator.Visible = true;
            TeamIndicator.BackgroundColor3 = v67.color;
        end;

        local v70 = PlaceUtil.isGameServer() and EntityUtil:getEntity(u64);

        if v70 then
            local v71;

            if u66 == Character then
                v71 = Theme.mcGreen;
            else
                v71 = Color3.fromRGB(240, 26, 26);
            end;

            v70:setNametag(u63:getNewNametagTextForPlayer(u64), v71);
            v70:setNametagBorderColor(v71);
        end;
    end);
end;

function u6.rescaleNametag(u72, u73) -- Line: 423
    -- upvalues: u3 (copy), Players (copy), u2 (copy)
    local DisplayNameContainer = u73:FindFirstChild("DisplayNameContainer");

    if not DisplayNameContainer then
        return nil;
    end;

    local v74 = u3("ScreenGui", {});
    DisplayNameContainer.Parent = u3("Frame", {
        Parent = v74,
        Size = UDim2.fromOffset(600, 65)
    });
    local v75 = DisplayNameContainer:FindFirstChildOfClass("UIListLayout") or u3("UIListLayout", {
        Parent = DisplayNameContainer,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.01, 0)
    });

    for _, child in DisplayNameContainer:GetChildren() do
        if child:IsA("TextLabel") then
            child.AutomaticSize = Enum.AutomaticSize.X;
            child.RichText = false;
        end;
    end;

    v74.Parent = Players.LocalPlayer:FindFirstChild("PlayerGui");
    local v76 = {};
    local v77 = {};

    for _, child in DisplayNameContainer:GetChildren() do
        if child:IsA("TextLabel") then
            v76[child] = UDim2.fromScale(child.AbsoluteSize.X / DisplayNameContainer.AbsoluteSize.X, child.AbsoluteSize.Y / DisplayNameContainer.AbsoluteSize.Y);

            if u72.forceRescaleMaid[child] == nil then
                local u78 = u2.new();
                u78:GiveTask(child.AncestryChanged:Connect(function() -- Line: 466
                    -- upvalues: child (copy), u78 (copy), u72 (copy)
                    if child.Parent then
                        return nil;
                    end;

                    u78:DoCleaning();
                    u72.forceRescaleMaid[child] = nil;
                end));
                u78:GiveTask(child:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 473
                    -- upvalues: u72 (copy), u73 (copy)
                    u72:rescaleNametag(u73);
                end));
                u72.forceRescaleMaid[child] = u78;
            end;
        end;

        if child:IsA("GuiObject") then
            local v79 = child.AbsolutePosition - DisplayNameContainer.AbsolutePosition;
            v77[child] = UDim2.fromScale(v79.X / DisplayNameContainer.AbsoluteSize.X, v79.Y / DisplayNameContainer.AbsoluteSize.Y);
        end;
    end;

    if v75 ~= nil then
        v75:Destroy();
    end;

    local function _(p80, p81) -- Line: 491
        p81.Position = p80;

        return p81.Position;
    end;

    for i, v in v77 do
        i.Position = v;
        local _ = i.Position;
    end;

    local function _(p82, p83) -- Line: 498
        p83.AutomaticSize = Enum.AutomaticSize.None;
        p83.RichText = false;
        p83.Size = p82;
    end;

    for i, v in v76 do
        i.AutomaticSize = Enum.AutomaticSize.None;
        i.RichText = false;
        i.Size = v;
    end;

    DisplayNameContainer.Parent = u73;
    v74:Destroy();
end;

function u6.getNewNametagTextForPlayer(p84, p85) -- Line: 509
    -- upvalues: GamePlayerUtil (copy), PlaceUtil (copy)
    local v86 = GamePlayerUtil.getGamePlayer(p85):getClanTag();
    local v87 = GamePlayerUtil.getGamePlayer(p85):getDisplayName();

    if v86 ~= "" and PlaceUtil.isLobbyServer() then
        return "<font color=\"rgb(219,219,219)\">[" .. v86 .. "]</font> <b>" .. v87 .. "</b>";
    end;

    return v87;
end;

return {
    NametagController = KnitClient.CreateController(u6.new())
};