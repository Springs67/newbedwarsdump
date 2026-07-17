-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v5 = u4.Component:extend("ScriptEditorComponent");

function v5.init(p6, p7) -- Line: 19
    -- upvalues: u3 (copy)
    p6.maid = u3.new();
    p6.shiftDown = false;
    p6.commandDown = false;
    p6.activeTextboxMaid = u3.new();
    p6:setState({
        textSize = 18,
        text = p6.props.initialText,
        numLines = #string.split(p6.props.initialText, "\n")
    });
end;

function v5.willUpdate(p8, p9, p10) -- Line: 30
    -- upvalues: ClientStore (copy)
    if p9.scriptId ~= p8.props.scriptId then
        ClientStore:dispatch({
            type = "GameUpdateScript",
            updateFromServer = false,
            scriptUpdates = {
                {
                    scriptId = p8.props.scriptId,
                    scriptContents = p8.state.text
                }
            }
        });
    end;
end;

function v5.didUpdate(p11, p12, p13) -- Line: 42
    -- upvalues: ClientStore (copy), u2 (copy)
    p11:registerPotentiallyNewTextBox();
    local v14 = {};

    if p11.state.text ~= p13.text then
        v14.numLines = #string.split(p11.state.text, "\n");
        local v15 = p11.props.textBoxRef:getValue();

        if v15 then
            v15.Text = p11.state.text;
        end;

        local v16 = ClientStore:getState().Game.scripts[p11.props.scriptId];

        if v16 ~= nil then
            v16 = v16.editInProgress;
        end;

        if v16 ~= true then
            ClientStore:dispatch({
                type = "GameSetScriptEditInProgress",
                editInProgress = true,
                scriptId = p11.props.scriptId
            });
        end;
    end;

    if p11.props.scriptId ~= p12.scriptId then
        v14.text = p11.props.initialText;
    end;

    if #u2.keys(v14) > 0 then
        p11:setState(v14);
    end;
end;

function v5.registerPotentiallyNewTextBox(u17) -- Line: 74
    -- upvalues: UserInputService (copy)
    local u18 = u17.props.textBoxRef:getValue();

    if not u18 then
        return nil;
    end;

    u17.activeTextboxMaid:DoCleaning();

    if u18:IsA("TextBox") then
        u17.activeTextboxMaid:GiveTask(u18:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 81
            -- upvalues: u18 (copy), u17 (copy)
            local v19 = string.gsub(u18.Text, "\t", "    ");

            if v19 ~= u18.Text then
                u18.Text = v19;

                if u18.CursorPosition ~= -1 then
                    local v20 = u18;
                    v20.CursorPosition = v20.CursorPosition + 3;
                end;

                return nil;
            end;

            u17:setState({
                text = u18.Text
            });
        end));
    end;

    u17.activeTextboxMaid:GiveTask(UserInputService.InputBegan:Connect(function(p21) -- Line: 97
        -- upvalues: u17 (copy), u18 (copy)
        if p21.KeyCode ~= Enum.KeyCode.Tab then
            return nil;
        end;

        local v22 = u17.props.textBoxRef:getValue();

        if not v22 then
            return nil;
        end;

        if not v22:IsA("TextBox") then
            return nil;
        end;

        if not v22:IsFocused() then
            return nil;
        end;

        if not u17.shiftDown then
            return nil;
        end;

        local CursorPosition = v22.CursorPosition;

        while true do
            local v23 = { string.byte(u18.Text, CursorPosition - 1) };

            if not (#v23 > 0 and v23[1] ~= 10) then
                break;
            end;

            CursorPosition = CursorPosition - 1;
        end;

        local CursorPosition2 = v22.CursorPosition;

        local function _(p24) -- Line: 133
            return string.byte(p24);
        end;

        local v25 = { " ", "\t" };
        local u26 = table.create(#v25);

        for i, v in v25 do
            local _ = i - 1;
            u26[i] = string.byte(v);
        end;

        local function _(p27) -- Line: 146
            -- upvalues: u26 (copy)
            return table.find(u26, p27) ~= nil;
        end;

        local v28 = true;

        for i, v in { string.byte(v22.Text, CursorPosition, CursorPosition + 3) } do
            local _ = i - 1;

            if table.find(u26, v) == nil then
                v28 = false;
                break;
            end;
        end;

        if v28 then
            v22.Text = table.concat({ string.sub(v22.Text, 0, CursorPosition - 1), (string.sub(v22.Text, CursorPosition + 4)) }, "");
            v22.CursorPosition = math.max(CursorPosition2 - 4, CursorPosition);
        end;
    end));

    if u18:IsA("TextBox") then
        u18:CaptureFocus();
    end;
end;

function v5.didMount(u29) -- Line: 170
    -- upvalues: UserInputService (copy), KnitClient (copy)
    u29.commandDown = false;
    u29.shiftDown = false;
    u29.maid:GiveTask(u29.activeTextboxMaid);
    u29:registerPotentiallyNewTextBox();
    local u30 = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl };
    local u31 = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift };
    u29.maid:GiveTask(UserInputService.InputBegan:Connect(function(p32) -- Line: 178
        -- upvalues: u30 (copy), u29 (copy), u31 (copy), KnitClient (ref)
        if table.find(u30, p32.KeyCode) ~= nil then
            u29.commandDown = true;
        end;

        if table.find(u31, p32.KeyCode) ~= nil then
            u29.shiftDown = true;
        end;

        if u29.commandDown and p32.KeyCode == Enum.KeyCode.S then
            local v33 = u29.props.textBoxRef:getValue();

            if not v33 then
                return nil;
            end;

            if not u29.props.editInProgress then
                return nil;
            end;

            KnitClient.Controllers.ScriptEditorController:editScriptContents(u29.props.scriptId, v33.Text);
        end;

        if u29.commandDown and p32.KeyCode == Enum.KeyCode.R then
            KnitClient.Controllers.ScriptEditorController:setScriptsRunning(not u29.props.scriptsRunning);
        end;
    end));
    u29.maid:GiveTask(UserInputService.InputEnded:Connect(function(p34) -- Line: 204
        -- upvalues: u30 (copy), u29 (copy), u31 (copy)
        if table.find(u30, p34.KeyCode) ~= nil then
            u29.commandDown = false;
        end;

        if table.find(u31, p34.KeyCode) ~= nil then
            u29.shiftDown = false;
        end;
    end));
end;

function v5.willUnmount(p35) -- Line: 215
    -- upvalues: ClientStore (copy)
    p35.maid:DoCleaning();
    ClientStore:dispatch({
        type = "GameUpdateScript",
        updateFromServer = false,
        scriptUpdates = {
            {
                scriptId = p35.props.scriptId,
                scriptContents = p35.state.text
            }
        }
    });
end;

function v5.render(u36) -- Line: 226
    -- upvalues: u4 (copy), Empty (copy), Button (copy), KnitClient (copy), Theme (copy), ColorUtil (copy)
    local v37 = false;
    local v38 = 1;
    local v39 = {};

    while true do
        if v37 then
            v38 = v38 + 1;
        else
            v37 = true;
        end;

        if v38 > u36.state.numLines + 23 then
            local v40 = table.concat(v39, "\n");
            local createElement = u4.createElement;
            local v43 = {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = 1,

                [u4.Event.MouseButton1Click] = function() -- Line: 254
                    -- upvalues: u36 (copy)
                    local v41 = u36.props.textBoxRef:getValue();
                    local v42;

                    if v41 == nil then
                        v42 = v41;
                    else
                        v42 = v41:IsA("TextBox");
                    end;

                    if not v42 then
                        return nil;
                    end;

                    if v41.Focused then
                        v41.CursorPosition = #v41.Text + 1;

                        return;
                    end;

                    v41:CaptureFocus();
                end
            };
            local v44 = {};
            local createElement2 = u4.createElement;
            local v45 = {
                Size = UDim2.fromScale(0.96, 0.08),
                Position = UDim2.fromScale(0.5, 0.98),
                AnchorPoint = Vector2.new(0.5, 1)
            };
            local v46 = {};
            local v47 = u4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = UDim.new(0.02, 0)
            });
            local createElement3 = u4.createElement;
            local v48 = {
                LayoutOrder = 0,
                Text = "SAVE",
                ZIndex = 2,
                Size = UDim2.fromScale(0.1, 1),
                TextLabel = {
                    ZIndex = 2,
                    Font = Enum.Font.SourceSansBold,
                    Size = UDim2.fromScale(0.95, 0.65)
                }
            };
            local v49;

            if u36.props.editInProgress then
                v49 = Color3.fromRGB(44, 184, 96);
            else
                v49 = Color3.fromRGB(169, 201, 181);
            end;

            v48.BackgroundColor3 = v49;

            function v48.OnClick() -- Line: 292
                -- upvalues: u36 (copy), KnitClient (ref)
                local v50 = u36.props.textBoxRef:getValue();

                if v50 ~= nil then
                    v50 = v50.Text;
                end;

                if v50 == nil then
                    return nil;
                end;

                if not u36.props.editInProgress then
                    return nil;
                end;

                KnitClient.Controllers.ScriptEditorController:editScriptContents(u36.props.scriptId, v50);
            end;

            local v51 = createElement3(Button, v48);
            local createElement4 = u4.createElement;
            local v52 = {
                LayoutOrder = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(0.1, 1),
                TextLabel = {
                    ZIndex = 2,
                    Font = Enum.Font.SourceSansBold,
                    Size = UDim2.fromScale(0.95, 0.65)
                },
                Text = u36.props.scriptsRunning and "STOP" or "RUN"
            };
            local v53;

            if u36.props.scriptsRunning then
                v53 = Theme.mcRed;
            else
                v53 = Color3.fromRGB(30, 144, 255);
            end;

            v52.BackgroundColor3 = v53;

            function v52.OnClick() -- Line: 318
                -- upvalues: KnitClient (ref), u36 (copy)
                KnitClient.Controllers.ScriptEditorController:setScriptsRunning(not u36.props.scriptsRunning);
            end;

            v46[1], v46[2], v46[3] = v47, v51, createElement4(Button, v52);
            v44[1], v44[2] = createElement2(Empty, v45, v46), u4.createElement(Empty, {
    Size = UDim2.fromScale(1, 1)
}, { u4.createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        ScrollBarImageTransparency = 0.5,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AutomaticCanvasSize = Enum.AutomaticSize.XY,
        CanvasSize = UDim2.fromScale(0.99, 1),
        ScrollingDirection = Enum.ScrollingDirection.XY
    }, { u4.createElement("TextBox", {
            AutomaticSize = Enum.AutomaticSize.XY,
            [u4.Ref] = u36.props.textBoxRef,
            Text = u36.props.initialText,
            Size = UDim2.fromScale(0.9, 0),
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0.05, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextSize = u36.state.textSize,
            LineHeight = 1.05,
            Font = Enum.Font.RobotoMono,
            TextColor3 = ColorUtil.hexColor(7260153),
            ClearTextOnFocus = false,
            MultiLine = true
        }), u4.createElement("TextLabel", {
            LineHeight = 1.05,
            TextTransparency = 0.8,
            BackgroundTransparency = 1,
            Text = v40,
            Size = UDim2.fromScale(0.04, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            TextSize = u36.state.textSize,
            Font = Enum.Font.RobotoMono,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Top
        }) }) });

            return createElement("ImageButton", v43, v44);
        end;

        if v38 <= u36.state.numLines then
            local v54 = tostring(v38);
            table.insert(v39, v54);
        else
            table.insert(v39, " ");
        end;
    end;
end;

return {
    ScriptEditorComponent = v5
};