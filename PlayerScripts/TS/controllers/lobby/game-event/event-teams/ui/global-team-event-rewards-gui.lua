-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local GlobalTeamsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local GlobalTeamEventRewardBox = RuntimeLib.import(script, script.Parent, "global-team-event-reward-box").GlobalTeamEventRewardBox;

return {
    GlobalTeamEventRewardsGUI = v3.new(u2)(function(u4, p5) -- Line: 22
        -- upvalues: EventMeta (copy), GlobalTeamsUtil (copy), DeviceUtil (copy), KnitClient (copy), ClientStore (copy), default (copy), SoundManager (copy), GameSound (copy), u2 (copy), Padding (copy), StringUtil (copy), ColorUtil (copy), Theme (copy), EventCurrencyMeta (copy), GlobalTeamEventRewardBox (copy), Empty (copy), AutoCanvasScrollingFrame (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local _, u6 = useState(0);
        local u7, u8 = useState({});
        local u9, u10 = useState(0);
        local v11 = EventMeta[u4.EventType];
        local globalTeamEventKey = v11.globalTeamEventKey;
        local u12 = 0;
        local v13 = GlobalTeamsUtil.getGlobalTeamMissionsForTeam(globalTeamEventKey, u4.GlobalTeamKey);
        local u14;

        if DeviceUtil.isHoarceKat() then
            u14 = 20000000;
        else
            local v15 = KnitClient.Controllers.GlobalTeamsController:getLocalGlobalTeamScore(globalTeamEventKey, u4.GlobalTeamKey);
            u14 = v15 == nil and 0 or v15;
        end;

        local u16 = 0;

        local function _(p17) -- Line: 44
            -- upvalues: u16 (ref)
            if u16 < p17.globalTeamScoreRequired then
                u16 = p17.globalTeamScoreRequired;
            end;
        end;

        for i, v in v13 do
            local _ = i - 1;

            if u16 < v.globalTeamScoreRequired then
                u16 = v.globalTeamScoreRequired;
            end;
        end;

        local u18 = 1500 / #v13;
        local u19 = 0;

        local function _(p20) -- Line: 56
            -- upvalues: u14 (copy), u19 (ref)
            if p20.globalTeamScoreRequired <= u14 then
                u19 = u19 + 1;
            end;
        end;

        for i, v in v13 do
            local _ = i - 1;

            if v.globalTeamScoreRequired <= u14 then
                u19 = u19 + 1;
            end;
        end;

        local function _(p21) -- Line: 64
            -- upvalues: u14 (copy)
            return u14 < p21.globalTeamScoreRequired;
        end;

        local v22 = -1;

        for i, v in v13 do
            local _ = i - 1;

            if u14 < v.globalTeamScoreRequired == true then
                v22 = i - 1;
                break;
            end;
        end;

        local v23 = v22 - 1;

        if v13[#v13 - 1 + 1].globalTeamScoreRequired <= u14 then
            v22 = #v13 - 1;
            v23 = #v13 - 1;
        end;

        local v24 = v13[v22 + 1].globalTeamScoreRequired - (v23 <= 0 and 0 or v13[v23 + 1].globalTeamScoreRequired);
        local v25 = u19 * u18 + (v24 == 0 and 0 or (u14 - (v23 <= 0 and 0 or v13[v23 + 1].globalTeamScoreRequired)) / v24) * u18;
        useEffect(function() -- Line: 88
            -- upvalues: ClientStore (ref), u4 (copy), u8 (copy), u6 (copy), u14 (copy), u16 (ref), u10 (copy)
            local v26 = ClientStore:getState().Event.profileData.events[u4.EventType];
            local v27;

            if v26 == nil then
                v27 = v26;
            else
                v27 = v26.claimedGlobalTeamRewards;
            end;

            u8(v27 == nil and {} or v27);
            u6((math.clamp(u14 / u16, 0, 1)));

            if v26 ~= nil then
                v26 = v26.totalGlobalTeamContribution;
            end;

            u10(v26 == nil and 0 or v26);
        end, {});

        local function u32(p28) -- Line: 110
            -- upvalues: u7 (copy), u12 (ref), default (ref), globalTeamEventKey (copy), SoundManager (ref), GameSound (ref), u8 (copy)
            if table.find(u7, p28) ~= nil then
                return nil;
            end;

            if tick() - u12 < 0.5 then
                return nil;
            end;

            u12 = tick();

            if not default.Client:Get("TryToClaimGlobalTeamReward"):CallServer({
                globalTeamEventKey = globalTeamEventKey,
                rewardId = p28
            }) then
                return nil;
            end;

            SoundManager:playSound(GameSound.UI_REWARD);
            local v29 = {};
            local v30 = #v29;
            local v31 = #u7;
            table.move(u7, 1, v31, v30 + 1, v29);
            v29[v30 + v31 + 1] = p28;
            u8(v29);
        end;

        local v33 = {
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Selectable = false,
                Size = UDim2.fromScale(1, 1),
                CanvasSize = UDim2.new(1, 0, 0, 1620)
            }
        };
        local v34 = {};
        local _ = #v34;
        local v35 = {
            BackgroundTransparency = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v36 = { u2.createElement(Padding, {
                Padding = {
                    Vertical = 60
                }
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0, 10)
            }) };
        local _ = #v36;

        local function v39(p37, p38) -- Line: 178
            -- upvalues: u2 (ref), u18 (copy), StringUtil (ref), ColorUtil (ref)
            return u2.createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(0, 1500 - (p38 + 1) * u18),
                Size = UDim2.fromScale(1, 0.015)
            }, {
                GlobalTeamEventRewardScoreRequirement = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    TextXAlignment = "Right",
                    Text = StringUtil.formatNumberWithCommas(p37.globalTeamScoreRequired),
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            });
        end;

        local v40 = table.create(#v13);

        for i, v in v13 do
            v40[i] = v39(v, i - 1, v13);
        end;

        local v41 = {
            BackgroundTransparency = 1,
            LayoutOrder = 100,
            Size = UDim2.new(0.3, 0, 0, 1500)
        };
        local v42 = {};
        local v43 = #v42;

        for i, v in v40 do
            v42[v43 + i] = v;
        end;

        v36.GlobalTeamEventRewardScoreRequirementsColumn = u2.createElement("Frame", v41, v42);

        local function v46(p44, p45) -- Line: 213
            -- upvalues: u2 (ref), u18 (copy), ColorUtil (ref)
            return u2.createElement("Frame", {
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                ZIndex = 100,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(0, 1500 - (p45 + 1) * u18),
                Size = UDim2.new(1, 0, 0, 1),
                BackgroundColor3 = ColorUtil.BLACK
            });
        end;

        local v47 = table.create(#v13);

        for i, v in v13 do
            v47[i] = v46(v, i - 1, v13);
        end;

        local v48 = {
            BorderSizePixel = 5,
            BackgroundTransparency = 0,
            LayoutOrder = 200,
            Size = UDim2.new(0, 75, 0, 1500),
            BackgroundColor3 = Theme.backgroundTertiary,
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v49 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            GlobalTeamEventRewardProgressBar = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                Size = UDim2.new(0.9, 0, 0, v25),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Theme.backgroundSuccess
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.75,
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.8, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = EventCurrencyMeta[v11.currencies[1]].icon,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.new(0.65, 0, 0, 30)
                }) })
        };
        local v50 = #v49;

        for i, v in v47 do
            v49[v50 + i] = v;
        end;

        v36.GlobalTeamEventRewardProgressBarContainer = u2.createElement("Frame", v48, v49);

        local function v56(u51, p52) -- Line: 272
            -- upvalues: u18 (copy), u14 (copy), u7 (copy), globalTeamEventKey (copy), u32 (copy), u9 (copy), u2 (ref), GlobalTeamEventRewardBox (ref)
            local v53 = {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromOffset(0, 1500 - (p52 + 1) * u18),
                Size = UDim2.new(1, 0, 0, 80)
            };
            local v54 = {};
            local v55 = {
                RewardData = u51,
                Score = u14,
                Claimed = table.find(u7, u51.globalTeamRewardId) ~= nil,
                GlobalTeamEventKey = globalTeamEventKey,

                OnClaimClick = function() -- Line: 288
                    -- upvalues: u32 (ref), u51 (copy)
                    return u32(u51.globalTeamRewardId);
                end,

                HasEnoughPoints = u14 >= u51.globalTeamScoreRequired,
                PersonalScoreContribution = u9
            };
            v54[#v54 + 1] = u2.createElement(GlobalTeamEventRewardBox, v55);

            return u2.createElement("Frame", v53, v54);
        end;

        local v57 = table.create(#v13);

        for i, v in v13 do
            v57[i] = v56(v, i - 1, v13);
        end;

        local v58 = {
            BackgroundTransparency = 1,
            LayoutOrder = 300,
            Size = UDim2.new(0.4, 0, 0, 1500),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v59 = {};
        local v60 = #v59;

        for i, v in v57 do
            v59[v60 + i] = v;
        end;

        v36.GlobalTeamEventRewardBoxesColumn = u2.createElement("Frame", v58, v59);
        v34.GlobalTeamFrameContainer = u2.createElement(Empty, v35, v36);

        return u2.createFragment({
            GlobalTeamRewardsList = u2.createElement(AutoCanvasScrollingFrame, v33, v34)
        });
    end)
};