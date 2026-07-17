-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local Workspace = v5.Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local teamBuffMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SnakeShrineUpgradeDescription = RuntimeLib.import(script, script.Parent, "snake-shrine-upgrade-description").SnakeShrineUpgradeDescription;

return {
    SnakeShrineUpgradeDescriptions = v4.new(u3)(function(u6, p7) -- Line: 25
        -- upvalues: u2 (copy), teamBuffMeta (copy), DeviceUtil (copy), ClientStore (copy), InventoryUtil (copy), Players (copy), ItemType (copy), ColorUtil (copy), default (copy), u3 (copy), BedwarsImageId (copy), Empty (copy), SnakeShrineUpgradeDescription (copy), Workspace (copy), SoundManager (copy), GameSound (copy), Theme (copy), Button (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u2.new();
        local u9 = teamBuffMeta[u6.SelectedTeamBuff];
        local v10 = DeviceUtil.isSmallScreen();
        local _ = (v10 and 12 or 14) * 0.6 * #u9.displayName;
        local u11, u12 = useState(0);
        local v13, u14 = useState(false);

        local function _(p15) -- Line: 34
            -- upvalues: ClientStore (ref), u6 (copy)
            local v16 = math;
            local v17 = ClientStore:getState().SnakeShrine.costMultipliers[u6.SelectedTeamBuff];

            return v16.ceil(p15 * (v17 == nil and 1 or v17));
        end;

        local baseCost = u9.baseCost;
        local v18 = math;
        local v19 = ClientStore:getState().SnakeShrine.costMultipliers[u6.SelectedTeamBuff];
        local v20, u21 = useState((v18.ceil(baseCost * (v19 == nil and 1 or v19))));

        local function _(p22) -- Line: 46
            -- upvalues: DeviceUtil (ref), InventoryUtil (ref), Players (ref), ItemType (ref)
            return DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.DIAMOND, p22);
        end;

        local u23, u24 = useState(DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.DIAMOND, v20));

        local function _(p25) -- Line: 50
            -- upvalues: ColorUtil (ref)
            if p25 then
                return Color3.fromRGB(138, 242, 245);
            end;

            return ColorUtil.darken(Color3.fromRGB(138, 242, 245), 0.2);
        end;

        local v26;

        if u23 then
            v26 = Color3.fromRGB(138, 242, 245);
        else
            v26 = ColorUtil.darken(Color3.fromRGB(138, 242, 245), 0.2);
        end;

        local v27, u28 = useState(v26);

        local function u33() -- Line: 54
            -- upvalues: u9 (copy), ClientStore (ref), u6 (copy)
            local purchaseLimit = u9.purchaseLimit;

            if purchaseLimit ~= nil then
                purchaseLimit = purchaseLimit.activeCountLimit;
            end;

            local v29 = purchaseLimit ~= nil;

            if v29 then
                local activeCountLimit = u9.purchaseLimit.activeCountLimit;
                local v30 = ClientStore:getState().SnakeShrine.activeBuffCounts[u6.SelectedTeamBuff];
                v29 = activeCountLimit <= (v30 == nil and 0 or v30);
            end;

            local purchaseLimit2 = u9.purchaseLimit;

            if purchaseLimit2 ~= nil then
                purchaseLimit2 = purchaseLimit2.totalCountLimit;
            end;

            local v31 = purchaseLimit2 ~= nil;

            if v31 then
                local totalCountLimit = u9.purchaseLimit.totalCountLimit;
                local v32 = ClientStore:getState().SnakeShrine.buffCounts[u6.SelectedTeamBuff];
                v31 = totalCountLimit <= (v32 == nil and 0 or v32);
            end;

            return v29 or v31;
        end;

        local function _() -- Line: 89
            -- upvalues: u9 (copy), ClientStore (ref), u6 (copy)
            local displayName = u9.displayName;
            local v34 = ClientStore:getState().SnakeShrine.activeBuffCounts[u6.SelectedTeamBuff];
            local v35 = v34 == nil and 0 or v34;

            if v35 >= 1 then
                displayName = displayName .. " (Lv. " .. tostring(v35 + 1) .. ")";
            end;

            return displayName;
        end;

        useEffect(function() -- Line: 103
            -- upvalues: u8 (copy), ClientStore (ref), u6 (copy), teamBuffMeta (ref), DeviceUtil (ref), InventoryUtil (ref), Players (ref), ItemType (ref), ColorUtil (ref), u33 (copy), u21 (copy), u24 (copy), u28 (copy), u14 (copy)
            u8:DoCleaning();
            local u44 = ClientStore.changed:connect(function(p36, p37) -- Line: 105
                -- upvalues: u6 (ref), teamBuffMeta (ref), ClientStore (ref), DeviceUtil (ref), InventoryUtil (ref), Players (ref), ItemType (ref), ColorUtil (ref), u33 (ref), u21 (ref), u24 (ref), u28 (ref), u14 (ref)
                if p36.SnakeShrine.costMultipliers[u6.SelectedTeamBuff] ~= p37.SnakeShrine.costMultipliers[u6.SelectedTeamBuff] then
                    local baseCost2 = teamBuffMeta[u6.SelectedTeamBuff].baseCost;
                    local v38 = math;
                    local v39 = ClientStore:getState().SnakeShrine.costMultipliers[u6.SelectedTeamBuff];
                    local v40 = v38.ceil(baseCost2 * (v39 == nil and 1 or v39));
                    local v41 = DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.DIAMOND, v40);
                    local v42;

                    if v41 then
                        v42 = Color3.fromRGB(138, 242, 245);
                    else
                        v42 = ColorUtil.darken(Color3.fromRGB(138, 242, 245), 0.2);
                    end;

                    local v43 = u33();
                    u21(v40);
                    u24(v41);
                    u28(v42);
                    u14(v43);
                end;
            end);
            u8:GiveTask(function() -- Line: 123
                -- upvalues: u44 (copy)
                return u44:disconnect();
            end);
            local baseCost2 = teamBuffMeta[u6.SelectedTeamBuff].baseCost;
            local v45 = math;
            local v46 = ClientStore:getState().SnakeShrine.costMultipliers[u6.SelectedTeamBuff];
            local v47 = v45.ceil(baseCost2 * (v46 == nil and 1 or v46));
            local v48 = DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.DIAMOND, v47);
            local v49;

            if v48 then
                v49 = Color3.fromRGB(138, 242, 245);
            else
                v49 = ColorUtil.darken(Color3.fromRGB(138, 242, 245), 0.2);
            end;

            local v50 = u33();
            u21(v47);
            u24(v48);
            u28(v49);
            u14(v50);

            return function() -- Line: 134
                -- upvalues: u8 (ref)
                return u8:DoCleaning();
            end;
        end, { u6.SelectedTeamBuff });

        local function _() -- Line: 138
            -- upvalues: u23 (copy), default (ref), u6 (copy)
            if not u23 then
                return nil;
            end;

            default.Client:Get("PurchaseSnakeShrineBuff"):SendToServer({
                teamBuff = u6.SelectedTeamBuff
            });
        end;

        local v51;

        if v10 then
            v51 = UDim2.fromOffset(300, 135);
        else
            v51 = UDim2.fromOffset(400, 180);
        end;

        local v52 = {
            BackgroundTransparency = 0.3,
            AnchorPoint = Vector2.new(0, 0)
        };
        local v53;

        if v10 then
            v53 = UDim2.fromScale(0.5, 0.6);
        else
            v53 = UDim2.fromScale(0.5, 0.65);
        end;

        v52.Position = v53;
        v52.Size = v51;
        v52.BackgroundColor3 = ColorUtil.BLACK;

        for i, v in u6.FrameProps do
            v52[i] = v;
        end;

        local v54 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u3.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromHex("#89f692")
            }) };
        local v55 = {
            Position = UDim2.fromScale(-0.05, -0.28)
        };
        local image = u9.image;

        if image == nil then
            image = BedwarsImageId.SNAKE_ICON;
        end;

        v55.Image = image;
        v55.BackgroundTransparency = 1;
        v55.BackgroundColor3 = ColorUtil.BLACK;
        v55.BorderSizePixel = 0;
        v55.Size = UDim2.fromScale(0.35, 0.35);
        v55.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v55.ScaleType = Enum.ScaleType.Fit;
        v55.LayoutOrder = 1;
        v54.BlessingIcon = u3.createElement("ImageLabel", v55, { u3.createElement("UIScale", {
                Scale = 1
            }) });
        local v56 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.925, 0.925)
        };
        local v57 = {};
        local v58 = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        });
        local createElement = u3.createElement;
        local v59 = {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 0.2)
        };
        local v60 = { (u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })) };
        local createElement2 = u3.createElement;
        local v61 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            TextColor3 = Color3.fromHex("#89f692")
        };
        local displayName = u9.displayName;
        local v62 = ClientStore:getState().SnakeShrine.activeBuffCounts[u6.SelectedTeamBuff];
        local v63 = v62 == nil and 0 or v62;

        if v63 >= 1 then
            displayName = displayName .. " (Lv. " .. tostring(v63 + 1) .. ")";
        end;

        v61.Text = displayName;
        v61.TextXAlignment = Enum.TextXAlignment.Left;
        v61.TextYAlignment = Enum.TextYAlignment.Center;
        v61.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v60.TeamBuffName = createElement2("TextLabel", v61, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = v10 and 18 or 24
            }) });
        v57[1], v57[2] = v58, createElement(Empty, v59, v60);
        local v64 = {};
        local description = u9.description;
        v64.Description = description == nil and "" or description;
        v64.LayoutOrder = 4;
        v57[#v57 + 1] = u3.createElement(SnakeShrineUpgradeDescription, v64);
        v54.UseableArea = u3.createElement("Frame", v56, v57);
        local v66 = {
            AnchorPoint = Vector2.new(1, 1),
            Size = UDim2.fromScale(0.45, 0.167),
            Position = UDim2.fromScale(0.965, 0.9),
            Text = "<b>" .. (v13 and "Limit Reached" or tostring(v20) .. " DIAMONDS") .. "</b>",

            OnClick = function() -- Line: 247, Name: OnClick
                -- upvalues: Workspace (ref), u11 (copy), u12 (copy), u23 (copy), default (ref), u6 (copy), SoundManager (ref), GameSound (ref), Theme (ref)
                if Workspace:GetServerTimeNow() > u11 + 0.5 then
                    u12(Workspace:GetServerTimeNow());

                    if u23 then
                        default.Client:Get("PurchaseSnakeShrineBuff"):SendToServer({
                            teamBuff = u6.SelectedTeamBuff
                        });
                    end;

                    local v65;

                    if u23 then
                        v65 = GameSound.UI_CLICK;
                    else
                        v65 = Theme.sound.uiDisabled;
                    end;

                    SoundManager:playSound(v65);
                end;
            end,

            BackgroundColor3 = v27
        };
        local v67 = {};
        local v68 = #v67;

        if u23 then
            u23 = u3.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(v27, 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(v27, 0.9)) }),
                Transparency = NumberSequence.new(0.15)
            });
        end;

        if u23 then
            v67[v68 + 1] = u23;
        end;

        v67[#v67 + 1] = u3.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.brighten(v27, 0.1)
        });
        v54[#v54 + 1] = u3.createElement(Button, v66, v67);

        return u3.createFragment({
            TeamBuffDescription = u3.createElement("Frame", v52, v54)
        });
    end)
};