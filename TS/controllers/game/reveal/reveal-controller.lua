-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "RevealController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "RevealController";
    p4.revealedPlayers = {};
end;

function u2.KnitStart(u5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), WatchCharacter (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("RevealPlayers"):Connect(function(p6) -- Line: 30
        -- upvalues: u5 (copy)
        u5:revealForViewer(p6);
    end);
    default.Client:Get("UnrevealPlayers"):Connect(function(p7) -- Line: 33
        -- upvalues: u5 (copy)
        u5:unrevealForViewer(p7);
    end);
    WatchCharacter(function(u8, p9) -- Line: 37
        -- upvalues: u5 (copy)
        local v10 = u5.revealedPlayers[u8];

        if not v10 then
            return nil;
        end;

        v10:Destroy();
        task.spawn(function() -- Line: 45
            -- upvalues: u5 (ref), u8 (copy)
            local v11 = u5:createHighlight(u8);

            if v11 then
                u5.revealedPlayers[u8] = v11;
            end;
        end);
    end);
end;

function u2.revealForViewer(u12, p13) -- Line: 55
    -- upvalues: Players (copy)
    local function _(u14) -- Line: 57
        -- upvalues: Players (ref), u12 (copy)
        if u14 == Players.LocalPlayer then
            return nil;
        end;

        task.spawn(function() -- Line: 61
            -- upvalues: u12 (ref), u14 (copy)
            local v15 = u12:createHighlight(u14);

            if v15 then
                u12.revealedPlayers[u14] = v15;
            end;
        end);
    end;

    for i, v in p13 do
        local _ = i - 1;

        if v ~= Players.LocalPlayer then
            task.spawn(function() -- Line: 61
                -- upvalues: u12 (copy), v (copy)
                local v16 = u12:createHighlight(v);

                if v16 then
                    u12.revealedPlayers[v] = v16;
                end;
            end);
        end;
    end;
end;

function u2.unrevealForViewer(u17, p18) -- Line: 74
    local function _(p19) -- Line: 76
        -- upvalues: u17 (copy)
        local v20 = u17.revealedPlayers[p19];

        if v20 ~= nil then
            v20:Destroy();
        end;

        u17.revealedPlayers[p19] = nil;
    end;

    for i, v in p18 do
        local _ = i - 1;
        local v21 = u17.revealedPlayers[v];

        if v21 ~= nil then
            v21:Destroy();
        end;

        u17.revealedPlayers[v] = nil;
    end;
end;

function u2.createHighlight(p22, p23) -- Line: 92
    -- upvalues: u1 (copy)
    local Character = p23.Character;

    if Character then
        return u1("Highlight", {
            FillTransparency = 1,
            OutlineTransparency = 0,
            Parent = Character,
            OutlineColor = Color3.fromRGB(255, 120, 120),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
    end;

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;