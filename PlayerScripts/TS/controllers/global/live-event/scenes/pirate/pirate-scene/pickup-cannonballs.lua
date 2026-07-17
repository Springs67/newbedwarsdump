-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local create = u1.create;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    PickupCannonballs = {
        name = "pickup cannonballs",
        event = "Heartbeat",

        func = function(p3, p4, p5) -- Line: 16, Name: func
            -- upvalues: PirateSceneTimestamps (copy), CollectionService (copy), u1 (copy), create (copy), Players (copy), default (copy), ClientStore (copy), ItemType (copy)
            if p3.elapsedEventTime < PirateSceneTimestamps.ShipReappears then
                return nil;
            end;

            for _, v in CollectionService:GetTagged("CannonballSource") do
                if v:IsA("Model") and v.PrimaryPart then
                    u1.portal(v.PrimaryPart, function() -- Line: 22
                        -- upvalues: u1 (ref), create (ref), Players (ref), default (ref), v (copy)
                        u1.useInstance(function(p6) -- Line: 23
                            -- upvalues: create (ref), Players (ref), default (ref), v (ref)
                            local v8 = create("ProximityPrompt", {
                                ActionText = "Collect",
                                ObjectText = "",
                                HoldDuration = 1,
                                RequiresLineOfSight = false,
                                Enabled = true,
                                MaxActivationDistance = 8,

                                Triggered = function(p7) -- Line: 31, Name: Triggered
                                    -- upvalues: Players (ref), default (ref), v (ref)
                                    if p7 == Players.LocalPlayer then
                                        default.Client:GetNamespace("PirateSceneRemotes"):Get("PickupCannonball"):SendToServer({
                                            model = v
                                        });
                                    end;
                                end
                            });
                            p6.instance = v8;

                            return v8;
                        end);
                    end);
                end;
            end;

            local hand = ClientStore:getState().Inventory.observedInventory.inventory.hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            if hand == ItemType.CANNON_BALL then
                for _, v in CollectionService:GetTagged("LobbyCannon") do
                    if v:IsA("Model") and v.PrimaryPart then
                        u1.portal(v.PrimaryPart, function() -- Line: 53
                            -- upvalues: u1 (ref), create (ref), Players (ref), default (ref), v (copy)
                            u1.useInstance(function(p9) -- Line: 54
                                -- upvalues: create (ref), Players (ref), default (ref), v (ref)
                                local v11 = create("ProximityPrompt", {
                                    ActionText = "Insert",
                                    ObjectText = "",
                                    HoldDuration = 1,
                                    RequiresLineOfSight = false,
                                    Enabled = true,
                                    MaxActivationDistance = 8,

                                    Triggered = function(p10) -- Line: 62, Name: Triggered
                                        -- upvalues: Players (ref), default (ref), v (ref)
                                        if p10 == Players.LocalPlayer then
                                            default.Client:GetNamespace("PirateSceneRemotes"):Get("InsertCannonball"):SendToServer({
                                                cannon = v
                                            });
                                        end;
                                    end
                                });
                                p9.instance = v11;

                                return v11;
                            end);
                        end);
                    end;
                end;
            end;
        end
    }
};