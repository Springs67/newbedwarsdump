-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "EmoteHandlerController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "EmoteHandlerController";
    p3.handlers = {};
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), WatchCharacter (copy)
    KnitController.KnitStart(u4);
    WatchCharacter(function(p5, p6, p7) -- Line: 27
        -- upvalues: u4 (copy)
        u4:hookEmoteHandlers(p5.UserId, p6, p7);
    end);
end;

function u1.registerHandler(p8, p9, p10) -- Line: 31
    local v11 = p10.new();
    p8.handlers[p9] = v11;
end;

function u1.hookEmoteHandlers(u12, u13, u14, p15) -- Line: 40
    local function u20(p16) -- Line: 41
        -- upvalues: u12 (copy), u13 (copy), u14 (copy)
        if p16 then
            local v17 = u12.handlers[p16];

            if v17 ~= nil then
                v17:enable(u13, u14, p16);
            end;
        else
            local function _(p18, p19) -- Line: 54
                -- upvalues: u13 (ref), u14 (ref)
                p18:disable(u13, u14, p19);
            end;

            for i, v in u12.handlers do
                v:disable(u13, u14, i);
            end;
        end;
    end;

    u20(u14:GetAttribute("PlayingEmote"));
    u14:GetAttributeChangedSignal("PlayingEmote"):Connect(function() -- Line: 65
        -- upvalues: u20 (copy), u14 (copy)
        u20(u14:GetAttribute("PlayingEmote"));
    end);
    p15:GiveTask(function() -- Line: 69
        -- upvalues: u12 (copy), u13 (copy), u14 (copy)
        local function _(p21, p22) -- Line: 54
            -- upvalues: u13 (ref), u14 (ref)
            p21:disable(u13, u14, p22);
        end;

        for i, v in u12.handlers do
            v:disable(u13, u14, i);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;