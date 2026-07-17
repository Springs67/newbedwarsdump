-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v3 = u2.Component:extend("KitShopToolbar");

function v3.init(p4, p5) -- Line: 14
    p4.alive = true;
    p4:setState({
        time = p4:getTime()
    });
end;

function v3.didMount(u6) -- Line: 20
    -- upvalues: RuntimeLib (copy)
    RuntimeLib.Promise.defer(function() -- Line: 21
        -- upvalues: u6 (copy)
        while true do
            local v7 = task.wait(0.2);

            if v7 ~= 0 and (v7 == v7 and v7) then
                v7 = u6.alive;
            end;

            if v7 == 0 or (v7 ~= v7 or not v7) then
                return;
            end;

            u6:setState({
                time = u6:getTime()
            });
        end;
    end);
end;

function v3.willUnmount(p8) -- Line: 36
    p8.alive = false;
end;

function v3.getTime(p9) -- Line: 39
    -- upvalues: DeviceUtil (copy), PlaceUtil (copy), KnitClient (copy), ClanUtil (copy), StringUtil (copy)
    local v10;

    if DeviceUtil.isHoarceKat() then
        v10 = os.time() + 604800;
    elseif PlaceUtil.isLobbyServer() then
        v10 = KnitClient.Controllers.LobbyUpdateCountdownController:getUpdateTime();
    else
        v10 = ClanUtil.resetTime:getNextWeeklyResetTime();
    end;

    local v11 = v10 - os.time();
    local v12 = math.max(0, v11);

    return StringUtil.formatCountdownTime(v12, {
        days = true,
        hours = true,
        seperator = " : "
    });
end;

function v3.render(p13) -- Line: 48
    -- upvalues: u2 (copy), ColorUtil (copy)
    local v14 = "Next free rotation: <font face=\"Roboto\"><b>" .. p13.state.time .. "</b></font>";

    return u2.createElement("Frame", {
        BorderSizePixel = 0,
        Size = p13.props.Size,
        BackgroundColor3 = ColorUtil.hexColor(3092550)
    }, { u2.createElement("TextLabel", {
            Text = "Kit Shop",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextXAlignment = "Left",
            Size = UDim2.fromScale(0.3, 0.5),
            Position = UDim2.fromScale(0.03, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Font = "Roboto",
            TextScaled = true,
            RichText = true,
            TextXAlignment = "Right",
            Text = v14,
            Size = UDim2.fromScale(0.97, 0.4),
            Position = UDim2.fromScale(0.95, 0.5),
            AnchorPoint = Vector2.new(1, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });
end;

return {
    KitShopToolbar = v3
};