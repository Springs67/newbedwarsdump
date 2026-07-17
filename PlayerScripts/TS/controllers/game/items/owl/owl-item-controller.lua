-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local OwlBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "OwlTargetController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "OwlTargetController";
    p6.maid = u1.new();
end;

function u4.KnitStart(u7) -- Line: 41
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), default (copy), ClientStore (copy), InventoryUtil (copy)
    HandKnitController.KnitStart(u7);
    ClientSyncEvents.AbilityUsed:connect(function(p8) -- Line: 43
        -- upvalues: Players (ref), AbilityId (ref), u7 (copy), default (ref), ClientStore (ref), InventoryUtil (ref)
        if p8.userCharacter == Players.LocalPlayer.Character and (p8.ability == AbilityId.SUMMON_OWL and u7.target) then
            local v9 = Players:GetPlayerFromCharacter(u7.target);

            if not v9 then
                return nil;
            end;

            if default.Client:Get("SummonOwl"):CallServer(v9) then
                ClientStore:dispatch({
                    type = "UnequipItemInHand",
                    equip = false
                });
                local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

                if hand ~= nil then
                    hand = hand.itemType;
                end;

                if hand then
                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        local v10 = Character:WaitForChild(hand, 3);

                        if v10 ~= nil then
                            v10:Destroy();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;

function u4.isRelevantItem(p11, p12) -- Line: 73
    -- upvalues: ItemType (copy)
    return p12.itemType == ItemType.OWL_ORB;
end;

function u4.onEnable(u13, p14, p15) -- Line: 76
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ContextActionService (copy), RunService (copy), Workspace (copy), EntityUtil (copy), Players (copy), OwlBalance (copy), u2 (copy)
    u13:setupYield(function() -- Line: 77
        -- upvalues: u13 (copy), Flamework (ref), AbilityId (ref), BedwarsImageId (ref)
        u13.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SUMMON_OWL, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.OWL_IMAGE
            }
        }):expect());

        return function() -- Line: 84
            -- upvalues: u13 (ref)
            u13.maid:DoCleaning();
        end;
    end);
    ContextActionService:BindAction("Use Owl", function(p16, p17, p18) -- Line: 88
        -- upvalues: Flamework (ref), AbilityId (ref)
        if p17 == Enum.UserInputState.Cancel then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SUMMON_OWL);
    end, false, Enum.UserInputType.MouseButton1);
    u13.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 94
        -- upvalues: Workspace (ref), u13 (copy), EntityUtil (ref), Players (ref), OwlBalance (ref), u2 (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u13:removeTarget();

            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            u13:removeTarget();

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            return nil;
        end;

        local v19 = u13:getPotentialTargetTeammates(Character, OwlBalance.OWL_ATTACH_MAX_RANGE);
        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local v20 = (1 / 0);
        local v21 = nil;

        for _, v in v19 do
            local Position = v:getInstance():GetPrimaryPartCFrame().Position;
            local v22 = Unit:ClosestPoint(Position);
            local Magnitude = (Position - v22).Magnitude;

            if Magnitude <= 60 then
                local v23 = Magnitude + (Unit.Origin - v22).Magnitude / 3;

                if v23 < v20 then
                    v21 = v:getInstance();
                    v20 = v23;
                end;
            end;
        end;

        if u13.target ~= v21 then
            u13:removeTarget();

            if v21 then
                local v24 = Color3.fromRGB(0, 133, 255);
                u13.targetIcon = u2("BillboardGui", {
                    StudsOffset = Vector3.new(0, 7, 0),
                    AlwaysOnTop = true,
                    Parent = v21.PrimaryPart,
                    Size = UDim2.fromOffset(40, 40),
                    Children = { u2("ImageLabel", {
                            Image = "rbxassetid://9429977101",
                            BackgroundTransparency = 1,
                            ImageTransparency = 0,
                            Size = UDim2.fromScale(1, 1),
                            ScaleType = Enum.ScaleType.Fit,
                            ImageColor3 = v24
                        }) }
                });
            end;
        end;

        u13.target = v21;
    end));
end;

function u4.onDisable(p25) -- Line: 165
    -- upvalues: ContextActionService (copy)
    p25:removeTarget();
    p25.maid:DoCleaning();
    ContextActionService:UnbindAction("Use Owl");
end;

function u4.removeTarget(p26) -- Line: 170
    p26.target = nil;
    local targetIcon = p26.targetIcon;

    if targetIcon ~= nil then
        targetIcon:Destroy();
    end;
end;

function u4.getPotentialTargetTeammates(p27, p28, p29) -- Line: 177
    -- upvalues: Players (copy), OwlBalance (copy), EntityUtil (copy)
    local v30 = {};

    for _, v in Players:GetPlayers() do
        local Character = v.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local v31 = Character and (v.Character.PrimaryPart.Position - p28).Magnitude < OwlBalance.OWL_ATTACH_MAX_RANGE;

        if v31 then
            if v.Team == Players.LocalPlayer.Team then
                v31 = v ~= Players.LocalPlayer;
            else
                v31 = false;
            end;

            if v31 then
                local v32 = v:GetAttribute("IsOwlTarget");

                if v32 == 0 or v32 ~= v32 then
                    v32 = false;
                elseif v32 == "" then
                    v32 = false;
                end;

                v31 = not v32;
            end;
        end;

        if v31 then
            local v33 = EntityUtil:getEntity(v);

            if v33 then
                table.insert(v30, v33);
            end;
        end;
    end;

    return v30;
end;

KnitClient.CreateController(u4.new());

return nil;