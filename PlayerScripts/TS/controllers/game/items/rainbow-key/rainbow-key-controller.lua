-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "RainbowKeyController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "RainbowKeyController";
    p5.currentKeyHoldingPlayer = nil;
end;

function u3.KnitStart(u6) -- Line: 31
    -- upvalues: KnitController (copy), default (copy), Players (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("EntityDeathEvent"):Connect(function(p7) -- Line: 33
        -- upvalues: Players (ref), u6 (copy)
        local v8 = Players:GetPlayerFromCharacter(p7.entityInstance);

        if not v8 then
            return nil;
        end;

        local currentKeyHoldingPlayer = u6.currentKeyHoldingPlayer;

        if currentKeyHoldingPlayer ~= nil then
            currentKeyHoldingPlayer = currentKeyHoldingPlayer.UserId;
        end;

        if v8.UserId == currentKeyHoldingPlayer then
            u6:refreshKeyStatus(nil);
        end;
    end);
    default.Client:OnEvent("RainbowKeyHolderUpdated", function(p9) -- Line: 47
        -- upvalues: u6 (copy)
        u6:refreshKeyStatus(p9.updatedKeyHoldingPlayer);
    end);
end;

function u3.refreshKeyStatus(u10, p11) -- Line: 51
    -- upvalues: ReplicatedStorage (copy), EntityUtil (copy), RunService (copy)
    local u12 = ReplicatedStorage.Assets.Effects.RainbowKey:Clone();

    if not u12 then
        return nil;
    end;

    u10.currentKeyHoldingPlayer = p11;

    if u10.currentKeyHoldingPlayer ~= nil then
        local u13 = 0;
        local u14 = EntityUtil:getEntity(u10.currentKeyHoldingPlayer);
        local Character = u10.currentKeyHoldingPlayer.Character;
        u12.Parent = Character;
        u10:highlightKey(u12, true);
        local u15 = nil;
        u15 = RunService.Heartbeat:Connect(function(p16) -- Line: 65
            -- upvalues: u13 (ref), u14 (copy), u10 (copy), u12 (copy), u15 (ref), Character (copy)
            u13 = u13 + p16;

            if u14 ~= nil then
                local v17 = u14:getHealth();

                if v17 == 0 or (v17 ~= v17 or not v17) then
                    u10:highlightKey(u12, false);
                    u12:Destroy();
                    u15:Disconnect();

                    return nil;
                end;

                local currentKeyHoldingPlayer = u10.currentKeyHoldingPlayer;

                if currentKeyHoldingPlayer ~= nil then
                    currentKeyHoldingPlayer = currentKeyHoldingPlayer:GetAttribute("KeyStatus");
                end;

                local v18 = u12.PrimaryPart and Character;

                if v18 then
                    if v17 <= 0 then
                        currentKeyHoldingPlayer = false;
                    end;
                else
                    currentKeyHoldingPlayer = v18;
                end;

                if currentKeyHoldingPlayer ~= 0 and (currentKeyHoldingPlayer == currentKeyHoldingPlayer and (currentKeyHoldingPlayer ~= "" and currentKeyHoldingPlayer)) then
                    local v19 = Character:GetPrimaryPartCFrame().Position + Vector3.new(0, 7, 0);
                    u12:PivotTo(CFrame.new(v19) * CFrame.Angles(0, u13 * 3.141592653589793 / 2, 0));

                    return;
                end;

                u10:highlightKey(u12, false);
                u12:Destroy();
                u15:Disconnect();
            end;
        end);
    end;
end;

function u3.highlightKey(p20, p21, p22) -- Line: 96
    -- upvalues: u1 (copy)
    local v23 = u1("Highlight", {
        FillTransparency = 0.7,
        OutlineTransparency = 0.2,
        Parent = nil,
        FillColor = Color3.fromRGB(255, 237, 0),
        OutlineColor = Color3.fromRGB(255, 255, 255)
    });

    if p22 then
        v23.Parent = p21;
        v23.Enabled = true;

        return;
    end;

    v23.Enabled = false;
    v23:Destroy();
end;

KnitClient.CreateController(u3.new());

return nil;