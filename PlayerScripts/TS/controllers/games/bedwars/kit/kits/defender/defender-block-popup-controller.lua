-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "DefenderPopupController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "DefenderPopupController";
    p6.popup = nil;
    p6.refundProgressFrame = nil;
    p6.refundProgressFill = nil;
    p6.refundProgressBlocksText = nil;
    p6.refundProgressRewardText = nil;
    p6.refundProgressRewardIcon = nil;
end;

function u4.KnitStart(p7) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.showPopup(p8) -- Line: 43
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    if not p8.popup then
        p8.popup = ReplicatedStorage.Assets.Misc.DefenderBlockPopup:Clone();
        p8.popup.Parent = Workspace;
    end;

    p8.popup.BillboardGui.Enabled = true;
end;

function u4.hidePopup(p9) -- Line: 50
    if p9.popup then
        p9.popup.BillboardGui.Enabled = false;
    end;
end;

function u4.updatePopup(p10, p11, p12, p13) -- Line: 55
    -- upvalues: Players (copy), KnitClient2 (copy), ReplicatedStorage (copy), Workspace (copy), ItemType (copy), BedwarsShop (copy), InventoryUtil (copy), getItemMeta (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot();
    end;

    if not Character then
        return nil;
    end;

    local v14 = KnitClient2.Controllers.DefenderKitController:getBlockCostFromBlock(p11);
    local v15 = not v14;

    if v15 then
        local v16;

        if p13 == nil then
            v16 = p13;
        else
            v16 = p13.price;
        end;

        v15 = v16 == nil or p13.currency == nil;
    end;

    if v15 then
        return nil;
    end;

    local v17;

    if p13 == nil then
        v17 = p13;
    else
        v17 = p13.price;
    end;

    if v17 == nil then
        v17 = v14.price;
    end;

    local v18;

    if p13 == nil then
        v18 = p13;
    else
        v18 = p13.currency;
    end;

    if v18 == nil then
        v18 = v14.currency;
    end;

    if not p10.popup then
        p10.popup = ReplicatedStorage.Assets.Misc.DefenderBlockPopup:Clone();
        p10.popup.Parent = Workspace;
    end;

    local v19;

    if p11 == ItemType.WOOL_WHITE then
        local v20 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v20 then
            p11 = BedwarsShop.getTeamWoolById(v20.id) or ItemType.WOOL_WHITE;
        end;

        local v21;

        if p13 == nil then
            v21 = p13;
        else
            v21 = p13.price;
        end;

        v19 = v21 == nil;

        if v19 then
            local v22;

            if p13 == nil then
                v22 = p13;
            else
                v22 = p13.currency;
            end;

            v19 = v22 == nil;
        end;
    else
        v19 = false;
    end;

    local v23;

    if p13 == nil then
        v23 = p13;
    else
        v23 = p13.canAfford;
    end;

    if v23 == nil then
        v23 = InventoryUtil.hasEnough(Players.LocalPlayer, v18, v17);
    end;

    local v24;

    if p13 == nil then
        v24 = p13;
    else
        v24 = p13.backgroundColor3;
    end;

    if v24 == nil then
        if v23 or v19 then
            v24 = Color3.fromRGB(65, 144, 255);
        else
            v24 = Color3.fromRGB(200, 44, 55);
        end;
    end;

    p10.popup.BillboardGui.Cost.BackgroundColor3 = v24;
    local v25;

    if v19 then
        v25 = "FREE";
    else
        local v26;

        if p13 == nil then
            v26 = p13;
        else
            v26 = p13.pricePrefix;
        end;

        v25 = (v26 == nil and "" or v26) .. p10:formatAmount(v17);
    end;

    p10.popup.BillboardGui.Cost.Price.Text = v25;
    local v27;

    if v19 then
        v27 = "";
    else
        local image = getItemMeta(v18).image;
        v27 = image == nil and "" or image;
    end;

    p10.popup.BillboardGui.Cost.CurrencyIcon.Image = v27;
    local v28;

    if p13 == nil then
        v28 = p13;
    else
        v28 = p13.refundProgress;
    end;

    p10.popup.BillboardGui.Cost.Visible = v28 == nil;
    local image = getItemMeta(p11).image;
    p10.popup.BillboardGui.BlockRender.Image = image == nil and "" or image;
    local displayName = getItemMeta(p11).displayName;
    local v29;

    if p13 == nil then
        v29 = p13;
    else
        v29 = p13.blockCount;
    end;

    local BlockName = p10.popup.BillboardGui.BlockName;

    if v29 ~= nil then
        displayName = displayName .. " x" .. tostring(p13.blockCount);
    end;

    BlockName.Text = displayName;

    if p13 ~= nil then
        p13 = p13.refundProgress;
    end;

    p10:updateRefundProgress(p13, {
        amount = v17,
        currency = v18
    });
    p10.popup:PivotTo(CFrame.new(p12));
    p10:showPopup();
end;

function u4.formatAmount(p30, p31) -- Line: 194
    if p31 % 1 == 0 then
        return tostring(p31);
    end;

    return string.format("%.2f", p31);
end;

function u4.updateRefundProgress(p32, p33, p34) -- Line: 200
    -- upvalues: getItemMeta (copy)
    if not p33 then
        if p32.refundProgressFrame then
            p32.refundProgressFrame.Visible = false;
        end;

        return nil;
    end;

    p32:getRefundProgressFrame().Visible = true;

    if p32.refundProgressFill then
        p32.refundProgressFill.Size = UDim2.fromScale(math.clamp(p33.progress, 0, 1), 1);
    end;

    if p32.refundProgressBlocksText then
        p32.refundProgressBlocksText.Text = p33.blocksUntilNextRefund <= 1 and "Next block" or tostring(p33.blocksUntilNextRefund) .. " blocks left";
    end;

    if p32.refundProgressRewardText then
        p32.refundProgressRewardText.Text = "+" .. p32:formatAmount(p34.amount);
    end;

    if p32.refundProgressRewardIcon then
        local image = getItemMeta(p34.currency).image;
        p32.refundProgressRewardIcon.Image = image == nil and "" or image;
    end;
end;

function u4.getRefundProgressFrame(p35) -- Line: 226
    -- upvalues: u2 (copy)
    if p35.refundProgressFrame then
        return p35.refundProgressFrame;
    end;

    local v36 = u2("Frame", {
        Name = "RefundProgress",
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 5,
        Parent = p35.popup.BillboardGui,
        Size = UDim2.fromScale(0.62, 0.13),
        Position = UDim2.fromScale(0.5, 0.92),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(18, 25, 30)
    });
    u2("UICorner", {
        Parent = v36,
        CornerRadius = UDim.new(0, 4)
    });
    u2("UIStroke", {
        Transparency = 0.35,
        Thickness = 1,
        Parent = v36,
        Color = Color3.fromRGB(235, 255, 238)
    });
    p35.refundProgressFill = u2("Frame", {
        Name = "Fill",
        BorderSizePixel = 0,
        ZIndex = 6,
        Parent = v36,
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Color3.fromRGB(68, 190, 108)
    });
    u2("UICorner", {
        Parent = p35.refundProgressFill,
        CornerRadius = UDim.new(0, 4)
    });
    local v37 = u2("Frame", {
        Name = "Content",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 7,
        Parent = v36,
        Size = UDim2.fromScale(0.82, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
    u2("UIListLayout", {
        Parent = v37,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.04, 0)
    });
    p35.refundProgressBlocksText = u2("TextLabel", {
        Name = "BlocksText",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        RichText = false,
        TextScaled = true,
        TextStrokeTransparency = 0.65,
        ZIndex = 7,
        Parent = v37,
        Size = UDim2.fromScale(0.6, 1),
        Font = Enum.Font.Roboto,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right
    });
    local v38 = u2("Frame", {
        Name = "Reward",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        ZIndex = 7,
        Parent = v37,
        Size = UDim2.fromScale(0.3, 1)
    });
    p35.refundProgressRewardText = u2("TextLabel", {
        Name = "RewardText",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        RichText = false,
        TextScaled = true,
        TextStrokeTransparency = 0.65,
        ZIndex = 8,
        Parent = v38,
        Size = UDim2.fromScale(0.5, 0.9),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Font = Enum.Font.Roboto,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right
    });
    p35.refundProgressRewardIcon = u2("ImageLabel", {
        Name = "RewardIcon",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 8,
        Parent = v38,
        Size = UDim2.fromScale(0.48, 0.9),
        Position = UDim2.fromScale(0.72, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit
    });
    p35.refundProgressFrame = v36;

    return v36;
end;

KnitClient.CreateController(u4.new());

return nil;