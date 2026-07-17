-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ElementGrid = v1.ElementGrid;
local GridElement = v1.GridElement;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TournamentAppEmoteGrid = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: ClientStore (copy), EmoteType (copy), EmoteMeta (copy), LockerTab (copy), u2 (copy), GridElement (copy), SoundManager (copy), GameSound (copy), ElementGrid (copy), Theme (copy), ColorUtil (copy)
        local useState = p5.useState;
        local _ = p5.useEffect;
        local useMemo = p5.useMemo;
        local emotes = ClientStore:getState().Locker.emotes;
        local u6, u7 = useState(EmoteType.NONE);
        local _ = ClientStore:getState().Tournament.myTeamId;

        local function v11(p8) -- Line: 25
            -- upvalues: EmoteMeta (ref), EmoteType (ref), LockerTab (ref)
            local v9 = EmoteMeta[p8];

            if p8 == EmoteType.NONE then
                return nil;
            end;

            if not v9 then
                return nil;
            end;

            if v9.disabled then
                return nil;
            end;

            if v9.animation then
                return nil;
            end;

            local v10 = {
                name = v9.name
            };
            local image = v9.image;
            v10.imageId = image == nil and "" or image;
            v10.itemEnum = p8;
            v10.lockerTab = LockerTab.EMOTES;

            return v10;
        end;

        local v12 = 0;
        local v13 = {};

        for i, v in emotes do
            local v14 = v11(v, i - 1, emotes);

            if v14 ~= nil then
                v12 = v12 + 1;
                v13[v12] = v14;
            end;
        end;

        local u15 = v13;
        table.sort(u15, function(p16, p17) -- Line: 65
            if string.lower(p16.name) == "none" then
                return true;
            end;

            if string.lower(p17.name) == "none" then
                return false;
            end;

            return p16.name < p17.name;
        end);
        local u18 = {};
        local v32 = useMemo(function() -- Line: 76
            -- upvalues: u15 (ref), u18 (ref), u7 (copy), EmoteMeta (ref), u2 (ref), GridElement (ref), SoundManager (ref), GameSound (ref), ElementGrid (ref)
            local v19 = u15;

            local function _(p20) -- Line: 78
                return {
                    id = p20.itemEnum,
                    imageId = p20.imageId,
                    alt = p20.name
                };
            end;

            local v21 = table.create(#v19);

            for i, v in v19 do
                local _ = i - 1;
                v21[i] = {
                    id = v.itemEnum,
                    imageId = v.imageId,
                    alt = v.name
                };
            end;

            u18 = v21;

            local function _(p22) -- Line: 92
                -- upvalues: u7 (ref)
                u7(p22);
            end;

            local v23 = u18;

            local function v27(u24, p25) -- Line: 96
                -- upvalues: EmoteMeta (ref), u2 (ref), GridElement (ref), SoundManager (ref), GameSound (ref), u7 (ref)
                local v26 = EmoteMeta[u24.id];

                if v26 then
                    v26 = v26.animation ~= nil;
                end;

                return u2.createElement(GridElement, {
                    CurrentIndex = 0,
                    Index = p25,
                    Image = u24.imageId,
                    TextElement = {
                        Text = u24.alt
                    },

                    OnClick = function() -- Line: 107, Name: OnClick
                        -- upvalues: u24 (copy), SoundManager (ref), GameSound (ref), u7 (ref)
                        local id = u24.id;

                        if id ~= "" and id then
                            SoundManager:playSound(GameSound.ARMOR_EQUIP);
                            u7(u24.id);
                        end;
                    end
                });
            end;

            local v28 = table.create(#v23);

            for i, v in v23 do
                v28[i] = v27(v, i - 1, v23);
            end;

            local v29 = {
                ElementSize = UDim2.new(0.187, 0, 0, 90),
                ScrollingFrameProps = {
                    ScrollBarThickness = 4,
                    Size = UDim2.new(1, 0, 0.8, 0),
                    Position = UDim2.fromOffset(0, 0),
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
                },
                UIPaddingProps = {
                    PaddingTop = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 0),
                    PaddingLeft = UDim.new(0, 32),
                    PaddingBottom = UDim.new(0, 2)
                },
                UIGridLayoutProps = {
                    CellSize = UDim2.new(0.15, 0, 0, 100)
                }
            };
            local v30 = {};
            local v31 = #v30;

            for i, v in v28 do
                v30[v31 + i] = v;
            end;

            return u2.createFragment({
                EmoteElementGrid = u2.createElement(ElementGrid, v29, v30)
            });
        end, {});

        return u2.createFragment({
            Items = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ZIndex = 4,
                Size = UDim2.fromScale(1, 1),
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                v32,
                ConfirmButton = u2.createElement("TextButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.9),
                    Size = UDim2.fromScale(0.3, 0.1),
                    BackgroundColor3 = Theme.backgroundSuccess,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    TextColor3 = ColorUtil.WHITE,
                    Font = "Roboto",
                    Text = "<b>Set Icon</b>",
                    TextXAlignment = "Center",
                    TextScaled = true,
                    RichText = true,

                    [u2.Event.Activated] = function() -- Line: 171
                        -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy), u6 (copy)
                        SoundManager:playSound(GameSound.UI_CLICK);
                        u4.onSetIcon(u6);
                        u4.onClose();
                    end,

                    ZIndex = 4
                }, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.1, 0)
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) })
            })
        });
    end)
};