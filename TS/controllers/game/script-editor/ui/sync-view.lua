-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    SyncView = v4.new(u3)(function(p5, p6) -- Line: 13
        -- upvalues: u3 (copy), u2 (copy), KnitClient (copy), ColorUtil (copy), Button (copy), Empty (copy), CircularSpinner (copy), BedwarsImageId (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7, u8 = useState(p5.syncToken);
        local v9, u10 = useState(1);
        local v11, u12 = useState(false);
        local u13 = u3.createRef();
        local u14 = u3.createRef();
        useEffect(function() -- Line: 21
            -- upvalues: u2 (ref), u13 (copy), u10 (copy)
            local u15 = u2.new();
            local u16 = u13:getValue();

            if u16 then
                u15:GiveTask(u16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 25
                    -- upvalues: u10 (ref), u16 (copy)
                    u10(u16.AbsoluteSize.X / 1285);
                end));
            end;

            return function() -- Line: 29
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 33
            -- upvalues: u2 (ref), u7 (copy), KnitClient (ref), u8 (copy), u12 (copy)
            local u17 = u2.new();

            if u7 == "" or not u7 then
                local u19 = KnitClient.Controllers.ScriptSyncController.syncTokenGenerated:Connect(function(p18) -- Line: 36
                    -- upvalues: u8 (ref), u12 (ref)
                    u8(p18);
                    u12(false);
                end);
                u17:GiveTask(function() -- Line: 40
                    -- upvalues: u19 (copy)
                    return u19:Disconnect();
                end);
            end;

            return function() -- Line: 44
                -- upvalues: u17 (copy)
                return u17:DoCleaning();
            end;
        end, {});
        local v20 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            [u3.Ref] = u13
        };
        local v21 = {};
        local v22 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.7610894941634241, 0.9008620689655172),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v23 = {
            u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0.1, 0)
            }),
            Header = u3.createElement("TextLabel", {
                LineHeight = 1.05,
                Text = "🔁 Code Sync",
                LayoutOrder = 0,
                TextSize = 50 * v9,
                FontFace = Font.new("Arial", Enum.FontWeight.Light),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            }),
            u3.createElement("TextLabel", {
                Text = "Download the BedWars Scripting Toolkit extension from the VS Code marketplace to use Code Sync. Code Sync allows you to write scripts in VS Code and automatically sync them into the BedWars script editor. Generate a sync token below to get started.",
                RichText = true,
                LineHeight = 1.05,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                TextWrapped = true,
                Size = UDim2.fromScale(1, 0.07177033492822966),
                TextSize = 30 * v9,
                FontFace = Font.new("Arial", Enum.FontWeight.Light),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            })
        };
        local v24 = #v23;
        local v25;

        if u7 == nil and v11 == false then
            v25 = u3.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.2)
            }, { u3.createElement(Button, {
                    Text = "<b>Generate Sync Token</b>",

                    OnClick = function() -- Line: 105, Name: OnClick
                        -- upvalues: KnitClient (ref), u12 (copy)
                        KnitClient.Controllers.ScriptSyncController:sendSyncEnableRequest();
                        u12(true);
                    end,

                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.5, 0.3),
                    BackgroundColor3 = ColorUtil.hexColor(16738428),
                    TextLabel = {
                        RichText = true
                    }
                }) });
        else
            v25 = false;
        end;

        if v25 then
            v23[v24 + 1] = v25;
        end;

        local v26 = #v23;
        local v27;

        if u7 == nil and v11 == true then
            v27 = u3.createElement(Empty, {
                LayoutOrder = 2,
                ZIndex = 1,
                Size = UDim2.fromScale(1, 0.2)
            }, { u3.createElement(CircularSpinner, {
                    Size = UDim2.fromScale(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        else
            v27 = false;
        end;

        if v27 then
            v23[v26 + 1] = v27;
        end;

        local v28 = #v23;
        local v29;

        if u7 == nil then
            v29 = false;
        else
            v29 = u3.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.2)
            }, { u3.createElement("TextLabel", {
                    Text = "<b>Sync Token</b>",
                    RichText = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextSize = 12,
                    AnchorPoint = Vector2.new(0, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(0.15, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }), u3.createElement("TextBox", {
                    [u3.Ref] = u14,
                    RichText = true,
                    ClearTextOnFocus = false,
                    TextEditable = false,
                    Text = u7,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.5, 0.3),
                    TextSize = 12,
                    BackgroundTransparency = 0.5,
                    BackgroundColor3 = Color3.fromRGB(83, 83, 83),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    ClipsDescendants = true
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }) }), u3.createElement("ImageButton", {
                    Image = BedwarsImageId.EYE_ICON_1,
                    Position = UDim2.fromScale(0.725, 0.35),
                    Size = UDim2.fromScale(0.15, 0.3),
                    ScaleType = Enum.ScaleType.Fit,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,

                    [u3.Event.MouseButton1Down] = function() -- Line: 185
                        -- upvalues: u14 (copy), u7 (copy)
                        local v30 = u14:getValue();

                        if v30 then
                            if #v30.Text > 25 then
                                v30.Text = "<i>hidden</i>";

                                return;
                            end;

                            v30.Text = u7;
                        end;
                    end
                }) });
        end;

        if v29 then
            v23[v28 + 1] = v29;
        end;

        v23[#v23 + 1] = u3.createElement("TextLabel", {
            Text = "Paste your sync token into the Code Sync panel in VS Code to start syncing. \n\n<b>⚠️WARNING⚠️</b> If you share your token with other users, they will be able to sync scripts into your editor. Your token expires after each session and a new one will need to be generated.",
            RichText = true,
            LineHeight = 1.05,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            TextWrapped = true,
            Size = UDim2.fromScale(1, 0.07177033492822966),
            TextSize = 30 * v9,
            FontFace = Font.new("Arial", Enum.FontWeight.Light),
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top
        });
        v21[#v21 + 1] = u3.createElement("Frame", v22, v23);

        return u3.createElement("ImageButton", v20, v21);
    end)
};