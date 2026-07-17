-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "AnniversaryCakeController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "AnniversaryCakeController";
    p4.disabled = true;
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), WatchCollectionTag (copy), Players (copy), DeviceUtil (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if p5.disabled then
        return nil;
    end;

    KnitController.KnitStart(p5);

    if KnitClient.Controllers.SpectateController:isSpectating() then
        return nil;
    end;

    WatchCollectionTag("cake", function(u6) -- Line: 42
        -- upvalues: KnitClient (ref), Players (ref), DeviceUtil (ref), default (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        local u7 = u6:GetAttribute("Team");
        task.spawn(function() -- Line: 44
            -- upvalues: u7 (ref), u6 (copy), KnitClient (ref), Players (ref), DeviceUtil (ref), default (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
            while u7 == nil do
                task.wait(1);
                u7 = u6:GetAttribute("Team");
            end;

            local v8 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if v8 ~= nil then
                v8 = v8.id;
            end;

            if u7 == v8 then
                local v9 = KnitClient.Controllers.ProximityPromptController:createProximityPrompt({
                    ActionText = "Take a slice!",
                    ObjectText = "Birthday Cake",
                    RequiresLineOfSight = false,
                    MaxActivationDistance = 8,
                    HoldDuration = 2,
                    Parent = u6,
                    ClickablePrompt = DeviceUtil.isMobileControls()
                });
                local u10 = nil;
                v9.Triggered:Connect(function(p11) -- Line: 65
                    -- upvalues: KnitClient (ref), default (ref), u6 (ref)
                    local v12 = KnitClient.Controllers.TeamController:getPlayerTeam(p11);

                    if v12 ~= nil then
                        v12 = v12.name;
                    end;

                    default.Client:Get("PlayerEatCake"):SendToServer({
                        block = u6
                    });
                end);
                v9.PromptButtonHoldBegan:Connect(function(p13) -- Line: 75
                    -- upvalues: Players (ref), u10 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
                    if p13 == Players.LocalPlayer then
                        u10 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.EAT), {
                            looped = true
                        });
                        SoundManager:playSound(GameSound.EAT_FOOD_1);
                    end;
                end);
                v9.PromptButtonHoldEnded:Connect(function(p14) -- Line: 83
                    -- upvalues: Players (ref), u10 (ref)
                    if p14 == Players.LocalPlayer then
                        local v15 = u10;

                        if v15 ~= nil then
                            v15:Stop();
                        end;

                        local v16 = u10;

                        if v16 ~= nil then
                            v16:Destroy();
                        end;
                    end;
                end);
            end;
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;