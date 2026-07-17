-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "ZiplineController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "ZiplineController";
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: CollectionTagAdded (copy), KnitClient2 (copy), DeviceUtil (copy), Players (copy), ClientSyncEvents (copy), default (copy), BlockEngine (copy), u3 (copy), Workspace (copy), RunService (copy), GameQueryUtil (copy), SoundManager (copy), GameSound (copy), CollectionService (copy)
    CollectionTagAdded("zipline", function(u9) -- Line: 42
        -- upvalues: KnitClient2 (ref), DeviceUtil (ref), Players (ref), ClientSyncEvents (ref), default (ref), BlockEngine (ref), u8 (copy), u3 (ref), Workspace (ref), RunService (ref), GameQueryUtil (ref)
        if u9:GetAttribute("ZiplineDepart") == false then
            return nil;
        end;

        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            HoldDuration = 0,
            ActionText = "Zipline",
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ClickablePrompt = DeviceUtil.isMobileControls(),
            Parent = u9
        }).Triggered:Connect(function(p10) -- Line: 54
            -- upvalues: Players (ref), ClientSyncEvents (ref), u9 (copy), default (ref), BlockEngine (ref), u8 (ref), u3 (ref), Workspace (ref), KnitClient2 (ref), RunService (ref), GameQueryUtil (ref)
            if p10 == Players.LocalPlayer then
                if ClientSyncEvents.ZiplineMount:fire():isCancelled() then
                    return nil;
                end;

                local v11 = p10:GetAttribute("Teleporting");

                if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
                    return nil;
                end;

                local v12 = p10:GetAttribute("ElektraDashing");

                if v12 ~= 0 and (v12 == v12 and (v12 ~= "" and v12)) then
                    return nil;
                end;

                local v13 = p10:GetAttribute("AgniRocket");

                if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
                    return nil;
                end;

                local Character = p10.Character;
                local Character2 = p10.Character;

                if Character2 ~= nil then
                    Character2 = Character2:FindFirstChild("Humanoid");
                end;

                if Character and Character2 then
                    local Value = u9.ZiplineDestination.Value;
                    local u14 = Value and default.Client:Get("MountZipline"):CallServer({
                        ziplineBasePosition = BlockEngine:getBlockPosition(u9.Position)
                    });

                    if u14 then
                        local u15 = CFrame.new(u9.Position, Value.Position);
                        local u16 = CFrame.new(Value.CFrame.Position, Value.Position);

                        if (u16.Position - u15.Position).Magnitude == 0 then
                            Character2.Sit = false;

                            return nil;
                        end;

                        local activeAirJump = u8.activeAirJump;

                        if activeAirJump ~= nil then
                            activeAirJump.Destroy();
                        end;

                        u8.activeAirJump = nil;
                        local u17 = u3.new();
                        Players.LocalPlayer.CameraMaxZoomDistance = 20;
                        Players.LocalPlayer.CameraMinZoomDistance = 20;
                        u17:GiveTask(function() -- Line: 101
                            -- upvalues: Players (ref), Workspace (ref)
                            Players.LocalPlayer.CameraMaxZoomDistance = 14;
                            Players.LocalPlayer.CameraMinZoomDistance = 0;
                            local Character3 = Players.LocalPlayer.Character;

                            if Character3 ~= nil then
                                Character3 = Character3:FindFirstChild("Humanoid");
                            end;

                            Workspace.CurrentCamera.CameraSubject = Character3;
                        end);
                        local u18 = true;
                        u17:GiveTask(Character2.Jumping:Connect(function() -- Line: 111
                            -- upvalues: u18 (ref), u17 (copy)
                            u18 = false;
                            u17:DoCleaning();
                        end));
                        local u19 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                            airJumps = 1,
                            deleteWhenLanded = true
                        });
                        u8.activeAirJump = u19;
                        u17:GiveTask(function() -- Line: 120
                            -- upvalues: u8 (ref), u19 (copy)
                            task.delay(3, function() -- Line: 121
                                -- upvalues: u8 (ref), u19 (ref)
                                if u8.activeAirJump == u19 then
                                    u19.Destroy();
                                    u8.activeAirJump = nil;
                                end;
                            end);
                        end);
                        u17:GiveTask(function() -- Line: 128
                            -- upvalues: u18 (ref), Character2 (copy)
                            if not u18 then
                                return nil;
                            end;

                            Character2.Sit = false;
                        end);
                        u14.CFrame = u15;
                        local Magnitude = (Character:GetPrimaryPartCFrame().Position - Value.Position).Magnitude;
                        local u20 = tick();
                        RunService:BindToRenderStep("zipline", Enum.RenderPriority.Character.Value, function(p21) -- Line: 140
                            -- upvalues: u16 (copy), u15 (copy), u14 (copy), u17 (copy), Character (copy), u9 (ref), Workspace (ref), GameQueryUtil (ref), u20 (copy), Magnitude (ref)
                            u14.Velocity = (u16.Position - u15.Position).Unit * 40;

                            if (u14.Position - u16.Position).Magnitude <= 1 then
                                u17:DoCleaning();

                                return nil;
                            end;

                            local function v23(p22) -- Line: 150
                                -- upvalues: u14 (ref), Character (ref), u9 (ref), Workspace (ref), GameQueryUtil (ref)
                                return not p22:IsDescendantOf(u14) and (not p22:IsDescendantOf(Character) and (not p22:IsDescendantOf(u9) and (not p22:IsDescendantOf(Workspace.CurrentCamera) and (not GameQueryUtil:isQueryIgnored(p22) and (p22.Position - u9.Position).Magnitude > 5)))) and true or false;
                            end;

                            for _, v in u14:GetTouchingParts() do
                                if v23(v) and tick() - u20 > 1 then
                                    u17:DoCleaning();

                                    return nil;
                                end;
                            end;

                            if Character.PrimaryPart then
                                for _, v in Character.PrimaryPart:GetTouchingParts() do
                                    if v23(v) and tick() - u20 > 1 then
                                        u17:DoCleaning();

                                        return nil;
                                    end;
                                end;
                            end;

                            local Magnitude2 = (u14.Position - u16.Position).Magnitude;

                            if Magnitude < Magnitude2 and tick() - u20 > 1.5 then
                                u17:DoCleaning();

                                return nil;
                            end;

                            Magnitude = Magnitude2;

                            if math.abs(u14.RotVelocity.Y) > 1 then
                                u17:DoCleaning();

                                return nil;
                            end;
                        end);
                        u17:GiveTask(function() -- Line: 192
                            -- upvalues: RunService (ref)
                            RunService:UnbindFromRenderStep("zipline");
                        end);
                        u17:GiveTask(Value.AncestryChanged:Connect(function(p24, p25) -- Line: 206
                            -- upvalues: u17 (copy)
                            if p25 == nil then
                                u17:DoCleaning();
                            end;
                        end));
                        u14.AncestryChanged:Connect(function(p26, p27) -- Line: 211
                            -- upvalues: u17 (copy)
                            if p27 == nil then
                                u17:DoCleaning();
                            end;
                        end);
                    end;
                end;
            end;
        end);
    end);
    CollectionTagAdded("zipline-attached", function(u28) -- Line: 222
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u3 (ref), CollectionService (ref)
        local u29 = Players.LocalPlayer.Character == u28;
        local ZIPLINE_LATCH = GameSound.ZIPLINE_LATCH;
        local v30 = {};
        local v31;

        if u29 then
            v31 = nil;
        else
            v31 = u28:GetPrimaryPartCFrame().Position;
        end;

        v30.position = v31;
        SoundManager:playSound(ZIPLINE_LATCH, v30);
        local u32 = u3.new();

        if u28.PrimaryPart then
            local ZIPLINE_TRAVEL = GameSound.ZIPLINE_TRAVEL;
            local v33 = {
                looped = true
            };
            local v34;

            if u29 then
                v34 = nil;
            else
                v34 = u28:GetPrimaryPartCFrame().Position;
            end;

            v33.position = v34;
            v33.parent = u28.PrimaryPart;
            local u35 = SoundManager:playSound(ZIPLINE_TRAVEL, v33);

            if u35 then
                u32:GiveTask(function() -- Line: 235
                    -- upvalues: u35 (copy)
                    u35:Stop();
                end);
            end;
        end;

        u32:GiveTask(CollectionService:GetInstanceRemovedSignal("zipline-attached"):Connect(function(p36) -- Line: 240
            -- upvalues: u28 (copy), SoundManager (ref), GameSound (ref), u29 (copy), u32 (copy)
            if p36 == u28 then
                local ZIPLINE_UNLATCH = GameSound.ZIPLINE_UNLATCH;
                local v37 = {};
                local v38;

                if u29 then
                    v38 = nil;
                else
                    v38 = u28:GetPrimaryPartCFrame().Position;
                end;

                v37.position = v38;
                SoundManager:playSound(ZIPLINE_UNLATCH, v37);
                u32:DoCleaning();
            end;
        end));
        u32:GiveTask(u28.AncestryChanged:Connect(function(p39, p40) -- Line: 248
            -- upvalues: u32 (copy)
            if p40 == nil then
                u32:DoCleaning();
            end;
        end));
    end);
end;

return {
    ZiplineController = KnitClient.CreateController(u5.new())
};