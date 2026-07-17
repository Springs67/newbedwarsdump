-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "VoidDragonAnimationController";
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
    p4.Name = "VoidDragonAnimationController";
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), WatchCharacter (copy), KnitClient2 (copy), BedwarsKit (copy)
    KnitController.KnitStart(u5);
    WatchCharacter(function(u6, p7) -- Line: 31
        -- upvalues: KnitClient2 (ref), BedwarsKit (ref), u5 (copy)
        if not KnitClient2.Controllers.KitController:isUsingKit(u6, BedwarsKit.VOID_DRAGON) then
            return nil;
        end;

        local Humanoid = p7:WaitForChild("Humanoid");
        local u8 = u5:setUpAnimationTrack(u6);

        if u8 == nil then
            return nil;
        end;

        local u9 = nil;
        local u10 = nil;
        Humanoid.Running:Connect(function() -- Line: 42
            -- upvalues: u9 (ref), u10 (ref), u8 (copy)
            if u9 then
                u9:Stop();
            end;

            if u10 then
                u10:Stop();
            end;

            local runningTrack = u8.runningTrack;

            if runningTrack ~= nil then
                runningTrack:Play();
            end;

            u10 = u8.runningTrack;
        end);
        Humanoid.FreeFalling:Connect(function() -- Line: 55
            -- upvalues: u6 (copy), u9 (ref), u10 (ref), u8 (copy)
            local v11 = u6:GetAttribute("VoidDragon");

            if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
                local v12 = u9;

                if v12 ~= nil then
                    v12:Stop();
                end;

                local v13 = u10;

                if v13 ~= nil then
                    v13:Stop();
                end;

                local flyingTrack = u8.flyingTrack;

                if flyingTrack ~= nil then
                    flyingTrack:Play();
                end;

                local wingsFlyingTrack = u8.wingsFlyingTrack;

                if wingsFlyingTrack ~= nil then
                    wingsFlyingTrack:Play();
                end;

                u9 = u8.flyingTrack;
                u10 = u8.wingsFlyingTrack;
            end;
        end);
        Humanoid.StateChanged:Connect(function(p14, p15) -- Line: 78
            -- upvalues: u9 (ref), u10 (ref)
            if p15 == Enum.HumanoidStateType.Landed and p14 == Enum.HumanoidStateType.Freefall then
                local v16 = u9;

                if v16 ~= nil then
                    v16:Stop();
                end;

                local v17 = u10;

                if v17 ~= nil then
                    v17:Stop();
                end;
            end;
        end);
    end);
end;

function u2.setUpAnimationTrack(p18, p19) -- Line: 92
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Character = p19.Character;

    if not Character then
        return nil;
    end;

    local Animator = Character.Humanoid.Animator;

    if not Animator then
        return nil;
    end;

    local v20 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_DRAGON_FLYING));
    local v21 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_DRAGON_GLIDE));
    v20:AdjustSpeed(0.1);
    v21.Priority = Enum.AnimationPriority.Movement;
    v20.Priority = Enum.AnimationPriority.Movement;
    local v22 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_DRAGON_IDLE));
    v22.Priority = Enum.AnimationPriority.Idle;
    local v23 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_DRAGON_RUNNING));
    v23.Priority = Enum.AnimationPriority.Movement;

    return {
        flyingTrack = v20,
        wingsFlyingTrack = v21,
        idleTrack = v22,
        runningTrack = v23
    };
end;

KnitClient.CreateController(u2.new());

return nil;