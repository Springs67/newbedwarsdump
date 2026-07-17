-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local GameQueryUtil = v1.GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "BillboardRiseController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BillboardRiseController";
end;

function u5.KnitStart(u8) -- Line: 36
    -- upvalues: default (copy)
    default.Client:WaitFor("BillboardRiseEffect"):andThen(function(p9) -- Line: 38
        -- upvalues: u8 (copy)
        p9:Connect(function(p10) -- Line: 39
            -- upvalues: u8 (ref)
            u8:playEffect(p10.position, {
                image = p10.image,
                imageColor = p10.imageColor,
                itemType = p10.itemType,
                size = p10.size
            });
        end);
    end);
end;

function u5.playEffect(p11, p12, p13) -- Line: 50
    -- upvalues: Workspace (copy), u2 (copy), Lighting (copy), GameQueryUtil (copy), u3 (copy), ItemViewport (copy), Empty (copy), Players (copy), TweenService (copy), RuntimeLib (copy)
    if (p12 - Workspace.CurrentCamera.CFrame.Position).Magnitude >= 100 then
        return nil;
    end;

    local v14 = u2("Part", {
        Name = "HarvestCropFloatEffect",
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CFrame = CFrame.new(p12),
        Parent = Lighting
    });
    GameQueryUtil:setQueryIgnored(v14, true);
    local v15 = p13.size or UDim2.fromScale(2.5, 2.5);
    local u16 = u3.createRef();
    local v17 = {
        [u3.Ref] = u16,
        Adornee = v14,
        Size = v15,
        LightInfluence = 0
    };
    local v18 = {};
    local v19 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v20 = {};
    local v21 = #v20;
    local v22;

    if p13.itemType == nil then
        v22 = false;
    else
        v22 = u3.createElement(ItemViewport, {
            ItemType = p13.itemType
        });
    end;

    if v22 then
        v20[v21 + 1] = v22;
    end;

    local v23 = #v20;
    local v24;

    if p13.image == nil then
        v24 = false;
    else
        v24 = u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = p13.image,
            ImageColor3 = p13.imageColor,
            Size = UDim2.fromScale(1, 1)
        });
    end;

    if v24 then
        v20[v23 + 1] = v24;
    end;

    v18[#v18 + 1] = u3.createElement(Empty, v19, v20);
    local u25 = u3.mount(u3.createElement("BillboardGui", v17, v18), Players.LocalPlayer:WaitForChild("PlayerGui"));
    TweenService:Create(u16:getValue(), TweenInfo.new(0.7), {
        StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
    }):Play();
    RuntimeLib.Promise.delay(0.5):andThen(function() -- Line: 107
        -- upvalues: TweenService (ref), u16 (copy)
        TweenService:Create(u16:getValue(), TweenInfo.new(0.2), {
            Size = UDim2.fromScale(0, 0)
        }):Play();
    end);
    RuntimeLib.Promise.delay(1.5):andThen(function() -- Line: 114
        -- upvalues: u3 (ref), u25 (copy)
        u3.unmount(u25);
    end);
end;

return {
    BillboardRiseController = KnitClient.CreateController(u5.new())
};