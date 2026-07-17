-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ConstraintType = v1.ConstraintType;
local IndicatorUIType = v1.IndicatorUIType;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "IndicatorController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "IndicatorController";
    p6.baseIndicatorRefreshId = 0;
end;

function u4.KnitStart(u7) -- Line: 41
    -- upvalues: KnitController (copy), KnitClient (copy), PlaceUtil (copy), WatchCharacter (copy), Players (copy), ClientSyncEvents (copy), MatchState (copy)
    KnitController.KnitStart(u7);
    local v8, v9 = KnitClient.Controllers.MatchController:getCustomMatchConfigAsync():await();

    if not v8 or (v9 or not PlaceUtil.isGameServer()) then
        return nil;
    end;

    WatchCharacter(function(u10) -- Line: 48
        -- upvalues: Players (ref), u7 (copy)
        if u10 ~= Players.LocalPlayer then
            return nil;
        end;

        u10:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 52
            -- upvalues: u7 (ref), u10 (copy)
            u7:refreshBaseIndicator(u10);
        end);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p11) -- Line: 56
        -- upvalues: MatchState (ref), u7 (copy), Players (ref)
        if p11.matchState == MatchState.RUNNING then
            u7:refreshBaseIndicator(Players.LocalPlayer);

            return;
        end;

        u7:cancelBaseIndicatorRefresh();
        u7:removeBaseIndicator();
    end);

    if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
        u7:refreshBaseIndicator(Players.LocalPlayer);
    end;
end;

function u4.refreshBaseIndicator(u12, u13) -- Line: 68
    -- upvalues: KnitClient (copy), MatchState (copy), RuntimeLib (copy)
    if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
        u12:cancelBaseIndicatorRefresh();
        u12:removeBaseIndicator();

        return nil;
    end;

    u12.baseIndicatorRefreshId = u12.baseIndicatorRefreshId + 1;
    local baseIndicatorRefreshId = u12.baseIndicatorRefreshId;
    RuntimeLib.Promise.new(function(p14) -- Line: 76
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.MapController:getCFramesFolder();
        p14();
    end):andThen(function() -- Line: 79
        -- upvalues: RuntimeLib (ref), baseIndicatorRefreshId (copy), u12 (copy), KnitClient (ref), u13 (copy)
        return RuntimeLib.Promise.retryWithDelay(function() -- Line: 80
            -- upvalues: RuntimeLib (ref), baseIndicatorRefreshId (ref), u12 (ref), KnitClient (ref), u13 (ref)
            return RuntimeLib.Promise.new(function(p15, p16) -- Line: 81
                -- upvalues: baseIndicatorRefreshId (ref), u12 (ref), KnitClient (ref), u13 (ref)
                if baseIndicatorRefreshId ~= u12.baseIndicatorRefreshId then
                    return p16("Base indicator refresh is stale");
                end;

                local v17 = KnitClient.Controllers.TeamController:getPlayerTeam(u13);

                if not v17 then
                    return p16("Base indicator team is not loaded");
                end;

                local v18 = u12:getBaseIndicatorLocation(v17.id);

                if v18 then
                    return p15({
                        team = v17,
                        location = v18
                    });
                end;

                return p16("Base indicator location is not loaded");
            end);
        end, 20, 0.25);
    end):andThen(function(p19) -- Line: 99
        -- upvalues: baseIndicatorRefreshId (copy), u12 (copy)
        if baseIndicatorRefreshId ~= u12.baseIndicatorRefreshId then
            return nil;
        end;

        u12:createBaseIndicator(p19.team, p19.location);
    end):catch(function() -- Line: 106
        -- upvalues: baseIndicatorRefreshId (copy), u12 (copy)
        if baseIndicatorRefreshId ~= u12.baseIndicatorRefreshId then
            return nil;
        end;

        u12:removeBaseIndicator();
    end);
end;

function u4.createBaseIndicator(p20, p21, p22) -- Line: 113
    -- upvalues: Flamework (copy), IndicatorUIType (copy), u2 (copy), ColorUtil (copy), BedwarsImageId (copy), BLOCK_SIZE (copy), TweenService (copy), Players (copy), ConstraintType (copy)
    local v23 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController");
    local activeIndicatorId = p20.activeIndicatorId;

    if activeIndicatorId ~= "" and activeIndicatorId then
        v23:removeIndicator(p20.activeIndicatorId);
    end;

    p20.activeIndicatorId = v23:addIndicator({
        uiType = IndicatorUIType.Custom,
        uiConfig = {
            distanceRelativeToPlayer = true,
            scaleWithAlpha = false,
            scaleOnFade = false,
            easeOutOnAppoach = false,
            color3 = Color3.new(255, 255, 255),
            template = u2("Frame", {
                Name = "Container",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Children = { u2("ImageLabel", {
                        Name = "BedIcon",
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 1),
                        Position = UDim2.fromScale(0.5, 0.85),
                        Size = UDim2.fromScale(0.7, 0.7),
                        ImageColor3 = ColorUtil.brighten(p21.color, 0.1),
                        Image = BedwarsImageId.HOME
                    }) }
            }),

            transparency = function(p24, p25, p26) -- Line: 139, Name: transparency
                -- upvalues: BLOCK_SIZE (ref)
                local u27 = 1 - math.min((p25 - BLOCK_SIZE * 30) / (BLOCK_SIZE * 5), 1);

                local function _(p28) -- Line: 142
                    -- upvalues: u27 (copy)
                    if p28:IsA("TextLabel") then
                        p28.TextTransparency = u27;
                    end;

                    if p28:IsA("ImageLabel") then
                        p28.ImageTransparency = u27;
                    end;
                end;

                for i, descendant in p24:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("TextLabel") then
                        descendant.TextTransparency = u27;
                    end;

                    if descendant:IsA("ImageLabel") then
                        descendant.ImageTransparency = u27;
                    end;
                end;

                return u27;
            end,

            onEnterAnimation = function(p29) -- Line: 159, Name: onEnterAnimation
                -- upvalues: TweenService (ref)
                local PingIcon = p29:FindFirstChild("PingIcon");

                if PingIcon ~= nil then
                    PingIcon = PingIcon:Clone();
                end;

                if not PingIcon then
                    return nil;
                end;

                PingIcon.Parent = p29;
                local u30 = TweenService:Create(PingIcon, TweenInfo.new(0.15), {
                    ImageTransparency = 1,
                    Size = UDim2.fromScale(1.5, 1.5)
                });
                u30:Play();
                u30.Completed:Connect(function() -- Line: 174
                    -- upvalues: u30 (copy), PingIcon (copy)
                    u30:Destroy();
                    PingIcon:Destroy();
                end);
            end
        },
        creator = Players.LocalPlayer,
        attachTo = p22,
        constraintType = ConstraintType.Hidden
    }):getId();
end;

function u4.removeBaseIndicator(p31) -- Line: 185
    -- upvalues: Flamework (copy)
    local activeIndicatorId = p31.activeIndicatorId;

    if activeIndicatorId == "" or not activeIndicatorId then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):removeIndicator(p31.activeIndicatorId);
    p31.activeIndicatorId = nil;
end;

function u4.cancelBaseIndicatorRefresh(p32) -- Line: 193
    p32.baseIndicatorRefreshId = p32.baseIndicatorRefreshId + 1;
end;

function u4.getBaseIndicatorLocation(p33, p34) -- Line: 196
    -- upvalues: KnitClient (copy), BLOCK_SIZE (copy)
    for _, v in { p34 .. "_generator", p34 .. "_bed" } do
        local v35 = KnitClient.Controllers.MapController:getCFrameWithoutYield(v);

        if v35 then
            return v35.Position + Vector3.new(0, BLOCK_SIZE * 3, 0);
        end;
    end;

    local v36 = KnitClient.Controllers.BedwarsController:getTeamBed(p34);

    if v36 ~= nil then
        v36 = v36.Position + Vector3.new(0, BLOCK_SIZE * 3, 0);
    end;

    return v36;
end;

KnitClient.CreateController(u4.new());

return nil;