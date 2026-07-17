-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local OutBack = v2.OutBack;
local OutExpo = v2.OutExpo;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local RunService = v5.RunService;
local StarterGui = v5.StarterGui;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local getSurfaceInfo = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic").getSurfaceInfo;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;

local function u12(p6, p7) -- Line: 22
    -- upvalues: u4 (copy), Workspace (copy), Lighting (copy)
    local v8 = u4("Camera", {
        FieldOfView = Workspace.CurrentCamera.FieldOfView,
        CFrame = Workspace.CurrentCamera.CFrame
    });
    local v9 = u4("ViewportFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(1, 1),
        LightColor = Color3.fromRGB(214, 74, 172),
        LightDirection = Lighting:GetSunDirection(),
        CurrentCamera = v8
    });
    local v10 = u4("WorldModel", {
        Parent = v9
    });
    v8.Parent = v9;
    p6.Archivable = true;
    local v11 = p6:Clone();
    v11.HumanoidRootPart.Anchored = true;
    v11:PivotTo(p7);
    v11.Parent = v10;

    return {
        viewportFrame = v9,
        clone = v11,
        worldModel = v10,
        camera = v8
    };
end;

local u13 = setmetatable({}, {
    __tostring = function() -- Line: 56, Name: __tostring
        return "GlitchKillEffect";
    end,

    __index = KillEffect
});
u13.__index = u13;

function u13.new(...) -- Line: 62
    -- upvalues: u13 (copy)
    local v14 = setmetatable({}, u13);

    return v14:constructor(...) or v14;
end;

function u13.constructor(p15, p16) -- Line: 66
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p15, p16);
    KillEffect.setPlayDefaultKillEffect(p15, false);
end;

function u13.onKill(p17, p18, p19, u20) -- Line: 70
    -- upvalues: u3 (copy), Workspace (copy), u4 (copy), GameQueryUtil (copy), u12 (copy), DeviceUtil (copy), StarterGui (copy), Players (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), RunService (copy), getSurfaceInfo (copy), default (copy), OutBack (copy), OutExpo (copy)
    local u21 = u3.new();
    local u22 = u4("Part", {
        Size = Vector3.new(7, 7, 7),
        Rotation = Vector3.new(45, 0, 0),
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Position = u20.Position + Vector3.new(0, 0, 0),
        Parent = Workspace
    });
    GameQueryUtil:setQueryIgnored(u22, true);
    local Position = u22.Position;
    local Size = u22.Size;
    local u23 = {};

    for _, v in Enum.NormalId:GetEnumItems() do
        local v24 = u12(p19, u20);
        local v25 = {};
        local v26 = {
            ResetOnSpawn = false,
            ClipsDescendants = true,
            Adornee = u22,
            Face = v,
            SizingMode = Enum.SurfaceGuiSizingMode.FixedSize,
            CanvasSize = Vector2.new(800, 800),
            Children = { v24.viewportFrame }
        };
        local v27;

        if DeviceUtil.isHoarceKat() then
            v27 = StarterGui;
        else
            v27 = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        end;

        v26.Parent = v27;
        v25.surfaceGui = u4("SurfaceGui", v26);
        v25.slice = v24;
        u23[v] = v25;
    end;

    KillEffect.hideCharacter(p17, p19);
    SoundManager:playSound(GameSound.GLITCH_KILL_EFFECT, {
        position = u20.Position
    });
    u21:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 110
        -- upvalues: u22 (copy), Position (copy), u23 (copy), getSurfaceInfo (ref), u20 (copy), Workspace (ref)
        local v28 = math.noise(os.clock() * 8) + 0.05;
        local v29 = math.noise(0, os.clock() * 18) * 10;
        local v30 = math.noise(os.clock() * 18) * 5;
        local v31 = math.noise(0, 0, os.clock() * 18) * 5;
        local v32 = math.noise(os.clock() * 15) * 0.5;
        local v33 = math.noise(0, 0, -os.clock() * 15) * 0.5;
        local v34 = math.noise(os.clock() * -15) * 0.5;
        u22.Rotation = Vector3.new(25 + v29, v30, v31);
        u22.Position = Position + Vector3.new(v32, v33, v34);

        for _, v in u23 do
            local surfaceGui = v.surfaceGui;
            local slice = v.slice;
            local v35 = getSurfaceInfo(surfaceGui);

            if v35 ~= nil then
                slice.clone:PivotTo(u20 * CFrame.Angles(-math.rad(v29) / 2, -math.rad(v30) / 2, -math.rad(v31) / 2));
                slice.viewportFrame.Ambient = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(170, 85, 255), (math.clamp(0.9 + v28, 0, 1)));
                local Y = Workspace.CurrentCamera.ViewportSize.Y;
                local v36 = v35.cf:PointToObjectSpace(Workspace.CurrentCamera.CFrame.Position);
                local v37 = v36.X / v35.size.X;
                local v38 = v36.Y / v35.size.Y;
                local v39 = math.abs(v37) * 2 + 1;
                local v40 = math.abs(v38) * 2 + 1;
                local v41 = math.sqrt(v39 * v39 + v40 * v40);
                local v42 = (Workspace.CurrentCamera.CFrame.Position - v35.cf.Position):Dot(v35.cf.LookVector);
                local v43 = math.atan2(v35.size.Y / 2, v42) * 2;
                local v44 = math.deg(v43);
                local v45 = math.clamp(v44, 1, 120);
                local v46 = v35.size.Y / 2;
                local v47 = math.rad(v45) / 2;
                local v48 = v42 / (v46 / math.tan(v47));
                local v49 = (v43 <= 2.0943951023931953 and 1 or v48) / v41;
                local v50 = CFrame.new(0, 0, 0, v49, 0, 0, 0, v49, 0, 0, 0, 1);
                slice.viewportFrame.Position = UDim2.new(slice.viewportFrame.AnchorPoint.X - v37, 0, slice.viewportFrame.AnchorPoint.Y - v38, 0);
                slice.viewportFrame.Size = UDim2.new(v41, 0, v41, 0);
                surfaceGui.CanvasSize = Vector2.new(Y * (v35.size.X / v35.size.Y), Y);
                slice.camera.FieldOfView = v45;
                local v51 = CFrame.new(Workspace.CurrentCamera.CFrame.Position);
                local cf = v35.cf;
                local Position2 = v35.cf.Position;
                local v52 = CFrame.Angles(0, 3.141592653589793, 0);
                slice.camera.CFrame = v51 * (cf - Position2) * v52 * v50;
            end;
        end;
    end));
    task.spawn(function() -- Line: 160
        -- upvalues: default (ref), OutBack (ref), u22 (copy), Size (copy), OutExpo (ref)
        task.wait(0.5);
        default(2, OutBack, function(p53) -- Line: 162
            -- upvalues: u22 (ref), Size (ref)
            local v54 = math.noise(os.clock() * 15) * 1.5;
            u22.Size = Vector3.new((Size.X + v54) * p53, (Size.Y + v54) * p53, Size.Z);
        end, 1, 0.3):Wait();
        task.wait(0.2);
        default(0.2, OutExpo, function(p55) -- Line: 167
            -- upvalues: u22 (ref), Size (ref)
            local v56 = math.random() * 3;
            u22.Size = Vector3.new((Size.X + v56) * p55, (Size.Y + v56) * p55, Size.Z);
        end, 0.3, 0);
    end);
    u21:GiveTask(function() -- Line: 172
        -- upvalues: u23 (copy)
        for _, v in u23 do
            v.surfaceGui:Destroy();
        end;
    end);
    u21:GiveTask(u22);
    task.delay(5, function() -- Line: 178
        -- upvalues: u21 (copy)
        u21:DoCleaning();
    end);

    return u21;
end;

return u13;