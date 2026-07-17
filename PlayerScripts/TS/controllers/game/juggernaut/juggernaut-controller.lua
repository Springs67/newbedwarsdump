-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "JuggernautController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "JuggernautController";
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), u2 (copy), KnitClient2 (copy), EntityDamageEventZap (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy)
    KnitController.KnitStart(p6);
    CollectionTagAdded("juggernaut-crate", function(u7) -- Line: 34
        -- upvalues: u2 (ref), KnitClient2 (ref), EntityDamageEventZap (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref)
        local u8 = u2.new();
        local u9 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            HoldDuration = 3,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Open",
            ObjectText = "Juggernaut Crate",
            ClickablePrompt = false,
            Parent = u7
        });
        u7.AncestryChanged:Connect(function(p10, p11) -- Line: 45
            -- upvalues: u8 (copy)
            if p11 == nil then
                u8:DoCleaning();
            end;
        end);
        local u26 = EntityDamageEventZap.On(function(p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25) -- Line: 50
            -- upvalues: Players (ref), u9 (copy)
            if p12 == Players.LocalPlayer.Character then
                u9:InputHoldEnd();
            end;
        end);
        u8:GiveTask(function() -- Line: 55
            -- upvalues: u26 (copy)
            u26();
        end);
        u9.PromptButtonHoldBegan:Connect(function(p27) -- Line: 58
            -- upvalues: u2 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u9 (copy)
            local u28 = u2.new();
            local u29 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OPEN_CRATE);
            u28:GiveTask(function() -- Line: 61
                -- upvalues: u29 (copy)
                local v30 = u29;

                if v30 ~= nil then
                    v30:Stop();
                end;

                local v31 = u29;

                if v31 ~= nil then
                    v31:Destroy();
                end;
            end);
            u9.PromptButtonHoldEnded:Connect(function() -- Line: 71
                -- upvalues: u28 (copy)
                u28:DoCleaning();
            end);
            u9.AncestryChanged:Connect(function(p32, p33) -- Line: 74
                -- upvalues: u28 (copy)
                if p33 == nil then
                    u28:DoCleaning();
                end;
            end);
        end);
        u9.Triggered:Connect(function(p34) -- Line: 80
            -- upvalues: default (ref), u7 (copy)
            default.Client:Get("OpenJuggernautCrate"):SendToServer({
                blockInstance = u7
            });
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;