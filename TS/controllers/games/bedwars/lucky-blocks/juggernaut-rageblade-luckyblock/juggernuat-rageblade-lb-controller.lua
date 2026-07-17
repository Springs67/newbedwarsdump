-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "JuggernuatRagebladeLuckyBlockController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "JuggernuatRagebladeLbController";
    p5.swordMap = {};
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), DeviceUtil (copy), Players (copy), EntityUtil (copy), Flamework (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("SpawnLuckyBlockJuggnautSword"):Connect(function(p7) -- Line: 36
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u6 (copy), KnitClient2 (ref), DeviceUtil (ref), Players (ref), EntityUtil (ref), Flamework (ref)
        local u8 = ReplicatedStorage.Assets.Effects.JuggernautRageBlade:Clone();
        u8.Parent = Workspace;

        local function _(p9) -- Line: 41
            if p9:IsA("Sound") then
                p9:Play();
            end;
        end;

        for i, descendant in u8:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Sound") then
                descendant:Play();
            end;
        end;

        if u8 then
            local PrimaryPart = u8.PrimaryPart;

            if not PrimaryPart then
                return nil;
            end;

            u6.swordMap[p7.secret] = u8;
            u8:SetAttribute("Secret", p7.secret);
            p7.position = p7.position - Vector3.new(0, 1, 0);
            u8:PivotTo(CFrame.new(p7.position));
            local u10 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                ActionText = "Pick Up",
                ObjectText = "This Will Cost You Everything",
                HoldDuration = 3,
                RequiresLineOfSight = false,
                MaxActivationDistance = 5,
                Parent = PrimaryPart,
                ClickablePrompt = DeviceUtil.isMobileControls()
            });
            u10.Triggered:Connect(function(p11) -- Line: 72
                -- upvalues: Players (ref), EntityUtil (ref), u6 (ref), u8 (copy), u10 (copy), Flamework (ref)
                if p11 == Players.LocalPlayer then
                    local v12 = EntityUtil:getEntity(p11);

                    if v12 ~= nil then
                        v12 = v12:isAlive();
                    end;

                    if not v12 then
                        return nil;
                    end;

                    if u6:useSword(u8) then
                        u10:Destroy();
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            message = "You are now the Juggernaut!"
                        });

                        return;
                    end;

                    u10:Destroy();
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "You are late! Somebody else has took the sword!"
                    });
                end;
            end);
        end;
    end);
    default.Client:Get("UseJuggernautSword"):Connect(function(p13) -- Line: 100
        -- upvalues: u6 (copy)
        local v14 = u6.swordMap[p13.secret];

        if v14 then
            u6.swordMap[p13.secret] = nil;
            v14:Destroy();
        end;
    end);
end;

function u3.useSword(p15, p16) -- Line: 112
    -- upvalues: default (copy)
    local v17 = p16:GetAttribute("Secret");

    return default.Client:Get("UseLuckyBlockJuggSword"):CallServer({
        secret = v17
    });
end;

KnitClient.CreateController(u3.new());

return nil;