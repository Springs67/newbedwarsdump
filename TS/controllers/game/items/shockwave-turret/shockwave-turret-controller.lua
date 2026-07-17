-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "ShockwaveTurretController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ShockwaveTurretController";
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("shockWaveRelease"):Connect(function(p5) -- Line: 27
        -- upvalues: u4 (copy)
        u4:playEffect(p5.turret);
        u4:clear(p5.turret);
        u4:chargeUp(p5.turret);
    end);
end;

function u1.playEffect(p6, p7) -- Line: 33
    local ShockWave = p7:WaitForChild("ShockWave", 3);

    if ShockWave then
        local function _(p8) -- Line: 37
            if p8:IsA("ParticleEmitter") then
                p8:Emit(1);
            end;
        end;

        for i, descendant in ShockWave:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(1);
            end;
        end;
    end;
end;

u1.chargeUp = RuntimeLib.async(function(p9, p10) -- Line: 47
    -- upvalues: ItemType (copy)
    if p10.Name == ItemType.SHOCK_WAVE_TURRET then
        local Circle = p10:WaitForChild("Circle", 3);

        if Circle == nil then
            return nil;
        end;

        local v11 = false;
        local v12 = 0;

        while true do
            if true then
                if v11 then
                    v12 = v12 + 1;
                else
                    v11 = true;
                end;
            end;

            if v12 >= 5 then
                break;
            end;

            task.wait(0.9);
            local v13 = Circle:WaitForChild("Circle" .. tostring(v12), 3);

            if v13 then
                v13.Color = Color3.fromRGB(0, 255, 0);
            end;
        end;
    end;
end);

function u1.clear(p14, p15) -- Line: 74
    -- upvalues: ItemType (copy)
    if p15.Name == ItemType.SHOCK_WAVE_TURRET then
        local Circle = p15:WaitForChild("Circle", 3);

        if Circle ~= nil then
            Circle = Circle:GetChildren();
        end;

        if Circle == nil then
            return nil;
        end;

        for _, v in Circle do
            v.Color = Color3.fromRGB(77, 77, 77);
        end;
    end;
end;

KnitClient.CreateController(u1.new());

return nil;