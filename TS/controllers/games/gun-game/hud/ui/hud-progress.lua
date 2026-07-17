-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local gunGameStages = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "gun-game", "gun-game-stages").gunGameStages;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v3 = {};
local u4 = setmetatable({}, {
    __index = v3
});
u4.FIRST = 0;
v3[0] = "FIRST";
u4.MIDDLE = 1;
v3[1] = "MIDDLE";
u4.LAST = 2;
v3[2] = "LAST";
local u5 = {
    start = 1,
    progress = 1,
    place = "1st (tied)",
    highlightFirst = true,
    highlightMiddle = false,
    highlightLast = false,
    win = #gunGameStages,
    lastImageId = getItemMeta(gunGameStages[1][1].item).image,
    currentImageId = getItemMeta(gunGameStages[2][1].item).image,
    nextImageId = getItemMeta(gunGameStages[3][1].item).image
};
local u6 = u2.Component:extend("HudProgress");

function u6.init(p7, p8) -- Line: 40
    -- upvalues: u1 (copy), u5 (copy)
    p7.connectionMaid = u1.new();
    p7:setState({
        progress = u5.progress,
        lastImageId = u5.lastImageId,
        currentImageId = u5.currentImageId,
        nextImageId = u5.nextImageId,
        place = u5.place,
        highlightFirst = u5.highlightFirst,
        highlightMiddle = u5.highlightMiddle,
        highlightLast = u5.highlightLast
    });
    p7:listenForProgressUpdates();
    p7:listenForLeaderboardUpdates();
end;

function u6.render(p9) -- Line: 55
    -- upvalues: u2 (copy), u4 (ref)
    return u2.createFragment({
        p9:createStageIndicator(),
        p9:createWeaponLabel(Vector2.new(0.44, 0.06), p9.state.lastImageId, u4.FIRST),
        p9:createWeaponLabel(Vector2.new(0.51, 0.06), p9.state.currentImageId, u4.MIDDLE),
        p9:createWeaponLabel(Vector2.new(0.58, 0.06), p9.state.nextImageId, u4.LAST),
        p9:createPlaceIndicator()
    });
end;

function u6.willUnmount(p10) -- Line: 64
    p10.connectionMaid:DoCleaning();
end;

function u6.createStageIndicator(p11) -- Line: 67
    -- upvalues: ColorUtil (copy), Theme (copy), u2 (copy)
    local v12 = 0.925 * (p11.state.progress / p11.props.win);
    local v13 = ColorUtil.brighten(Theme.backgroundPrimary, 0.3);

    return u2.createFragment({ u2.createElement("Frame", {
            BackgroundTransparency = 0.25,
            Size = UDim2.fromScale(0.19, 0.027),
            Position = UDim2.fromScale(0.41, 0.11),
            BackgroundColor3 = Theme.backgroundPrimary
        }, { u2.createElement("UIStroke", {
                Thickness = 1,
                Color = v13
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.2, 0)
            }), u2.createElement("Frame", {
                Size = UDim2.fromScale(v12, 0.5),
                Position = UDim2.fromScale(0.04, 0.25),
                BackgroundColor3 = v13
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.2, 0)
                }) }) }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextStrokeTransparency = 0,
            RichText = true,
            TextScaled = true,
            ZIndex = 3,
            Position = UDim2.fromScale(0.565, 0.105),
            FontSize = Enum.FontSize.Size28,
            Size = UDim2.fromScale(0.05, 0.05),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            Font = Enum.Font.LuckiestGuy,
            Text = tostring(p11.state.progress) .. " / " .. tostring(p11.props.win)
        }) });
end;

function u6.createPlaceIndicator(p14) -- Line: 111
    -- upvalues: u2 (copy)
    return u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextStrokeTransparency = 0,
        RichText = true,
        Position = UDim2.fromScale(0.51, 0),
        FontSize = Enum.FontSize.Size24,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        Font = Enum.Font.LuckiestGuy,
        Text = p14.state.place
    });
end;

function u6.createWeaponLabel(p15, p16, p17, p18) -- Line: 124
    -- upvalues: u4 (ref), Theme (copy), u2 (copy), ColorUtil (copy)
    local v19;

    if p18 == u4.FIRST then
        v19 = p15.state.highlightFirst;
    else
        v19 = false;
    end;

    local v20;

    if p18 == u4.MIDDLE then
        v20 = p15.state.highlightMiddle;
    else
        v20 = false;
    end;

    local v21;

    if p18 == u4.LAST then
        v21 = p15.state.highlightLast;
    else
        v21 = false;
    end;

    local v22 = {
        transparency = 0.7,
        backgroundColor = Theme.backgroundPrimary,
        strokeColor = Theme.backgroundPrimary,
        size = UDim2.fromScale(0.05, 0.05)
    };

    if v19 or v20 then
        v22.size = UDim2.fromScale(0.07, 0.07);
        v22.transparency = 0;
    end;

    if v21 then
        v22.size = UDim2.fromScale(0.07, 0.07);
        v22.transparency = 0;
        v22.backgroundColor = Color3.new(220, 188, 129);
        v22.strokeColor = Color3.new(220, 188, 129);
    end;

    return u2.createElement("ImageLabel", {
        BackgroundTransparency = 0.5,
        Position = UDim2.fromScale(p16.X, p16.Y),
        Size = v22.size,
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = p17,
        BackgroundColor3 = v22.backgroundColor,
        ImageTransparency = v22.transparency
    }, { u2.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.brighten(v22.strokeColor, 0.3)
        }), u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        }) });
end;

function u6.listenForProgressUpdates(u23) -- Line: 165
    -- upvalues: default (copy), u5 (copy), getItemMeta (copy), gunGameStages (copy)
    local v28 = default.Client:WaitFor("GunGameUpdate"):expect():Connect(function(p24) -- Line: 166
        -- upvalues: u23 (copy), u5 (ref), getItemMeta (ref), gunGameStages (ref)
        local v25, v26, v27;

        if p24.progress == u23.props.start then
            v25 = u5.lastImageId;
            v26 = u5.currentImageId;
            v27 = u5.nextImageId;
            u23:updateHighlightStates(true, false, false);
        elseif p24.progress == u23.props.win then
            v25 = getItemMeta(gunGameStages[p24.progress - 3 + 1][1].item).image;
            v26 = getItemMeta(gunGameStages[p24.progress - 2 + 1][1].item).image;
            v27 = getItemMeta(gunGameStages[p24.progress - 1 + 1][1].item).image;
            u23:updateHighlightStates(false, false, true);
        else
            v25 = getItemMeta(gunGameStages[p24.progress - 2 + 1][1].item).image;
            v26 = getItemMeta(gunGameStages[p24.progress - 1 + 1][1].item).image;
            v27 = getItemMeta(gunGameStages[p24.progress + 1][1].item).image;
            u23:updateHighlightStates(false, true, false);
        end;

        u23:setState({
            progress = p24.progress,
            lastImageId = v25,
            currentImageId = v26,
            nextImageId = v27
        });
    end);
    u23.connectionMaid:GiveTask(v28);
end;

function u6.listenForLeaderboardUpdates(u29) -- Line: 198
    -- upvalues: default (copy)
    local v32 = default.Client:WaitFor("GunGameLeaderboardUpdate"):expect():Connect(function(p30) -- Line: 199
        -- upvalues: u29 (copy)
        local v31 = u29:ordinalSuffix(p30.place);

        if p30.tied then
            v31 = v31 .. " (tied)";
        end;

        u29:setState({
            place = v31
        });
    end);
    u29.connectionMaid:GiveTask(v32);
end;

function u6.ordinalSuffix(p33, p34) -- Line: 210
    local v35 = p34 % 10;
    local v36 = p34 % 100;

    if v35 == 1 and v36 ~= 11 then
        return tostring(p34) .. "st";
    end;

    if v35 == 2 and v36 ~= 12 then
        return tostring(p34) .. "nd";
    end;

    if v35 == 3 and v36 ~= 13 then
        return tostring(p34) .. "rd";
    end;

    return tostring(p34) .. "th";
end;

function u6.updateHighlightStates(p37, p38, p39, p40) -- Line: 224
    p37:setState({
        highlightFirst = p38,
        highlightMiddle = p39,
        highlightLast = p40
    });
end;

return {
    HudProgressWrapper = function() -- Line: 232, Name: HudProgressWrapper
        -- upvalues: u2 (copy), u6 (ref), u5 (copy)
        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(u6, {
                start = u5.start,
                win = u5.win
            }) });
    end,

    HudProgress = u6
};