-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ScriptEditorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil;

return {
    ScriptListName = v3.new(u2)(function(u5, p6) -- Line: 13
        -- upvalues: u2 (copy), u1 (copy), ScriptEditorUtil (copy), ColorUtil (copy), Players (copy), KnitClient (copy), ClientStore (copy), RunService (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u2.createRef();
        useEffect(function() -- Line: 17
            -- upvalues: u7 (copy), u1 (ref), u5 (copy), ScriptEditorUtil (ref)
            local u8 = u7:getValue();

            if not u8 then
                return nil;
            end;

            local u9 = u1.new();
            u9:GiveTask(u8.FocusLost:Connect(function() -- Line: 23
                -- upvalues: u5 (ref), u8 (copy)
                u5.stopEditingName(u8.Text);
            end));
            u9:GiveTask(u8:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 26
                -- upvalues: ScriptEditorUtil (ref), u8 (copy)
                local v10 = ScriptEditorUtil:liveCleanScriptName(u8.Text);

                if v10 ~= u8.Text then
                    u8.Text = v10;
                end;
            end));
            u8:CaptureFocus();

            return function() -- Line: 33
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        if not u5.editingName then
            local WHITE = ColorUtil.WHITE;

            if u5.scriptData and Players.LocalPlayer then
                WHITE = KnitClient.Controllers.ScriptEditorController:getScriptNameColor(u5.scriptData);
            end;

            local v11 = {};
            local v12 = #v11;
            local v13 = u5.scriptData and u2.createElement("TextButton", {
                Text = u5.scriptData.scriptName,
                BackgroundTransparency = 0,
                BackgroundColor3 = ColorUtil.hexColor(1973790),
                Font = Enum.Font.Arial,
                TextSize = u5.TextSize,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = u5.Size,
                TextColor3 = WHITE,
                LayoutOrder = u5.LayoutOrder,
                TextTruncate = Enum.TextTruncate.AtEnd,
                BorderSizePixel = 0,

                [u2.Event.MouseButton1Click] = function() -- Line: 80
                    -- upvalues: u5 (copy), ClientStore (ref)
                    if not u5.scriptData then
                        return nil;
                    end;

                    ClientStore:dispatch({
                        type = "GameSetOpenScript",
                        scriptId = u5.scriptData.scriptId
                    });
                end,

                [u2.Event.MouseButton2Click] = function() -- Line: 89
                    -- upvalues: RunService (ref), u5 (copy), KnitClient (ref)
                    if not RunService:IsStudio() then
                        return nil;
                    end;

                    if not u5.scriptData then
                        return nil;
                    end;

                    KnitClient.Controllers.ScriptEditorController:deleteScript(u5.scriptData.scriptId);
                end
            });

            if v13 then
                v11[v12 + 1] = v13;
            end;

            return u2.createFragment(v11);
        end;

        local v14 = {};
        local scriptData = u5.scriptData;

        if scriptData ~= nil then
            scriptData = scriptData.scriptName;
        end;

        v14.Text = scriptData == nil and "" or scriptData;
        v14.PlaceholderText = "script-name";
        v14.BackgroundTransparency = 0;
        v14.BackgroundColor3 = ColorUtil.hexColor(1973790);
        v14.Font = Enum.Font.Arial;
        v14.TextSize = u5.TextSize;
        v14.TextXAlignment = Enum.TextXAlignment.Left;
        v14.Size = u5.Size;
        v14.TextColor3 = ColorUtil.WHITE;
        v14.LayoutOrder = u5.LayoutOrder;
        v14.TextTruncate = Enum.TextTruncate.AtEnd;
        v14.BorderSizePixel = 0;
        v14[u2.Ref] = u7;

        return u2.createElement("TextBox", v14);
    end)
};