-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TextService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TextService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function getTabWidth(p4, p5, p6, p7) -- Line: 11
    -- upvalues: TextService (copy)
    local v8 = TextService:GetTextSize(p4, p5, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p7;
    local v9 = TextService:GetTextSize("Script", p5, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p7;
    local v10 = p6 and (1 / 0) or TextService:GetTextSize("GameDamageHandler", p5, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p7;

    return math.clamp(v8, v9, v10);
end;

return {
    ScriptEditorTopBar = v3.new(u2)(function(u11, p12) -- Line: 17
        -- upvalues: u2 (copy), u1 (copy), getTabWidth (copy), ColorUtil (copy), ClientStore (copy), KnitClient (copy), Theme (copy)
        local useState = p12.useState;
        local useEffect = p12.useEffect;
        local u13, u14 = useState(1);
        local u15 = u2.createRef();
        useEffect(function() -- Line: 22
            -- upvalues: u1 (ref), u15 (copy), u14 (copy)
            local u16 = u1.new();
            local u17 = u15:getValue();

            if u17 then
                u16:GiveTask(u17:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 26
                    -- upvalues: u14 (ref), u17 (copy)
                    u14(u17.AbsoluteSize.X / 146);
                end));
                u14(u17.AbsoluteSize.X / 146);
            end;

            return function() -- Line: 31
                -- upvalues: u16 (copy)
                u16:DoCleaning();
            end;
        end, {});
        local u18, u19 = useState(24);
        useEffect(function() -- Line: 36
            -- upvalues: u19 (copy), u13 (copy)
            u19(u13 * 24);
        end, { u13 });
        local v20 = { u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }) };
        local v21 = {
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8099688473520249, 1)
        };
        local v22 = {};
        local loadedTabs = u11.loadedTabs;

        local function v29(u23, p24) -- Line: 54
            -- upvalues: u11 (copy), getTabWidth (ref), u18 (copy), u13 (copy), ColorUtil (ref), u2 (ref), ClientStore (ref), KnitClient (ref)
            local v25 = {
                LayoutOrder = 1,
                BackgroundTransparency = 0,
                Active = u23.scriptId ~= u11.activeTabScriptId,
                AutoButtonColor = u23.scriptId ~= u11.activeTabScriptId,
                Size = UDim2.new(0, getTabWidth(u23.scriptName, u18, u23.scriptId == u11.activeTabScriptId, u13), 1, 0),
                BackgroundColor3 = ColorUtil.hexColor(u23.scriptId == u11.activeTabScriptId and 1579032 or 3223857),
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 63
                    -- upvalues: ClientStore (ref), u23 (copy)
                    ClientStore:dispatch({
                        type = "GameSetOpenScript",
                        scriptId = u23.scriptId
                    });
                end
            };
            local v26 = {};
            local v27 = #v26;
            local v28;

            if p24 == #u11.loadedTabs - 1 then
                v28 = false;
            else
                v28 = u2.createFragment({
                    Divider = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.new(0, 4 * u13, 1, 0),
                        BackgroundColor3 = ColorUtil.hexColor(1579032),
                        Position = UDim2.new(1, 0, 0, 0),
                        AnchorPoint = Vector2.new(1, 0)
                    })
                });
            end;

            if v28 then
                v26[v27 + 1] = v28;
            end;

            v26[#v26 + 1] = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextColor3 = KnitClient.Controllers.ScriptEditorController:getScriptNameColor(u23),
                Text = u23.scriptName,
                Size = UDim2.new(1, -20 * u13, 1, 0),
                Position = UDim2.fromOffset(u13 * 10, 0),
                TextSize = u18,
                Font = Enum.Font.Arial,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextTruncate = Enum.TextTruncate.AtEnd
            });

            return u2.createFragment({
                ScriptTab = u2.createElement("ImageButton", v25, v26)
            });
        end;

        local v30 = table.create(#loadedTabs);

        for i, v in loadedTabs do
            v30[i] = v29(v, i - 1, loadedTabs);
        end;

        local v31 = {
            BackgroundTransparency = 1,
            ScrollBarThickness = 1,
            ScrollBarImageTransparency = 0.8,
            BorderSizePixel = 0,
            ScrollingDirection = Enum.ScrollingDirection.X,
            Size = UDim2.fromScale(1, 1),
            AutomaticCanvasSize = Enum.AutomaticSize.X,
            CanvasSize = UDim2.fromScale(0.95, 1)
        };
        local v32 = { u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }) };
        local v33 = #v32;

        for i, v in v30 do
            v32[v33 + i] = v;
        end;

        v22[#v22 + 1] = u2.createElement("ScrollingFrame", v31, v32);
        v20[#v20 + 1] = u2.createElement("Frame", v21, v22);
        v20.SyncTab = u2.createFragment({
            SyncTab = u2.createElement("ImageButton", {
                LayoutOrder = 1,
                BackgroundTransparency = 0,
                Size = UDim2.fromScale(0.0763239875389408, 1),
                BackgroundColor3 = ColorUtil.hexColor(u11.syncOpen and 1579032 or 2566194),
                [u2.Ref] = u15,
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 137
                    -- upvalues: ClientStore (ref)
                    ClientStore:dispatch({
                        type = "GameSetScriptSyncOpen",
                        open = true
                    });
                end
            }, { u2.createElement("TextLabel", {
                    Text = "Sync",
                    BackgroundTransparency = 1,
                    TextColor3 = ColorUtil.WHITE,
                    Size = UDim2.fromScale(1, 1),
                    TextSize = u18,
                    Font = Enum.Font.Arial,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) })
        });
        v20.InfoTab = u2.createFragment({
            InfoTab = u2.createElement("ImageButton", {
                LayoutOrder = 1,
                BackgroundTransparency = 0,
                Size = UDim2.fromScale(0.0763239875389408, 1),
                BackgroundColor3 = ColorUtil.hexColor(u11.infoOpen and 1579032 or 2566194),
                [u2.Ref] = u15,
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 164
                    -- upvalues: ClientStore (ref)
                    ClientStore:dispatch({
                        type = "GameSetScriptInfoOpen",
                        open = true
                    });
                end
            }, { u2.createElement("TextLabel", {
                    Text = "Info",
                    BackgroundTransparency = 1,
                    TextColor3 = ColorUtil.WHITE,
                    Size = UDim2.fromScale(1, 1),
                    TextSize = u18,
                    Font = Enum.Font.Arial,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }) })
        });
        local createFragment = u2.createFragment;
        local v34 = {};
        local createElement = u2.createElement;
        local v35 = {
            LayoutOrder = 2,
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(0.11370716510903427, 1),
            BackgroundColor3 = ColorUtil.hexColor(u11.consoleOpen and 1579032 or 2566194),
            [u2.Ref] = u15,
            BorderSizePixel = 0,

            [u2.Event.MouseButton1Click] = function() -- Line: 191
                -- upvalues: ClientStore (ref)
                ClientStore:dispatch({
                    type = "GameSetConsoleOpen",
                    open = true
                });
            end
        };
        local v36 = {};
        local createElement2 = u2.createElement;
        local v37 = {
            BackgroundTransparency = 1
        };
        local v38;

        if u11.errors > 0 then
            v38 = Theme.mcRed;
        else
            v38 = ColorUtil.WHITE;
        end;

        v37.TextColor3 = v38;
        v37.Text = "Console" .. (u11.errors <= 0 and "" or " (" .. tostring(u11.errors) .. ")");
        v37.Size = UDim2.fromScale(1, 1);
        v37.TextSize = u18;
        v37.Font = Enum.Font.Arial;
        v37.TextXAlignment = Enum.TextXAlignment.Center;
        v37.TextYAlignment = Enum.TextYAlignment.Center;
        v36[1] = createElement2("TextLabel", v37);
        v34.ConsoleTab = createElement("ImageButton", v35, v36);
        v20.ConsoleTab = createFragment(v34);

        return u2.createFragment(v20);
    end)
};