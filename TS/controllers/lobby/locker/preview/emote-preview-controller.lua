-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteDisplayType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "EmotePreviewController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "EmotePreviewController";
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.previewEmote(p6, p7, u8) -- Line: 29
    -- upvalues: u1 (copy), EmoteMeta (copy), EmoteDisplayType (copy), KnitClient (copy)
    local v9 = u1.new();
    local v10 = EmoteMeta[p7];

    if v10.emoteDisplayType == EmoteDisplayType.IMAGE_DEFAULT then
        return v9;
    end;

    KnitClient.Controllers.LockerPreviewController:setPreviewOffset(Vector3.new(0.5, 2.5, 0));

    if u8 ~= nil then
        u8:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    end;

    v9:GiveTask(function() -- Line: 42
        -- upvalues: u8 (copy), KnitClient (ref)
        local v11 = u8;

        if v11 ~= nil then
            v11:PivotTo(KnitClient.Controllers.LockerPreviewController:getBackstageWorldPosition());
        end;
    end);

    local function _(p12) -- Line: 50
        local v13 = p12:GetAttribute("DisableInPlayerViewport");

        if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
            p12:Destroy();
        end;
    end;

    for i, child in u8:GetChildren() do
        local _ = i - 1;
        local v14 = child:GetAttribute("DisableInPlayerViewport");

        if v14 ~= 0 and (v14 == v14 and (v14 ~= "" and v14)) then
            child:Destroy();
        end;
    end;

    u8:SetAttribute("PlayingEmote", p7);
    v9:GiveTask(function() -- Line: 61
        -- upvalues: u8 (copy)
        return u8:SetAttribute("PlayingEmote", nil);
    end);

    if v10.animation then
        v9:GiveTask(KnitClient.Controllers.EmoteController:playEmoteAnimation(-1, u8, v10.animation, p7));
    end;

    local u15 = KnitClient.Controllers.EmoteController:playEmoteBeginSounds(p7);
    v9:GiveTask(function() -- Line: 68
        -- upvalues: u15 (copy)
        local v16 = u15;

        if v16 ~= nil then
            local function _(p17) -- Line: 71
                p17:Stop();
                p17:Destroy();
            end;

            for i, v in v16 do
                local _ = i - 1;
                v:Stop();
                v:Destroy();
            end;
        end;
    end);

    return v9;
end;

KnitClient.CreateController(u2.new());

return nil;