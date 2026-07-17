-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local LanternFlicker = RuntimeLib.import(script, script.Parent, "lantern-flicker").LanternFlicker;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "PaperLanternReleaseController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "PaperLanternReleaseController";
end;

function u6.KnitStart(p9) -- Line: 42
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), u2 (copy), RandomUtil (copy), ReplicatedStorage (copy), u3 (copy), u4 (copy), LanternFlicker (copy), WeldUtil (copy), TweenService (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), Workspace (copy), default (copy), Linear (copy)
    KnitController.KnitStart(p9);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local PAPER_LANTERN_RELEASE = EmoteType.PAPER_LANTERN_RELEASE;
    local u10 = EmoteHandler;
    local u11 = setmetatable({}, {
        __tostring = function() -- Line: 50, Name: __tostring
            return "Anonymous";
        end,

        __index = u10
    });
    u11.__index = u11;

    function u11.new(...) -- Line: 56
        -- upvalues: u11 (ref)
        local v12 = setmetatable({}, u11);

        return v12:constructor(...) or v12;
    end;

    function u11.constructor(p13) -- Line: 60
        -- upvalues: u10 (copy)
        u10.constructor(p13);
        p13.playerLanternMaidMap = {};
    end;

    function u11.onEnable(u14, u15, p16, p17, p18) -- Line: 64
        -- upvalues: u2 (ref), RandomUtil (ref), ReplicatedStorage (ref), u3 (ref), u4 (ref), LanternFlicker (ref), WeldUtil (ref), TweenService (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Workspace (ref), default (ref), Linear (ref)
        local u19 = false;
        local u20 = u2.new();
        local v21 = RandomUtil.fromList(unpack(ReplicatedStorage.Assets.Misc.LNYLanterns:GetChildren()));
        local u22 = v21:Clone();
        u22.Frame.BallSocketConstraint.Enabled = false;
        local u23 = u3("WeldConstraint", {
            Parent = u22.Charm,
            Part0 = u22.Charm,
            Part1 = u22.Frame
        });
        local Paper = u22.Paper;
        local u24 = u3("Part", {
            Name = "Handle",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            CanCollide = false,
            Anchored = false,
            CanQuery = false,
            CanTouch = false,
            Children = { u22 },
            Position = v21:GetPivot().Position
        });
        u3("WeldConstraint", {
            Parent = u24,
            Part0 = u24,
            Part1 = Paper
        });
        local u25 = u3("Attachment", {
            Name = "LeftGripAttachment",
            Orientation = Vector3.new(0, 130, 0),
            Position = Vector3.new(1, 0, 0),
            Parent = u24
        });
        u3("PointLight", {
            Brightness = 3,
            Range = 9,
            Parent = Paper,
            Color = Color3.fromRGB(255, 183, 0)
        });
        local u26 = u4.mount(u4.createElement(LanternFlicker), Paper);
        u20:GiveTask(function() -- Line: 105
            -- upvalues: u4 (ref), u26 (copy)
            u4.unmount(u26);
        end);
        local u27 = u3("Accessory", {
            Name = "LanternEmoteAccesory",
            Children = { u24 }
        });
        u27.Parent = p16;
        WeldUtil:weldCharacterAccessories(p16);
        u20:GiveTask(function() -- Line: 114
            -- upvalues: u19 (ref), u27 (copy), TweenService (ref)
            if not u19 then
                u27:Destroy();

                return;
            end;

            local v28 = u27:GetDescendants();

            local function v30(p29) -- Line: 117
                -- upvalues: TweenService (ref)
                if p29:IsA("BasePart") then
                    TweenService:Create(p29, TweenInfo.new(2), {
                        Transparency = 1
                    }):Play();
                end;
            end;

            for i, v in v28 do
                v30(v, i - 1, v28);
            end;

            task.delay(2, function() -- Line: 127
                -- upvalues: u27 (ref)
                u27:Destroy();
            end);
        end);
        local u31 = GameAnimationUtil:getAssetId(AnimationType.SUMMON_SNOW);
        p18:GiveTask(p16.Humanoid.Animator.AnimationPlayed:Connect(function(p32) -- Line: 138
            -- upvalues: u31 (copy), u20 (copy), SoundManager (ref), GameSound (ref), Paper (copy), u14 (copy), u15 (copy), u22 (copy), u23 (copy), u19 (ref), u24 (copy), u25 (copy), u27 (copy), Workspace (ref), default (ref), Linear (ref)
            local Animation = p32.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation ~= u31 then
                return nil;
            end;

            u20:GiveTask(p32:GetMarkerReachedSignal("LeaveHand"):Connect(function() -- Line: 146
                -- upvalues: SoundManager (ref), GameSound (ref), Paper (ref), u14 (ref), u15 (ref), u20 (ref), u22 (ref), u23 (ref), u19 (ref), u24 (ref), u25 (ref), u27 (ref), Workspace (ref), default (ref), Linear (ref)
                SoundManager:playSound(GameSound.LANTERN_RELEASE, {
                    rollOffMaxDistance = 50,
                    volumeMultiplier = 0.7,
                    position = Paper:GetPivot().Position
                });
                local v33 = u14.playerLanternMaidMap[u15];

                if v33 then
                    v33:Destroy();
                end;

                local u34 = 0;
                u20:GiveTask(task.spawn(function() -- Line: 159
                    -- upvalues: u34 (ref), u22 (ref)
                    while true do
                        local v35 = task.wait(0.01);

                        if v35 == 0 or (v35 ~= v35 or not v35) then
                            break;
                        end;

                        u34 = u34 + 1;
                        local Charm = u22.Charm;
                        local v36 = u34 % 10;
                        local v37 = v36 ~= 0 and (v36 == v36 and v36) and 0 or (math.random() - 0.5) / 35;
                        local v38 = (math.random() - 1) / 15;
                        local v39 = u34 % 10;
                        local v40 = v39 ~= 0 and (v39 == v39 and v39) and 0 or (math.random() - 0.5) / 35;
                        Charm:ApplyImpulse((Vector3.new(v37, v38, v40)));
                    end;
                end));
                u22.Frame.BallSocketConstraint.Enabled = true;
                u23:Destroy();
                u14.playerLanternMaidMap[u15] = u20;
                u20:GiveTask(function() -- Line: 179
                    -- upvalues: u20 (ref), u14 (ref), u15 (ref)
                    u20:Destroy();
                    u14.playerLanternMaidMap[u15] = nil;
                end);
                u19 = true;
                u24.Anchored = true;
                u25:Destroy();
                u27.Parent = Workspace;
                local CFrame2 = u24.CFrame;
                local u41 = 0;
                local u42 = 0;
                local u43 = 0;
                local u44 = 0;
                local u45 = 20;
                local u46 = 20;
                u20:GiveTask((task.spawn(function() -- Line: 198
                    -- upvalues: u43 (ref), u44 (ref)
                    while true do
                        local v47 = task.wait(1);

                        if v47 == 0 or (v47 ~= v47 or not v47) then
                            break;
                        end;

                        local v48 = math.random();
                        u43 = math.round(v48);
                        local v49 = math.random();
                        u44 = math.round(v49);
                    end;
                end)));
                u20:GiveTask((task.spawn(function() -- Line: 209
                    -- upvalues: u41 (ref), u43 (ref), u42 (ref), u44 (ref)
                    while true do
                        local v50 = task.wait(0.25);

                        if v50 == 0 or (v50 ~= v50 or not v50) then
                            break;
                        end;

                        u41 = (u43 == 1 and 1 or -1) * 0.005;
                        u42 = (u44 == 1 and 1 or -1) * 0.005;
                    end;
                end)));
                local u61 = default(45, Linear, function(p51) -- Line: 220
                    -- upvalues: u45 (ref), u41 (ref), u46 (ref), u42 (ref), CFrame2 (copy), u24 (ref)
                    u45 = u45 + u41;
                    u46 = u46 + u42;
                    u45 = math.clamp(u45, 19.5, 20.5);
                    u46 = math.clamp(u46, 19.5, 20.5);
                    local v52 = math.sin(p51 * (5 / (2.71828 ^ ((u45 - 15) * -0.2) + 1) + 10)) * 10;
                    local v53 = math.cos(p51 * (5 / (2.71828 ^ ((u46 - 15) * -0.2) + 1) + 10)) * 10;
                    local v54 = Vector3.new(v52, 30, v53);
                    local v55 = 1 - math.min(p51 / 0.15555555555555556, 1);
                    local v56 = { CFrame2:ToEulerAnglesXYZ() };
                    local v57 = CFrame.new(CFrame2.Position);
                    local v58 = CFrame.Angles(v56[1] * v55 + math.rad((1 - u45 / 20) * 150), v56[2] * v55 + math.rad((1 - u45 / 20) * 150), v56[3] * v55 + math.rad((1 - u46 / 20) * 150));
                    local v59 = CFrame.new((CFrame2 + v54).Position);
                    local v60 = CFrame.Angles(v56[1] * v55 + math.rad((1 - u45 / 20) * 150), v56[2] * v55 + math.rad((1 - u45 / 20) * 150), v56[3] * v55 + math.rad((1 - u46 / 20) * 150));
                    u24:PivotTo((v57 * v58):Lerp(v59 * v60, p51));
                end);
                u20:GiveTask(function() -- Line: 236
                    -- upvalues: u61 (copy)
                    u61:Cancel();
                end);
                u20:GiveTask(task.delay(43, function() -- Line: 239
                    -- upvalues: u20 (ref)
                    u20:DoCleaning();
                end));
            end));
        end));
        p18:GiveTask(function() -- Line: 244
            -- upvalues: u19 (ref), u20 (copy)
            if not u19 then
                u20:Destroy();
            end;
        end);
    end;

    function u11.onDisable(p62, p63, p64, p65) -- Line: 250
    end;

    EmoteHandlerController:registerHandler(PAPER_LANTERN_RELEASE, u11);
end;

KnitClient.CreateController(u6.new());

return nil;