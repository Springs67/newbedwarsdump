-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TweenService = v3.TweenService;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local v4 = u2.Component:extend("ShopDisruptionTop");

function v4.init(p5) -- Line: 17
    -- upvalues: u2 (copy)
    p5.disruptionHeader = u2.createRef();
end;

function v4.didMount(p6) -- Line: 20
    -- upvalues: TweenService (copy)
    local v7 = p6.disruptionHeader:getValue();

    if v7 then
        TweenService:Create(v7, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            Size = UDim2.fromScale(1, 0.55)
        }):Play();
    end;
end;

function v4.render(u8) -- Line: 28
    -- upvalues: DeviceUtil (copy), Players (copy), KnitClient (copy), u2 (copy), ColorUtil (copy), Empty (copy)
    local v9 = not DeviceUtil.isHoarceKat();

    if v9 then
        local v10 = Players.LocalPlayer:GetAttribute("DisruptionPriceIncrease");

        if v10 == 0 or v10 ~= v10 then
            v10 = false;
        elseif v10 == "" then
            v10 = false;
        end;

        v9 = not v10;
    end;

    if v9 then
        return nil;
    end;

    local v11;

    if DeviceUtil.isHoarceKat() then
        v11 = "blue";
    else
        v11 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v11 ~= nil then
            v11 = v11.name;
        end;
    end;

    local v12 = {};

    if not DeviceUtil.isHoarceKat() then
        for _, v in Players:GetPlayers() do
            local v13 = v:GetAttribute("DisruptorActivation");

            if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
                v13 = v:GetAttribute("DisruptorTarget") == v11;
            end;

            if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
                table.insert(v12, v);
            end;

            if #v12 >= 3 then
                break;
            end;
        end;
    end;

    local v14 = {
        Size = u8.props.Size
    };
    local v15 = { u2.createElement("ImageLabel", {
            Image = "rbxassetid://11637830425",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        }) };
    local _ = #v15;
    local v16 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 4,
        Size = UDim2.fromScale(1, 1),
        BorderMode = Enum.BorderMode.Inset
    };
    local v17 = { u2.createElement("TextLabel", {
            Text = "<b>▲ YOUR SHOP IS BEING DISRUPTED ▲</b>",
            [u2.Ref] = u8.disruptionHeader,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.25),
            Size = UDim2.fromScale(1, 0.5),
            TextScaled = true,
            RichText = true,
            Font = Enum.Font.RobotoMono,
            TextColor3 = ColorUtil.hexColor(15423319),
            BackgroundTransparency = 1
        }) };

    local function _(p18) -- Line: 97
        -- upvalues: u8 (copy)
        return u8:getNameString(p18);
    end;

    local v19 = table.create(#v12);
    local v20 = {};

    for i, v in v12 do
        local _ = i - 1;
        v19[i] = u8:getNameString(v);
    end;

    v20.Text = "Eliminate <b>" .. table.concat(v19, ", ") .. "</b> to restore prices.";
    v20.AnchorPoint = Vector2.new(0.5, 0.5);
    v20.Position = UDim2.fromScale(0.5, 0.75);
    v20.Size = UDim2.fromScale(1, 0.5);
    v20.TextScaled = true;
    v20.RichText = true;
    v20.Font = Enum.Font.RobotoMono;
    v20.TextColor3 = ColorUtil.hexColor(15423319);
    v20.BackgroundTransparency = 1;
    v20.AutoLocalize = false;
    v17[#v17 + 1] = u2.createElement("TextLabel", v20);
    v15.DisruptionHeader = u2.createElement("Frame", v16, v17);

    return u2.createElement(Empty, v14, v15);
end;

function v4.getNameString(p21, p22) -- Line: 120
    -- upvalues: GamePlayerUtil (copy)
    local v23 = math.round(p22.TeamColor.r * 255);
    local v24 = tostring(v23);
    local v25 = math.round(p22.TeamColor.g * 255);
    local v26 = tostring(v25);
    local v27 = math.round(p22.TeamColor.b * 255);

    return "<font color=\"rgb(" .. v24 .. "," .. v26 .. "," .. tostring(v27) .. ")\">■</font> " .. GamePlayerUtil.getGamePlayer(p22):getDisplayName();
end;

return {
    ShopDisruptionTop = v4
};