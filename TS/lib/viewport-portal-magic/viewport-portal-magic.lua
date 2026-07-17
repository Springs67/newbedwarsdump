-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v2.Lighting;
local Players = v2.Players;
local StarterGui = v2.StarterGui;
local Workspace = v2.Workspace;
local v3 = {};

local function createViewportSetup(p4, p5) -- Line: 13
    -- upvalues: u1 (copy), Workspace (copy), Lighting (copy)
    local v6 = u1("Camera", {
        FieldOfView = Workspace.CurrentCamera.FieldOfView,
        CFrame = Workspace.CurrentCamera.CFrame
    });
    local v7 = u1("ViewportFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        LightColor = Color3.fromRGB(255, 255, 255),
        LightDirection = Lighting:GetSunDirection(),
        CurrentCamera = v6
    });
    local v8 = u1("WorldModel", {
        Parent = v7
    });
    v6.Parent = v7;

    if not p5 then
        return {
            undefined = nil,
            viewportFrame = v7,
            worldModel = v8,
            camera = v6
        };
    end;

    p5.Archivable = true;
    local v9 = p5:Clone();
    v9:PivotTo(p4);
    v9.Parent = v8;

    return {
        viewportFrame = v7,
        clone = v9,
        worldModel = v8,
        camera = v6
    };
end;

v3.createViewportSetup = createViewportSetup;

local function getSurfaceInfo(p10) -- Line: 52
    local Adornee = p10.Adornee;

    if Adornee == nil then
        return nil;
    end;

    local v11 = Vector3.FromNormalId(p10.Face) * -1;
    local v12 = math.abs(v11.Y) ~= 1 and Vector3.new(0, 1, 0) or Vector3.new(v11.Y, 0, 0);
    local v13 = CFrame.fromAxisAngle(v12, 1.5707963267948966) * v11;
    local Unit = v11:Cross(v13).Unit;

    return {
        cf = Adornee.CFrame * CFrame.fromMatrix(v11 * -1 * (Adornee.Size / 2), v13, Unit, v11),
        size = Vector2.new((Adornee.Size * v13).Magnitude, (Adornee.Size * Unit).Magnitude)
    };
end;

v3.getSurfaceInfo = getSurfaceInfo;

function v3.createFaces(p14, p15, p16) -- Line: 74
    -- upvalues: createViewportSetup (copy), u1 (copy), DeviceUtil (copy), StarterGui (copy), Players (copy)
    if p16 == nil then
        p16 = Enum.NormalId:GetEnumItems();
    end;

    local v17 = {};

    for _, v in p16 do
        local v18;

        if p15 == nil then
            v18 = p15;
        else
            v18 = p15:GetPivot();
        end;

        if v18 == nil then
            v18 = p14:GetPivot();
        end;

        local v19 = createViewportSetup(v18, p15);
        local v20 = {};
        local v21 = {
            ResetOnSpawn = false,
            LightInfluence = 1,
            ClipsDescendants = true,
            Adornee = p14,
            Face = v,
            SizingMode = Enum.SurfaceGuiSizingMode.FixedSize,
            CanvasSize = Vector2.new(800, 800),
            Children = { v19.viewportFrame }
        };
        local v22;

        if DeviceUtil.isHoarceKat() then
            v22 = StarterGui;
        else
            v22 = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        end;

        v21.Parent = v22;
        v20.surfaceGui = u1("SurfaceGui", v21);
        v20.slice = v19;
        v17[v] = v20;
    end;

    return v17;
end;

function v3.update(p23, p24) -- Line: 108
    -- upvalues: Workspace (copy), getSurfaceInfo (copy)
    local CFrame2 = Workspace.CurrentCamera.CFrame;
    local v25 = getSurfaceInfo(p23);

    if v25 == nil then
        return nil;
    end;

    if v25.cf:PointToObjectSpace(CFrame2.Position).Z > 0 then
        return nil;
    end;

    local v26 = v25.cf.YVector:Cross(CFrame2.ZVector);
    local v27;

    if v26:Dot(v26) > 0 then
        v27 = v26.Unit;
    else
        v27 = CFrame2.XVector;
    end;

    local v28 = CFrame.fromMatrix(CFrame2.Position, v27, v25.cf.YVector);
    local v29 = v25.cf * Vector3.new(0, v25.size.Y / 2, 0);
    local v30 = v25.cf * Vector3.new(0, -v25.size.Y / 2, 0);
    local v31 = v28:PointToObjectSpace(v29);
    local v32 = v28:PointToObjectSpace(v30);
    local Unit = (v31 * Vector3.new(0, 1, 1)).Unit;
    local Unit2 = (v32 * Vector3.new(0, 1, 1)).Unit;
    local v33 = math.sign(Unit.Y) * math.acos(-Unit.Z);
    local v34 = math.sign(Unit2.Y) * math.acos(-Unit2.Z);
    local v35 = math.rad(Workspace.CurrentCamera.FieldOfView / 2);
    local v36 = math.tan(v35) * 2;
    local v37 = (math.tan(v33) - math.tan(v34)) / v36;
    local v38 = v25.cf:VectorToObjectSpace(v25.cf.Position - CFrame2.Position);
    local Unit3 = (v38 * Vector3.new(1, 0, 1)).Unit;
    local v39 = v38 * Vector3.new(0, 1, 1);
    local v40 = -Unit3.Z;
    local v41 = (v25.cf:VectorToObjectSpace(CFrame2.LookVector) * Vector3.new(1, 0, 1)).Unit:Dot(Unit3) / v40;
    local v42 = math.sqrt(1 - v40 * v40) / v40;
    local v43 = v25.size.X / v25.size.Y;
    local v44 = math.sign(v38.X * v38.Z) * v42;
    local v45 = v39.Y / v39.Z * v43;
    local v46 = math.abs(v41 * v37 * v43);
    local cf = v25.cf;
    local Position = v25.cf.Position;
    local v47 = CFrame.fromEulerAnglesXYZ(0, 3.141592653589793, 0);
    local v48 = CFrame.new(0, 0, 0, 1, 0, 0, 0, v43, 0, v44, v45, v46);
    local v49 = {};
    local v50 = 0;

    for i, v in { ((cf - Position) * v47 * v48):GetComponents() } do
        v49[i] = v;
    end;

    for _, v in v49 do
        local v51 = math.abs(v);
        v50 = math.max(v50, v51);
    end;

    for i, v in ipairs(v49) do
        v49[i - 1 + 1] = v / v50;
    end;

    local v52 = CFrame.new(unpack(v49)) + CFrame2.Position;
    p24.camera.FieldOfView = Workspace.CurrentCamera.FieldOfView;
    p24.camera.CFrame = v52;
end;

return v3;