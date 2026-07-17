-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v2.ContentProvider;
local Players = v2.Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SnapTrapState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "trapper", "snap-trap-state").SnapTrapState;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "SnapTrapController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SnapTrapController";
    p5.preloaded = false;
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), Players (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), OutQuad (copy), SnapTrapState (copy), default2 (copy), ContentProvider (copy), WatchCharacter (copy), KnitClient (copy), BedwarsImageId (copy)
    KnitController.KnitStart(u6);
    CollectionTagAdded("snap_trap", function(u7) -- Line: 41
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref), OutQuad (ref), SnapTrapState (ref), default2 (ref), u6 (copy), ContentProvider (ref)
        local v8 = u7:GetAttribute("PlacedByUserId");
        local u9 = v8 == Players.LocalPlayer.UserId;
        Players:GetPlayerByUserId(v8);
        local v10 = u7:GetAttribute("SnapTrapTeamId");

        if v10 == "" or not v10 then
            u7:GetAttributeChangedSignal("SnapTrapTeamId"):Wait();
        end;

        local v11 = u7:GetAttribute("SnapTrapTeamId");
        local Team = Players.LocalPlayer.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        task.spawn(function() -- Line: 55
            -- upvalues: SoundManager (ref), GameSound (ref), u9 (copy), u7 (copy)
            local SNAP_TRAP_SETUP = GameSound.SNAP_TRAP_SETUP;
            local v12 = {};
            local v13;

            if u9 then
                v13 = nil;
            else
                v13 = u7.Position;
            end;

            v12.position = v13;
            SoundManager:playSound(SNAP_TRAP_SETUP, v12);
        end);
        task.spawn(function() -- Line: 60
            -- upvalues: u7 (copy), GameAnimationUtil (ref), AnimationType (ref)
            local u14 = u7:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SNAP_TRAP_SETUP));
            u14.Priority = Enum.AnimationPriority.Idle;
            task.wait(0.1);
            u14:Play();
            u14:GetMarkerReachedSignal("end"):Connect(function() -- Line: 66
                -- upvalues: u14 (copy), u7 (ref)
                u14:AdjustSpeed(0);
                u7:GetAttributeChangedSignal("SnapTrapState"):Connect(function() -- Line: 68
                end);
            end);
        end);

        if v11 ~= Team then
            task.spawn(function() -- Line: 72
                -- upvalues: u7 (copy), default (ref), OutQuad (ref)
                task.wait(0.5);

                if not u7.Parent then
                    return nil;
                end;

                local u15 = nil;
                u15 = default(0.8, OutQuad, function(p16) -- Line: 78
                    -- upvalues: u7 (ref), u15 (ref)
                    if not u7.Parent then
                        u15:Cancel();

                        return nil;
                    end;

                    for _, descendant in u7.Model:GetDescendants() do
                        if descendant:IsA("BasePart") then
                            descendant.Transparency = p16;
                        end;
                    end;
                end);
            end);
            u7.Touched:Connect(function(p17) -- Line: 90
                -- upvalues: u7 (copy), SnapTrapState (ref), Players (ref), default2 (ref)
                if u7:GetAttribute("SnapTrapState") == SnapTrapState.ACTIVE and (Players.LocalPlayer.Character and p17.Parent == Players.LocalPlayer.Character) then
                    for _, descendant in u7.Model:GetDescendants() do
                        if descendant:IsA("BasePart") then
                            descendant.Transparency = 0;
                        end;
                    end;

                    default2.Client:Get("StepOnSnapTrap"):SendToServer({
                        snapTrap = u7
                    });
                end;
            end);
        end;

        task.spawn(function() -- Line: 105
            -- upvalues: u6 (ref), GameAnimationUtil (ref), AnimationType (ref), ContentProvider (ref)
            if not u6.preloaded then
                u6.preloaded = true;
                ContentProvider:PreloadAsync({ (GameAnimationUtil:getAnimation(AnimationType.SNAP_TRAP_CLOSE)) });
            end;
        end);
    end);
    default2.Client:OnEvent("SnapTrapSnared", function(p18) -- Line: 113
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        local SNAP_TRAP_CLOSE = GameSound.SNAP_TRAP_CLOSE;
        local v19 = {};
        local v20;

        if p18.entityInstance == Players.LocalPlayer.Character then
            v20 = nil;
        else
            v20 = p18.snapTrap.Position;
        end;

        v19.position = v20;
        SoundManager:playSound(SNAP_TRAP_CLOSE, v19);
        local u21 = p18.snapTrap:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SNAP_TRAP_CLOSE));
        u21.Priority = Enum.AnimationPriority.Action;
        u21:AdjustSpeed(1.5);
        u21:Play();
        u21:GetMarkerReachedSignal("end"):Connect(function() -- Line: 123
            -- upvalues: u21 (copy)
            u21:AdjustSpeed(0);
        end);
    end);
    default2.Client:OnEvent("SnapTrapMarkConsumed", function(p22) -- Line: 127
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
        local SNAP_TRAP_CONSUME_MARK = GameSound.SNAP_TRAP_CONSUME_MARK;
        local v23 = {};
        local v24;

        if p22.entity == Players.LocalPlayer.Character and true or p22.consumer == Players.LocalPlayer.Character then
            v24 = nil;
        else
            v24 = p22.entity.PrimaryPart;

            if v24 ~= nil then
                v24 = v24.Position;
            end;
        end;

        v23.position = v24;
        SoundManager:playSound(SNAP_TRAP_CONSUME_MARK, v23);
    end);
    WatchCharacter(function(p25, u26) -- Line: 146
        -- upvalues: KnitClient (ref), BedwarsImageId (ref)
        u26:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function() -- Line: 147
            -- upvalues: u26 (copy), KnitClient (ref), BedwarsImageId (ref)
            if u26:GetAttribute("SnapTrapMarked") then
                local u27 = KnitClient.Controllers.StunController:showStatusBubble(u26, BedwarsImageId.TRAPPER_MARKED);
                u27:GiveTask(u26:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function() -- Line: 151
                    -- upvalues: u27 (copy)
                    u27:DoCleaning();
                end));
            end;
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;