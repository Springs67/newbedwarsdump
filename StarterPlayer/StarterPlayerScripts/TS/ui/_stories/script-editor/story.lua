local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent, "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype
local u7 = v1.import(script, script.Parent.Parent.Parent, "controllers", "game", "script-editor", "ui", "script-editor-app").ScriptEditorApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u2
        [5] = u3
        [6] = u7
    --]]
    local v9 = false
    local v10 = 0
    local v11 = "local i = 0\nprint(i)"
    while true do
        if v9 then
            v10 = v10 + 1
        else
            v9 = true
        end
        if v10 >= 100 then
            local v12 = {
                ["Game"] = u5
            }
            local v13 = u4.combineReducers(v12)
            local v14 = {
                ["consoleText"] = {
                    {
                        ["text"] = "Hello world",
                        ["time"] = 0.02
                    },
                    {
                        ["text"] = "OH NO!",
                        ["time"] = 23.22,
                        ["lineType"] = u6.ERROR
                    },
                    {
                        ["text"] = "Hello world",
                        ["time"] = 30.02
                    },
                    {
                        ["text"] = "Okay so we made it this far in the script..!",
                        ["time"] = 69.42
                    }
                }
            }
            local v15 = {
                {
                    ["scriptId"] = 1,
                    ["scriptName"] = "Script",
                    ["editInProgress"] = false
                },
                {
                    ["scriptId"] = 2,
                    ["scriptName"] = "Test",
                    ["editInProgress"] = false
                },
                {
                    ["scriptId"] = 4,
                    ["scriptName"] = "DamageHandler",
                    ["editInProgress"] = true
                },
                {
                    ["scriptId"] = 5,
                    ["scriptName"] = "VeryVeryLongScriptName",
                    ["editInProgress"] = true
                }
            }
            local v16 = #v15
            local v17 = string.split(string.rep("r", 10), "r")
            local v18 = table.create(#v17)
            local v19 = {}
            for v20, _ in v17 do
                local _ = v20 - 1
                v18[v20] = {
                    ["scriptId"] = 6,
                    ["scriptName"] = "AnotherScript",
                    ["editInProgress"] = false
                }
            end
            table.move(v18, 1, #v18, v16 + 1, v15)
            v14.scripts = v15
            v14.consoleOpen = false
            v14.syncOpen = false
            v14.infoOpen = true
            v14.openScript = nil
            v19.Game = v14
            local v21 = {
                ["store"] = u4.Store.new(v13, v19)
            }
            local u22 = u2.mount(u2.createElement(u3, v21, { u2.createElement(u7, {
                    ["AppId"] = "ScriptEditor"
                }) }), p8)
            return function() --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u22
                --]]
                return u2.unmount(u22)
            end
        end
        v11 = v11 .. "\nprint(i)"
    end
end