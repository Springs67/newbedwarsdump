-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v22 = v3.new(u2)(function(p6, p7) -- Line: 20
    -- upvalues: u2 (copy), BedPlatingUtil (copy), TweenService (copy), DeviceUtil (copy), ClientSyncEvents (copy), GamePlayerUtil (copy), Players (copy), SoundManager (copy), GameSound (copy), TopBarCard (copy), BedwarsImageId (copy)
    local _ = p7.useState;
    local useEffect = p7.useEffect;
    local v8 = u2.createRef();
    u2.createRef();
    local u9 = u2.createRef();
    local v10 = p6.BedStatus == BedPlatingUtil.BedStatus.BED_BROKEN;
    local v11 = p6.BedStatus == BedPlatingUtil.BedStatus.BED_PLATING_ACTIVE;
    local v12 = v10 and 0 or p6.BedHealth / p6.MaxBedHealth;
    local v13 = math.floor(v12 * 100);
    local _ = p6.PlatingHealth / p6.MaxPlatingHealth;
    local v14;

    if v12 <= 0.5 then
        v14 = Color3.fromRGB(255, 30, 30):Lerp(Color3.fromRGB(255, 255, 30), v12 * 2);
    else
        v14 = Color3.fromRGB(255, 255, 30):Lerp(Color3.fromRGB(30, 255, 30), v12 * 2);
    end;

    useEffect(function() -- Line: 33
        -- upvalues: TweenService (ref), u9 (copy), DeviceUtil (ref), ClientSyncEvents (ref), GamePlayerUtil (ref), Players (ref), SoundManager (ref), GameSound (ref)
        local u15 = TweenService:Create(u9:getValue(), TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 16.8, 0, 16.8)
        });
        local u16 = TweenService:Create(u9:getValue(), TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 21, 0, 21)
        });

        if not DeviceUtil.isHoarceKat() then
            ClientSyncEvents.BedDamaged:connect(function(p17) -- Line: 41
                -- upvalues: GamePlayerUtil (ref), Players (ref), u15 (copy), u16 (copy), SoundManager (ref), GameSound (ref)
                if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId() == p17.teamId and not p17.platingDamaged then
                    u15:Cancel();
                    u16:Cancel();
                    u15:Play();
                    u15.Completed:Once(function() -- Line: 48
                        -- upvalues: u16 (ref)
                        u16:Play();
                    end);
                    SoundManager:playSound(GameSound.BED_DAMAGED_ALERT);
                    SoundManager:playSound(GameSound.BED_DAMAGED_ALERT_OVERLAY);
                end;
            end);
        end;
    end, {});
    local createElement = u2.createElement;
    local v18 = {
        [u2.Ref] = v8,
        Size = UDim2.new(0, 0, 0, 32),
        Visible = not v10
    };
    local v19 = {};
    local createElement2 = u2.createElement;
    local v20 = {
        [u2.Ref] = u9
    };
    local v21;

    if v11 then
        v21 = BedwarsImageId.BED_PLATING_ACTIVE_ICON;
    else
        v21 = BedwarsImageId.BED_ALIVE_ICON;
    end;

    v20.Image = v21;
    v20.Size = UDim2.new(0, 21, 0, 21);
    v20.AnchorPoint = Vector2.new(0.5, 0.5);
    v20.ScaleType = Enum.ScaleType.Fit;
    v20.BackgroundTransparency = 1;
    v20.BorderSizePixel = 0;
    v19[1], v19[2] = createElement2("ImageLabel", v20), u2.createElement("TextLabel", {
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    TextSize = 16,
    Text = tostring(v13) .. "%",
    AutomaticSize = Enum.AutomaticSize.X,
    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = v14
});

    return createElement(TopBarCard, v18, v19);
end);

return {
    HudBedHealth = v4.connect(function(p23, p24) -- Line: 85
        -- upvalues: DeviceUtil (copy), GamePlayerUtil (copy), Players (copy), getItemMeta (copy), ItemType (copy)
        local v25;

        if DeviceUtil.isHoarceKat() then
            v25 = "1";
        else
            local v26 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
            v25 = v26 == nil and "" or v26;
        end;

        local v27 = p23.Bedwars.bedHealth[v25];
        local v28 = p23.Bedwars.bedPlatingHealth[v25];
        local v29 = p23.Bedwars.teamBedStatus[v25];
        local v30 = {};

        for i, v in p24 do
            v30[i] = v;
        end;

        v30.BedStatus = v29;
        local v31;

        if v27 == nil then
            v31 = v27;
        else
            v31 = v27.maxHealth;
        end;

        if v31 == nil then
            local block = getItemMeta(ItemType.BED).block;

            if block ~= nil then
                block = block.health;
            end;

            v31 = block == nil and 24 or block;
        end;

        v30.MaxBedHealth = v31;

        if v27 ~= nil then
            v27 = v27.health;
        end;

        if v27 == nil then
            local block = getItemMeta(ItemType.BED).block;

            if block ~= nil then
                block = block.health;
            end;

            v27 = block == nil and 24 or block;
        end;

        v30.BedHealth = v27;
        local v32;

        if v28 == nil then
            v32 = v28;
        else
            v32 = v28.maxHealth;
        end;

        v30.MaxPlatingHealth = v32 == nil and 0 or v32;

        if v28 ~= nil then
            v28 = v28.health;
        end;

        v30.PlatingHealth = v28 == nil and 0 or v28;

        return v30;
    end)(v22)
};