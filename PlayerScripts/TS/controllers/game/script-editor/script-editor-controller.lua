-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "highlighter", "src", "lexer", "language");
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "ScriptEditorController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: KnitController (copy), u4 (copy)
    KnitController.constructor(p7);
    p7.Name = "ScriptEditorController";
    p7.downloadStatus = nil;
    p7.languageDownloadedSignal = u4.new();
end;

function u5.KnitStart(p8) -- Line: 38
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), Players (copy)
    KnitController.KnitStart(p8);
    default.Client:Get("SendScriptConsoleMessage"):Connect(function(p9) -- Line: 41
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameRegisterNewConsoleLines",
            newLines = p9
        });
    end);
    default.Client:Get("ScriptDeleted"):Connect(function(p10) -- Line: 48
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameDeleteScript",
            scriptId = p10.scriptId
        });
    end);
    default.Client:Get("ScriptRunStatusChanged"):Connect(function(p11) -- Line: 54
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameSetScriptsRunning",
            running = p11
        });
    end);
    default.Client:Get("RequestScriptRunningStatus"):SendToServer();
    default.Client:Get("ScriptSyntaxErrors"):Connect(function(p12) -- Line: 61
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameRegisterScriptSyntaxError",
            scriptId = p12.scriptId,
            syntaxError = p12.syntaxError
        });
    end);
    default.Client:Get("ScriptUpdated"):Connect(function(p13) -- Line: 69
        -- upvalues: ClientStore (ref), Players (ref)
        ClientStore:dispatch({
            type = "GameUpdateScript",
            updateFromServer = true,
            scriptUpdates = p13
        });

        for _, v in p13 do
            if v.createdByUserId == Players.LocalPlayer.UserId then
                ClientStore:dispatch({
                    type = "GameSetOpenScript",
                    scriptId = v.scriptId
                });

                return;
            end;
        end;
    end);
    ClientStore.changed:connect(function(u14, p15) -- Line: 85
        -- upvalues: default (ref)
        if p15.Game.consoleOpen == u14.Game.consoleOpen then
            return nil;
        end;

        task.spawn(function() -- Line: 89
            -- upvalues: default (ref), u14 (copy)
            default.Client:Get("SetScriptConsoleOpen"):SendToServer({
                open = u14.Game.consoleOpen
            });
        end);
    end);
    default.Client:Get("DownloadScript"):SendToServer({});
end;

function u5.deleteScript(p16, p17) -- Line: 98
    -- upvalues: default (copy)
    default.Client:Get("DeleteScript"):SendToServer({
        scriptId = p17
    });
end;

function u5.downloadScriptLanguage(u18) -- Line: 103
    -- upvalues: default (copy), u2 (copy), u3 (copy)
    if u18.downloadStatus == "complete" then
        return nil;
    end;

    if u18.downloadStatus == "downloading" then
        u18.languageDownloadedSignal:Wait();

        return nil;
    end;

    u18.downloadStatus = "downloading";
    default.Client:Get("ScriptLanguageUpdate"):Connect(function(p19, p20) -- Line: 112
        -- upvalues: u2 (ref), u3 (ref), u18 (copy)
        for _, v in p19 do
            u2.builtin[v] = "table";
        end;

        for _, v in u3.entries(p20) do
            local v21 = v[1];
            local v22 = {};

            for _, v2 in v[2] do
                v22[v2] = "function";
            end;

            u2.libraries[v21] = v22;
        end;

        u18.downloadStatus = "complete";
        u18.languageDownloadedSignal:Fire();
    end);
    default.Client:Get("RequestScriptLanguage"):SendToServer();
    u18.languageDownloadedSignal:Wait();
end;

function u5.setScriptsRunning(p23, p24) -- Line: 132
    -- upvalues: SoundManager (copy), GameSound (copy), default (copy)
    local v25;

    if p24 then
        v25 = GameSound.TURRET_ON;
    else
        v25 = GameSound.TURRET_OFF;
    end;

    SoundManager:playSound(v25, {
        volumeMultiplier = 0.5
    });
    default.Client:Get("SetScriptsRunning"):SendToServer({
        running = p24
    });
end;

function u5.openScriptEditor(p26) -- Line: 140
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    p26:downloadScriptLanguage();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SCRIPT_EDITOR, {});
end;

function u5.createScript(p27, p28) -- Line: 144
    -- upvalues: default (copy)
    default.Client:Get("CreateScript"):SendToServer({
        scriptName = p28
    });
end;

function u5.editScriptContents(p29, p30, p31) -- Line: 149
    -- upvalues: SoundManager (copy), GameSound (copy), ClientStore (copy), default (copy)
    SoundManager:playSound(GameSound.UI_CLICK);
    ClientStore:dispatch({
        type = "GameUpdateScript",
        updateFromServer = false,
        scriptUpdates = {
            {
                scriptId = p30,
                scriptContents = p31
            }
        }
    });
    default.Client:Get("EditScript"):SendToServer({
        scriptId = p30,
        newText = p31
    });
end;

function u5.renameScript(p32, p33, p34) -- Line: 164
    -- upvalues: default (copy)
    default.Client:Get("RenameScript"):SendToServer({
        scriptId = p33,
        newName = p34
    });
end;

function u5.getScriptNameColor(p35, p36) -- Line: 170
    -- upvalues: Theme (copy), ColorUtil (copy)
    local knownSyntaxError = p36.knownSyntaxError;

    if knownSyntaxError ~= 0 and (knownSyntaxError == knownSyntaxError and knownSyntaxError) then
        return Theme.mcRed;
    end;

    if p36.editInProgress then
        return Color3.fromRGB(209, 152, 33);
    end;

    return ColorUtil.WHITE;
end;

KnitClient.CreateController(u5.new());

return nil;