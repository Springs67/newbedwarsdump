-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BatteryController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy)
    BaseKitController.constructor(p5, BedwarsKit.BATTERY);
    p5.Name = "BatteryController";
    p5.maid = u1.new();
end;

function u3.onKitLocalActivated(p6, p7) -- Line: 31
    -- upvalues: RunService (copy), Players (copy), Workspace (copy), KnitClient (copy), default (copy)
    p7:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 32
        -- upvalues: Players (ref), Workspace (ref), KnitClient (ref), default (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        local v8 = OverlapParams.new();
        v8.MaxParts = 0;

        for _, v in Workspace:GetPartBoundsInRadius(Players.LocalPlayer.Character:GetPivot().Position, 6, v8) do
            if v:IsA("BasePart") then
                local v9 = KnitClient.Controllers.BatteryEffectsController:getBatteryIdFromPart(v);

                if v9 ~= 0 and (v9 == v9 and v9) then
                    local v10 = KnitClient.Controllers.BatteryEffectsController:getBatteryInfo(v9);

                    if v10 and (v10.activateTime < Workspace:GetServerTimeNow() and v10.consumeTime + 0.5 < Workspace:GetServerTimeNow()) then
                        v10.consumeTime = Workspace:GetServerTimeNow();
                        default.Client:Get("ConsumeBattery"):SendToServer({
                            batteryId = v9
                        });

                        return;
                    end;
                end;
            end;
        end;
    end));
end;

function u3.onKitLocalDeactivated(p11) -- Line: 62
end;

function u3.onKitReplicationActivated(p12, p13) -- Line: 64
end;

function u3.onKitReplicationDeactivated(p14) -- Line: 66
end;

function u3.onInnateAbilityEnabled(p15, p16, p17) -- Line: 68
end;

function u3.onAbilityUsed(p18, p19, p20) -- Line: 70
end;

KnitClient.CreateController(u3.new());

return nil;