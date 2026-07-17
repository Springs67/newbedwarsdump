-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = {
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "RainbowBackpackController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "RainbowBackpackController";
    p7.maidMap = {};
    p7.prismsMap = {};
end;

function u5.KnitStart(u8) -- Line: 40
    -- upvalues: KnitController (copy), default (copy), ItemType (copy), KnitClient (copy), Players (copy), u2 (copy), u4 (copy), TweenService (copy), RandomUtil (copy)
    KnitController.KnitStart(u8);
    default.Client:OnEvent("RainbowBackpackEquip", function(p9) -- Line: 43
        -- upvalues: ItemType (ref), u8 (copy)
        if p9.item == ItemType.RAINBOW_BACKPACK then
            if not u8:hasPrisms(p9.player) then
                u8:summonPrisms(p9.player);
            end;
        else
            u8:removePrisms(p9.player);
        end;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(u10) -- Line: 53
        -- upvalues: u8 (copy), Players (ref)
        local v11 = u8.prismsMap[Players.LocalPlayer];

        if v11 ~= nil then
            local function _(p12) -- Line: 58
                -- upvalues: u10 (copy)
                if u10 == 0 then
                    p12.Transparency = 1;

                    return;
                end;

                p12.Transparency = 0;
            end;

            for i, v in v11 do
                local _ = i - 1;

                if u10 == 0 then
                    v.Transparency = 1;
                else
                    v.Transparency = 0;
                end;
            end;
        end;
    end);
    default.Client:OnEvent("RainbowBackpackPrismAttack", function(p13) -- Line: 71
        -- upvalues: u8 (copy), u2 (ref), u4 (ref), TweenService (ref), RandomUtil (ref)
        local v14 = u8.prismsMap[p13.fromPlayer];

        if not v14 then
            return nil;
        end;

        local v15 = u8:getClosestPrism(v14, p13.targetEntity:GetPivot().Position);
        local PrimaryPart = p13.targetEntity.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:FindFirstChild("RainbowPrismAttachment");
        end;

        if PrimaryPart == nil then
            PrimaryPart = u2("Attachment", {
                Name = "RainbowPrismAttachment",
                Parent = p13.targetEntity.PrimaryPart
            });
        end;

        local v16 = v15:FindFirstChild("RainbowPrismAttachment") or u2("Attachment", {
            Name = "RainbowPrismAttachment",
            Parent = v15
        });

        if v16 and PrimaryPart then
            local u17 = u2("Beam", {
                Width0 = 0.5,
                Width1 = 0.5,
                FaceCamera = true,
                Attachment0 = v16,
                Attachment1 = PrimaryPart,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, u4[1]),
                    ColorSequenceKeypoint.new(0.2, u4[2]),
                    ColorSequenceKeypoint.new(0.3, u4[3]),
                    ColorSequenceKeypoint.new(0.5, u4[4]),
                    ColorSequenceKeypoint.new(0.6, u4[5]),
                    ColorSequenceKeypoint.new(0.8, u4[6]),
                    ColorSequenceKeypoint.new(1, u4[7])
                }),
                Parent = v16,
                Transparency = NumberSequence.new(0.1)
            });
            TweenService:Create(u17, TweenInfo.new(0.5), {
                Width0 = 0,
                Width1 = 0,
                CurveSize0 = 1.5 * RandomUtil.fromList(-1, 1),
                CurveSize1 = 1.5 * RandomUtil.fromList(-1, 1)
            }):Play();
            task.delay(0.5, function() -- Line: 115
                -- upvalues: u17 (copy)
                u17:Destroy();
            end);
        end;
    end);
end;

function u5.getClosestPrism(p18, p19, u20) -- Line: 121
    table.sort(p19, function(p21, p22) -- Line: 123
        -- upvalues: u20 (copy)
        return (p21.Position - u20).Magnitude < (p22.Position - u20).Magnitude;
    end);

    return p19[1];
end;

function u5.hasPrisms(p23, p24) -- Line: 134
    local v25 = p23.prismsMap[p24];

    return v25 and #v25 ~= 0 and true or false;
end;

function u5.summonPrisms(p26, u27) -- Line: 144
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    local v28 = u1.new();
    local u29 = 0;
    local v30 = false;
    local v31 = {};

    while true do
        if v30 then
            u29 = u29 + 1;
        else
            v30 = true;
        end;

        if u29 >= 3 then
            p26.maidMap[u27] = v28;
            p26.prismsMap[u27] = v31;

            return;
        end;

        local u32 = ReplicatedStorage.Assets.Misc.RainbowPrism:Clone();
        u32.Parent = Workspace;
        u32.CanCollide = false;
        local u33 = 0;
        v28:GiveTask(RunService.Heartbeat:Connect(function(p34) -- Line: 164
            -- upvalues: u27 (copy), u33 (ref), u29 (ref), u32 (copy)
            local Character = u27.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            if not Character then
                return nil;
            end;

            u33 = u33 + p34 * 2;
            local v35 = 2.0943951023931953 * u29;
            local v36 = math.sin(u33 + v35) * 3.5;
            local v37 = math.cos(u33 + v35) * 3.5;
            u32.Position = Character + Vector3.new(v36, 0, v37);
        end));
        table.insert(v31, u32);
        v28:GiveTask(u32);
        u29 = u29;
    end;
end;

function u5.removePrisms(p38, p39) -- Line: 190
    local v40 = p38.prismsMap[p39];

    if v40 ~= nil then
        table.clear(v40);
    end;

    local v41 = p38.maidMap[p39];

    if v41 ~= nil then
        v41:DoCleaning();
    end;
end;

KnitClient.CreateController(u5.new());

return nil;