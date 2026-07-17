-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "YuziFlipEmoteHandlerController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 26
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "YuziFlipEmoteHandlerController";
end;

function u1.KnitStart(p4) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), default (copy), OutExpo (copy), ReplicatedStorage (copy), AccessoryUtil (copy), ItemType (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local YUZI_FLIP = EmoteType.YUZI_FLIP;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 48
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 52
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(p9, p10, u11, p12, p13) -- Line: 55
        -- upvalues: default (ref), OutExpo (ref), ReplicatedStorage (ref), AccessoryUtil (ref), ItemType (ref), WeldUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if not u11.PrimaryPart then
            return nil;
        end;

        local function u19(p14, u15) -- Line: 59
            -- upvalues: default (ref), OutExpo (ref)
            local function _(u16) -- Line: 61
                -- upvalues: default (ref), OutExpo (ref), u15 (copy)
                if u16:IsA("BasePart") then
                    default(0.35, OutExpo, function(p17) -- Line: 63
                        -- upvalues: u16 (copy)
                        u16.LocalTransparencyModifier = p17;
                    end, 1 - u15, u15):Play();
                end;
            end;

            for i, descendant in p14:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    default(0.35, OutExpo, function(p18) -- Line: 63
                        -- upvalues: descendant (copy)
                        descendant.LocalTransparencyModifier = p18;
                    end, 1 - u15, u15):Play();
                end;
            end;
        end;

        local u20 = ReplicatedStorage.Assets.Misc.emerald_dao_back:Clone();
        AccessoryUtil:addAccessory(u11, u20);
        p13:GiveTask(u20);
        local u21 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(ItemType.EMERALD_DAO):Clone();

        if not u21 then
            return nil;
        end;

        p13:GiveTask(u21);
        WeldUtil:weldCharacterAccessories(u11);
        local u22 = u11:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.FRONT_FLIP));
        u22:Play();
        p13:GiveTask(u22:GetMarkerReachedSignal("sword1"):Connect(function() -- Line: 84
            -- upvalues: u19 (copy), u20 (copy), AccessoryUtil (ref), u11 (copy), u21 (copy), WeldUtil (ref)
            u19(u20, 1);
            AccessoryUtil:addAccessory(u11, u21);
            WeldUtil:weldCharacterAccessories(u11);
            u19(u21, 0);
        end));
        p13:GiveTask(u22:GetMarkerReachedSignal("sword2"):Connect(function() -- Line: 90
            -- upvalues: u19 (copy), u20 (copy), u21 (copy)
            u19(u20, 0);
            u19(u21, 1);
            task.spawn(function() -- Line: 93
                -- upvalues: u21 (ref), u19 (ref), u20 (ref)
                task.wait(0.35);
                u21:Destroy();
                task.wait(1);
                u19(u20, 1);
                task.wait(0.35);
                u20:Destroy();
            end);
        end));
        p13:GiveTask(function() -- Line: 102
            -- upvalues: u22 (copy)
            u22:Stop();
            u22:Destroy();
        end);
    end;

    function u6.onDisable(p23, p24, p25, p26) -- Line: 107
    end;

    EmoteHandlerController:registerHandler(YUZI_FLIP, u6);
end;

KnitClient.CreateController(u1.new());

return nil;