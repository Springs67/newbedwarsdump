-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = {
    GameSound.OWL_HOOT,
    GameSound.OWL_HOOT_1,
    GameSound.OWL_HOOT_2,
    GameSound.OWL_HOOT_3,
    GameSound.OWL_HOOT_4
};
local u4 = { GameSound.OWL_CUTE_1, GameSound.OWL_CUTE_2 };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "WhisperOwlEmoteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "WhisperOwlEmoteController";
end;

function u5.KnitStart(p8) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), CFrameUtil (copy), RunService (copy), GameAnimationUtil (copy), AnimationType (copy), RandomUtil (copy), u3 (copy), GameSound (copy), u4 (copy)
    KnitController.KnitStart(p8);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SPIRIT_OWL = EmoteType.SPIRIT_OWL;
    local u9 = EmoteHandler;
    local u10 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u9
    });
    u10.__index = u10;

    function u10.new(...) -- Line: 51
        -- upvalues: u10 (ref)
        local v11 = setmetatable({}, u10);

        return v11:constructor(...) or v11;
    end;

    function u10.constructor(p12, ...) -- Line: 55
        -- upvalues: u9 (copy)
        u9.constructor(p12, ...);
    end;

    function u10.onEnable(u13, u14, u15, p16, u17) -- Line: 58
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), CFrameUtil (ref), RunService (ref), GameAnimationUtil (ref), AnimationType (ref), RandomUtil (ref), u3 (ref), GameSound (ref), u4 (ref)
        local u18 = true;
        u17:GiveTask(function() -- Line: 60
            -- upvalues: u18 (ref)
            u18 = false;
        end);
        local u19 = ReplicatedStorage.Assets.Pets.Owl:Clone();
        local v20;

        if u19 == nil then
            v20 = u19;
        else
            v20 = u19.PrimaryPart;
        end;

        if not v20 then
            return nil;
        end;

        u17:GiveTask(u19);
        u19.PrimaryPart.Anchored = true;

        local function _(p21) -- Line: 74
            -- upvalues: GameQueryUtil (ref)
            if p21:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p21, true);
                p21.CanCollide = false;
                p21.CanQuery = false;
                p21.CanTouch = false;
            end;
        end;

        for i, descendant in u19:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.CanTouch = false;
            end;
        end;

        u13:setupInstance(u19);
        local X = u15:GetPivot().RightVector.X;
        local Z = u15:GetPivot().RightVector.Z;
        local Unit = Vector3.new(X, 0, Z).Unit;
        local X2 = u15:GetPivot().LookVector.X;
        local Z2 = u15:GetPivot().LookVector.Z;
        local Unit2 = Vector3.new(X2, 0, Z2).Unit;
        u19:PivotTo(u15:GetPivot() + (Unit * 1.5 + (Unit2 * -1 + Vector3.new(0, -2.5, 0))));
        CFrameUtil.rotateLocalDegrees(u19, Vector3.new(0, 180, 0));
        local RightHand = u15:FindFirstChild("RightHand");

        if RightHand then
            local u22 = u19:GetPivot().Position - RightHand:GetPivot().Position;
            RunService.Heartbeat:Connect(function() -- Line: 100
                -- upvalues: RightHand (copy), u22 (copy), u19 (copy), CFrameUtil (ref)
                local v23 = RightHand.Position + u22;
                local X3 = v23.X;
                local Y = u19:GetPivot().Y;
                local v24 = Vector3.new(X3, Y, v23.Z);
                u19:PivotTo(CFrameUtil.setCframePositionWithoutChangingRotation(u19:GetPivot(), v24));
            end);
        end;

        u19.Parent = u15;
        GameAnimationUtil:playAnimation(u19, AnimationType.SPIRIT_OWL_EMOTE_OWL);
        task.delay(2, function() -- Line: 120
            -- upvalues: u18 (ref), u13 (copy), RandomUtil (ref), u3 (ref), u14 (copy), u15 (copy)
            if not u18 then
                return nil;
            end;

            u13:playSound(RandomUtil.fromList(unpack(u3)), u14, {
                position = u15:GetPivot().Position
            });
        end);
        local u25 = nil;
        u17:GiveTask((u13:watchEmoteAnimation(u14, u15, AnimationType.SPIRIT_OWL_EMOTE_CHARACTER, function(p26) -- Line: 129
            -- upvalues: u17 (copy), u18 (ref), u25 (ref), u13 (copy), GameSound (ref), u14 (copy), u15 (copy), RandomUtil (ref), u4 (ref)
            local v27;

            if p26 == nil then
                v27 = p26;
            else
                v27 = p26:GetMarkerReachedSignal("fly_start"):Connect(function() -- Line: 133
                    -- upvalues: u18 (ref), u25 (ref), u13 (ref), GameSound (ref), u14 (ref), u15 (ref)
                    if not u18 then
                        return nil;
                    end;

                    if u25 ~= nil then
                        u25:Stop();
                    end;

                    u25 = u13:playSound(GameSound.OWL_FLY, u14, {
                        looped = true,
                        position = u15:GetPivot().Position
                    });
                end);
            end;

            u17:GiveTask(v27);
            local v28;

            if p26 == nil then
                v28 = p26;
            else
                v28 = p26:GetMarkerReachedSignal("fly_end"):Connect(function() -- Line: 150
                    -- upvalues: u18 (ref), u25 (ref)
                    if not u18 then
                        return nil;
                    end;

                    if u25 ~= nil then
                        u25:Stop();
                    end;
                end);
            end;

            u17:GiveTask(v28);

            if p26 ~= nil then
                p26 = p26:GetMarkerReachedSignal("owl_sound"):Connect(function() -- Line: 163
                    -- upvalues: u18 (ref), u13 (ref), RandomUtil (ref), u4 (ref), u14 (ref), u15 (ref)
                    if not u18 then
                        return nil;
                    end;

                    u13:playSound(RandomUtil.fromList(unpack(u4)), u14, {
                        position = u15:GetPivot().Position
                    });
                end);
            end;

            u17:GiveTask(p26);
        end)));
    end;

    function u10.onDisable(p29, p30, p31, p32) -- Line: 176
    end;

    EmoteHandlerController:registerHandler(SPIRIT_OWL, u10);
end;

KnitClient.CreateController(u5.new());

return nil;