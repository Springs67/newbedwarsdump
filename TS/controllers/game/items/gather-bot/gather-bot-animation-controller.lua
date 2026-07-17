-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "GatherBotAnimationController";
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
    p3.Name = "GatherBotAnimationController";
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), MonsterType (copy), RunService (copy)
    KnitController.KnitStart(u4);
    WatchCollectionTag("Monster", function(u5) -- Line: 30
        -- upvalues: MonsterType (ref), u4 (copy), RunService (ref)
        if u5:GetAttribute("MonsterType") ~= MonsterType.GATHER_BOT then
            return nil;
        end;

        local Humanoid = u5:WaitForChild("Humanoid", 3);
        local u6 = nil;
        local u7 = u4:setUpAnimationTrack(Humanoid);
        local u8 = false;
        local u9 = 0;
        local u10 = nil;
        u10 = RunService.Heartbeat:Connect(function() -- Line: 41
            -- upvalues: u5 (copy), u10 (ref), u8 (ref), u9 (ref), u7 (copy), u6 (ref)
            local v11 = u5;
            v11.Destroying:Connect(function() -- Line: 43
                -- upvalues: u10 (ref), u8 (ref)
                u10:Disconnect();
                u8 = false;
            end);

            if v11.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 1 then
                if not u8 and u9 <= 0 then
                    u8 = true;
                    u9 = 2;
                end;

                local v12 = v11:GetAttribute("HeldItemAmount");

                if v12 == nil then
                    v11:SetAttribute("HeldItemAmount", 0);
                    v12 = 0;
                end;

                if v12 <= 0 then
                    if not u7.walkNoItem.IsPlaying then
                        local v13 = u6;

                        if v13 ~= nil then
                            v13:Stop();
                        end;

                        u7.walkNoItem:Play();
                        u6 = u7.walkNoItem;
                    end;
                elseif not u7.walkWithItem.IsPlaying then
                    local v14 = u6;

                    if v14 ~= nil then
                        v14:Stop();
                    end;

                    u7.walkWithItem:Play();
                    u6 = u7.walkWithItem;
                end;
            else
                u8 = false;
                u9 = math.max(0, u9 - 0.1);
                local v15 = v11:GetAttribute("HeldItemAmount");

                if v15 == nil then
                    v11:SetAttribute("HeldItemAmount", 0);
                    v15 = 0;
                end;

                if not u7.idle.IsPlaying and v15 <= 0 then
                    local v16 = u6;

                    if v16 ~= nil then
                        v16:Stop();
                    end;

                    u7.idle:Play();
                    u6 = u7.idle;
                end;
            end;
        end);
    end);
end;

function u1.setUpAnimationTrack(p17, p18) -- Line: 96
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Animator = p18:WaitForChild("Animator");
    local v19 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GATHER_BOT_WALK));
    v19.Priority = Enum.AnimationPriority.Action;
    v19.Looped = true;
    local v20 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GATHER_BOT_WALK_CARRY_ITEM));
    v20.Priority = Enum.AnimationPriority.Action;
    v20.Looped = true;
    local v21 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GATHER_BOT_IDLE));
    v21.Priority = Enum.AnimationPriority.Action;
    v21.Looped = true;

    return {
        walkNoItem = v19,
        walkWithItem = v20,
        idle = v21
    };
end;

KnitClient.CreateController(u1.new());

return nil;