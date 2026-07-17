-- Decompiled with Potassium's decompiler.

local CurrentCamera = Game:GetService("Workspace").CurrentCamera;
local u1 = {
    ViewSizeX = function() -- Line: 7, Name: ViewSizeX
        -- upvalues: CurrentCamera (copy)
        local _ = CurrentCamera.ViewportSize.Y;

        return CurrentCamera.ViewportSize.X;
    end,

    ViewSizeY = function() -- Line: 23, Name: ViewSizeY
        -- upvalues: CurrentCamera (copy)
        local _ = CurrentCamera.ViewportSize.X;

        return CurrentCamera.ViewportSize.Y;
    end
};

function u1.AspectRatio() -- Line: 41
    -- upvalues: u1 (copy)
    return u1.ViewSizeX() / u1.ViewSizeY();
end;

function u1.WorldToScreen(p2) -- Line: 47
    -- upvalues: u1 (copy)
    local v3 = Workspace.CurrentCamera.CoordinateFrame:pointToObjectSpace(p2);
    local v4 = u1.AspectRatio();
    local v5 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v6 = math.tan(v5);
    local v7 = v3.x / v3.z / -(v4 * v6);
    local v8 = v3.y / v3.z / v6;

    return Vector2.new(u1.ViewSizeX() * (0.5 + 0.5 * v7), u1.ViewSizeY() * (0.5 + 0.5 * v8));
end;

function u1.ScreenToWorld(p9, p10, p11) -- Line: 61
    -- upvalues: u1 (copy)
    local v12 = u1.AspectRatio();
    local v13 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v14 = math.tan(v13);
    local v15 = p9 / u1.ViewSizeX() * 2 - 1;
    local v16 = p10 / u1.ViewSizeY() * 2 - 1;

    return Vector3.new(v15 * -(v12 * v14) * p11, v16 * v14 * p11, p11);
end;

function u1.ScreenWidthToWorldWidth(p17, p18, p19) -- Line: 74
    -- upvalues: u1 (copy)
    local v20 = u1.AspectRatio();
    local v21 = math.rad(p19 or Workspace.CurrentCamera.FieldOfView) / 2;
    local v22 = v20 * math.tan(v21);

    return -(p17 / u1.ViewSizeX()) * 2 * v22 * p18;
end;

function u1.ScreenHeightToWorldHeight(p23, p24, p25) -- Line: 82
    -- upvalues: u1 (copy)
    local v26 = math.rad(p25 or Workspace.CurrentCamera.FieldOfView) / 2;
    local v27 = math.tan(v26);

    return -(p23 / u1.ViewSizeY()) * 2 * v27 * p24;
end;

function u1.WorldWidthToScreenWidth(p28, p29) -- Line: 91
    -- upvalues: u1 (copy)
    local v30 = u1.AspectRatio();
    local v31 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v32 = v30 * math.tan(v31);

    return -(p28 * u1.ViewSizeX()) / (2 * v32 * p29);
end;

function u1.WorldHeightToScreenHeight(p33, p34) -- Line: 99
    -- upvalues: u1 (copy)
    local v35 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v36 = math.tan(v35);

    return -(p33 * u1.ViewSizeY()) / (v36 * 2 * p34);
end;

function u1.GetDepthForWidth(p37, p38) -- Line: 107
    -- upvalues: u1 (copy)
    local v39 = u1.AspectRatio();
    local v40 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v41 = v39 * math.tan(v40);
    local v42 = u1.ViewSizeX();
    u1.ViewSizeY();

    return -(v42 * p38) / (p37 * 2 * v41);
end;

function u1.GetDepthForHeight(p43, p44) -- Line: 115
    -- upvalues: u1 (copy)
    local v45 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v46 = math.tan(v45);

    return -(u1.ViewSizeY() * p44) / (p43 * 2 * v46);
end;

function u1.ScreenToWorldByHeightDepth(p47, p48, p49, p50) -- Line: 125
    -- upvalues: u1 (copy)
    local v51 = u1.AspectRatio();
    local v52 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v53 = math.tan(v52);
    local v54 = u1.ViewSizeX();
    local v55 = u1.ViewSizeY();

    return Vector3.new((p47 / v54 * 2 - 1) * -(v51 * v53) * p50, (p48 / v55 * 2 - 1) * v53 * p50, p50), -(p49 / v55) * 2 * v53 * p50;
end;

function u1.ScreenToWorldByWidthDepth(p56, p57, p58, p59) -- Line: 143
    -- upvalues: u1 (copy)
    local v60 = u1.AspectRatio();
    local v61 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v62 = math.tan(v61);
    local v63 = v60 * v62;
    local v64 = u1.ViewSizeX();
    local v65 = u1.ViewSizeY();

    return Vector3.new((p56 / v64 * 2 - 1) * -v63 * p59, (p57 / v65 * 2 - 1) * v62 * p59, p59), p58 / v64 * 2 * -v63 * p59;
end;

function u1.ScreenToWorldByHeight(p66, p67, p68, p69) -- Line: 161
    -- upvalues: u1 (copy)
    local v70 = u1.AspectRatio();
    local v71 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v72 = math.tan(v71);
    local v73 = u1.ViewSizeX();
    local v74 = u1.ViewSizeY();
    local v75 = -(v74 * p69) / (p68 * 2 * v72);

    return Vector3.new((p66 / v73 * 2 - 1) * -(v70 * v72) * v75, (p67 / v74 * 2 - 1) * v72 * v75, v75);
end;

function u1.ScreenToWorldByWidth(p76, p77, p78, p79) -- Line: 179
    -- upvalues: u1 (copy)
    local v80 = u1.AspectRatio();
    local v81 = math.rad(Workspace.CurrentCamera.FieldOfView) / 2;
    local v82 = math.tan(v81);
    local v83 = v80 * v82;
    local v84 = u1.ViewSizeX();
    local v85 = u1.ViewSizeY();
    local v86 = -(v84 * p79) / (p78 * 2 * v83);

    return Vector3.new((p76 / v84 * 2 - 1) * -v83 * v86, (p77 / v85 * 2 - 1) * v82 * v86, v86);
end;

return u1;