-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local CommonUtils = script.Parent.Parent.Parent:WaitForChild("CommonUtils");
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local CameraWrapper = require(CommonUtils:WaitForChild("CameraWrapper"));
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"));
local u1 = FlagUtil.getUserFlag("UserRaycastUpdateAPI");
local u2 = FlagUtil.getUserFlag("UserCurrentCameraUpdate2");
local u3 = FlagUtil.getUserFlag("UserPlayerConnectionMemoryLeak");
local u4;

if u2 then
    u4 = CameraWrapper.new();
else
    u4 = nil;
end;

local u5;

if u2 then
    u5 = nil;
else
    u5 = game.Workspace.CurrentCamera;
end;

if u2 then
    u4:Enable();
end;

local min = math.min;
local tan = math.tan;
local rad = math.rad;
local new = Ray.new;
local u6 = RaycastParams.new();
u6.IgnoreWater = true;
u6.FilterType = Enum.RaycastFilterType.Exclude;
local u7 = RaycastParams.new();
u7.IgnoreWater = true;
u7.FilterType = Enum.RaycastFilterType.Include;
local u8;

if u3 then
    u8 = ConnectionUtil.new();
else
    u8 = nil;
end;

local function getTotalTransparency(p9) -- Line: 42
    return 1 - (1 - p9.Transparency) * (1 - p9.LocalTransparencyModifier);
end;

local function eraseFromEnd(p10, p11) -- Line: 46
    for i = #p10, p11 + 1, -1 do
        p10[i] = nil;
    end;
end;

local u12 = nil;
local u13 = nil;
local u14;

if u2 then
    local function updateProjection() -- Line: 56
        -- upvalues: u4 (copy), rad (copy), u13 (ref), tan (copy), u12 (ref)
        local v15 = u4:getCamera();
        local v16 = rad(v15.FieldOfView);
        local ViewportSize = v15.ViewportSize;
        local v17 = ViewportSize.X / ViewportSize.Y;
        u13 = tan(v16 / 2) * 2;
        u12 = v17 * u13;
    end;

    u4:Connect("FieldOfView", updateProjection);
    u4:Connect("ViewportSize", updateProjection);
    local v18 = u4:getCamera();
    local v19 = rad(v18.FieldOfView);
    local ViewportSize = v18.ViewportSize;
    local v20 = ViewportSize.X / ViewportSize.Y;
    u13 = tan(v19 / 2) * 2;
    u12 = v20 * u13;
    u14 = u4:getCamera().NearPlaneZ;
    u4:Connect("NearPlaneZ", function() -- Line: 72
        -- upvalues: u14 (ref), u4 (copy)
        u14 = u4:getCamera().NearPlaneZ;
    end);
else
    local function v23() -- Line: 78
        -- upvalues: u5 (ref), rad (copy), u13 (ref), tan (copy), u12 (ref)
        local v21 = rad(u5.FieldOfView);
        local ViewportSize = u5.ViewportSize;
        local v22 = ViewportSize.X / ViewportSize.Y;
        u13 = tan(v21 / 2) * 2;
        u12 = v22 * u13;
    end;

    u5:GetPropertyChangedSignal("FieldOfView"):Connect(v23);
    u5:GetPropertyChangedSignal("ViewportSize"):Connect(v23);
    local v24 = rad(u5.FieldOfView);
    local ViewportSize = u5.ViewportSize;
    local v25 = ViewportSize.X / ViewportSize.Y;
    u13 = tan(v24 / 2) * 2;
    u12 = v25 * u13;
    u14 = u5.NearPlaneZ;
    u5:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() -- Line: 92
        -- upvalues: u14 (ref), u5 (ref)
        u14 = u5.NearPlaneZ;
    end);
end;

local u26 = {};
local u27 = {};

local function refreshIgnoreList() -- Line: 101
    -- upvalues: u26 (ref), u27 (copy)
    local v28 = 1;
    u26 = {};

    for _, v in pairs(u27) do
        u26[v28] = v;
        v28 = v28 + 1;
    end;
end;

local function playerAdded(u29) -- Line: 110
    -- upvalues: u27 (copy), u26 (ref), u3 (copy), u8 (copy)
    local function characterAdded(p30) -- Line: 111
        -- upvalues: u27 (ref), u29 (copy), u26 (ref)
        u27[u29] = p30;
        local v31 = 1;
        u26 = {};

        for _, v in pairs(u27) do
            u26[v31] = v;
            v31 = v31 + 1;
        end;
    end;

    local function characterRemoving() -- Line: 115
        -- upvalues: u27 (ref), u29 (copy), u26 (ref)
        u27[u29] = nil;
        local v32 = 1;
        u26 = {};

        for _, v in pairs(u27) do
            u26[v32] = v;
            v32 = v32 + 1;
        end;
    end;

    if u3 then
        u8:trackConnection(`{u29.UserId}CharacterAdded`, u29.CharacterAdded:Connect(characterAdded));
        u8:trackConnection(`{u29.UserId}CharacterRemoving`, u29.CharacterRemoving:Connect(characterRemoving));
    else
        u29.CharacterAdded:Connect(characterAdded);
        u29.CharacterRemoving:Connect(characterRemoving);
    end;

    if u29.Character then
        u27[u29] = u29.Character;
        local v33 = 1;
        u26 = {};

        for _, v in pairs(u27) do
            u26[v33] = v;
            v33 = v33 + 1;
        end;
    end;
end;

local function playerRemoving(p34) -- Line: 133
    -- upvalues: u27 (copy), u26 (ref), u3 (copy), u8 (copy)
    u27[p34] = nil;
    local v35 = 1;
    u26 = {};

    for _, v in pairs(u27) do
        u26[v35] = v;
        v35 = v35 + 1;
    end;

    if u3 then
        u8:disconnect((`{p34.UserId}CharacterAdded`));
        u8:disconnect((`{p34.UserId}CharacterRemoving`));
    end;
end;

Players.PlayerAdded:Connect(playerAdded);
Players.PlayerRemoving:Connect(playerRemoving);

for _, v in ipairs(Players:GetPlayers()) do
    playerAdded(v);
end;

local v36 = 1;
u26 = {};

for _, v in pairs(u27) do
    u26[v36] = v;
    v36 = v36 + 1;
end;

local u37 = nil;
local u38 = nil;

if u2 then
    u4:Connect("CameraSubject", function() -- Line: 173
        -- upvalues: u4 (copy), u38 (ref)
        local CameraSubject = u4:getCamera().CameraSubject;

        if CameraSubject and CameraSubject:IsA("Humanoid") then
            u38 = CameraSubject.RootPart;

            return;
        end;

        if CameraSubject and CameraSubject:IsA("BasePart") then
            u38 = CameraSubject;

            return;
        end;

        u38 = nil;
    end);
else
    u5:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line: 184
        -- upvalues: u5 (ref), u38 (ref)
        local CameraSubject = u5.CameraSubject;

        if CameraSubject:IsA("Humanoid") then
            u38 = CameraSubject.RootPart;

            return;
        end;

        if CameraSubject:IsA("BasePart") then
            u38 = CameraSubject;

            return;
        end;

        u38 = nil;
    end);
end;

local function canOcclude(p39) -- Line: 196
    -- upvalues: u37 (ref)
    return 1 - (1 - p39.Transparency) * (1 - p39.LocalTransparencyModifier) < 0.25 and (p39.CanCollide and u37 ~= (p39:GetRootPart() or p39)) and not p39:IsA("TrussPart") or p39:GetAttribute("BlockCamera");
end;

local u40 = {
    Vector2.new(0.4, 0),
    Vector2.new(-0.4, 0),
    Vector2.new(0, -0.4),
    Vector2.new(0, 0.4),
    Vector2.new(0, 0.2)
};

local function getCollisionPoint(p41, p42) -- Line: 224
    -- upvalues: u1 (copy), u6 (copy), u26 (ref), new (copy)
    if u1 then
        u6.FilterDescendantsInstances = u26;
        local v43;

        repeat
            v43 = workspace:Raycast(p41, p42, u6);

            if v43 then
                if v43.Instance.CanCollide then
                    return v43.Position, true;
                end;

                u6:AddToFilter(v43.Instance);
            end;
        until not v43;
    else
        local v44 = #u26;
        local v45;

        repeat
            local v46;
            v45, v46 = workspace:FindPartOnRayWithIgnoreList(new(p41, p42), u26, false, true);

            if v45 then
                if v45.CanCollide then
                    local v47 = u26;

                    for i = #v47, v44 + 1, -1 do
                        v47[i] = nil;
                    end;

                    return v46, true;
                end;

                u26[#u26 + 1] = v45;
            end;
        until not v45;

        local v48 = u26;

        for i = #v48, v44 + 1, -1 do
            v48[i] = nil;
        end;
    end;

    return p41 + p42, false;
end;

local function queryPoint(p49, p50, p51, p52) -- Line: 262
    -- upvalues: u26 (ref), u14 (ref), u1 (copy), u6 (copy), u37 (ref), u7 (copy), new (copy)
    debug.profilebegin("queryPoint");
    local v53 = #u26;
    local v54 = p51 + u14;
    local v55 = p49 + p50 * v54;
    local v56 = (1 / 0);
    local v57 = (1 / 0);
    local v58 = 0;
    local v59;

    if u1 then
        u6.FilterDescendantsInstances = u26;
        local v60 = p49;

        while true do
            local v61 = workspace:Raycast(p49, v55 - p49, u6);

            if not v61 then
                v59 = v56;
                break;
            end;

            v58 = v58 + 1;
            local Instance = v61.Instance;
            local Position = v61.Position;
            v59 = (Position - v60).Magnitude;

            if v58 >= 64 then
                v57 = v59;
                v59 = v56;
            elseif 1 - (1 - Instance.Transparency) * (1 - Instance.LocalTransparencyModifier) < 0.25 and (Instance.CanCollide and u37 ~= (Instance:GetRootPart() or Instance)) and not Instance:IsA("TrussPart") or Instance:GetAttribute("BlockCamera") then
                u7.FilterDescendantsInstances = { Instance };

                if workspace:Raycast(v55, Position - v55, u7) then
                    local v62;

                    if p52 then
                        v62 = workspace:Raycast(p52, v55 - p52, u7) or workspace:Raycast(v55, p52 - v55, u7);
                    else
                        v62 = false;
                    end;

                    if v62 then
                        v57 = v59;
                        v59 = v56;
                    elseif v54 >= v56 then
                        v59 = v56;
                    end;
                else
                    v57 = v59;
                    v59 = v56;
                end;
            else
                v59 = v56;
            end;

            u6:AddToFilter(Instance);
            p49 = Position - p50 * 0.001;

            if v57 < (1 / 0) or not Instance then
                break;
            end;

            v56 = v59;
        end;
    else
        local v63 = p49;

        while true do
            local v64;

            if true then
                local v65;
                v64, v65 = workspace:FindPartOnRayWithIgnoreList(new(p49, v55 - p49), u26, false, true);
                v58 = v58 + 1;

                if v64 then
                    local v66 = v58 >= 64;

                    if 1 - (1 - v64.Transparency) * (1 - v64.LocalTransparencyModifier) < 0.25 and (v64.CanCollide and u37 ~= (v64:GetRootPart() or v64)) and not v64:IsA("TrussPart") or v64:GetAttribute("BlockCamera") or v66 then
                        local v67 = { v64 };
                        local v68 = workspace:FindPartOnRayWithWhitelist(new(v55, v65 - v55), v67, true);
                        v59 = (v65 - v63).Magnitude;

                        if v68 and not v66 then
                            local v69;

                            if p52 then
                                v69 = workspace:FindPartOnRayWithWhitelist(new(p52, v55 - p52), v67, true) or workspace:FindPartOnRayWithWhitelist(new(v55, p52 - v55), v67, true);
                            else
                                v69 = false;
                            end;

                            if v69 then
                                v57 = v59;
                                v59 = v56;
                            elseif v54 >= v56 then
                                v59 = v56;
                            end;
                        else
                            v57 = v59;
                            v59 = v56;
                        end;
                    else
                        v59 = v56;
                    end;

                    u26[#u26 + 1] = v64;
                    p49 = v65 - p50 * 0.001;
                else
                    v59 = v56;
                end;
            end;

            if v57 < (1 / 0) or not v64 then
                break;
            end;

            v56 = v59;
        end;

        local v70 = u26;

        for i = #v70, v53 + 1, -1 do
            v70[i] = nil;
        end;
    end;

    debug.profileend();

    return v59 - u14, v57 - u14;
end;

local function queryViewport(p71, p72) -- Line: 365
    -- upvalues: u5 (ref), u2 (copy), u4 (copy), u12 (ref), u13 (ref), u14 (ref), queryPoint (copy)
    debug.profilebegin("queryViewport");
    local p = p71.p;
    local rightVector = p71.rightVector;
    local upVector = p71.upVector;
    local v73 = -p71.lookVector;
    local v74;

    if u2 then
        v74 = u4:getCamera();
    else
        v74 = u5;
    end;

    u5 = v74;
    local ViewportSize = u5.ViewportSize;
    local v75 = (1 / 0);
    local v76 = (1 / 0);

    for i = 0, 1 do
        local v77 = rightVector * ((i - 0.5) * u12);

        for i2 = 0, 1 do
            local v78, v79 = queryPoint(p + u14 * (v77 + upVector * ((i2 - 0.5) * u13)), v73, p72, u5:ViewportPointToRay(ViewportSize.x * i, ViewportSize.y * i2).Origin);

            if v79 >= v76 then
                v79 = v76;
            end;

            if v78 < v75 then
                v76 = v79;
                v75 = v78;
            else
                v76 = v79;
            end;
        end;
    end;

    debug.profileend();

    return v75, v76;
end;

local function testPromotion(p80, p81, p82) -- Line: 408
    -- upvalues: getCollisionPoint (copy), min (copy), queryPoint (copy), u40 (copy)
    debug.profilebegin("testPromotion");
    local p = p80.p;
    local rightVector = p80.rightVector;
    local upVector = p80.upVector;
    local v83 = -p80.lookVector;
    debug.profilebegin("extrapolate");
    local Magnitude = (getCollisionPoint(p, p82.posVelocity * 1.25) - p).Magnitude;

    for i = 0, min(1.25, p82.rotVelocity.magnitude + Magnitude / p82.posVelocity.magnitude), 0.0625 do
        local v84 = p82.extrapolate(i);

        if p81 <= queryPoint(v84.p, -v84.lookVector, p81) then
            return false;
        end;
    end;

    debug.profileend();
    debug.profilebegin("testOffsets");

    for _, v in ipairs(u40) do
        local v85 = getCollisionPoint(p, rightVector * v.x + upVector * v.y);

        if queryPoint(v85, (p + v83 * p81 - v85).Unit, p81) == (1 / 0) then
            return false;
        end;
    end;

    debug.profileend();
    debug.profileend();

    return true;
end;

return function(p86, p87, p88) -- Line: 457, Name: Popper
    -- upvalues: u37 (ref), u38 (ref), queryViewport (copy), testPromotion (copy)
    debug.profilebegin("popper");
    u37 = u38 and u38:GetRootPart() or u38;
    local v89, v90 = queryViewport(p86, p87);

    if v90 >= p87 then
        v90 = p87;
    end;

    if v89 < v90 then
        if not testPromotion(p86, p87, p88) then
            v89 = v90;
        end;
    else
        v89 = v90;
    end;

    u37 = nil;
    debug.profileend();

    return v89;
end;