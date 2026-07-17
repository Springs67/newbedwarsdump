-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local PregameVotingUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "pregame", "pregame-voting-utils").PregameVotingUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PregameVotingCard = RuntimeLib.import(script, script.Parent, "pregame-voting-card").PregameVotingCard;
local v64 = v3.new(u2)(function(u5, p6) -- Line: 23
    -- upvalues: u2 (copy), UIUtil (copy), TweenService (copy), PregameVotingUtils (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), DarkBackground (copy), DeviceUtil (copy), ColorUtil (copy), Empty (copy), TimedProgressBar (copy), Countdown (copy), PregameVotingCard (copy), SlideIn (copy), Button (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local u7, u8 = useState(false);
    local u9, u10 = useState(nil);
    local u11, u12 = useState(false);
    local u13, u14 = useState(0);
    local u15, u16 = useState(nil);
    local u17 = u2.createRef();
    local u18 = u2.createRef();
    local u19 = u2.createRef();
    local u20 = u2.createRef();
    useEffect(function() -- Line: 35
        -- upvalues: u5 (copy), u12 (copy), u8 (copy)
        if not (u5.winningVotingOption and u5.voteState) then
            return nil;
        end;

        u12(true);
        u8(false);
    end, { u5.winningVotingOption });
    useEffect(function() -- Line: 42
        -- upvalues: u5 (copy), u17 (copy), u18 (copy), u20 (copy), UIUtil (ref), TweenService (ref), PregameVotingUtils (ref), u14 (copy), SoundManager (ref), GameSound (ref), u16 (copy), u19 (copy), Flamework (ref), BedwarsAppIds (ref)
        if not (u5.winningVotingOption and u5.voteState) then
            return nil;
        end;

        local u21 = u17:getValue();
        local u22 = u18:getValue();
        local v23 = u20:getValue();

        if not (u21 and (u22 and v23)) then
            return nil;
        end;

        task.spawn(function() -- Line: 52
            -- upvalues: u21 (copy), UIUtil (ref), u22 (copy)
            local ProgressBarContainer = u21:WaitForChild("ProgressBarContainer");

            if ProgressBarContainer ~= nil then
                ProgressBarContainer = ProgressBarContainer:WaitForChild("ProgressBar");
            end;

            UIUtil:setContainerTransparency(u21, 1, {
                onSetTweenInfo = TweenInfo.new(0.3)
            });
            UIUtil:setContainerTransparency(u22, 1, {
                onSetTweenInfo = TweenInfo.new(0.3)
            });
        end);
        TweenService:Create(v23, TweenInfo.new(2, Enum.EasingStyle.Circular), {
            Position = UDim2.fromScale(0, 0.065)
        }):Play();
        local voteState = u5.voteState;
        local v24;

        if voteState == nil then
            v24 = voteState;
        else
            local function _(p25) -- Line: 74
                return #p25.voterUserIds;
            end;

            v24 = table.create(#voteState);

            for i, v in voteState do
                local _ = i - 1;
                v24[i] = #v.voterUserIds;
            end;
        end;

        local v26 = v24 == nil and { 0 } or v24;

        local function _(p27, p28) -- Line: 89
            return p27 + p28;
        end;

        if #v26 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
        end;

        local u29 = v26[1];

        for i = 2, #v26 do
            local _ = i - 1;
            u29 = u29 + v26[i];
        end;

        local u30;

        if u29 > 16 then
            u30 = 1;
        elseif u29 > 12 then
            u30 = math.random(1, 2);
        elseif u29 > 8 then
            u30 = math.random(2, 4);
        elseif u29 > 4 then
            u30 = math.random(4, 6);
        else
            u30 = u29 <= 2 and 12 or math.random(6, 8);
        end;

        local function _(p31) -- Line: 105
            -- upvalues: u5 (ref)
            local winningVotingOption = u5.winningVotingOption;

            if winningVotingOption ~= nil then
                winningVotingOption = winningVotingOption.mapName;
            end;

            return p31.pregameVotingOption.mapName == winningVotingOption;
        end;

        local u32 = -1;

        for i, v in u5.voteState do
            local _ = i - 1;
            local winningVotingOption = u5.winningVotingOption;

            if winningVotingOption ~= nil then
                winningVotingOption = winningVotingOption.mapName;
            end;

            if v.pregameVotingOption.mapName == winningVotingOption == true then
                u32 = i - 1;
                break;
            end;
        end;

        if u32 == -1 then
            local v33 = math.random(0, PregameVotingUtils.POOL_SIZE - 1);
            u32 = math.round(v33);
        end;

        local voteState2 = u5.voteState;

        local function _(p34) -- Line: 127
            return #p34.voterUserIds;
        end;

        local v35 = table.create(#voteState2);

        for i, v in voteState2 do
            local _ = i - 1;
            v35[i] = #v.voterUserIds;
        end;

        local function _(p36, p37, p38) -- Line: 136
            -- upvalues: u32 (ref)
            if u32 <= p38 then
                return p36;
            end;

            return p36 + p37;
        end;

        local v39 = 0;

        for i = 1, #v35 do
            local v40 = v35[i];

            if u32 > i - 1 then
                v39 = v39 + v40;
            end;
        end;

        local winningVoterIndex = u5.winningVoterIndex;
        local u41 = v39 + (winningVoterIndex == nil and 0 or winningVoterIndex);
        local u42 = u30 * u29 + u41;
        local u43 = (PregameVotingUtils.ROULETTE_DURATION - 2) / u42;
        task.spawn(function() -- Line: 159
            -- upvalues: u42 (copy), u29 (copy), u14 (ref), u30 (copy), u41 (copy), u43 (ref), SoundManager (ref), GameSound (ref), u16 (ref), u32 (ref)
            local v44 = false;
            local v45 = 0;

            while true do
                if v44 then
                    v45 = v45 + 1;
                else
                    v44 = true;
                end;

                if v45 > u42 then
                    SoundManager:playSound(GameSound.PREGAME_VOTE_WINNER_CHOSEN);
                    u16(u32);
                    u14(u41);

                    return;
                end;

                local v46 = v45 % u29;
                u14(v46);

                if u30 * u29 + u41 - 10 < v45 then
                    u43 = u43 + 0.05;
                end;

                if u30 * u29 < v45 and u41 < v46 then
                    u14(v46);
                end;

                SoundManager:playSound(GameSound.ROULETTE_TICK);
                task.wait(u43);
            end;
        end);
        local u47 = u19:getValue();
        task.delay(PregameVotingUtils.ROULETTE_DURATION + PregameVotingUtils.ROULETTE_BREAK_DURATION + 0.5, function() -- Line: 191
            -- upvalues: u47 (copy), UIUtil (ref), Flamework (ref), BedwarsAppIds (ref)
            if u47 then
                UIUtil:setContainerTransparency(u47, 1, {
                    onSetTweenInfo = TweenInfo.new(0.3)
                });
            end;

            task.wait(1);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PREGAME_VOTING);
        end);
    end, { u11 });
    local v48;

    if u7 then
        v48 = u2.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 901,
            Enabled = not u5.winningVotingOption
        }, { u2.createElement(Button, {
                Text = "<b>Show</b>",
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.13, 0.05),
                Position = UDim2.fromScale(0.5, 0.95),
                AnchorPoint = Vector2.new(0.5, 1),

                OnClick = function() -- Line: 364, Name: OnClick
                    -- upvalues: u8 (copy), u7 (copy), SoundManager (ref), GameSound (ref)
                    u8(not u7);
                    SoundManager:playSound(GameSound.UI_CLICK_2);
                end
            }) });
    else
        local v49 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v50 = { u2.createElement(DarkBackground, {
                AppId = u5.AppId,
                ImageButtonProps = {
                    ZIndex = -99
                },

                OnClick = function() -- Line: 212, Name: OnClick
                    -- upvalues: u11 (copy), u8 (copy), u7 (copy)
                    if not u11 then
                        u8(not u7);
                    end;

                    return false;
                end
            }) };
        local v51 = {};
        local v52 = {
            BackgroundTransparency = 1,
            Modal = true,
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.85 or 0.75, DeviceUtil.isSmallScreen() and 0.85 or 0.75),
            Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.02 or 0.1),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v53 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.6386036960985626
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }) };
        local _ = #v53;
        local v54 = {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v55 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), u2.createElement("TextLabel", {
                Text = "Map Vote!",
                TextColor3 = ColorUtil.WHITE,
                TextScaled = true,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextStrokeTransparency = 1,
                Size = UDim2.fromScale(1, 0.1),
                BackgroundTransparency = 1,
                [u2.Ref] = u18
            }), u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.03),
                Position = UDim2.fromScale(0, 0.1),
                LayoutOrder = 1,
                [u2.Ref] = u17
            }, { u2.createElement(TimedProgressBar, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.65, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    StartTime = u5.VoteStartTime,
                    EndTime = u5.VoteEndTime,
                    ProgressBarConfig = {
                        Flip = true,
                        GradientRotation = 180,
                        BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                    }
                }), u2.createElement(Countdown, {
                    EndTime = u5.VoteEndTime,
                    TextLabel = {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.1, 1),
                        Position = UDim2.fromScale(0.8, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5)
                    },
                    CountdownConfig = {
                        minutes = false,
                        hours = false,
                        days = false
                    }
                }) }) };
        local voteState = u5.voteState;

        if voteState then
            local voteState2 = u5.voteState;

            local function v58(p56, u57) -- Line: 298
                -- upvalues: u2 (ref), PregameVotingCard (ref), u5 (copy), u9 (copy), u15 (copy), u10 (copy), u11 (copy), u13 (copy)
                return u2.createElement(PregameVotingCard, {
                    voteState = u5.voteState or {},
                    Selected = u9 == u57,
                    winHighlightIndex = u15,
                    votingOptionIndex = u57,

                    OnClick = function() -- Line: 304, Name: OnClick
                        -- upvalues: u10 (ref), u57 (copy)
                        u10(u57);
                    end,

                    rouletteMode = u11,
                    rouletteSelectedVoterIndex = u13,
                    WinningPregameVotingOption = u5.winningVotingOption
                });
            end;

            voteState = table.create(#voteState2);

            for i, v in voteState2 do
                voteState[i] = v58(v, i - 1, voteState2);
            end;
        end;

        local v59 = {
            Size = UDim2.fromScale(1, 0.9),
            Position = UDim2.fromScale(0, 0.13),
            [u2.Ref] = u20
        };
        local v60 = { u2.createElement("UIGridLayout", {
                FillDirectionMaxCells = 2,
                CellPadding = UDim2.fromScale(0.025, 0.05),
                CellSize = UDim2.fromScale(0.475, 0.45),
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }) };
        local v61 = #v60;

        if voteState then
            for i, v in voteState do
                v60[v61 + i] = v;
            end;
        end;

        v55[#v55 + 1] = u2.createElement(Empty, v59, v60);
        v53.PregameCore = u2.createElement("Frame", v54, v55);
        v51[#v51 + 1] = u2.createElement("ImageButton", v52, v53);
        v50[#v50 + 1] = u2.createElement(SlideIn, {}, v51);
        v48 = u2.createElement(Empty, v49, v50);
    end;

    local v62 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen(),
        [u2.Ref] = u19
    };
    local v63 = {
        [#v63 + 1] = v48
    };

    return u2.createElement("ScreenGui", v62, v63);
end);

return {
    PregameVotingApp = v4.connect(function(p65, p66) -- Line: 383
        local v67 = {
            store = p65
        };
        local pregameVote = p65.Bedwars.pregameVote;

        if pregameVote ~= nil then
            pregameVote = pregameVote.voteState;
        end;

        v67.voteState = pregameVote;
        local pregameVote2 = p65.Bedwars.pregameVote;

        if pregameVote2 ~= nil then
            pregameVote2 = pregameVote2.winningVotingOption;
        end;

        v67.winningVotingOption = pregameVote2;
        local pregameVote3 = p65.Bedwars.pregameVote;

        if pregameVote3 ~= nil then
            pregameVote3 = pregameVote3.winningVoterIndex;
        end;

        v67.winningVoterIndex = pregameVote3;

        for i, v in p66 do
            v67[i] = v;
        end;

        return v67;
    end)(v64)
};