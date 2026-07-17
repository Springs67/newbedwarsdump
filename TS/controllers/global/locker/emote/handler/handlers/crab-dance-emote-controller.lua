-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "CrabDanceEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "CrabDanceEmoteController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local CRAB_DANCE = EmoteType.CRAB_DANCE;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 36, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 42
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 46
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(p9, p10, p11, p12, p13) -- Line: 49
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref)
        local u14 = {};
        local LeftHand = p11:FindFirstChild("LeftHand");
        local RightHand = p11:FindFirstChild("RightHand");
        table.insert(u14, LeftHand);
        table.insert(u14, RightHand);

        local function _(p15) -- Line: 59
            if p15:IsA("MeshPart") then
                p15.Transparency = 1;
            end;
        end;

        for i, v in u14 do
            local _ = i - 1;

            if v:IsA("MeshPart") then
                v.Transparency = 1;
            end;
        end;

        p13:GiveTask(function() -- Line: 67
            -- upvalues: u14 (copy)
            local function _(p16) -- Line: 69
                if p16:IsA("MeshPart") then
                    p16.Transparency = 0;
                end;
            end;

            for i, v in u14 do
                local _ = i - 1;

                if v:IsA("MeshPart") then
                    v.Transparency = 0;
                end;
            end;
        end);
        local u17 = ReplicatedStorage.Assets.Misc.Summer2024.CrabClawLeft:Clone();
        local u18 = ReplicatedStorage.Assets.Misc.Summer2024.CrabClawRight:Clone();
        u17.Parent = p11;
        u18.Parent = p11;

        local function _(p19) -- Line: 84
            -- upvalues: GameQueryUtil (ref)
            if p19:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p19, true);
            end;
        end;

        for i, descendant in u17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        local function _(p20) -- Line: 93
            -- upvalues: GameQueryUtil (ref)
            if p20:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p20, true);
            end;
        end;

        for i, descendant in u18:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        WeldUtil:weldCharacterAccessories(p11);
        p13:GiveTask(function() -- Line: 102
            -- upvalues: u17 (copy), u18 (copy)
            u17:Destroy();
            u18:Destroy();
        end);
    end;

    function u6.onDisable(p21, p22, p23, p24) -- Line: 107
    end;

    EmoteHandlerController:registerHandler(CRAB_DANCE, u6);
end;

KnitClient.CreateController(u1.new());

return nil;