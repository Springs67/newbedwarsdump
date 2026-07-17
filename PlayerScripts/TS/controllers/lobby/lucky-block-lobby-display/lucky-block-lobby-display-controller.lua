-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local LuckyBlockRotationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-rotation-util").LuckyBlockRotationUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "LuckyBlockLobbyDisplayController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "LuckyBlockLobbyDisplayController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), CollectionService (copy)
    KnitController.KnitStart(u5);

    local function _(p6) -- Line: 30
        -- upvalues: u5 (copy)
        if p6:IsA("Model") and p6.PrimaryPart then
            u5:setUpLuckyBlockTextures(p6.PrimaryPart);
        end;
    end;

    for i, v in CollectionService:GetTagged("LuckyBlockDisplay") do
        local _ = i - 1;

        if v:IsA("Model") and v.PrimaryPart then
            u5:setUpLuckyBlockTextures(v.PrimaryPart);
        end;
    end;

    CollectionService:GetInstanceAddedSignal("LuckyBlockDisplay"):Connect(function(p7) -- Line: 38
        -- upvalues: u5 (copy)
        if p7:IsA("Model") and p7.PrimaryPart then
            u5:setUpLuckyBlockTextures(p7.PrimaryPart);
        end;
    end);
end;

function u2.setUpLuckyBlockTextures(p8, p9) -- Line: 44
    -- upvalues: LuckyBlockRotationUtil (copy), u1 (copy)
    local v10 = LuckyBlockRotationUtil.getCurrentRotation();
    local v11 = LuckyBlockRotationUtil.getLuckyBlockTextures(v10);

    if not v11 then
        return nil;
    end;

    local function _(p12) -- Line: 51
        if p12:IsA("Texture") and p12.Name == "Normal" then
            p12:Destroy();
        end;
    end;

    for i, child in p9:GetChildren() do
        local _ = i - 1;

        if child:IsA("Texture") and child.Name == "Normal" then
            child:Destroy();
        end;
    end;

    u1("Texture", {
        Name = "Top",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Top,
        Texture = v11[1],
        Parent = p9
    });
    local v13 = {
        Name = "Bottom",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Bottom
    };
    local v14;

    if #v11 == 1 then
        v14 = v11[1];
    else
        v14 = v11[2];
    end;

    v13.Texture = v14;
    v13.Parent = p9;
    u1("Texture", v13);
    local v15 = {
        Name = "Left",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Left
    };
    local v16;

    if #v11 == 1 then
        v16 = v11[1];
    else
        v16 = v11[3];
    end;

    v15.Texture = v16;
    v15.Parent = p9;
    u1("Texture", v15);
    local v17 = {
        Name = "Front",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Front
    };
    local v18;

    if #v11 == 1 then
        v18 = v11[1];
    else
        v18 = v11[4];
    end;

    v17.Texture = v18;
    v17.Parent = p9;
    u1("Texture", v17);
    local v19 = {
        Name = "Right",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Right
    };
    local v20;

    if #v11 == 1 then
        v20 = v11[1];
    else
        v20 = v11[5];
    end;

    v19.Texture = v20;
    v19.Parent = p9;
    u1("Texture", v19);
    local v21 = {
        Name = "Back",
        StudsPerTileU = 6,
        StudsPerTileV = 6,
        Face = Enum.NormalId.Back
    };
    local v22;

    if #v11 == 1 then
        v22 = v11[1];
    else
        v22 = v11[6];
    end;

    v21.Texture = v22;
    v21.Parent = p9;
    u1("Texture", v21);
end;

KnitClient.CreateController(u2.new());

return nil;