-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ScriptListName = RuntimeLib.import(script, script.Parent, "script-list-name").ScriptListName;

return {
    ScriptList = v4.new(u3)(function(u5, p6) -- Line: 11
        -- upvalues: u3 (copy), u2 (copy), KnitClient (copy), ColorUtil (copy), ScriptListName (copy), Empty (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u3.createRef();
        local u8, u9 = useState(22);
        local u10, u11 = useState(800);
        local u12, u13 = useState(nil);
        useEffect(function() -- Line: 19
            -- upvalues: u2 (ref), u7 (copy), u9 (copy), u11 (copy)
            local u14 = u2.new();
            local u15 = u7:getValue();

            if u15 then
                u14:GiveTask(u15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 23
                    -- upvalues: u9 (ref), u15 (copy), u11 (ref)
                    u9(u15.AbsoluteSize.X / 194 * 22);
                    u11(u15.AbsoluteSize.Y);
                end));
                u11(u15.AbsoluteSize.Y);
                u9(u15.AbsoluteSize.X / 194 * 22);
            end;

            return function() -- Line: 30
                -- upvalues: u14 (copy)
                u14:DoCleaning();
            end;
        end, {});

        local function u18(p16) -- Line: 34
            -- upvalues: u12 (copy), KnitClient (ref), u13 (copy)
            local v17 = u12;

            if v17 == nil then
                return nil;
            end;

            if v17 == -1 and p16 ~= "" then
                KnitClient.Controllers.ScriptEditorController:createScript(p16);
            end;

            if v17 >= 0 and p16 ~= "" then
                KnitClient.Controllers.ScriptEditorController:renameScript(v17, p16);
            end;

            u13(nil);
        end;

        local v19 = { u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0.005, 0)
            }), u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "SCRIPTS",
                TextScaled = true,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.82, 0.035),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }) };
        local availableScripts = u5.availableScripts;

        local function v22(p20, p21) -- Line: 69
            -- upvalues: u3 (ref), ScriptListName (ref), u12 (copy), u8 (copy), u10 (copy), u18 (copy), u5 (copy)
            return u3.createElement(ScriptListName, {
                scriptData = p20,
                editingName = u12 == p20.scriptId,
                TextSize = u8,
                Size = UDim2.new(0.824, 0, 0, 0.0445 * u10),
                LayoutOrder = p21,
                stopEditingName = u18,
                rerenderId = u5.rerenderId
            });
        end;

        local v23 = table.create(#availableScripts);

        for i, v in availableScripts do
            v23[i] = v22(v, i - 1, availableScripts);
        end;

        local v24 = {
            Size = UDim2.fromScale(1, 0.93),
            BackgroundTransparency = 1,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.fromScale(1, 0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarThickness = 3,
            ScrollBarImageTransparency = 0.5,
            [u3.Ref] = u7,
            BorderSizePixel = 0
        };
        local v25 = { u3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), u3.createElement(Empty, {
                LayoutOrder = -1
            }) };
        local v26 = #v25;

        for i, v in v23 do
            v25[v26 + i] = v;
        end;

        local v27 = #v25;
        local v28;

        if u12 == -1 then
            v28 = u3.createElement(ScriptListName, {
                editingName = true,
                TextSize = u8,
                Size = UDim2.new(0.824, 0, 0, 0.0445 * u10),
                LayoutOrder = #u5.availableScripts + 1,
                stopEditingName = u18,
                rerenderId = u5.rerenderId
            });
        else
            v28 = false;
        end;

        if v28 then
            v25[v27 + 1] = v28;
        end;

        local v29 = #v25;
        v25[v29 + 1] = u3.createElement("TextButton", {
            Text = "New script...",
            BackgroundTransparency = 0,
            BackgroundColor3 = ColorUtil.hexColor(1973790),
            Font = Enum.Font.Arial,
            TextSize = u8,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(0.824, 0, 0, 0.0445 * u10),
            TextColor3 = ColorUtil.hexColor(11447982),
            LayoutOrder = #u5.availableScripts + 2,
            TextTruncate = Enum.TextTruncate.AtEnd,
            BorderSizePixel = 0,

            [u3.Event.MouseButton1Click] = function() -- Line: 136
                -- upvalues: u13 (copy)
                u13(-1);
            end
        });
        v25[v29 + 2] = u3.createElement(Empty, {
            LayoutOrder = #u5.availableScripts + 1
        });
        v19[#v19 + 1] = u3.createElement("ScrollingFrame", v24, v25);

        return u3.createFragment(v19);
    end)
};