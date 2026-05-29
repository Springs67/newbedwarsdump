local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "highlighter", "src", "lexer", "language")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "ScriptEditorController"
    end,
    ["__index"] = u11
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    u11.constructor(p20)
    p20.Name = "ScriptEditorController"
    p20.downloadStatus = nil
    p20.languageDownloadedSignal = u10.new()
end
function u17.KnitStart(p21) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u12
        [4] = u9
    --]]
    u11.KnitStart(p21)
    u14.Client:Get("SendScriptConsoleMessage"):Connect(function(p22) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:dispatch({
            ["type"] = "GameRegisterNewConsoleLines",
            ["newLines"] = p22
        })
    end)
    u14.Client:Get("ScriptDeleted"):Connect(function(p23) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:dispatch({
            ["type"] = "GameDeleteScript",
            ["scriptId"] = p23.scriptId
        })
    end)
    u14.Client:Get("ScriptRunStatusChanged"):Connect(function(p24) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:dispatch({
            ["type"] = "GameSetScriptsRunning",
            ["running"] = p24
        })
    end)
    u14.Client:Get("RequestScriptRunningStatus"):SendToServer()
    u14.Client:Get("ScriptSyntaxErrors"):Connect(function(p25) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:dispatch({
            ["type"] = "GameRegisterScriptSyntaxError",
            ["scriptId"] = p25.scriptId,
            ["syntaxError"] = p25.syntaxError
        })
    end)
    u14.Client:Get("ScriptUpdated"):Connect(function(p26) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
        --]]
        u12:dispatch({
            ["type"] = "GameUpdateScript",
            ["updateFromServer"] = true,
            ["scriptUpdates"] = p26
        })
        for _, v27 in p26 do
            if v27.createdByUserId == u9.LocalPlayer.UserId then
                u12:dispatch({
                    ["type"] = "GameSetOpenScript",
                    ["scriptId"] = v27.scriptId
                })
                return
            end
        end
    end)
    u12.changed:connect(function(u28, p29) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        if p29.Game.consoleOpen == u28.Game.consoleOpen then
            return nil
        end
        task.spawn(function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u28
            --]]
            u14.Client:Get("SetScriptConsoleOpen"):SendToServer({
                ["open"] = u28.Game.consoleOpen
            })
        end)
    end)
    u14.Client:Get("DownloadScript"):SendToServer({})
end
function u17.deleteScript(_, p30) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:Get("DeleteScript"):SendToServer({
        ["scriptId"] = p30
    })
end
function u17.downloadScriptLanguage(u31) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u8
    --]]
    if u31.downloadStatus == "complete" then
        return nil
    end
    if u31.downloadStatus == "downloading" then
        u31.languageDownloadedSignal:Wait()
        return nil
    end
    u31.downloadStatus = "downloading"
    u14.Client:Get("ScriptLanguageUpdate"):Connect(function(p32, p33) --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u31
        --]]
        for _, v34 in p32 do
            u6.builtin[v34] = "table"
        end
        for _, v35 in u8.entries(p33) do
            local v36 = v35[1]
            local v37 = {}
            for _, v38 in v35[2] do
                v37[v38] = "function"
            end
            u6.libraries[v36] = v37
        end
        u31.downloadStatus = "complete"
        u31.languageDownloadedSignal:Fire()
    end)
    u14.Client:Get("RequestScriptLanguage"):SendToServer()
    u31.languageDownloadedSignal:Wait()
end
function u17.setScriptsRunning(_, p39) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u15
        [3] = u14
    --]]
    local v40 = u5
    local v41
    if p39 then
        v41 = u15.TURRET_ON
    else
        v41 = u15.TURRET_OFF
    end
    v40:playSound(v41, {
        ["volumeMultiplier"] = 0.5
    })
    u14.Client:Get("SetScriptsRunning"):SendToServer({
        ["running"] = p39
    })
end
function u17.openScriptEditor(p42) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
    --]]
    p42:downloadScriptLanguage()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.SCRIPT_EDITOR, {})
end
function u17.createScript(_, p43) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:Get("CreateScript"):SendToServer({
        ["scriptName"] = p43
    })
end
function u17.editScriptContents(_, p44, p45) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u15
        [3] = u12
        [4] = u14
    --]]
    u5:playSound(u15.UI_CLICK)
    local v46 = {
        ["type"] = "GameUpdateScript",
        ["updateFromServer"] = false,
        ["scriptUpdates"] = {
            {
                ["scriptId"] = p44,
                ["scriptContents"] = p45
            }
        }
    }
    u12:dispatch(v46)
    u14.Client:Get("EditScript"):SendToServer({
        ["scriptId"] = p44,
        ["newText"] = p45
    })
end
function u17.renameScript(_, p47, p48) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:Get("RenameScript"):SendToServer({
        ["scriptId"] = p47,
        ["newName"] = p48
    })
end
function u17.getScriptNameColor(_, p49) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
    --]]
    local v50 = p49.knownSyntaxError
    if v50 == 0 or (v50 ~= v50 or not v50) then
        if p49.editInProgress then
            return Color3.fromRGB(209, 152, 33)
        else
            return u4.WHITE
        end
    else
        return u16.mcRed
    end
end
v7.CreateController(u17.new())
return nil