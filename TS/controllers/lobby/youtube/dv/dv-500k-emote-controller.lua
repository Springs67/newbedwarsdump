-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "Dv500kEmoteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "Dv500kEmoteController";
end;

function u5.KnitStart(p8) -- Line: 39
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), Players (copy), default (copy), InQuad (copy), u3 (copy), KnitClient (copy), FireworkType (copy), ReplicatedStorage (copy), ItemType (copy), Workspace (copy), default2 (copy)
    KnitController.KnitStart(p8);
    WatchCollectionTag("DvTrophy", function(u9) -- Line: 41
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient2 (ref), Players (ref), default (ref), InQuad (ref), u3 (ref), KnitClient (ref), FireworkType (ref), ReplicatedStorage (ref), ItemType (ref), Workspace (ref), default2 (ref)
        SoundManager:playSound(GameSound.EMERALD_GENERATOR_AURA, {
            volumeMultiplier = 1.4,
            parent = u9
        });
        local u10 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ObjectText = "DV Trophy",
            ActionText = "Activate",
            HoldDuration = 1,
            RequiresLineOfSight = false,
            Parent = u9
        });
        u10.Triggered:Connect(function(p11) -- Line: 53
            -- upvalues: Players (ref), u10 (copy), u9 (copy), default (ref), InQuad (ref), u3 (ref), KnitClient (ref), FireworkType (ref), ReplicatedStorage (ref), ItemType (ref), Workspace (ref), SoundManager (ref), GameSound (ref), default2 (ref)
            if p11 ~= Players.LocalPlayer then
                return nil;
            end;

            u10.Enabled = false;
            local u12 = u9:FindFirstChildWhichIsA("BillboardGui");

            local function _(u13) -- Line: 59
                -- upvalues: default (ref), InQuad (ref), u12 (copy)
                default(1, InQuad, function(u14) -- Line: 60
                    -- upvalues: u12 (ref), u13 (copy)
                    local v15 = u12;

                    if v15 ~= nil then
                        local function _(p16) -- Line: 64
                            -- upvalues: u13 (ref), u14 (copy)
                            if p16:IsA("TextLabel") then
                                p16.TextTransparency = u13 * u14 + (1 - u14) * (1 - u13);
                            end;
                        end;

                        for i, child in v15:GetChildren() do
                            local _ = i - 1;

                            if child:IsA("TextLabel") then
                                child.TextTransparency = u13 * u14 + (1 - u14) * (1 - u13);
                            end;
                        end;
                    end;
                end);
            end;

            local u17 = 0;
            default(1, InQuad, function(u18) -- Line: 60
                -- upvalues: u12 (copy), u17 (copy)
                local v19 = u12;

                if v19 ~= nil then
                    local function _(p20) -- Line: 64
                        -- upvalues: u17 (ref), u18 (copy)
                        if p20:IsA("TextLabel") then
                            p20.TextTransparency = u17 * u18 + (1 - u18) * (1 - u17);
                        end;
                    end;

                    for i, child in v19:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("TextLabel") then
                            child.TextTransparency = u17 * u18 + (1 - u18) * (1 - u17);
                        end;
                    end;
                end;
            end);
            task.spawn(function() -- Line: 76
                -- upvalues: u3 (ref), u9 (ref), KnitClient (ref), FireworkType (ref), ReplicatedStorage (ref), ItemType (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
                local v21 = u3.new();
                local u22 = true;
                task.spawn(function() -- Line: 79
                    -- upvalues: u22 (ref), u9 (ref), KnitClient (ref), FireworkType (ref)
                    while true do
                        local v23 = task.wait(0.125);

                        if v23 ~= 0 and (v23 == v23 and v23) then
                            v23 = u22;
                        end;

                        if v23 == 0 or (v23 ~= v23 or not v23) then
                            return;
                        end;

                        local v24 = math.random() * 3.141592653589793 * 2;
                        local v25 = 30 + math.random() * 60;
                        local v26 = math.cos(v24) * v25;
                        local v27 = 20 + math.random() * 25;
                        local v28 = math.sin(v24) * v25;
                        local v29 = Vector3.new(v26, v27, v28);
                        KnitClient.Controllers.FireworkController:playFireworkEffect(u9.Position + u9.CFrame.LookVector * 100 + v29, FireworkType.DV);
                    end;
                end);
                local v30 = false;
                local v31 = 0;

                while true do
                    if v30 then
                        v31 = v31 + 1;
                    else
                        v30 = true;
                    end;

                    if v31 >= 7 then
                        task.wait(1.5);
                        u22 = false;

                        return;
                    end;

                    local v32 = false;
                    local v33 = 0;

                    while true do
                        if true then
                            if v32 then
                                v33 = v33 + 1;
                            else
                                v32 = true;
                            end;
                        end;

                        if v33 >= 4 then
                            break;
                        end;

                        local Items = ReplicatedStorage:FindFirstChild("Items");

                        if Items ~= nil then
                            Items = Items:FindFirstChild(ItemType.EMERALD);

                            if Items ~= nil then
                                Items = Items:Clone();
                            end;
                        end;

                        local v34 = Items and Items:FindFirstChild("Handle");

                        if v34 then
                            Items.Parent = Workspace;
                            v34.CFrame = u9.CFrame * CFrame.Angles(0, math.random() * 3.141592653589793 * 2, 0) + Vector3.new(0, 6, 0);
                            local v35 = math.random() * 3.141592653589793 * 2;
                            local v36 = math.cos(v35) * 30;
                            local v37 = 40 + math.random() * 5;
                            local v38 = math.sin(v35) * 30;
                            v34.Velocity = Vector3.new(v36, v37, v38);
                            SoundManager:playSound(GameSound.NEW_EMERALD_PICKUP, {
                                volumeMultiplier = 0.25,
                                position = u9.Position,
                                playbackSpeedMultiplier = v33 / 6 * 0.04 + 0.98
                            });
                            v21:GiveTask(Items);
                        end;

                        task.wait(0.125);
                    end;

                    task.wait(0.5);
                    v21:DoCleaning();
                end;
            end);
            task.wait(10.5);
            local u39 = 1;
            default(1, InQuad, function(u40) -- Line: 60
                -- upvalues: u12 (copy), u39 (copy)
                local v41 = u12;

                if v41 ~= nil then
                    local function _(p42) -- Line: 64
                        -- upvalues: u39 (ref), u40 (copy)
                        if p42:IsA("TextLabel") then
                            p42.TextTransparency = u39 * u40 + (1 - u40) * (1 - u39);
                        end;
                    end;

                    for i, child in v41:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("TextLabel") then
                            child.TextTransparency = u39 * u40 + (1 - u40) * (1 - u39);
                        end;
                    end;
                end;
            end);
            default2.Client:Get("ClaimDv500k"):SendToServer();
            task.delay(3, function() -- Line: 160
                -- upvalues: u10 (ref)
                u10.Enabled = true;
            end);
        end);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;