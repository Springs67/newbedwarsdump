-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SparklerController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SparklerController";
    p4.sparklers = {};
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), SharedSyncEvents (copy), ItemType (copy), u1 (copy), GameSound (copy), RuntimeLib (copy)
    KnitController.KnitStart(u5);
    SharedSyncEvents.HandItemRendered:connect(function(u6) -- Line: 32
        -- upvalues: ItemType (ref), u5 (copy), u1 (ref), GameSound (ref)
        if u6.tool and (u6.itemType == ItemType.SPARKLER and u5.sparklers[u6.tool] == nil) then
            u5.sparklers[u6.tool] = true;
            local u7 = nil;
            u7 = u6.tool.Destroying:Connect(function() -- Line: 41
                -- upvalues: u5 (ref), u6 (copy), u7 (ref)
                u5.sparklers[u6.tool] = nil;
                u7:Disconnect();
            end);
            local v8 = u5:updateBurnedParts(u6.tool);

            if not v8 or v8:FindFirstChild("Sound") then
                return nil;
            end;

            u1("Sound", {
                RollOffMinDistance = 40,
                RollOffMaxDistance = 80,
                Volume = 0.9,
                Playing = true,
                PlaybackSpeed = 1,
                Looped = true,
                SoundId = GameSound.SPARKLER_LOOP,
                Parent = v8
            }):Play();
        end;
    end);
    task.spawn(function() -- Line: 65
        -- upvalues: RuntimeLib (ref), u5 (copy)
        while RuntimeLib.Promise.delay(1):await() do
            local function _(p9) -- Line: 68
                -- upvalues: u5 (ref)
                u5:updateBurnedParts(p9);
            end;

            for i in u5.sparklers do
                u5:updateBurnedParts(i);
            end;
        end;
    end);
end;

function u2.updateBurnedParts(p10, p11) -- Line: 77
    local Handle = p11:FindFirstChild("Handle");

    if Handle ~= nil then
        Handle = Handle:FindFirstChild("Inside");
    end;

    local v12 = p11:GetAttribute("LifeTime");
    local v13 = (v12 == nil and 0 or v12) / 100 * 14;
    local Handle2 = p11:FindFirstChild("Handle");

    if Handle2 ~= nil then
        Handle2 = Handle2:FindFirstChild("EffectAttachment");
    end;

    if not Handle then
        return nil;
    end;

    local v14 = false;
    local v15 = 1;

    while true do
        if v14 then
            v15 = v15 + 1;
        else
            v14 = true;
        end;

        if v15 > 14 - v13 then
            local v16 = Handle:FindFirstChild("P" .. tostring(v15));

            if v16 then
                Handle2.WorldPosition = v16.Position;

                local function _(p17) -- Line: 122
                    if p17:IsA("ParticleEmitter") or p17:IsA("Trail") then
                        p17.Enabled = true;
                    end;
                end;

                for i, descendant in Handle2:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
                        descendant.Enabled = true;
                    end;
                end;
            end;

            return Handle2;
        end;

        if Handle ~= nil then
            local v18 = Handle:FindFirstChild("P" .. tostring(v15));

            if v18 ~= nil then
                v18:Destroy();
            end;
        end;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;