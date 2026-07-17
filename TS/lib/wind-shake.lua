-- Decompiled with Potassium's decompiler.

local CollectionService = game:GetService("CollectionService");
local RunService = game:GetService("RunService");
local Settings = require(script.Settings);
local Octree = require(script.Octree);
local u1 = Settings.new(script, {
    WindDirection = Vector3.new(0.5, 0, 0.5),
    WindSpeed = 20,
    WindPower = 0.5
});
local BindableEvent = Instance.new("BindableEvent");
local BindableEvent2 = Instance.new("BindableEvent");
local BindableEvent3 = Instance.new("BindableEvent");
local BindableEvent4 = Instance.new("BindableEvent");
local BindableEvent5 = Instance.new("BindableEvent");

return {
    Handled = 0,
    Active = 0,
    ObjectMetadata = {},
    Octree = Octree.new(),
    LastUpdate = os.clock(),
    ObjectShakeAdded = BindableEvent.Event,
    ObjectShakeRemoved = BindableEvent2.Event,
    ObjectShakeUpdated = BindableEvent3.Event,
    Paused = BindableEvent4.Event,
    Resumed = BindableEvent5.Event,

    Connect = function(u2, p3, p4) -- Line: 56, Name: Connect
        local u5 = u2[p3];
        local v6 = typeof(u5) == "function";
        assert(v6, "Unknown function: " .. p3);

        return p4:Connect(function(...) -- Line: 60
            -- upvalues: u5 (copy), u2 (copy)
            return u5(u2, ...);
        end);
    end,

    AddObjectShake = function(p7, p8, p9) -- Line: 65, Name: AddObjectShake
        -- upvalues: Settings (copy), u1 (copy), BindableEvent (copy)
        if typeof(p8) ~= "Instance" then
            return;
        end;

        if not p8:IsA("BasePart") then
            return;
        end;

        local ObjectMetadata = p7.ObjectMetadata;

        if ObjectMetadata[p8] then
            return;
        end;

        p7.Handled = p7.Handled + 1;
        ObjectMetadata[p8] = {
            Node = p7.Octree:CreateNode(p8.Position, p8),
            Settings = Settings.new(p8, u1),
            Seed = math.random(1000) * 0.1,
            Origin = p8.CFrame
        };
        p7:UpdateObjectSettings(p8, p9);
        BindableEvent:Fire(p8);
    end,

    RemoveObjectShake = function(p10, p11) -- Line: 95, Name: RemoveObjectShake
        -- upvalues: BindableEvent2 (copy)
        if typeof(p11) ~= "Instance" then
            return;
        end;

        local ObjectMetadata = p10.ObjectMetadata;
        local v12 = ObjectMetadata[p11];

        if v12 then
            p10.Handled = p10.Handled - 1;
            ObjectMetadata[p11] = nil;
            v12.Settings:Destroy();
            v12.Node:Destroy();

            if p11:IsA("BasePart") then
                p11.CFrame = v12.Origin;
            end;
        end;

        BindableEvent2:Fire(p11);
    end,

    Update = function(p13) -- Line: 117, Name: Update
        local v14 = os.clock();
        local v15 = v14 - p13.LastUpdate;

        if v15 < 0.022222222222222223 then
            return;
        end;

        p13.LastUpdate = v14;
        debug.profilebegin("WindShake");
        local CurrentCamera = workspace.CurrentCamera;

        if CurrentCamera then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        debug.profilebegin("Octree Search");
        local v16 = p13.Octree:RadiusSearch(CurrentCamera.Position + CurrentCamera.LookVector * 115, 120);
        debug.profileend();
        local v17 = #v16;
        p13.Active = v17;

        if v17 < 1 then
            return;
        end;

        local v18 = math.min(1, v15 * 8);
        local v19 = table.create(v17);
        local ObjectMetadata = p13.ObjectMetadata;
        debug.profilebegin("Calc");

        for i, v in ipairs(v16) do
            local v20 = ObjectMetadata[v];
            local Origin = v20.Origin;
            local v21 = v20.CFrame or Origin;

            if v14 - (v20.LastCompute or 0) > 0.03333333333333333 then
                local Settings2 = v20.Settings;
                local Seed = v20.Seed;
                local v22 = Settings2.WindPower * 0.1;
                local v23 = v14 * (Settings2.WindSpeed * 0.08);
                local v24 = math.noise(v23, 0, Seed) * v22;
                local v25 = math.noise(v23, 0, -Seed) * v22;
                local v26 = math.noise(v23, 0, Seed + Seed) * v22;
                local PivotOffset = v.PivotOffset;
                v20.Target = (Origin * PivotOffset * CFrame.Angles(v24, v25, v26) + Settings2.WindDirection * ((0.5 + math.noise(v23, Seed, Seed)) * v22)) * PivotOffset:Inverse();
                v20.LastCompute = v14;
            end;

            local v27 = v21:Lerp(v20.Target, v18);
            v20.CFrame = v27;
            v19[i] = v27;
        end;

        debug.profileend();
        workspace:BulkMoveTo(v16, v19, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end,

    Pause = function(p28) -- Line: 184, Name: Pause
        -- upvalues: BindableEvent4 (copy)
        if p28.UpdateConnection then
            p28.UpdateConnection:Disconnect();
            p28.UpdateConnection = nil;
        end;

        p28.Active = 0;
        p28.Running = false;
        BindableEvent4:Fire();
    end,

    Resume = function(p29) -- Line: 196, Name: Resume
        -- upvalues: RunService (copy), BindableEvent5 (copy)
        if p29.Running then
            return;
        end;

        p29.Running = true;
        p29.UpdateConnection = p29:Connect("Update", RunService.Heartbeat);
        BindableEvent5:Fire();
    end,

    Init = function(p30) -- Line: 209, Name: Init
        -- upvalues: u1 (copy), CollectionService (copy)
        if p30.Initialized then
            return;
        end;

        p30.Initialized = true;
        local v31 = script:GetAttribute("WindPower");
        local v32 = script:GetAttribute("WindSpeed");
        local v33 = script:GetAttribute("WindDirection");

        if typeof(v31) ~= "number" then
            script:SetAttribute("WindPower", u1.WindPower);
        end;

        if typeof(v32) ~= "number" then
            script:SetAttribute("WindSpeed", u1.WindSpeed);
        end;

        if typeof(v33) ~= "Vector3" then
            script:SetAttribute("WindDirection", u1.WindDirection);
        end;

        p30:Cleanup();
        p30.AddedConnection = p30:Connect("AddObjectShake", (CollectionService:GetInstanceAddedSignal("WindShake")));
        p30.RemovedConnection = p30:Connect("RemoveObjectShake", (CollectionService:GetInstanceRemovedSignal("WindShake")));

        for _, v in pairs(CollectionService:GetTagged("WindShake")) do
            p30:AddObjectShake(v);
        end;

        p30:Resume();
    end,

    Cleanup = function(p34) -- Line: 251, Name: Cleanup
        if not p34.Initialized then
            return;
        end;

        p34:Pause();

        if p34.AddedConnection then
            p34.AddedConnection:Disconnect();
            p34.AddedConnection = nil;
        end;

        if p34.RemovedConnection then
            p34.RemovedConnection:Disconnect();
            p34.RemovedConnection = nil;
        end;

        table.clear(p34.ObjectMetadata);
        p34.Octree:ClearNodes();
        p34.Handled = 0;
        p34.Active = 0;
        p34.Initialized = false;
    end,

    UpdateObjectSettings = function(p35, p36, p37) -- Line: 276, Name: UpdateObjectSettings
        -- upvalues: BindableEvent3 (copy)
        if typeof(p36) ~= "Instance" then
            return;
        end;

        if typeof(p37) ~= "table" then
            return;
        end;

        if not p35.ObjectMetadata[p36] and p36 ~= script then
            return;
        end;

        for i, v in pairs(p37) do
            p36:SetAttribute(i, v);
        end;

        BindableEvent3:Fire(p36);
    end,

    UpdateAllObjectSettings = function(p38, p39) -- Line: 296, Name: UpdateAllObjectSettings
        -- upvalues: BindableEvent3 (copy)
        if typeof(p39) ~= "table" then
            return;
        end;

        for i, _ in pairs(p38.ObjectMetadata) do
            for i2, v in pairs(p39) do
                i:SetAttribute(i2, v);
            end;

            BindableEvent3:Fire(i);
        end;
    end,

    SetDefaultSettings = function(p40, p41) -- Line: 309, Name: SetDefaultSettings
        p40:UpdateObjectSettings(script, p41);
    end
};