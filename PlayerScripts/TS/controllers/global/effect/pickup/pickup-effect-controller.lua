-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "PickupEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PickupEffectController";
end;

function u3.KnitStart(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.playEffect(p7, u8, u9) -- Line: 31
    -- upvalues: Players (copy), u1 (copy), RunService (copy), Workspace (copy)
    if u9 == nil then
        u9 = Players.LocalPlayer.Character;
    end;

    local u10 = u1.new();
    local CFrame2 = u8.CFrame;
    local v11 = math.random() * 3.141592653589793 * 2;
    local v12 = math.cos(v11);
    local v13 = math.sin(v11);
    local u14 = Vector3.new(v12, 0, v13) * 3;
    local v15 = u9;

    if v15 ~= nil then
        v15 = v15.PrimaryPart;
    end;

    if not v15 then
        return nil;
    end;

    local u16 = u9:GetPrimaryPartCFrame();
    local u17 = 0;
    u10:GiveTask(RunService.Heartbeat:Connect(function(p18) -- Line: 52
        -- upvalues: u9 (ref), u10 (copy), u16 (ref), Workspace (ref), u17 (ref), u14 (copy), CFrame2 (copy), u8 (copy)
        local v19 = u9;

        if v19 ~= nil then
            v19 = v19.PrimaryPart;

            if v19 ~= nil then
                v19 = v19.CFrame;
            end;
        end;

        if not v19 then
            u10:DoCleaning();

            return nil;
        end;

        local v20 = p18 * 80;
        local Magnitude = (u16.Position - v19.Position).Magnitude;
        local v21 = v20 / Magnitude;

        if Magnitude > 20 then
            v21 = (Magnitude - 20 + v20) / Magnitude;
        end;

        u16 = u16:Lerp(v19, (math.clamp(v21, 0, 1)));
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u10:DoCleaning();

            return nil;
        end;

        local function _(p22) -- Line: 84
            -- upvalues: CurrentCamera (copy)
            local LookVector = CFrame.new(p22, CurrentCamera.Position).LookVector;
            local v23 = Vector3.new(LookVector.X, 0, LookVector.Z);

            return CFrame.new(Vector3.new(0, 0, 0), (v23.Magnitude == 0 and Vector3.new(1, 0, 0) or v23).Unit);
        end;

        u17 = u17 + p18;
        local u24 = 0;

        local function _(p25) -- Line: 96
            -- upvalues: u17 (ref), u24 (ref)
            return (u17 - (u24 - p25)) / p25;
        end;

        u24 = u24 + 0.14;

        if u17 < u24 then
            local v26 = v19 + (u14 + Vector3.new(0, 8, 0));
            local v27 = CFrame.new(v26.Position);
            local LookVector = CFrame.new(v26.Position, CurrentCamera.Position).LookVector;
            local v28 = Vector3.new(LookVector.X, 0, LookVector.Z);
            u8.CFrame = CFrame2:Lerp(v27 * CFrame.new(Vector3.new(0, 0, 0), (v28.Magnitude == 0 and Vector3.new(1, 0, 0) or v28).Unit), (math.pow((u17 - (u24 - 0.14)) / 0.14, 0.4)));
        else
            u24 = u24 + 0.12;

            if u17 < u24 then
                local v29 = (u14 + Vector3.new(0, 8, 0)):Lerp(u14 + Vector3.new(0, 6, 0), (math.pow((u17 - (u24 - 0.12)) / 0.12, 0.25)));
                u8.CFrame = CFrame.new(v29 + u16.Position);
            else
                u24 = u24 + 0.08;

                if u17 < u24 then
                    u8.CFrame = CFrame.new(u14 + Vector3.new(0, 6, 0) + u16.Position);
                else
                    u24 = u24 + 0.06;

                    if u17 >= u24 then
                        u10:DoCleaning();

                        return nil;
                    end;

                    local v30 = (u17 - (u24 - 0.06)) / 0.06;
                    local v31 = (u14 + Vector3.new(0, 6, 0)):Lerp(u14 + Vector3.new(0, 3, 0), v30);
                    u8.CFrame = CFrame.new(v31 + u16.Position);
                    u8.Size = u8.Size:Lerp(Vector3.new(0, 0, 0), v30);
                end;
            end;
        end;
    end));

    return u10;
end;

KnitClient.CreateController(u3.new());

return nil;