-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VoidWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local VoidPortalTag = RuntimeLib.import(script, script.Parent, "void-portal-tag").VoidPortalTag;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "VoidPortalController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "VoidPortalController";
end;

function u6.KnitStart(p9) -- Line: 45
    -- upvalues: KnitController (copy), Players (copy), CollectionService (copy), default (copy), Linear (copy), GameAnimationUtil (copy), AnimationType (copy), WatchCollectionTag (copy), u3 (copy), u4 (copy), VoidPortalTag (copy), VoidWorldUtil (copy), getItemMeta (copy), KnitClient2 (copy), EntityDamageEventZap (copy), InventoryUtil (copy), Flamework (copy), SoundManager (copy), GameSound (copy), default2 (copy)
    KnitController.KnitStart(p9);
    task.spawn(function() -- Line: 48
        -- upvalues: Players (ref), CollectionService (ref), default (ref), Linear (ref), GameAnimationUtil (ref), AnimationType (ref)
        while true do
            local v10 = task.wait(0.25);

            if v10 == 0 or (v10 ~= v10 or not v10) then
                break;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            for _, v in CollectionService:GetTagged("VoidPortal") do
                task.spawn(function() -- Line: 63
                    -- upvalues: v (copy), Character (copy), default (ref), Linear (ref), GameAnimationUtil (ref), AnimationType (ref)
                    local v11 = v;
                    local v12 = not Character and (1 / 0) or (Character - v11.Position).Magnitude;
                    local Rig = v11:FindFirstChild("Rig");

                    if not Rig then
                        return nil;
                    end;

                    if not Rig.PrimaryPart then
                        return nil;
                    end;

                    if Character then
                        local u13 = Rig:GetPrimaryPartCFrame();
                        local u14 = Vector3.new(Character.X, u13.Y, Character.Z);
                        default(0.25, Linear, function(p15) -- Line: 84
                            -- upvalues: Rig (copy), u13 (copy), u14 (copy)
                            if not Rig.PrimaryPart then
                                return nil;
                            end;

                            Rig:PivotTo(u13:Lerp(CFrame.new(u13.Position, u14) * CFrame.Angles(0, 1.5707963267948966, 0), p15));
                        end);
                    end;

                    if Rig ~= nil then
                        Rig = Rig:FindFirstChildWhichIsA("AnimationController");

                        if Rig ~= nil then
                            Rig = Rig:FindFirstChildWhichIsA("Animator");
                        end;
                    end;

                    if Rig then
                        local v16 = v12 < 10;

                        local function _(p17) -- Line: 107
                            -- upvalues: GameAnimationUtil (ref), AnimationType (ref)
                            local Animation = p17.Animation;

                            if Animation ~= nil then
                                Animation = Animation.AnimationId;
                            end;

                            return Animation == GameAnimationUtil:getAssetId(AnimationType.VOID_PORTAL_EXCITED);
                        end;

                        local u18 = nil;

                        for i, v3 in Rig:GetPlayingAnimationTracks() do
                            local _ = i - 1;
                            local Animation = v3.Animation;

                            if Animation ~= nil then
                                Animation = Animation.AnimationId;
                            end;

                            if Animation == GameAnimationUtil:getAssetId(AnimationType.VOID_PORTAL_EXCITED) == true then
                                u18 = v3;
                                break;
                            end;
                        end;

                        if v16 and not u18 then
                            GameAnimationUtil:playAnimation(Rig, AnimationType.VOID_PORTAL_EXCITED, {
                                fadeInTime = 0.1
                            });

                            return;
                        end;

                        if not v16 and u18 then
                            u18:Stop(0.5);
                            task.delay(0.15, function() -- Line: 130
                                -- upvalues: u18 (copy)
                                u18:Destroy();
                            end);
                        end;
                    end;
                end);
            end;
        end;
    end);
    WatchCollectionTag("VoidPortal", function(u19) -- Line: 139
        -- upvalues: u3 (ref), GameAnimationUtil (ref), AnimationType (ref), u4 (ref), VoidPortalTag (ref), VoidWorldUtil (ref), getItemMeta (ref), KnitClient2 (ref), EntityDamageEventZap (ref), Players (ref), InventoryUtil (ref), Flamework (ref), SoundManager (ref), GameSound (ref), default2 (ref)
        local u20 = u3.new();
        task.spawn(function() -- Line: 142
            -- upvalues: u19 (copy), GameAnimationUtil (ref), AnimationType (ref)
            u19:WaitForChild("Rig");
            GameAnimationUtil:playAnimation(u19.Rig:WaitForChild("AnimationController"):WaitForChild("Animator"), AnimationType.VOID_PORTAL_IDLE);
        end);
        task.spawn(function() -- Line: 148
            -- upvalues: u19 (copy), u4 (ref), VoidPortalTag (ref)
            local v21 = u19:GetAttribute("CloseTime");

            if v21 == 0 or (v21 ~= v21 or not v21) then
                u19:GetAttributeChangedSignal("CloseTime"):Wait();
            end;

            local v22 = u19:GetAttribute("CloseTime");

            if v22 ~= nil then
                u4.mount(u4.createElement(VoidPortalTag, {
                    getTag = function(p23) -- Line: 156, Name: getTag
                        return "Closes in " .. tostring(p23) .. "s";
                    end,

                    closeTime = v22
                }), u19, "VoidTag");
            end;
        end);
        local u24 = u19:GetAttribute("VoidExit") == true;
        local u25 = tostring(VoidWorldUtil.VOID_ENTRY_COST) .. " " .. getItemMeta(VoidWorldUtil.VOID_ENTRY_MATERIAL).displayName;
        local u26 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            HoldDuration = 3,
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            ObjectText = "Void",
            ClickablePrompt = false,
            ActionText = u24 and "Exit" or "Enter (" .. u25 .. ")",
            Parent = u19
        });
        u19.AncestryChanged:Connect(function(p27, p28) -- Line: 175
            -- upvalues: u20 (copy)
            if p28 == nil then
                u20:DoCleaning();
            end;
        end);
        local u43 = EntityDamageEventZap.On(function(p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, p41, p42) -- Line: 180
            -- upvalues: Players (ref), u26 (copy)
            if p29 == Players.LocalPlayer.Character then
                u26:InputHoldEnd();
            end;
        end);
        u20:GiveTask(function() -- Line: 185
            -- upvalues: u43 (copy)
            u43();
        end);
        u26.PromptButtonHoldBegan:Connect(function(p44) -- Line: 188
            -- upvalues: u24 (copy), InventoryUtil (ref), VoidWorldUtil (ref), u26 (copy), Flamework (ref), u25 (copy), u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref)
            if not (u24 or InventoryUtil.hasEnough(p44, VoidWorldUtil.VOID_ENTRY_MATERIAL, VoidWorldUtil.VOID_ENTRY_COST)) then
                u26:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You need " .. u25 .. " to enter the Void."
                });

                return nil;
            end;

            local u45 = u3.new();
            local u46 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OPEN_CRATE);
            u45:GiveTask(function() -- Line: 198
                -- upvalues: u46 (copy)
                local v47 = u46;

                if v47 ~= nil then
                    v47:Stop();
                end;

                local v48 = u46;

                if v48 ~= nil then
                    v48:Destroy();
                end;
            end);
            u26.PromptButtonHoldEnded:Connect(function() -- Line: 208
                -- upvalues: u45 (copy)
                u45:DoCleaning();
            end);
            u26.AncestryChanged:Connect(function(p49, p50) -- Line: 211
                -- upvalues: u45 (copy)
                if p50 == nil then
                    u45:DoCleaning();
                end;
            end);
        end);
        u26.Triggered:Connect(function(p51) -- Line: 217
            -- upvalues: SoundManager (ref), GameSound (ref), default2 (ref), u19 (copy)
            SoundManager:playSound(GameSound.VOID_PORTAL_TELEPORT);
            default2.Client:Get("UseVoidPortal"):SendToServer({
                blockInstance = u19
            });
        end);
    end);
    default2.Client:WaitFor("VoidPortalUsed"):andThen(function(p52) -- Line: 225
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
        p52:Connect(function(p53) -- Line: 226
            -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
            if p53.player == Players.LocalPlayer then
                return nil;
            end;

            SoundManager:playSound(GameSound.VOID_PORTAL_TELEPORT, {
                rollOffMaxDistance = 80,
                position = p53.portal.Position
            });
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;