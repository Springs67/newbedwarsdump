-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BalloonSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "BalloonsBedBreakEffect";
    end,

    __index = BreakBedEffectController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p7, BedBreakEffectType.BALLOONS);
    p7.Name = "BalloonsBedBreakEffect";
end;

function u5.KnitStart(p8) -- Line: 37
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p8);
end;

function u5.onBedBreak(u9, p10, p11, p12, p13) -- Line: 40
    -- upvalues: u2 (copy), KnitClient (copy), u3 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy)
    local u14 = u2.new();
    u9.maid:GiveTask(u14);
    local u15 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p12);
    u14:GiveTask(u15);
    u15:PivotTo(p11);

    local function _(p16) -- Line: 49
        -- upvalues: u3 (ref), u15 (copy)
        if p16:IsA("BasePart") then
            p16.Anchored = false;
            p16.CanCollide = false;
            u3("WeldConstraint", {
                Part0 = p16,
                Part1 = u15.PrimaryPart,
                Parent = p16
            });
        end;
    end;

    for i, descendant in u15:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Anchored = false;
            descendant.CanCollide = false;
            u3("WeldConstraint", {
                Part0 = descendant,
                Part1 = u15.PrimaryPart,
                Parent = descendant
            });
        end;
    end;

    u15.Parent = Workspace;
    local v17;

    if u15 == nil then
        v17 = u15;
    else
        v17 = u15:WaitForChild("Root", 1);
    end;

    local u18 = u3("Attachment", {
        Parent = v17
    });
    local v19 = false;
    local v20 = 0;
    local u21 = {};

    while true do
        if v19 then
            v20 = v20 + 1;
        else
            v19 = true;
        end;

        if v20 >= 3 then
            local function _(u22, p23) -- Line: 105
                -- upvalues: RuntimeLib (ref), u9 (copy)
                RuntimeLib.Promise.delay(7 + p23 / 2):andThen(function() -- Line: 107
                    -- upvalues: u22 (copy), u9 (ref)
                    if u22.Parent then
                        u9:popBalloon(u22);
                    end;
                end);
            end;

            for i, v in u21 do
                RuntimeLib.Promise.delay(7 + (i - 1) / 2):andThen(function() -- Line: 107
                    -- upvalues: v (copy), u9 (copy)
                    if v.Parent then
                        u9:popBalloon(v);
                    end;
                end);
            end;

            task.delay(#u21 / 2 + 7, function() -- Line: 117
                -- upvalues: u14 (copy)
                u14:DoCleaning();
            end);

            return;
        end;

        task.delay(v20 * 0.25, function() -- Line: 88
            -- upvalues: u9 (copy), u15 (copy), u21 (copy), u18 (copy), u14 (copy), SoundManager (ref), GameSound (ref)
            local v24 = u9:inflateBalloon(u15);

            if v24 then
                table.insert(u21, v24);
                u9:hookBalloon(u18, v24);
                u14:GiveTask(v24);
                SoundManager:playSound(GameSound.BALLOON_INFLATE, {
                    position = v24.Balloon.Position
                });
            end;
        end);
    end;
end;

function u5.hookBalloon(p25, p26, p27) -- Line: 121
    local RopeConstraint = p27:WaitForChild("RopeConstraint");
    RopeConstraint.Attachment0 = p26;
    RopeConstraint.Attachment1 = p27.Balloon.Attachment;
end;

function u5.inflateBalloon(p28, p29) -- Line: 126
    -- upvalues: PlaceUtil (copy), BalloonSkin (copy), RandomUtil (copy), ReplicatedStorage (copy), u3 (copy), Workspace (copy), CollectionService (copy), ClientStore (copy)
    if not (p29 and p29.PrimaryPart) then
        return nil;
    end;

    local v30 = "InflatedBalloon";
    local v31;

    if PlaceUtil.isLobbyServer() then
        v31 = BalloonSkin.BALLOON_SKIN_MODELS_LOBBY;
    else
        v31 = BalloonSkin.BALLOON_SKIN_MODELS;
    end;

    if v31 and #v31 > 0 then
        v30 = RandomUtil.fromList(unpack(v31));
    end;

    local v32 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v30):Clone();
    v32.Balloon:SetAttribute("IgnoreProjectileCollision", true);
    v32.Balloon.CFrame = p29:GetPrimaryPartCFrame();
    u3("BodyForce", {
        Name = "BodyForce",
        Force = Vector3.new(0, Workspace.Gravity * v32.Balloon.Mass * 7, 0),
        Parent = v32.Balloon
    });

    if v30 == "InflatedBalloon" then
        u3("BodyGyro", {
            D = 0,
            CFrame = v32.Balloon.CFrame,
            Parent = v32.Balloon
        });
    else
        u3("BodyGyro", {
            D = 1000,
            P = 10,
            CFrame = v32.Balloon.CFrame,
            Parent = v32.Balloon
        });
    end;

    v32.Parent = p29;
    CollectionService:AddTag(v32, "InflatedBalloon:" .. p29.Name);
    local v33 = Color3.fromRGB(216, 50, 53);
    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam then
        if myTeam ~= nil then
            myTeam = myTeam.color;
        end;
    else
        myTeam = v33;
    end;

    v32.Balloon.Color = myTeam;
    v32.Balloon.PopEffect.Color = ColorSequence.new(myTeam);

    return v32;
end;

function u5.popBalloon(p34, u35) -- Line: 173
    -- upvalues: RuntimeLib (copy), SoundManager (copy), GameSound (copy)
    u35.Balloon.BodyForce.Force = Vector3.new(0, 0, 0);
    u35:SetAttribute("DeflatedBalloon", true);
    RuntimeLib.Promise.delay(2):andThen(function() -- Line: 177
        -- upvalues: u35 (copy), SoundManager (ref), GameSound (ref)
        u35:Destroy();
        SoundManager:playSound(GameSound.BALLOON_POP, {
            position = u35.Balloon.Position
        });
    end);
end;

KnitClient.CreateController(u5.new());

return nil;