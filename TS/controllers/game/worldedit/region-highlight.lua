-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "RegionHighlight";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 13
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, p5, p6, p7) -- Line: 17
    p4.extraSizeIncrement = 0;
    local v8;

    if p7 == nil then
        v8 = p7;
    else
        v8 = p7.extraSizeIncrement;
    end;

    if v8 ~= 0 and (v8 == v8 and v8) then
        local v9;

        if p7 == nil then
            v9 = p7;
        else
            v9 = p7.extraSizeIncrement;
        end;

        p4.extraSizeIncrement = v9;
    end;

    local v10 = p4:create(p5, p6, p7);
    local selectionBox = v10.selectionBox;
    local decals = v10.decals;
    p4.part = v10.part;
    p4.selectionBox = selectionBox;
    p4.decals = decals;
end;

function u2.updateRegion(p11, p12, p13) -- Line: 38
    p11.part.Size = p11:getRegionSize(p12, p13);
    p11.part.Position = p11:getRegionCenter(p12, p13);
end;

function u2.getPart(p14) -- Line: 42
    return p14.part;
end;

function u2.getSelectionBox(p15) -- Line: 45
    return p15.selectionBox;
end;

function u2.enable(p16) -- Line: 48
    p16.selectionBox.Visible = true;

    local function _(p17) -- Line: 51
        p17.Transparency = 0;

        return p17.Transparency;
    end;

    for i, v in p16.decals do
        local _ = i - 1;
        v.Transparency = 0;
        local _ = v.Transparency;
    end;
end;

function u2.disable(p18) -- Line: 59
    p18.selectionBox.Visible = false;

    local function _(p19) -- Line: 62
        p19.Transparency = 1;

        return p19.Transparency;
    end;

    for i, v in p18.decals do
        local _ = i - 1;
        v.Transparency = 1;
        local _ = v.Transparency;
    end;
end;

function u2.destroy(p20) -- Line: 70
    p20.part:Destroy();
    p20.selectionBox:Destroy();
end;

function u2.create(u21, p22, p23, u24) -- Line: 74
    -- upvalues: Workspace (copy), u1 (copy)
    local v25 = {};
    local v26;

    if u24 == nil then
        v26 = u24;
    else
        v26 = u24.name;
    end;

    v25.Name = v26 == nil and "HighlightBox" or v26;
    v25.Size = u21:getRegionSize(p22, p23);
    v25.Position = u21:getRegionCenter(p22, p23);
    v25.Anchored = true;
    v25.CanCollide = false;
    v25.CanQuery = false;
    v25.CanTouch = false;
    v25.Parent = Workspace;
    v25.Transparency = 1;
    u21.part = u1("Part", v25);
    local v27 = {
        Name = "SelectionBox",
        SurfaceTransparency = 0.7,
        LineThickness = 0.04,
        Transparency = 0.3,
        Adornee = u21.part,
        Parent = u21.part,
        Color3 = Color3.fromRGB(255, 46, 242),
        SurfaceColor3 = Color3.fromRGB(158, 0, 172)
    };
    local v28;

    if u24 == nil then
        v28 = u24;
    else
        v28 = u24.selectionBox;
    end;

    if type(v28) == "table" then
        for i, v in v28 do
            v27[i] = v;
        end;
    end;

    u21.selectionBox = u1("SelectionBox", v27);
    local u29 = {};
    local v30;

    if u24 then
        v30 = u24.decalTexture;
    else
        v30 = u24;
    end;

    if v30 ~= "" and v30 then
        local v31 = Enum.NormalId:GetEnumItems();

        local function v36(p32) -- Line: 119
            -- upvalues: u24 (copy), u21 (copy), u1 (ref), u29 (copy)
            local v33 = {
                Transparency = 0.5,
                Name = "HighlightDecal" .. p32.Name,
                Face = p32,
                Texture = u24.decalTexture
            };
            local v34 = u24;

            if v34 ~= nil then
                v34 = v34.selectionBox;

                if v34 ~= nil then
                    v34 = v34.Color3;
                end;
            end;

            if v34 == nil then
                v34 = Color3.fromRGB(255, 255, 255);
            end;

            v33.Color3 = v34;
            v33.Parent = u21.part;
            local v35 = u1("Decal", v33);
            table.insert(u29, v35);
        end;

        for i, v in v31 do
            v36(v, i - 1, v31);
        end;
    end;

    u21.decals = u29;

    return {
        part = u21.part,
        selectionBox = u21.selectionBox,
        decals = u21.decals
    };
end;

function u2.getRegionSize(p37, p38, p39) -- Line: 154
    local v40 = math.abs(p39.X - p38.X) + p37.extraSizeIncrement;
    local v41 = math.abs(p39.Y - p38.Y) + p37.extraSizeIncrement;
    local v42 = math.abs(p39.Z - p38.Z) + p37.extraSizeIncrement;

    return Vector3.new(v40, v41, v42);
end;

function u2.getRegionCenter(p43, p44, p45) -- Line: 160
    return (p45 + p44) / 2;
end;

return {
    RegionHighlight = u2
};