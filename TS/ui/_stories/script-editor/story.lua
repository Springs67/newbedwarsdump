-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent, "rodux", "reducers", "games", "game-reducer").GameReducer;
local ScriptConsoleLinetype = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype;
local ScriptEditorApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "controllers", "game", "script-editor", "ui", "script-editor-app").ScriptEditorApp;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), GameReducer (copy), ScriptConsoleLinetype (copy), u1 (copy), StoreProvider (copy), ScriptEditorApp (copy)
    local v4 = false;
    local v5 = 0;
    local v6 = "local i = 0\nprint(i)";

    while true do
        if v4 then
            v5 = v5 + 1;
        else
            v4 = true;
        end;

        if v5 >= 100 then
            local v7 = u2.combineReducers({
                Game = GameReducer
            });
            local v8 = {
                consoleText = {
                    {
                        text = "Hello world",
                        time = 0.02
                    },
                    {
                        text = "OH NO!",
                        time = 23.22,
                        lineType = ScriptConsoleLinetype.ERROR
                    },
                    {
                        text = "Hello world",
                        time = 30.02
                    },
                    {
                        text = "Okay so we made it this far in the script..!",
                        time = 69.42
                    }
                }
            };
            local v9 = { {
                    scriptId = 1,
                    scriptName = "Script",
                    editInProgress = false
                }, {
                    scriptId = 2,
                    scriptName = "Test",
                    editInProgress = false
                }, {
                    scriptId = 4,
                    scriptName = "DamageHandler",
                    editInProgress = true
                }, {
                    scriptId = 5,
                    scriptName = "VeryVeryLongScriptName",
                    editInProgress = true
                } };
            local v10 = string.split(string.rep("r", 10), "r");

            local function _() -- Line: 67
                return {
                    scriptId = 6,
                    scriptName = "AnotherScript",
                    editInProgress = false
                };
            end;

            local v11 = table.create(#v10);
            local v12 = {};

            for i, _ in v10 do
                local _ = i - 1;
                v11[i] = {
                    scriptId = 6,
                    scriptName = "AnotherScript",
                    editInProgress = false
                };
            end;

            table.move(v11, 1, #v11, #v9 + 1, v9);
            v8.scripts = v9;
            v8.consoleOpen = false;
            v8.syncOpen = false;
            v8.infoOpen = true;
            v8.openScript = nil;
            v12.Game = v8;
            local v13 = u2.Store.new(v7, v12);
            local u14 = u1.mount(u1.createElement(StoreProvider, {
                store = v13
            }, { u1.createElement(ScriptEditorApp, {
                    AppId = "ScriptEditor"
                }) }), p3);

            return function() -- Line: 95
                -- upvalues: u1 (ref), u14 (copy)
                return u1.unmount(u14);
            end;
        end;

        v6 = v6 .. "\nprint(i)";
    end;
end;