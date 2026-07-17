-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Indicator = RuntimeLib.import(script, script.Parent, "indicator").Indicator;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "MetalDetectorController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p7);
    p7.Name = "MetalDetectorController";
end;

function u5.KnitStart(p8) -- Line: 38
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p8);
end;

function u5.isRelevantItem(p9, p10) -- Line: 41
    -- upvalues: ItemType (copy)
    return p10.itemType == ItemType.METAL_DETECTOR;
end;

function u5.onEnable(u11, p12, p13) -- Line: 44
    -- upvalues: u1 (copy), u2 (copy), u4 (copy), Indicator (copy), Players (copy), CollectionService (copy), RunService (copy), EntityUtil (copy), Workspace (copy), InQuad (copy), SoundManager (copy), GameSound (copy)
    u11.maid = u1.new();
    local v14, u15 = u2.createBinding(UDim2.fromScale(0.5, 0.5));
    local v16, u17 = u2.createBinding(0);
    local u18 = u4.new();
    local u19 = u2.createRef();
    u11.maid:GiveTask(u18);
    local u20 = u2.mount(u2.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true
    }, { u2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            [u2.Ref] = u19
        }), u2.createElement(Indicator, {
            position = v14,
            rotation = v16,
            activatedSignal = u18
        }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
    u11.maid:GiveTask(function() -- Line: 67
        -- upvalues: u2 (ref), u20 (copy)
        u2.unmount(u20);
    end);

    local function u22(p21) -- Line: 71
        -- upvalues: CollectionService (ref)
        for _, v in CollectionService:GetTagged("hidden-metal") do
            for _, child in v:GetChildren() do
                if child:IsA("ProximityPrompt") then
                    child.Enabled = p21;
                end;
            end;
        end;
    end;

    u22(true);
    u11.maid:GiveTask(function() -- Line: 81
        -- upvalues: u22 (copy)
        return u22(false);
    end);
    u11.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 85
        -- upvalues: EntityUtil (ref), u11 (copy), Workspace (ref), u19 (copy), u15 (copy), u17 (copy), InQuad (ref), SoundManager (ref), GameSound (ref), u18 (copy), CollectionService (ref)
        local v23 = EntityUtil:getLocalPlayerEntity();
        local v24;

        if v23 == nil then
            v24 = v23;
        else
            v24 = v23:getInstance():GetPivot().Position;
        end;

        if v23 == nil or v24 == nil then
            return nil;
        end;

        if u11.lastTrackedHiddenMetal then
            if u11.lastTrackedHiddenMetal.model:IsDescendantOf(Workspace) == false then
                u11.lastTrackedHiddenMetal = nil;

                return nil;
            end;

            local Position = u11.lastTrackedHiddenMetal.model:GetPivot().Position;
            local Magnitude = (Position - v24).Magnitude;
            local v25 = u19:getValue();
            local AbsolutePosition = v25.AbsolutePosition;
            local AbsoluteSize = v25.AbsoluteSize;
            local v26 = Workspace.CurrentCamera:WorldToViewportPoint(Position);
            local v27 = Vector2.new(v26.X, v26.Y);

            if v26.Z < 0 then
                v27 = AbsoluteSize + AbsolutePosition - v27 + AbsolutePosition;
            end;

            local v28 = v27 - AbsolutePosition;
            local v29 = math.atan2(v28.Y, v28.X);
            local v30 = AbsolutePosition + Vector2.new(math.cos(v29) * 80, math.sin(v29) * 80);
            u15(UDim2.fromOffset(v30.X, v30.Y));
            u17((math.deg(v29)));

            if u11.lastTrackedHiddenMetal.nextBeep < time() then
                local v31 = {};

                for i, v in u11.lastTrackedHiddenMetal do
                    v31[i] = v;
                end;

                v31.nextBeep = time() + InQuad(200 - Magnitude, 1, -0.9, 200);
                u11.lastTrackedHiddenMetal = v31;
                SoundManager:playSound(GameSound.METAL_DETECTOR_BEEP, {});
                u18:Fire(InQuad(200 - Magnitude, 2, 20, 200));

                if Magnitude > 200 then
                    u11.lastTrackedHiddenMetal = nil;
                end;
            end;
        else
            for _, v in CollectionService:GetTagged("hidden-metal") do
                if (v:GetPivot().Position - v24).Magnitude < 200 then
                    u11.lastTrackedHiddenMetal = {
                        model = v,
                        nextBeep = time() + 1,
                        nextRevealLocation = time() + 1
                    };
                end;
            end;
        end;
    end));
end;

function u5.onDisable(p32) -- Line: 148
    if p32.maid then
        p32.maid:DoCleaning();
        p32.maid = nil;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;