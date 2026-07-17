-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = ConstantManager.registerConstants(script, {
    C0 = -5,
    C1 = 0,
    YAngleRod = 1.0471975511965976,
    YAngleBobber = 1.0471975511965976
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "FishingRodEffectsController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 40
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 44
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "FishingRodEffectsController";
end;

function u6.KnitStart(p9) -- Line: 48
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), TweenService (copy), SoundManager (copy), GameSound (copy), Players (copy), ItemUtil (copy), RuntimeLib (copy), KnitClient2 (copy), ClientSyncEvents (copy), EntityUtil (copy), ItemType (copy), u3 (copy), u5 (copy), RunService (copy)
    KnitController.KnitStart(p9);
    default.Client:WaitFor("FishCaught"):andThen(function(p10) -- Line: 51
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), TweenService (ref), SoundManager (ref), GameSound (ref), Players (ref), ItemUtil (ref), RuntimeLib (ref), KnitClient2 (ref)
        p10:Connect(function(u11) -- Line: 52
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), TweenService (ref), SoundManager (ref), GameSound (ref), Players (ref), ItemUtil (ref), RuntimeLib (ref), KnitClient2 (ref)
            local Character = u11.catchingPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            local v12 = ReplicatedStorage.Assets.Misc.Fisherman[u11.dropData.fishModel]:Clone();
            local fishSizeMultiplier = u11.dropData.fishSizeMultiplier;
            v12.Size = v12.Size * (fishSizeMultiplier == nil and 1 or fishSizeMultiplier);
            v12.Parent = Workspace;
            GameQueryUtil:setQueryIgnored(v12, true);
            v12.Position = u11.catchPosition;
            local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
            local v14 = {};
            local Character2 = u11.catchingPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.Position;
                end;
            end;

            if Character2 ~= nil then
                Character = Character2;
            end;

            v14.Position = Character + Vector3.new(0, 6, 0);
            local v15 = TweenService:Create(v12, v13, v14);
            v15:Play();
            v15.Completed:Wait();
            task.wait(0.25);
            local Position = v12.Position;
            v12:Destroy();

            if not Workspace.CurrentCamera or (Workspace.CurrentCamera.CFrame - Position).Position.Magnitude > 180 then
                return nil;
            end;

            local CONFETTI = GameSound.CONFETTI;
            local v16 = {};
            local v17;

            if u11.catchingPlayer == Players.LocalPlayer then
                v17 = nil;
            else
                v17 = u11.catchingPlayer.Character;

                if v17 ~= nil then
                    v17 = v17.PrimaryPart;

                    if v17 ~= nil then
                        v17 = v17.Position;
                    end;
                end;
            end;

            v16.position = v17;
            v16.volumeMultiplier = 0.8;
            SoundManager:playSound(CONFETTI, v16);
            local u18 = 0;

            for _, v in u11.dropData.drops do
                local v19 = math.min(8, v.amount);

                if v.amount > 8 then
                    v19 = v19 + math.log(v.amount - 8 + 1, 2);
                end;

                local v20 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v.itemType);
                local u21 = ItemUtil.cloneItemIntoModel(v20);
                local v22 = false;
                local v23 = 0;

                while true do
                    if true then
                        if v22 then
                            v23 = v23 + 1;
                        else
                            v22 = true;
                        end;
                    end;

                    if v23 >= math.ceil(v19) then
                        break;
                    end;

                    task.spawn(function() -- Line: 142
                        -- upvalues: RuntimeLib (ref), KnitClient2 (ref), u21 (copy), Position (copy), u11 (copy), SoundManager (ref), GameSound (ref), Players (ref), u18 (ref)
                        RuntimeLib.Promise.delay(math.random() * 0.2):await();
                        KnitClient2.Controllers.ReceiveItemEffectController:playEffect(u21, Position, function() -- Line: 144
                            -- upvalues: u11 (ref)
                            local Character3 = u11.catchingPlayer.Character;

                            if Character3 ~= nil then
                                Character3 = Character3.PrimaryPart;

                                if Character3 ~= nil then
                                    Character3 = Character3.CFrame;
                                end;
                            end;

                            return Character3;
                        end, 0.5 + math.random() * 0.2):andThen(function(p24) -- Line: 154
                            -- upvalues: SoundManager (ref), GameSound (ref), u11 (ref), Players (ref), u18 (ref)
                            if p24 then
                                local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                                local v25 = {};
                                local v26;

                                if u11.catchingPlayer == Players.LocalPlayer then
                                    v26 = nil;
                                else
                                    v26 = u11.catchingPlayer.Character;

                                    if v26 ~= nil then
                                        v26 = v26.PrimaryPart;

                                        if v26 ~= nil then
                                            v26 = v26.Position;
                                        end;
                                    end;
                                end;

                                v25.position = v26;
                                v25.volumeMultiplier = 0.8;
                                local v27 = u18;
                                u18 = u18 + 1;
                                v25.playbackSpeedMultiplier = v27 / 50 + 1;
                                SoundManager:playSound(PICKUP_ITEM_DROP, v25);
                            end;
                        end);
                    end);
                end;
            end;
        end);
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p28) -- Line: 190
        -- upvalues: Players (ref), EntityUtil (ref), ItemType (ref), u3 (ref), u5 (ref), RunService (ref), RuntimeLib (ref)
        if p28.projectileType ~= "fisherman_bobber" then
            return nil;
        end;

        local v29 = p28.projectile:GetAttribute("ProjectileShooter");

        if v29 == 0 or (v29 ~= v29 or not v29) then
            return nil;
        end;

        local v30 = Players:GetPlayerByUserId(v29);

        if not v30 then
            return nil;
        end;

        local v31 = EntityUtil:getEntity(v30);

        if not v31 then
            return nil;
        end;

        local u32 = v31:getHandItemInstanceFromCharacter();

        if not u32 or u32.Name ~= ItemType.FISHING_ROD then
            return nil;
        end;

        local projectile = p28.projectile;
        local u33 = u3("Beam", {
            Width0 = 0.06,
            Width1 = 0.06,
            LightEmission = 0.95,
            LightInfluence = 0.95,
            FaceCamera = true,
            Segments = 100,
            Parent = p28.projectile,
            Attachment0 = projectile.Handle.LineAttachment,
            Attachment1 = u32.Handle.LineAttachment,
            CurveSize0 = u5.C0,
            CurveSize1 = u5.C1,
            Transparency = NumberSequence.new(0),
            Color = ColorSequence.new(Color3.fromRGB(120, 120, 120))
        });
        local u34 = nil;
        u34 = RunService.Heartbeat:Connect(function() -- Line: 228
            -- upvalues: u32 (copy), projectile (copy), u34 (ref), u33 (copy), u5 (ref)
            if not (u32.Parent and projectile.Parent) then
                u34:Disconnect();

                return nil;
            end;

            local v35 = math.min(1, (u32.Handle.LineAttachment.WorldPosition - projectile.Handle.LineAttachment.WorldPosition).Magnitude / 15);
            u33.CurveSize0 = u5.C0 * v35;
            u33.CurveSize1 = u5.C1 * v35;
            local v36 = CFrame.new(u32.Handle.LineAttachment.WorldCFrame.Position, projectile.Handle.LineAttachment.WorldPosition);
            local v37 = CFrame.Angles(0, u5.YAngleRod, 1.5707963267948966);
            u32.Handle.LineAttachment.WorldCFrame = v36 * v37;
            local v38 = CFrame.new(projectile.Handle.LineAttachment.WorldCFrame.Position, u32.Handle.LineAttachment.WorldPosition);
            local v39 = CFrame.Angles(0, u5.YAngleBobber, 1.5707963267948966);
            projectile.Handle.LineAttachment.WorldCFrame = v38 * v39;
        end);
        task.spawn(function() -- Line: 246
            -- upvalues: projectile (copy), RuntimeLib (ref), RunService (ref)
            if not projectile:GetAttribute("WaitingForFish") then
                projectile:GetAttributeChangedSignal("WaitingForFish"):Wait();
            end;

            RuntimeLib.Promise.delay(0.5):await();
            local v40 = projectile;

            if v40 ~= nil then
                v40 = v40.PrimaryPart;

                if v40 ~= nil then
                    v40 = v40.Parent;
                end;
            end;

            if v40 == nil then
                return nil;
            end;

            local u41 = os.clock();
            local Position = projectile:GetPrimaryPartCFrame().Position;
            local u42 = projectile:GetPrimaryPartCFrame() - Position;
            local u43 = nil;
            u43 = RunService.Heartbeat:Connect(function() -- Line: 265
                -- upvalues: projectile (ref), u43 (ref), u41 (copy), Position (copy), u42 (copy)
                if not projectile.Parent then
                    u43:Disconnect();

                    return nil;
                end;

                local v44 = (os.clock() - u41) * 3.141592653589793;
                local v45 = math.sin(v44) * 0.5;
                local v46 = Position + Vector3.new(0, v45, 0);
                projectile:PivotTo(CFrame.new(v46) * u42);
            end);
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;