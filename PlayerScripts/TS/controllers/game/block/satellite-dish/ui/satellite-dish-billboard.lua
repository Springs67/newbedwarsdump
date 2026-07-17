-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local DisruptorBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "disruptor-balance").DisruptorBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function u12(p4) -- Line: 18
    -- upvalues: DisruptorBalance (copy), Workspace (copy)
    local v5 = p4:GetAttribute("DisruptorActivation");

    if v5 == nil then
        v5 = false;
    end;

    local v6 = p4:GetAttribute("DisruptorShopTaxMaxChargeSeconds");

    if v6 == nil then
        v6 = DisruptorBalance.SHOP_TAX_ACTIVE_DURATION_SECONDS;
    end;

    local v7 = p4:GetAttribute("DisruptorShopTaxChargeSeconds");

    if v7 == nil then
        v7 = v6;
    end;

    local v8 = p4:GetAttribute("DisruptorShopTaxChargeUpdatedAt");

    if v8 == nil then
        v8 = Workspace:GetServerTimeNow();
    end;

    local v9 = Workspace:GetServerTimeNow() - v8;
    local v10 = math.max(0, v9);
    local v11;

    if v5 then
        v11 = math.max(0, v7 - v10);
    else
        v11 = math.min(v6, v7 + v10);
    end;

    return math.clamp(v11 / v6, 0, 1);
end;

return {
    SatelliteDishBillboard = v3.new(u2)(function(u13, p14) -- Line: 43
        -- upvalues: u1 (copy), default (copy), ItemType (copy), DisruptorBalance (copy), u12 (copy), u2 (copy), Empty (copy), Theme (copy)
        local useState = p14.useState;
        local useEffect = p14.useEffect;
        local u15 = 0;
        local u16 = 0;
        local v17, u18 = useState(u15);
        local v19, u20 = useState(u16);
        local v21, u22 = useState(1);
        local v23, u24 = useState(nil);
        useEffect(function() -- Line: 54
            -- upvalues: u1 (ref), default (ref), ItemType (ref), u15 (ref), u18 (copy), u16 (ref), u20 (copy), u13 (copy), u22 (copy), DisruptorBalance (ref), u12 (ref), u24 (copy)
            local u25 = 0;
            local u26 = u1.new();
            u26:GiveTask((default.Client:WaitFor("DisruptionCollect"):expect():Connect(function(p27) -- Line: 57
                -- upvalues: ItemType (ref), u15 (ref), u18 (ref), u16 (ref), u20 (ref)
                if p27.resource ~= ItemType.IRON then
                    if p27.resource == ItemType.EMERALD then
                        u16 = u16 + p27.amount;
                        u20(u16);
                    end;

                    return;
                end;

                u15 = u15 + p27.amount;
                u18(u15);
            end)));
            local u28 = true;
            u26:GiveTask(function() -- Line: 68
                -- upvalues: u28 (ref)
                u28 = false;
            end);
            task.spawn(function() -- Line: 71
                -- upvalues: u28 (ref), u13 (ref), u25 (ref), u22 (ref), DisruptorBalance (ref), u12 (ref)
                while true do
                    local v29 = u28 and task.wait(1);

                    if v29 == 0 or (v29 ~= v29 or not v29) then
                        return;
                    end;

                    local v30 = os.time();
                    local v31 = u13.satelliteInstance:GetAttribute("DisabledEndTime");

                    if v30 <= (v31 == nil and 0 or v31) then
                        u25 = u25 + 1;
                        u22((math.clamp(u25 / DisruptorBalance.SATELLITE_DISABLED_DURATION, 0, 1)));
                    else
                        u22((u12(u13.player)));
                    end;
                end;
            end);
            u26:GiveTask(u13.satelliteInstance:GetAttributeChangedSignal("DisabledEndTime"):Connect(function() -- Line: 90
                -- upvalues: u25 (ref), u13 (ref), u24 (ref), u22 (ref), u12 (ref)
                u25 = 0;
                local u32 = u13.satelliteInstance:GetAttribute("DisabledEndTime");
                local v33 = os.time();

                if u32 ~= nil and v33 <= u32 then
                    u24(u32);
                    task.delay(u32 - v33, function() -- Line: 97
                        -- upvalues: u32 (copy), u13 (ref), u24 (ref), u22 (ref), u12 (ref)
                        if u32 == u13.satelliteInstance:GetAttribute("DisabledEndTime") then
                            u24(nil);
                            u22((u12(u13.player)));
                        end;
                    end);
                end;
            end));

            return function() -- Line: 105
                -- upvalues: u26 (copy)
                u26:Destroy();
            end;
        end, {});
        local v34;

        if v23 == 0 or (v23 ~= v23 or not v23) then
            local v35 = u13.player:GetAttribute("DisruptorShopTaxMaxChargeSeconds");

            if v35 == nil then
                v35 = DisruptorBalance.SHOP_TAX_ACTIVE_DURATION_SECONDS;
            end;

            v34 = math.round(v21 * v35);
        else
            v34 = math.round(DisruptorBalance.SATELLITE_DISABLED_DURATION - v21 * DisruptorBalance.SATELLITE_DISABLED_DURATION);
        end;

        local v36 = math.floor(v34 / 60);

        local function _(p37) -- Line: 123
            if p37 == 0 then
                return "00";
            end;

            if #tostring(p37) > 1 then
                return p37;
            end;

            return "0" .. tostring(p37);
        end;

        local createFragment = u2.createFragment;
        local v38 = {};
        local createElement = u2.createElement;
        local v39 = {
            ExtentsOffset = Vector3.new(0, 3.5, 0),
            MaxDistance = 30,
            Adornee = u13.satelliteInstance,
            Size = UDim2.fromScale(5, 6)
        };
        local v40 = {};
        local createElement2 = u2.createElement;
        local v41 = {
            Image = "rbxassetid://10667281451",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = Color3.fromRGB(0, 255, 204)
        };
        local v42 = {};
        local createElement3 = u2.createElement;
        local v43 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.6),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.7)
        };
        local v44 = {
            InterceptedHeader = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                RichText = true,
                TextScaled = true,
                Text = "<b>" .. ((v23 == 0 or (v23 ~= v23 or not v23)) and "INTERCEPTED" or "DISABLED") .. "</b>",
                Size = UDim2.fromScale(1, 0.225),
                Font = Enum.Font.RobotoMono,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        };
        local createElement4 = u2.createElement;
        local v45 = {
            Size = UDim2.fromScale(1, 0.05),
            Position = UDim2.fromScale(0, 0.25)
        };
        local v46 = {};
        local createElement5 = u2.createElement;
        local v47 = {
            Size = UDim2.fromScale(0.3, 1)
        };
        local v48 = {};
        local createElement6 = u2.createElement;
        local v49 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            RichText = true,
            TextScaled = true
        };

        if v36 == 0 then
            v36 = "00";
        elseif #tostring(v36) <= 1 then
            v36 = "0" .. tostring(v36);
        end;

        local v50 = tostring(v36);
        local v51 = v34 % 60;

        if v51 == 0 then
            v51 = "00";
        elseif #tostring(v51) <= 1 then
            v51 = "0" .. tostring(v51);
        end;

        v49.Text = "<b>" .. v50 .. ":" .. tostring(v51) .. "</b>";
        v49.Size = UDim2.fromScale(1.75, 1.75);
        v49.Position = UDim2.fromScale(0.5, 0.5);
        v49.AnchorPoint = Vector2.new(0.5, 0.5);
        v49.TextXAlignment = Enum.TextXAlignment.Center;
        v49.TextYAlignment = Enum.TextYAlignment.Center;
        v49.Font = Enum.Font.RobotoMono;
        v49.TextColor3 = Color3.fromRGB(255, 255, 255);
        v48.InterceptedHeader = createElement6("TextLabel", v49);
        local v52 = createElement5(Empty, v47, v48);
        local createElement7 = u2.createElement;
        local v53 = {
            BorderSizePixel = 0,
            BackgroundColor3 = Theme.Gray,
            Size = UDim2.fromScale(0.7, 1),
            Position = UDim2.fromScale(0.3, 0)
        };
        local v54 = {};
        local createElement8 = u2.createElement;
        local v55 = {
            BorderSizePixel = 0
        };
        local v56;

        if v23 == 0 or (v23 ~= v23 or not v23) then
            v56 = Color3.fromRGB((1 - v21) * 205 + 50, v21 * 205 + 50, 50);
        else
            v56 = Color3.fromRGB(255, 54, 54);
        end;

        v55.BackgroundColor3 = v56;
        v55.Size = UDim2.fromScale(v21, 1);
        v54[1] = createElement8("Frame", v55);
        v46[1], v46[2] = v52, createElement7("Frame", v53, v54);
        v44[1] = createElement4(Empty, v45, v46);
        v44.InterceptedContainer = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.725),
            Position = UDim2.fromScale(0, 0.3725)
        }, {
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.15, 0)
            }),
            IronIntercepted = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.35)
            }, {
                IronIcon = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://6850537969",
                    BackgroundTransparency = 0.75,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.4, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement("UIStroke", {
                        Thickness = 1,
                        Transparency = 0.75
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }) }),
                IronCounter = u2.createElement("TextLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    Text = "x<b>" .. tostring(v17) .. "</b>",
                    Position = UDim2.fromScale(0.4, 0.15),
                    Size = UDim2.fromScale(0.6, 0.8),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.RobotoMono
                })
            }),
            EmeraldsIntercepted = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.35),
                Position = UDim2.fromScale(0, 0.4)
            }, {
                EmeraldIcon = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://6850538075",
                    BackgroundTransparency = 0.75,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.4, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement("UIStroke", {
                        Thickness = 1,
                        Transparency = 0.75
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }) }),
                EmeraldCounter = u2.createElement("TextLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    Text = "x<b>" .. tostring(v19) .. "</b>",
                    Position = UDim2.fromScale(0.4, 0.15),
                    Size = UDim2.fromScale(0.6, 0.8),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.RobotoMono
                })
            })
        });
        v42.UsableArea = createElement3("Frame", v43, v44);
        v40.BillboardFrame = createElement2("ImageLabel", v41, v42);
        v38.SatelliteBillboard = createElement("BillboardGui", v39, v40);

        return createFragment(v38);
    end)
};