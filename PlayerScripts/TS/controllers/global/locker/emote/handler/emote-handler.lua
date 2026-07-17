-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;

return {
    EmoteHandler = {
        constructor = function(p5) -- Line: 19, Name: constructor
            p5.maidMap = {};
        end,

        enable = function(p6, p7, p8, p9) -- Line: 22, Name: enable
            -- upvalues: u3 (copy)
            local v10 = u3.new();
            p6:cleanMaid(p7);

            if not p8.PrimaryPart then
                return nil;
            end;

            p6:onEnable(p7, p8, p9, v10);
            p6.maidMap[p7] = v10;
        end,

        disable = function(p11, p12, p13, p14) -- Line: 33, Name: disable
            p11:cleanMaid(p12);

            if not p13.PrimaryPart then
                return nil;
            end;

            p11:onDisable(p12, p13, p14);
        end,

        cleanMaid = function(p15, p16) -- Line: 40, Name: cleanMaid
            if p15.maidMap[p16] == nil then
                return false;
            end;

            local v17 = p15.maidMap[p16];

            if v17 ~= nil then
                v17:DoCleaning();
            end;

            p15.maidMap[p16] = nil;

            return true;
        end,

        playSound = function(p18, p19, p20, p21) -- Line: 57, Name: playSound
            -- upvalues: ClientStore (copy), SoundManager (copy)
            local emote_volume = ClientStore:getState().Settings.emote_volume;
            local v22 = {};

            for i, v in p21 do
                v22[i] = v;
            end;

            local volumeMultiplier = p21.volumeMultiplier;
            v22.volumeMultiplier = emote_volume * ((volumeMultiplier == 0 or (volumeMultiplier ~= volumeMultiplier or not volumeMultiplier)) and 1 or volumeMultiplier);
            local v23;

            if p18:isPreview(p20) then
                v23 = nil;
            else
                v23 = p21.position;
            end;

            v22.position = v23;

            return SoundManager:playSound(p19, v22);
        end,

        isPreview = function(p24, p25) -- Line: 75, Name: isPreview
            return p25 == -1;
        end,

        setupInstance = function(p26, p27) -- Line: 78, Name: setupInstance
            -- upvalues: GameQueryUtil (copy)
            GameQueryUtil:setQueryIgnored(p27, true);
            p27:SetAttribute("DisableInPlayerViewport", true);

            local function _(p28) -- Line: 82
                -- upvalues: GameQueryUtil (ref)
                if p28:IsA("BasePart") then
                    GameQueryUtil:setQueryIgnored(p28, true);
                    p28:SetAttribute("DisableInPlayerViewport", true);
                end;
            end;

            for i, descendant in p27:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    GameQueryUtil:setQueryIgnored(descendant, true);
                    descendant:SetAttribute("DisableInPlayerViewport", true);
                end;
            end;
        end,

        watchEmoteAnimation = function(p29, u30, p31, u32, u33) -- Line: 92, Name: watchEmoteAnimation
            -- upvalues: GameAnimationUtil (copy), WatchCharacterAnimation (copy)
            if u30 == -1 then
                return p31.Humanoid.Animator.AnimationPlayed:Connect(function(p34) -- Line: 97
                    -- upvalues: GameAnimationUtil (ref), u32 (copy), u33 (copy)
                    local Animation = p34.Animation;

                    if Animation ~= nil then
                        Animation = Animation.AnimationId;
                    end;

                    if Animation ~= GameAnimationUtil:getAssetId(u32) then
                        return nil;
                    end;

                    u33(p34);
                end);
            end;

            return WatchCharacterAnimation({ GameAnimationUtil:getAssetId(u32) }, function(p35, p36) -- Line: 109
                -- upvalues: u30 (copy), u33 (copy)
                if p35.UserId ~= u30 then
                    return nil;
                end;

                u33(p36);
            end);
        end,

        handleRightHandItemWithEmote = function(p37, p38, p39, p40, p41, p42) -- Line: 118, Name: handleRightHandItemWithEmote
            -- upvalues: u3 (copy), Players (copy), u2 (copy), ReplicatedStorage (copy), InventoryUtil (copy), ItemUtil (copy)
            local v43 = u3.new();
            local u44 = Players:GetPlayerByUserId(p38);
            u2.Controllers.ViewmodelController:setHeldItem(nil);
            local v45 = p40(u44);

            if not v45 then
                return v43;
            end;

            local Items = ReplicatedStorage:FindFirstChild("Items");

            if Items ~= nil then
                Items = Items:FindFirstChild(v45);
            end;

            if Items == nil or not Items:IsA("Accessory") then
                return v43;
            end;

            local v46 = Items:Clone();

            local function _(p47) -- Line: 139
                if p47:IsA("BasePart") then
                    p47.CanCollide = false;
                end;
            end;

            for i, descendant in v46:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false;
                end;
            end;

            v46.Parent = p39;
            local Handle = v46:WaitForChild("Handle");

            if Handle ~= nil then
                local RightGripAttachment = Handle:FindFirstChild("RightGripAttachment");

                if RightGripAttachment ~= nil then
                    RightGripAttachment:Destroy();
                end;
            end;

            local Handle2 = v46:WaitForChild("Handle");

            if Handle2 == nil then
                return v43;
            end;

            local u48 = Handle2:Clone();
            u48.Parent = p39;

            if p42 ~= nil then
                p42 = p42.name;
            end;

            u48.Name = p42 == nil and "item" or p42;
            u48:SetAttribute("DisableInPlayerViewport", true);
            v46:Destroy();
            local u49 = p41(u48, v45);
            v43:GiveTask(function() -- Line: 175
                -- upvalues: u48 (ref), u49 (copy), u44 (copy), Players (ref), InventoryUtil (ref), ItemUtil (ref), u2 (ref)
                u48:Destroy();
                u49:Destroy();

                if u44 == Players.LocalPlayer then
                    local hand = InventoryUtil.getInventory(u44).hand;

                    if hand ~= nil then
                        hand = hand.itemType;
                    end;

                    if not hand then
                        return nil;
                    end;

                    local v50 = ItemUtil.createItemInstance(hand);
                    u2.Controllers.ViewmodelController:setHeldItem(v50);
                end;
            end);

            return v43;
        end,

        handleLeftHandItemWithEmote = function(p51, p52, p53, p54, p55, p56) -- Line: 194, Name: handleLeftHandItemWithEmote
            -- upvalues: u3 (copy), Players (copy), u2 (copy), ReplicatedStorage (copy), InventoryUtil (copy), ItemUtil (copy)
            local v57 = u3.new();
            local u58 = Players:GetPlayerByUserId(p52);
            u2.Controllers.ViewmodelController:setHeldItem(nil);
            local v59 = p54(u58);

            if not v59 then
                return v57;
            end;

            local Items = ReplicatedStorage:FindFirstChild("Items");

            if Items ~= nil then
                Items = Items:FindFirstChild(v59);
            end;

            if Items == nil or not Items:IsA("Accessory") then
                return v57;
            end;

            local v60 = Items:Clone();

            local function _(p61) -- Line: 215
                if p61:IsA("BasePart") then
                    p61.CanCollide = false;
                end;
            end;

            for i, descendant in v60:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false;
                end;
            end;

            v60.Parent = p53;
            local Handle = v60:WaitForChild("Handle");

            if Handle ~= nil then
                local LeftGripAttachment = Handle:FindFirstChild("LeftGripAttachment");

                if LeftGripAttachment ~= nil then
                    LeftGripAttachment:Destroy();
                end;
            end;

            local Handle2 = v60:WaitForChild("Handle");

            if Handle2 == nil then
                return v57;
            end;

            local u62 = Handle2:Clone();
            u62.Parent = p53;

            if p56 ~= nil then
                p56 = p56.name;
            end;

            u62.Name = p56 == nil and "item" or p56;
            u62:SetAttribute("DisableInPlayerViewport", true);
            v60:Destroy();
            local u63 = p55(u62, v59);
            v57:GiveTask(function() -- Line: 251
                -- upvalues: u62 (ref), u63 (copy), u58 (copy), Players (ref), InventoryUtil (ref), ItemUtil (ref), u2 (ref)
                u62:Destroy();
                u63:Destroy();

                if u58 == Players.LocalPlayer then
                    local hand = InventoryUtil.getInventory(u58).hand;

                    if hand ~= nil then
                        hand = hand.itemType;
                    end;

                    if not hand then
                        return nil;
                    end;

                    local v64 = ItemUtil.createItemInstance(hand);
                    u2.Controllers.ViewmodelController:setHeldItem(v64);
                end;
            end);

            return v57;
        end
    }
};