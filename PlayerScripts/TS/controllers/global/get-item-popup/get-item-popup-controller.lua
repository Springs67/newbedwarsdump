-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "GetItemPopupController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "GetItemPopupController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("GetItemPopupServerToClient"):Connect(function(p6) -- Line: 33
        -- upvalues: u5 (copy)
        u5:createPopup(p6.player, p6.itemPart, p6.offset);
    end);
end;

function u2.createPopup(p7, p8, p9, p10) -- Line: 37
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), WeldUtil (copy), RunService (copy), CFrameUtil (copy)
    local Character = p8.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    task.spawn(function() -- Line: 47
        -- upvalues: SoundManager (ref), GameSound (ref), Character (copy)
        local COIN_FOUNTAIN_2 = GameSound.COIN_FOUNTAIN_2;
        local v11 = {};
        local v12 = Character;

        if v12 ~= nil then
            v12 = v12.Position;
        end;

        v11.position = v12;
        v11.volumeMultiplier = 2;
        SoundManager:playSound(COIN_FOUNTAIN_2, v11);
        task.wait(0.1);
        local COIN_FOUNTAIN_1 = GameSound.COIN_FOUNTAIN_1;
        local v13 = {};
        local v14 = Character;

        if v14 ~= nil then
            v14 = v14.Position;
        end;

        v13.position = v14;
        v13.volumeMultiplier = 2;
        SoundManager:playSound(COIN_FOUNTAIN_1, v13);
    end);
    local u15 = ReplicatedStorage.Assets.Misc.GetItemPopup:Clone();
    u15.Parent = Character;
    local v16 = p9:Clone();
    v16:PivotTo(u15.Pivot.SpinPivot.CFrame);
    v16.Parent = u15.Pivot.SpinPivot;
    WeldUtil:weldParts(v16, u15.Pivot.SpinPivot);

    local function _(p17) -- Line: 81
        local v18 = p17:IsA("BasePart") and p17.Transparency ~= 1;

        return v18;
    end;

    local v19 = 0;
    local u20 = {};

    for i, descendant in v16:GetDescendants() do
        local _ = i - 1;
        local v21 = descendant:IsA("BasePart") and descendant.Transparency ~= 1;

        if v21 == true then
            v19 = v19 + 1;
            u20[v19] = descendant;
        end;
    end;

    table.insert(u20, v16);
    local u22 = p10 or Vector3.new(0, 4, 0);
    u15:PivotTo(CFrame.new(Character.Position + u22));
    local SpinPivot = u15.Pivot.SpinPivot;
    local u23 = 0;
    local u24 = nil;
    u24 = RunService.Heartbeat:Connect(function(p25) -- Line: 108
        -- upvalues: u23 (ref), CFrameUtil (ref), SpinPivot (copy), Character (copy), u22 (ref), u15 (copy), u24 (ref), u20 (copy)
        u23 = u23 + p25;
        CFrameUtil.rotateLocalDegrees(SpinPivot, Vector3.new(0, 1, 0) * (100 * p25));
        CFrameUtil.setPosition(u15, Character.Position + u22);

        if u23 > 1 then
            local u26 = u23 - 1;

            if u26 >= 1 then
                u15:Destroy();

                if u24 then
                    u24:Disconnect();
                end;
            else
                local function _(p27) -- Line: 129
                    -- upvalues: u26 (copy)
                    p27.Transparency = u26;
                end;

                for i, v in u20 do
                    local _ = i - 1;
                    v.Transparency = u26;
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;