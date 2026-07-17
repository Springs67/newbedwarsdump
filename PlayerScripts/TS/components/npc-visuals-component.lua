-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes");
local NpcAnimationAttr = v4.NpcAnimationAttr;
local NpcAutoPlaceAttr = v4.NpcAutoPlaceAttr;
local NpcCollectionServiceTag = v4.NpcCollectionServiceTag;
local NpcLookAtPlayerAttr = v4.NpcLookAtPlayerAttr;
local NpcLookMinDistanceAttr = v4.NpcLookMinDistanceAttr;
local NpcNameAttr = v4.NpcNameAttr;
local NpcScale = v4.NpcScale;
local NpcSecondaryAnimationAttr = v4.NpcSecondaryAnimationAttr;
local NpcVerticalOffset = v4.NpcVerticalOffset;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local u6 = TweenInfo.new(0.085, Enum.EasingStyle.Linear);

local function calculateLookAtAngles(p7, p8) -- Line: 23
    local v9 = p8 - p7.Position;
    local v10 = (-(math.atan(v9.Z / v9.X) + (v9.X > 0 and 3.141592653589793 or 0)) + 1.5707963267948966 - select(2, (p7 - p7.Position):ToEulerAnglesYXZ()) + 1.5707963267948966) % 6.283185307179586 - 1.5707963267948966;

    if math.abs(v10) > 1.7278759594743864 then
        return 0, 3.141592653589793;
    end;

    local v11 = math.clamp(v10, -1.288052987971815, 1.288052987971815) + 3.141592653589793;
    local v12 = math.pow(v9.X, 2) + math.pow(v9.Z, 2);
    local v13 = math.sqrt(v12);
    local v14 = math.atan(v9.Y / v13) - (p7 - p7.Position):ToEulerAnglesYXZ();

    return math.clamp(v14, -0.3141592653589793, 0.3141592653589793), v11;
end;

local u15 = setmetatable({}, {
    __tostring = function() -- Line: 51, Name: __tostring
        return "NpcVisualsComponent";
    end
});
u15.__index = u15;

function u15.new(...) -- Line: 56
    -- upvalues: u15 (ref)
    local v16 = setmetatable({}, u15);

    return v16:constructor(...) or v16;
end;

function u15.constructor(u17, p18) -- Line: 60
    -- upvalues: u1 (copy), u5 (copy), NpcNameAttr (copy), NpcAutoPlaceAttr (copy), NpcAnimationAttr (copy), NpcSecondaryAnimationAttr (copy), NpcLookAtPlayerAttr (copy), NpcLookMinDistanceAttr (copy), NpcScale (copy), NpcCollectionServiceTag (copy), NpcVerticalOffset (copy), Workspace (copy), RuntimeLib (copy), Players (copy)
    u17.npcModel = p18;
    u17.maid = u1.new();
    u17.lastUpdate = 0;
    u17.config = u5.new(p18.Parent, {
        NpcNameAttr,
        NpcAutoPlaceAttr,
        NpcAnimationAttr,
        NpcSecondaryAnimationAttr,
        NpcLookAtPlayerAttr,
        NpcLookMinDistanceAttr,
        NpcScale,
        NpcCollectionServiceTag,
        NpcVerticalOffset
    });

    if not Workspace:FindFirstChild("NpcContainer") then
        local Folder = Instance.new("Folder");
        Folder.Name = "NpcContainer";
        Folder.Parent = Workspace;
    end;

    u17.humanoid = p18:WaitForChild("Humanoid");
    u17.npcRoot = p18.PrimaryPart;
    local Head = p18:FindFirstChild("Head");

    if Head ~= nil then
        Head = Head:FindFirstChild("Neck");
    end;

    u17.npcNeck = Head;
    local npcNeck = u17.npcNeck;

    if npcNeck ~= nil then
        npcNeck = npcNeck.C0;
    end;

    u17.originalNeckC0 = npcNeck;
    local NpcAnimation = u17.config.Values.NpcAnimation;

    if NpcAnimation ~= "" and NpcAnimation then
        RuntimeLib.Promise.defer(function() -- Line: 90
            -- upvalues: u17 (copy)
            u17:applyAnimation();
        end);
    end;

    u17:getLocalCharacterRoot();
    Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 95
        -- upvalues: u17 (copy)
        return u17:getLocalCharacterRoot();
    end);
end;

u15.getLocalCharacterRoot = RuntimeLib.async(function(p19) -- Line: 99
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

    if not HumanoidRootPart then
        return nil;
    end;

    p19.localCharacterRoot = HumanoidRootPart;
end);

function u15.applyAnimation(u20) -- Line: 110
    -- upvalues: Workspace (copy), u2 (copy), RuntimeLib (copy)
    local Animator = u20.humanoid:FindFirstChild("Animator");

    if not u20.humanoid:IsDescendantOf(Workspace) then
        return nil;
    end;

    local v21 = Animator or u2("Animator", {
        Parent = u20.humanoid
    });
    local v22 = u2("Animation", {
        AnimationId = u20.config.Values.NpcAnimation
    });
    local u23 = v21:LoadAnimation(v22);
    local NpcSecondaryAnimation = u20.config.Values.NpcSecondaryAnimation;

    if NpcSecondaryAnimation ~= "" and NpcSecondaryAnimation then
        local v24 = u2("Animation", {
            AnimationId = u20.config.Values.NpcSecondaryAnimation
        });
        local v25 = v21:LoadAnimation(v24);
        v25.Looped = true;
        v25:Play();
        u20.maid:GiveTask(v24);
    end;

    RuntimeLib.Promise.defer(function() -- Line: 137
        -- upvalues: u20 (copy), u23 (copy)
        while u20.humanoid.Parent ~= nil do
            u23:Play();
            u23.Stopped:Wait();
            task.wait(3);
        end;
    end);
    u20.maid:GiveTask(v22);
end;

function u15.HeartbeatUpdate(p26) -- Line: 146
    -- upvalues: calculateLookAtAngles (copy), TweenService (copy), u6 (copy)
    if os.clock() - p26.lastUpdate < 0.1 then
        return nil;
    end;

    p26.lastUpdate = os.clock();

    if not (p26.npcNeck and p26.originalNeckC0) then
        return nil;
    end;

    if p26.config.Values.NpcLookAtPlayer ~= true then
        return nil;
    end;

    if not p26.localCharacterRoot then
        return nil;
    end;

    local npcRoot = p26.npcRoot;
    local Magnitude = (p26.localCharacterRoot.Position - npcRoot.Position).Magnitude;
    local NpcLookMinimumDistance = p26.config.Values.NpcLookMinimumDistance;
    local v27 = CFrame.new();

    if Magnitude <= ((NpcLookMinimumDistance == 0 or (NpcLookMinimumDistance ~= NpcLookMinimumDistance or not NpcLookMinimumDistance)) and 16 or NpcLookMinimumDistance) then
        local v28, v29 = calculateLookAtAngles(npcRoot.CFrame, p26.localCharacterRoot.Position);
        v27 = CFrame.new(0, 0, 0) * CFrame.Angles(v28, -3.141592653589793 + v29, 0);
    end;

    local v30 = { p26.npcNeck.C0:ToEulerAnglesXYZ() };

    local function _(p31, p32) -- Line: 180
        return p31 + p32;
    end;

    if #v30 == 0 then
        error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
    end;

    local v33 = v30[1];

    for i = 2, #v30 do
        local _ = i - 1;
        v33 = v33 + v30[i];
    end;

    local v34 = { v27:ToEulerAnglesXYZ() };

    local function _(p35, p36) -- Line: 195
        return p35 + p36;
    end;

    if #v34 == 0 then
        error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
    end;

    local v37 = v34[1];

    for i = 2, #v34 do
        local _ = i - 1;
        v37 = v37 + v34[i];
    end;

    if math.abs(v33 - v37) < 1e-6 then
        return nil;
    end;

    TweenService:Create(p26.npcNeck, u6, {
        C0 = p26.originalNeckC0 * v27
    }):Play();
end;

function u15.Destroy(p38) -- Line: 221
    p38.maid:DoCleaning();
end;

u15.Tag = "NpcModel";

return u15;