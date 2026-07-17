-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ScriptConsoleLinetype = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype;
local ConsoleView = RuntimeLib.import(script, script.Parent, "console-view").ConsoleView;
local InfoView = RuntimeLib.import(script, script.Parent, "info", "info-view").InfoView;
local ScriptEditorComponent = RuntimeLib.import(script, script.Parent, "script-editor-component").ScriptEditorComponent;
local ScriptEditorTopBar = RuntimeLib.import(script, script.Parent, "script-editor-top-bar").ScriptEditorTopBar;
local ScriptList = RuntimeLib.import(script, script.Parent, "script-list").ScriptList;
local SyncView = RuntimeLib.import(script, script.Parent, "sync-view").SyncView;
local v41 = v3.new(u2)(function(p5, p6) -- Line: 21
    -- upvalues: Players (copy), KnitClient (copy), u2 (copy), DarkBackground (copy), ColorUtil (copy), Empty (copy), ScriptList (copy), MapUtil (copy), ScriptConsoleLinetype (copy), ScriptEditorTopBar (copy), InfoView (copy), SyncView (copy), ConsoleView (copy), ScriptEditorComponent (copy), SlideIn (copy)
    local useEffect = p6.useEffect;

    if Players.LocalPlayer then
        useEffect(function() -- Line: 24
            -- upvalues: KnitClient (ref)
            local u7 = KnitClient.Controllers.ShiftLockController:registerShiftLockControlDisabler("script-editor");

            return function() -- Line: 26
                -- upvalues: u7 (copy)
                u7:DoCleaning();
            end;
        end, {});
    end;

    local v8 = u2.createRef();
    local v9 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true
    };
    local v10 = { u2.createElement(DarkBackground, {
            AppId = p5.AppId
        }) };
    local _ = #v10;
    local v11 = {
        BackgroundTransparency = 0.03,
        BackgroundColor3 = ColorUtil.hexColor(4276545),
        Size = UDim2.fromScale(1, 1)
    };
    local v12 = {};
    local v13 = {};
    local v14 = {
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9)
    };
    local v15 = {
        u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.5441329179646937
        }),
        u2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        }),
        ExplorerBackground = u2.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.1324815063887021, 1),
            BackgroundColor3 = ColorUtil.hexColor(1973790)
        }, { u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.98),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u2.createElement(ScriptList, {
                    availableScripts = MapUtil.values(p5.scripts),
                    rerenderId = p5.rerenderId
                }) }) })
    };
    local _ = #v15;
    local v16 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.867518493611298, 1)
    };
    local v17 = { u2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical
        }) };
    local _ = #v17;
    local v18 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.93, 0.036344755970924195)
    };
    local v19 = {};
    local v20 = {};
    local v21;

    if p5.consoleOpen or (p5.infoOpen or p5.syncOpen) then
        v21 = nil;
    else
        v21 = p5.scriptId;
    end;

    v20.activeTabScriptId = v21;

    local function _(p22) -- Line: 110
        return p22.loaded;
    end;

    local v23 = 0;
    local v24 = {};

    for i, v in MapUtil.values(p5.scripts) do
        local _ = i - 1;

        if v.loaded == true then
            v23 = v23 + 1;
            v24[v23] = v;
        end;
    end;

    v20.loadedTabs = v24;

    local function _(p25) -- Line: 125
        -- upvalues: ScriptConsoleLinetype (ref)
        return p25.lineType == ScriptConsoleLinetype.ERROR;
    end;

    local v26 = 0;
    local v27 = {};

    for i, v in p5.consoleText do
        local _ = i - 1;

        if v.lineType == ScriptConsoleLinetype.ERROR == true then
            v26 = v26 + 1;
            v27[v26] = v;
        end;
    end;

    v20.errors = #v27;
    v20.consoleOpen = p5.consoleOpen;
    v20.infoOpen = p5.infoOpen;
    v20.syncOpen = p5.syncOpen;
    v19[#v19 + 1] = u2.createElement(ScriptEditorTopBar, v20);
    v17.OpenTabsBackground = u2.createElement("Frame", v18, v19);
    local v28 = {
        LayoutOrder = 2,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.9636552440290758),
        BackgroundColor3 = ColorUtil.hexColor(1579032)
    };
    local v29 = {};
    local v30 = #v29;
    local v31;

    if p5.infoOpen == true then
        v31 = u2.createElement(InfoView);
    else
        v31 = false;
    end;

    if v31 then
        v29[v30 + 1] = v31;
    end;

    local v32 = #v29;
    local v33;

    if p5.syncOpen == true then
        v33 = u2.createElement(SyncView, {
            syncToken = KnitClient.Controllers.ScriptSyncController.syncToken
        });
    else
        v33 = false;
    end;

    if v33 then
        v29[v32 + 1] = v33;
    end;

    local v34 = #v29;
    local v35;

    if p5.consoleOpen == true then
        v35 = u2.createElement(ConsoleView, {
            consoleText = p5.consoleText
        });
    else
        v35 = false;
    end;

    if v35 then
        v29[v34 + 1] = v35;
    end;

    local v36 = #v29;
    local v37;

    if p5.consoleOpen == true or (p5.infoOpen == true or p5.syncOpen == true) then
        v37 = false;
    else
        v37 = p5.scriptId ~= nil;
    end;

    if v37 then
        local v38 = {};
        local v39 = p5.scriptContents[p5.scriptId];
        v38.initialText = v39 == nil and "" or v39;
        v38.scriptId = p5.scriptId;
        v38.textBoxRef = v8;
        v38.scriptsRunning = p5.scriptsRunning;
        local v40 = p5.scripts[p5.scriptId];

        if v40 ~= nil then
            v40 = v40.editInProgress;
        end;

        v38.editInProgress = v40 == true;
        v37 = u2.createElement(ScriptEditorComponent, v38);
    end;

    if v37 then
        v29[v36 + 1] = v37;
    end;

    v17.ScriptEditorBackground = u2.createElement("Frame", v28, v29);
    v15.ScriptPanelBackground = u2.createElement("Frame", v16, v17);
    v13[#v13 + 1] = u2.createElement("TextButton", v14, v15);
    v12[#v12 + 1] = u2.createElement(SlideIn, {}, v13);
    v10.EditorGrayBackground = u2.createElement("Frame", v11, v12);

    return u2.createFragment({
        ScriptEditor = u2.createElement("ScreenGui", v9, v10)
    });
end);

return {
    ScriptEditorApp = v4.connect(function(p42, p43) -- Line: 206
        local v44 = {};

        for i, v in p43 do
            v44[i] = v;
        end;

        v44.scripts = p42.Game.scripts;
        v44.scriptContents = p42.Game.scriptContents;
        v44.consoleText = p42.Game.consoleText;
        v44.consoleOpen = p42.Game.consoleOpen;
        v44.infoOpen = p42.Game.infoOpen;
        v44.syncOpen = p42.Game.syncOpen;
        v44.scriptId = p42.Game.openScript;
        v44.rerenderId = p42.Game.scriptUpdateId;
        v44.scriptsRunning = p42.Game.scriptsRunning;

        return v44;
    end)(v41)
};