-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local MapDataUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil;
local MatchDraftMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-mode").MatchDraftMode;
local MatchDraftPhase = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase;
local MatchDraftMultiTeamPage = RuntimeLib.import(script, script.Parent, "match-draft-multi-team-page").MatchDraftMultiTeamPage;
local MatchDraftTwoTeamsPage = RuntimeLib.import(script, script.Parent, "match-draft-two-teams-page").MatchDraftTwoTeamsPage;
local v29 = v4.new(u3)(function(u6, p7) -- Line: 16
    -- upvalues: u3 (copy), MapDataUtil (copy), u2 (copy), TweenService (copy), MatchDraftPhase (copy), ColorUtil (copy), Empty (copy), MatchDraftMode (copy), MatchDraftTwoTeamsPage (copy), MatchDraftMultiTeamPage (copy)
    local useEffect = p7.useEffect;
    local _ = p7.useState;
    local _ = p7.useValue;
    local _ = p7.useMemo;
    local u8 = u3.createRef();
    local MapId = u6.MapId;
    local v9;

    if MapId == "" or not MapId then
        v9 = MapDataUtil.DEFAULT_MAP_IMAGE;
    else
        v9 = MapDataUtil.getMapImage(u6.MapId);
    end;

    local v10 = v9 == MapDataUtil.DEFAULT_MAP_IMAGE and "rbxassetid://71356717298935" or v9;
    local u11 = nil;

    local function v18() -- Line: 26
        -- upvalues: u8 (copy), u2 (ref), TweenService (ref), u6 (copy), u11 (ref)
        local u12 = u8:getValue();

        if not u12 then
            return nil;
        end;

        local u13 = u2.new();
        local u14 = TweenService:Create(u12, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        });
        local v15 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local v16 = {};
        local sharedData = u6.store.Draft.sharedData;

        if sharedData ~= nil then
            sharedData = sharedData.matchDraftPhase;
        end;

        v16.BackgroundColor3 = u11(sharedData);
        local u17 = TweenService:Create(u12, v15, v16);
        u13:GiveTask(u14.Completed:Connect(function() -- Line: 45
            -- upvalues: u13 (copy), u17 (copy)
            u13:GiveTask(task.delay(0.5, function() -- Line: 46
                -- upvalues: u17 (ref)
                u17:Play();
            end));
        end));
        u13:GiveTask(function() -- Line: 50
            -- upvalues: u14 (copy)
            u14:Cancel();
            u14:Destroy();
        end);
        u13:GiveTask(u17.Completed:Connect(function() -- Line: 54
            -- upvalues: u13 (copy), u14 (copy)
            u13:GiveTask(task.delay(0.5, function() -- Line: 55
                -- upvalues: u14 (ref)
                u14:Play();
            end));
        end));
        u13:GiveTask(function() -- Line: 59
            -- upvalues: u17 (copy)
            u17:Cancel();
            u17:Destroy();
        end);
        u14:Play();

        return function() -- Line: 64
            -- upvalues: u13 (copy), u12 (copy)
            u13:Destroy();
            u12.Transparency = 0;
        end;
    end;

    local sharedData = u6.store.Draft.sharedData;

    if sharedData ~= nil then
        sharedData = sharedData.matchDraftPhase;
    end;

    useEffect(v18, { sharedData });

    u11 = function(p19) -- Line: 74
        -- upvalues: MatchDraftPhase (ref)
        if p19 == MatchDraftPhase.BANNING then
            return Color3.fromRGB(255, 153, 153);
        end;

        if p19 == MatchDraftPhase.BANNING_TRANSITION and true or false or p19 == MatchDraftPhase.LOADING then
            return Color3.fromRGB(255, 255, 145);
        end;

        if p19 == MatchDraftPhase.KIT_SELECT then
            return Color3.fromRGB(135, 135, 255);
        end;

        return Color3.fromRGB(255, 255, 255);
    end;

    local v20 = {
        DisplayOrder = 1500,
        IgnoreGuiInset = true
    };
    local v21 = {};
    local _ = #v21;
    local v22 = {
        AutoButtonColor = false,
        ZIndex = -1,
        Size = UDim2.fromScale(1, 1),
        Image = v10,
        ScaleType = Enum.ScaleType.Crop
    };
    local v23 = {};
    local v24 = {
        ZIndex = -1,
        Size = UDim2.fromScale(1, 1)
    };
    local v25 = {
        HeaderPane = u3.createElement("Frame", {
            Transparency = 0.2,
            BorderSizePixel = 0,
            ZIndex = -1,
            Size = UDim2.fromScale(1, 0.25),
            BackgroundColor3 = ColorUtil.BLACK
        }),
        LeftPane = u3.createElement("Frame", {
            Transparency = 0.2,
            BorderSizePixel = 0,
            ZIndex = -1,
            Size = UDim2.fromScale(0.25, 0.75),
            Position = UDim2.fromScale(0, 0.25),
            BackgroundColor3 = ColorUtil.BLACK
        }),
        RightPane = u3.createElement("Frame", {
            Transparency = 0.2,
            BorderSizePixel = 0,
            ZIndex = -1,
            Size = UDim2.fromScale(0.25, 0.75),
            Position = UDim2.fromScale(1, 0.25),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = ColorUtil.BLACK
        })
    };
    local _ = #v25;
    local v26 = {
        Transparency = 0.2,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.5, 0.75),
        Position = UDim2.fromScale(0.5, 0.25),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local sharedData2 = u6.store.Draft.sharedData;

    if sharedData2 ~= nil then
        sharedData2 = sharedData2.matchDraftPhase;
    end;

    v26.ZIndex = sharedData2 == MatchDraftPhase.LOADING and 1000 or -1;
    v25.CenterBodyPane = u3.createElement("Frame", v26);
    v23.DraftAppBackgroundTint = u3.createElement(Empty, v24, v25);
    local v27 = {
        Size = UDim2.fromScale(1, 1)
    };
    local sharedData3 = u6.store.Draft.sharedData;

    if sharedData3 ~= nil then
        sharedData3 = sharedData3.matchDraftPhase;
    end;

    v27.BackgroundColor3 = u11(sharedData3);
    v27[u3.Ref] = u8;
    v27.ZIndex = -1;
    v23.BackgroundGradient = u3.createElement("Frame", v27, { u3.createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
            Color = ColorSequence.new(ColorUtil.WHITE)
        }) });
    local v28;

    if u6.store.Draft.draftMode == MatchDraftMode.TWO_TEAMS then
        v28 = u3.createElement(MatchDraftTwoTeamsPage, {
            store = u6.store
        });
    elseif u6.store.Draft.draftMode == MatchDraftMode.MULTI_TEAM then
        v28 = u3.createElement(MatchDraftMultiTeamPage, {
            store = u6.store
        });
    else
        v28 = u3.createFragment();
    end;

    v23[#v23 + 1] = v28;
    v21.DraftAppBackground = u3.createElement("ImageButton", v22, v23);

    return u3.createElement("ScreenGui", v20, v21);
end);

return {
    MatchDraftApp = v5.connect(function(p30, p31) -- Line: 179
        local v32 = {};

        for i, v in p31 do
            v32[i] = v;
        end;

        v32.store = p30;

        return v32;
    end)(v29)
};