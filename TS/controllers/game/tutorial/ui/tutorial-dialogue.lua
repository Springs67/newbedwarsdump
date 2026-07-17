-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local UserInputService = v3.UserInputService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4;

if DeviceUtil.isGamepadControls() then
    u4 = Enum.KeyCode.ButtonX;
else
    u4 = Enum.KeyCode.V;
end;

return {
    TutorialDialogue = v2.new(u1)(function(u5, p6) -- Line: 16
        -- upvalues: u1 (copy), DeviceUtil (copy), ContextActionService (copy), UserInputService (copy), RuntimeLib (copy), SoundManager (copy), default (copy), KnitClient (copy), Theme (copy), ColorUtil (copy), BedwarsImageId (copy), u4 (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u1.createRef();
        local u8 = u1.createRef();
        local u9, u10 = useState(DeviceUtil.isHoarceKat() and 1 or 0);
        local v11 = DeviceUtil.isSmallScreen();
        local v12 = v11 and 1.25 or 0.6;
        local u13 = false;
        local u14 = nil;
        local u15 = nil;
        useEffect(function() -- Line: 26
            -- upvalues: u14 (ref), u7 (copy), u5 (copy), u9 (copy), ContextActionService (ref), u15 (ref), UserInputService (ref)
            u14(u7, u5.Dialogue[u9 + 1], 0.01, u5.TalkSound);
            ContextActionService:BindAction("advance_dialogue", function(p16, p17, p18) -- Line: 28
                -- upvalues: u15 (ref)
                if p17 == Enum.UserInputState.Begin then
                    u15();
                end;
            end, false, Enum.KeyCode.V);
            local u20 = UserInputService.InputBegan:Connect(function(p19) -- Line: 33
                -- upvalues: u15 (ref)
                if p19.KeyCode == Enum.KeyCode.ButtonX then
                    u15();
                end;
            end);

            return function() -- Line: 38
                -- upvalues: ContextActionService (ref), u20 (copy)
                ContextActionService:UnbindAction("advance_dialogue");
                u20:Disconnect();
            end;
        end);
        u14 = RuntimeLib.async(function(p21, p22, p23, p24) -- Line: 43
            -- upvalues: u13 (ref), DeviceUtil (ref), SoundManager (ref)
            u13 = true;
            local v25 = p21:getValue();

            if not v25 then
                return nil;
            end;

            if #p22 <= 0 then
                return nil;
            end;

            v25.MaxVisibleGraphemes = 0;
            v25.Text = p22;
            local v26 = string.gsub(p22, "<[^<>]->", "");

            for _, _ in utf8.graphemes(v26) do
                if not u13 then
                    v25.MaxVisibleGraphemes = #v26;

                    return nil;
                end;

                v25.MaxVisibleGraphemes = v25.MaxVisibleGraphemes + 1;
                local v27 = nil;
                local v28;

                if v25.MaxVisibleGraphemes % 2 == 0 then
                    v28 = p24;
                else
                    v28 = false;
                end;

                if v28 ~= "" and (v28 and not DeviceUtil.isHoarceKat()) then
                    v27 = SoundManager:playSound(p24, {
                        volumeMultiplier = 3,
                        playbackSpeedMultiplier = 0.85 + math.random() * 0.2
                    });
                end;

                task.wait(p23);

                if v27 ~= nil then
                    v27:Destroy();
                end;
            end;

            u13 = false;
        end);

        u15 = function() -- Line: 81, Name: advanceDialogue
            -- upvalues: u13 (ref), u9 (copy), u5 (copy), u10 (copy), u14 (ref), u7 (copy), DeviceUtil (ref), u8 (copy), default (ref), KnitClient (ref)
            if u13 then
                u13 = false;

                return;
            end;

            if u9 < #u5.Dialogue - 1 then
                u10(u9 + 1);
                u14(u7, u5.Dialogue[u9 + 1], 0.01, u5.TalkSound);

                return;
            end;

            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local v29 = u8:getValue();

            if v29 then
                v29.Visible = false;
            end;

            default.Client:Get("TutorialDialogueClose"):SendToServer({
                tutorialType = u5.TutorialType
            });
            KnitClient.Controllers.TutorialController:closeDialogue();
        end;

        local function prevDialogue() -- Line: 103
            -- upvalues: u13 (ref), u9 (copy), u10 (copy), u14 (ref), u7 (copy), u5 (copy)
            if u13 then
                u13 = false;

                return;
            end;

            if u9 > 0 then
                u10(u9 - 1);
                u14(u7, u5.Dialogue[u9 + 1], 0.01, u5.TalkSound);
            end;
        end;

        local v30 = {
            ResetOnSpawn = false,
            DisplayOrder = 999
        };
        local v31 = {
            TapAnywhereToAdvance = u1.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                Text = "",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 0,

                [u1.Event.Activated] = function() -- Line: 124
                    -- upvalues: u15 (ref)
                    u15();
                end
            })
        };
        local _ = #v31;
        local v32 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 1
        };
        local v33;

        if v11 then
            v33 = UDim2.fromScale(0.82, 0.28);
        else
            v33 = UDim2.fromScale(0.5, 0.25);
        end;

        v32.Size = v33;
        v32.AnchorPoint = Vector2.new(0.5, 1);
        v32.Position = UDim2.fromScale(0.5, 0.9);
        local v34 = {};
        local _ = #v34;
        local v35 = {
            [u1.Ref] = u8,
            Size = UDim2.fromScale(1, 0.8),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            BorderSizePixel = 1,
            BackgroundColor3 = Theme.backgroundSecondary,
            BackgroundTransparency = 0,
            Text = "",
            AutoButtonColor = false,
            ZIndex = 1,

            [u1.Event.Activated] = function() -- Line: 151
                -- upvalues: u15 (ref)
                u15();
            end
        };
        local v36 = {};
        local createElement = u1.createElement;
        local v37 = {
            [u1.Ref] = u7,
            Size = UDim2.fromScale(0.9, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = "",
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        };
        local v38;

        if DeviceUtil.isSmallScreen() then
            v38 = Enum.FontSize.Size14;
        else
            v38 = Enum.FontSize.Size24;
        end;

        v37.FontSize = v38;
        v37.RichText = true;
        v37.TextWrapped = true;
        v37.BackgroundTransparency = 1;
        v37.BorderSizePixel = 0;
        v37.ZIndex = 2;
        v36.DialogueText = createElement("TextLabel", v37);
        v36[1], v36[2] = u1.createElement("UIStroke", {
    Thickness = DeviceUtil.isSmallScreen() and 3 or 5,
    Color = Theme.backgroundPrimary
}), u1.createElement("UICorner", {
    CornerRadius = UDim.new(0.1, 0)
});
        local _ = #v36;
        local v39 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            Size = UDim2.fromScale(v12 * 0.24, v12 * 0.3),
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(1.02, 1.1)
        };
        local v40 = {};
        local _ = #v40;
        local v41 = {
            Size = UDim2.fromScale(0.58, 1),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            BackgroundColor3 = Theme.backgroundPrimary,
            ZIndex = 4,

            [u1.Event.Activated] = function() -- Line: 196
                -- upvalues: u15 (ref)
                u15();
            end
        };
        local v42 = {};
        local v43 = u1.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 4)
        });
        local createElement2 = u1.createElement;
        local v44 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v45;

        if #u5.Dialogue - 1 <= u9 then
            v45 = BedwarsImageId.CHECK_SOLID;
        else
            v45 = BedwarsImageId.TRIANGLE_ARROW_RIGHT;
        end;

        v44.Image = v45;
        v44.SizeConstraint = Enum.SizeConstraint.RelativeYY;
        v44.AnchorPoint = Vector2.new(0.5, 0.5);
        v44.Position = UDim2.fromScale(0.5, 0.5);
        v44.ScaleType = Enum.ScaleType.Fit;
        v42[1], v42[2] = v43, createElement2("ImageLabel", v44);
        local v46 = #v42;
        local v47 = not DeviceUtil.isMobileControls();

        if v47 then
            local createFragment = u1.createFragment;
            local v48 = {};
            local createElement3 = u1.createElement;
            local v49 = {
                AutomaticSize = "X",
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Size = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(1, 1),
                Text = "(" .. (u4 == Enum.KeyCode.ButtonX and "X" or "V") .. ")",
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            };
            local v50;

            if DeviceUtil.isSmallScreen() then
                v50 = Enum.FontSize.Size12;
            else
                v50 = Enum.FontSize.Size14;
            end;

            v49.FontSize = v50;
            v48.NextDialogueHotkey = createElement3("TextLabel", v49);
            v47 = createFragment(v48);
        end;

        if v47 then
            v42[v46 + 1] = v47;
        end;

        v42[#v42 + 1] = u1.createElement("UICorner", {
            CornerRadius = UDim.new(0.2, 0)
        });
        v40.AdvanceDialogueButton = u1.createElement("ImageButton", v41, v42);
        v40.PreviousDialogueButton = u1.createElement("ImageButton", {
            Size = UDim2.fromScale(0.4, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            BackgroundColor3 = Theme.backgroundPrimary,
            Visible = u9 > 0,
            ZIndex = 4,

            [u1.Event.Activated] = function() -- Line: 251
                -- upvalues: u13 (ref), u9 (copy), u10 (copy), u14 (ref), u7 (copy), u5 (copy)
                if u13 then
                    u13 = false;

                    return;
                end;

                if u9 > 0 then
                    u10(u9 - 1);
                    u14(u7, u5.Dialogue[u9 + 1], 0.01, u5.TalkSound);
                end;
            end
        }, { u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Size = UDim2.fromScale(1, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                Image = BedwarsImageId.TRIANGLE_ARROW_LEFT,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit
            }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(0.2, 0)
            }) });
        v36.DialogueButtons = u1.createElement("Frame", v39, v40);
        v34.DialogueBox = u1.createElement("TextButton", v35, v36);
        v31.TutorialDialogueWrapper = u1.createElement("Frame", v32, v34);

        return u1.createFragment({
            TutorialDialogue = u1.createElement("ScreenGui", v30, v31)
        });
    end)
};