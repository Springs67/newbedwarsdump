-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local SpectateSelectorWrapper = RuntimeLib.import(script, script.Parent, "ui", "spectate-selector").SpectateSelectorWrapper;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpectateUIController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy), u2 (copy), Signal (copy)
    KnitController.constructor(p6);
    p6.Name = "SpectateUIController";
    p6.maid = u2.new();
    p6.lobbyButtonVisible = true;
    p6.buttonVisibilityUpdate = Signal.new();
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: ClientStore (copy), RuntimeLib (copy), CreateRoduxApp (copy), SpectateSelectorWrapper (copy), u3 (copy)
    ClientStore.changed:connect(function(p8, p9) -- Line: 35
        -- upvalues: RuntimeLib (ref), CreateRoduxApp (ref), SpectateSelectorWrapper (ref), u7 (copy), u3 (ref)
        if p8.Game.spectating ~= p9.Game.spectating then
            if p8.Game.spectating then
                RuntimeLib.Promise.defer(function() -- Line: 38
                    -- upvalues: CreateRoduxApp (ref), SpectateSelectorWrapper (ref), u7 (ref), u3 (ref)
                    local u10 = CreateRoduxApp("spectate-selector", SpectateSelectorWrapper);
                    u7.maid:GiveTask(function() -- Line: 40
                        -- upvalues: u3 (ref), u10 (copy)
                        u3.unmount(u10);
                    end);
                end);

                return;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 45
                -- upvalues: u7 (ref)
                u7.maid:DoCleaning();
            end);
        end;
    end);
end;

function u4.setLobbyButtonsVisiblity(p11, p12) -- Line: 52
    p11.lobbyButtonVisible = p12;
    p11.buttonVisibilityUpdate:Fire(p12);
end;

function u4.getButtonsVisibility(p13) -- Line: 56
    return p13.lobbyButtonVisible;
end;

KnitClient.CreateController(u4.new());

return nil;