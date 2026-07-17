-- Decompiled with Potassium's decompiler.

local u1 = {
    ["nil"] = 0,
    EnumItem = 4,
    boolean = 1,
    number = 8,
    UDim = 8,
    UDim2 = 16,
    Ray = 24,
    Faces = 6,
    Axes = 6,
    BrickColor = 4,
    Color3 = 12,
    Vector2 = 8,
    Vector3 = 12,
    Instance = 4,
    Vector2int16 = 4,
    Vector3int16 = 6,
    NumberSequenceKeypoint = 12,
    ColorSequenceKeypoint = 16,
    NumberRange = 8,
    Rect = 16,
    PhysicalProperties = 20,
    Color3uint8 = 3
};
local u2 = {
    [CFrame.Angles(0, 0, 0)] = true,
    [CFrame.Angles(0, 3.141592653589793, 0)] = true,
    [CFrame.Angles(1.5707963267948966, 0, 0)] = true,
    [CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0)] = true,
    [CFrame.Angles(0, 3.141592653589793, 3.141592653589793)] = true,
    [CFrame.Angles(0, 0, 3.141592653589793)] = true,
    [CFrame.Angles(-1.5707963267948966, 0, 0)] = true,
    [CFrame.Angles(1.5707963267948966, 3.141592653589793, 0)] = true,
    [CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)] = true,
    [CFrame.Angles(0, 0, -1.5707963267948966)] = true,
    [CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)] = true,
    [CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)] = true,
    [CFrame.Angles(0, 0, 1.5707963267948966)] = true,
    [CFrame.Angles(0, -3.141592653589793, -1.5707963267948966)] = true,
    [CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)] = true,
    [CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)] = true,
    [CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0)] = true,
    [CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)] = true,
    [CFrame.Angles(0, -1.5707963267948966, 0)] = true,
    [CFrame.Angles(0, 1.5707963267948966, 0)] = true,
    [CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)] = true,
    [CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)] = true,
    [CFrame.Angles(0, 1.5707963267948966, 3.141592653589793)] = true,
    [CFrame.Angles(0, -1.5707963267948966, 3.141592653589793)] = true
};

local function GetVLQSize(p3, p4) -- Line: 74
    local v5 = math.log(p4 + p3, 128);
    local v6 = math.ceil(v5);

    return math.max(v6, p3);
end;

local function GetDataByteSize(p7, p8) -- Line: 78
    -- upvalues: u1 (copy), GetDataByteSize (copy), u2 (copy)
    local v9 = typeof(p7);

    if u1[v9] then
        return u1[v9];
    end;

    if v9 == "string" or v9 == "buffer" then
        local v10 = v9 == "string" and #p7 or buffer.len(p7);
        local v11 = math.log(v10 + 1, 128);
        local v12 = math.ceil(v11);

        return math.max(v12, 1) + v10;
    end;

    if v9 == "table" then
        if p8[p7] then
            return 0;
        end;

        p8[p7] = true;
        local v13 = p7[1] ~= nil;
        local v14 = 1;
        local v15 = 0;
        local v16 = 0;

        for i, v in next, p7 do
            v14 = v14 + 1;

            if not v13 then
                v16 = v16 + (GetDataByteSize(i, p8) + 1);
            end;

            v15 = v15 + (GetDataByteSize(v, p8) + 1);
        end;

        if v13 then
            local v17 = math.log(v14 + 1, 128);
            local v18 = math.ceil(v17);

            return math.max(v18, 1) + v15;
        end;

        local v19 = math.log(v14 + 1, 128);
        local v20 = math.ceil(v19);

        return math.max(v20, 1) + v16 + v15;
    end;

    if v9 ~= "CFrame" then
        if v9 ~= "NumberSequence" and v9 ~= "ColorSequence" then
            warn("[PacketSizeCounter]: Unsupported data type: " .. v9);

            return 0;
        end;

        local v21 = 4;

        for _, v in next, p7.Keypoints do
            v21 = v21 + GetDataByteSize(v, p8);
        end;

        return v21;
    end;

    local v22 = false;

    for i in next, u2 do
        if i == p7.Rotation then
            v22 = true;
            break;
        end;
    end;

    return v22 and 13 or 19;
end;

local v27 = {
    BaseRemoteOverhead = 9,
    RemoteFunctionOverhead = 2,
    ClientToServerOverhead = 5,
    TypeOverhead = 1,

    GetPacketSize = function(p23) -- Line: 173, Name: GetPacketSize
        -- upvalues: GetDataByteSize (copy)
        local v24 = 9;

        if p23.RemoteType == "RemoteFunction" then
            v24 = v24 + 2;
        end;

        if p23.RunContext == "Client" then
            v24 = v24 + 5;
        end;

        local v25 = {};

        for _, v in ipairs(p23.PacketData) do
            v24 = v24 + (GetDataByteSize(v, v25) + 1);
        end;

        return v24;
    end,

    GetDataByteSize = function(p26) -- Line: 195, Name: GetDataByteSize
        -- upvalues: GetDataByteSize (copy)
        return GetDataByteSize(p26, {}) + 1;
    end
};
table.freeze(v27);

return v27;