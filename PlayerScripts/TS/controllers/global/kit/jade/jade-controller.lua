-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local WatchCharacterAnimation = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v2.Debris;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local JadeBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "jade-balance").JadeBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "JadeController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "JadeController";
end;

function u3.KnitStart(p6) -- Line: 36
    -- upvalues: KnitClient (copy), ItemType (copy), AnimationType (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), JadeBalance (copy), ClientSyncEvents (copy), EntityUtil (copy), BlockEngine (copy), u1 (copy), Workspace (copy), Debris (copy)
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.JADE_HAMMER, {
        animations = { AnimationType.JADE_HAMMER_IDLE, AnimationType.JADE_HAMMER_SLAM }
    });
    local u7 = {};
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.JADE_HAMMER_SLAM) }, function(p8, p9) -- Line: 43
        -- upvalues: JadeBalance (ref), ClientSyncEvents (ref), u7 (copy), EntityUtil (ref), ItemType (ref), BlockEngine (ref), u1 (ref), Workspace (ref), Debris (ref)
        local Character = p8.Character;

        if not Character then
            return nil;
        end;

        local v10 = os.clock();
        local cooldown = ClientSyncEvents.ItemCooldownModifierCheck:fire(JadeBalance.HAMMER_COOLDOWN).cooldown;
        local v11 = u7[Character];

        if v10 - (v11 == nil and 0 or v11) < cooldown * 0.95 then
            return nil;
        end;

        local u12 = EntityUtil:getEntity(p8);

        if u12 ~= nil then
            u12 = u12:getHandItemInstanceFromCharacter();
        end;

        if u12 == nil or u12.Name ~= ItemType.JADE_HAMMER then
            return nil;
        end;

        u7[Character] = v10;

        for _, descendant in u12:GetDescendants() do
            if descendant:IsA("Trail") then
                descendant.Enabled = true;
            end;
        end;

        for _, descendant in Character:GetDescendants() do
            if descendant:IsA("Trail") then
                descendant.Enabled = true;
            end;
        end;

        task.delay(p9.Length, function() -- Line: 77
            -- upvalues: Character (copy), u12 (copy), BlockEngine (ref), u1 (ref), Workspace (ref), Debris (ref)
            if not Character.Parent then
                return nil;
            end;

            for _, descendant in u12:GetDescendants() do
                if descendant:IsA("Trail") then
                    descendant.Enabled = false;
                end;
            end;

            for _, descendant in Character:GetDescendants() do
                if descendant:IsA("Trail") then
                    descendant.Enabled = false;
                end;
            end;

            local Handle = u12:FindFirstChild("Handle");

            if not Handle then
                return nil;
            end;

            local StrikePosition = Handle:FindFirstChild("StrikePosition");

            if not StrikePosition then
                return nil;
            end;

            local v13 = false;
            local v14 = 0;

            while true do
                if v13 then
                    v14 = v14 + 1;
                else
                    v13 = true;
                end;

                if v14 >= 3 then
                    return;
                end;

                local v15 = false;
                local v16 = 0;

                while true do
                    if true then
                        if v15 then
                            v16 = v16 + 1;
                        else
                            v15 = true;
                        end;
                    end;

                    if v16 >= 3 then
                        break;
                    end;

                    local WorldPosition = StrikePosition.WorldPosition;
                    local v17 = Vector3.new(v14 * 3, 0, v16 * 3);
                    local v18 = BlockEngine:getBlockPosition(WorldPosition - Vector3.new(3, 3, 3) + v17);
                    local v19 = BlockEngine:getStore():getBlockAt(v18);

                    if v19 then
                        local Name = v19.Name;
                        local v20 = BlockEngine:getHandlerRegistry():getHandler(Name);

                        if v20 then
                            local v21 = v20:place(v18 + Vector3.new(0, 1, 0), 0);
                            v21.CanCollide = false;
                            v21.Anchored = false;

                            for _, child in v21:GetChildren() do
                                if child:IsA("BasePart") then
                                    child.CanCollide = false;
                                    child.Anchored = false;
                                    u1("WeldConstraint", {
                                        Part0 = child,
                                        Part1 = v21,
                                        Parent = child
                                    });
                                end;
                            end;

                            local Unit = (StrikePosition.WorldPosition - v21.Position).Unit;
                            local v22 = Vector3.new(Unit.X, 0.8, Unit.Y);
                            v21.Parent = Workspace;
                            v21.AssemblyLinearVelocity = v22 * 100;
                            Debris:AddItem(v21, 3);
                        end;
                    end;
                end;
            end;
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;