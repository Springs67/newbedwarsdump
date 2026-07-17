-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuint = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuint;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "YuziSkinController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.DASHER);
    p4.Name = "YuziSkinController";
    p4.spinMotorCache = {};
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p5);
end;

function u2.onKitLocalActivated(p6, p7) -- Line: 35
end;

function u2.onKitLocalDeactivated(p8) -- Line: 37
end;

function u2.onKitReplicationActivated(u9, p10) -- Line: 39
    -- upvalues: WatchCharacter (copy), KnitClient (copy), isUsingKit (copy), BedwarsKit (copy), BedwarsKitSkin (copy)
    p10:GiveTask(WatchCharacter(function(p11, u12, u13) -- Line: 40
        -- upvalues: KnitClient (ref), isUsingKit (ref), BedwarsKit (ref), BedwarsKitSkin (ref), u9 (copy)
        local v14 = KnitClient.Controllers.KitController:getKitSkin(u12);

        if isUsingKit(p11, BedwarsKit.DASHER) then
            return nil;
        end;

        local function u16(p15) -- Line: 45
            -- upvalues: BedwarsKitSkin (ref), u13 (copy), u9 (ref), u12 (copy)
            if p15 ~= BedwarsKitSkin.DASHER_CURSED then
                return false;
            end;

            u13:GiveTask(u9:applyVoodooSkinEffect(u12));

            return true;
        end;

        if not u16(v14) then
            u13:GiveTask(u12:GetAttributeChangedSignal("KitSkin"):Connect(function() -- Line: 59
                -- upvalues: KnitClient (ref), u12 (copy), u16 (copy)
                u16((KnitClient.Controllers.KitController:getKitSkin(u12)));
            end));
        end;
    end));
end;

function u2.onKitReplicationDeactivated(p17) -- Line: 66
end;

function u2.onInnateAbilityEnabled(p18, p19, p20) -- Line: 68
end;

function u2.onAbilityUsed(p21, p22, p23) -- Line: 70
end;

function u2.applyVoodooSkinEffect(p24, p25) -- Line: 72
    -- upvalues: u1 (copy), default (copy), InQuint (copy), RunService (copy)
    local v26 = u1.new();
    local u27 = p24:getSpinMotor(p25);

    if u27 then
        local function _() -- Line: 77
            -- upvalues: default (ref), InQuint (ref), u27 (copy)
            default(0.2, InQuint, function(p28) -- Line: 78
                -- upvalues: u27 (ref)
                u27.C0 = u27.C0 * CFrame.Angles(0, 0, (math.rad(p28)));
            end, 0, 3);
        end;

        local u29 = 0;
        v26:GiveTask(RunService.Heartbeat:Connect(function(p30) -- Line: 86
            -- upvalues: u29 (ref), default (ref), InQuint (ref), u27 (copy)
            if u29 > 1 then
                default(0.2, InQuint, function(p31) -- Line: 78
                    -- upvalues: u27 (ref)
                    u27.C0 = u27.C0 * CFrame.Angles(0, 0, (math.rad(p31)));
                end, 0, 3);
                u29 = 0;
            end;

            u29 = u29 + p30;
        end));
    end;

    return v26;
end;

function u2.windUpMotor(p32, p33) -- Line: 96
    -- upvalues: default (copy), InQuint (copy)
    local u34 = p32:getSpinMotor(p33);

    if not u34 then
        return nil;
    end;

    default(0.45, InQuint, function(p35) -- Line: 101
        -- upvalues: u34 (copy)
        u34.C0 = u34.C0 * CFrame.Angles(0, 0, (math.rad(p35)));
    end, 0, 1440);
end;

function u2.getSpinMotor(u36, u37) -- Line: 107
    if u36.spinMotorCache[u37] ~= nil then
        local v38 = u36.spinMotorCache[u37];

        if v38 ~= nil then
            v38 = v38.motor;
        end;

        return v38;
    end;

    local u39 = nil;
    u39 = u37.AncestryChanged:Connect(function() -- Line: 121
        -- upvalues: u37 (copy), u39 (ref), u36 (copy)
        if not u37.Parent then
            u39:Disconnect();
            u36.spinMotorCache[u37] = nil;
        end;
    end);
    local v40 = u37:WaitForChild("3DClothing", 3);

    if v40 ~= nil then
        v40 = v40:WaitForChild("Spin", 3);
    end;

    local v41 = u37:WaitForChild("3DClothing", 3);

    if v41 ~= nil then
        v41 = v41:WaitForChild("Welding", 3);

        if v41 ~= nil then
            v41 = v41:WaitForChild("Spin->UpperTorso", 3);
        end;
    end;

    if v40 and (v41 and u37:WaitForChild("UpperTorso", 3)) then
        u36.spinMotorCache[u37] = {
            motor = v41
        };

        return v41;
    end;

    u36.spinMotorCache[u37] = {
        motor = nil
    };

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;