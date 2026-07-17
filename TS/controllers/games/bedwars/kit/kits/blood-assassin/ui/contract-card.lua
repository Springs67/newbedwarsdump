-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local Workspace = v5.Workspace;
local BedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").BedwarsClassMeta;
local BloodAssassinUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").BloodAssassinUtil;
local BloodUpgradeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade-meta").BloodUpgradeMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;

return {
    ContractCard = v4.new(u3)(function(u6, p7) -- Line: 19
        -- upvalues: getItemMeta (copy), ItemType (copy), BedwarsClassMeta (copy), KnitClient (copy), BloodUpgradeMeta (copy), Workspace (copy), BloodAssassinUtil (copy), u2 (copy), Players (copy), ColorUtil (copy), u3 (copy), GamePlayerUtil (copy), Empty (copy)
        local useEffect = p7.useEffect;
        local useState = p7.useState;
        local image = getItemMeta(ItemType.WOOD_SWORD).image;
        local v8 = image == nil and "" or image;

        if u6.ContractInfo.rewardExplanation.assassin then
            v8 = "rbxassetid://12518331579";
        else
            local kitClass = u6.ContractInfo.rewardExplanation.kitClass;

            if kitClass == 0 or (kitClass ~= kitClass or not kitClass) then
                if u6.ContractInfo.rewardExplanation.gear then
                    local image2 = getItemMeta(u6.ContractInfo.rewardExplanation.gear).image;
                    v8 = image2 == nil and "" or image2;
                end;
            else
                v8 = BedwarsClassMeta[u6.ContractInfo.rewardExplanation.kitClass].imageId;
            end;
        end;

        local v9;

        if u6.ContractInfo.target == nil then
            v9 = nil;
        else
            v9 = KnitClient.Controllers.TeamController:getPlayerTeam(u6.ContractInfo.target);
        end;

        local v10 = BloodUpgradeMeta[u6.ContractInfo.rewardUpgrade];
        local v11, u12 = useState("0 blocks away");
        local v13 = math;
        local activationTime = u6.ContractInfo.activationTime;

        if activationTime == nil then
            activationTime = Workspace:GetServerTimeNow();
        end;

        local v14 = activationTime + BloodAssassinUtil.ABANDON_TIME_SEC - Workspace:GetServerTimeNow();
        local u15, u16 = useState((v13.round(v14)));
        useEffect(function() -- Line: 50
            -- upvalues: u2 (ref), u6 (copy), Workspace (ref), u16 (copy), BloodAssassinUtil (ref), Players (ref), u12 (copy)
            local u17 = u2.new();
            local u18 = true;
            task.spawn(function() -- Line: 53
                -- upvalues: u18 (ref), u6 (ref), Workspace (ref), u16 (ref), BloodAssassinUtil (ref), Players (ref), u12 (ref)
                while true do
                    local v19 = task.wait(0.1);

                    if v19 ~= 0 and (v19 == v19 and v19) then
                        v19 = u18;
                    end;

                    if v19 == 0 or (v19 ~= v19 or not v19) then
                        return;
                    end;

                    local v20 = math;
                    local v21 = math;
                    local activationTime2 = u6.ContractInfo.activationTime;

                    if activationTime2 == nil then
                        activationTime2 = Workspace:GetServerTimeNow();
                    end;

                    local v22 = activationTime2 + BloodAssassinUtil.ABANDON_TIME_SEC - Workspace:GetServerTimeNow();
                    local v23 = v21.round(v22);
                    u16((v20.max(0, v23)));

                    if u6.ContractInfo.target then
                        if u6.ContractInfo.target.Parent == Players then
                            local Character = u6.ContractInfo.target.Character;
                            local LocalPlayer = Players.LocalPlayer;

                            if LocalPlayer ~= nil then
                                LocalPlayer = LocalPlayer.Character;
                            end;

                            local v24;

                            if Character == nil then
                                v24 = Character;
                            else
                                v24 = Character.PrimaryPart;
                            end;

                            local v25 = not v24;

                            if not v25 then
                                local v26;

                                if LocalPlayer == nil then
                                    v26 = LocalPlayer;
                                else
                                    v26 = LocalPlayer.PrimaryPart;
                                end;

                                v25 = not v26;
                            end;

                            if v25 then
                                u12("respawning");
                            else
                                local v27 = math.floor((LocalPlayer.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude / 3);
                                u12(tostring(v27) .. " blocks away");
                            end;
                        else
                            u12("0 blocks away");
                        end;
                    end;
                end;
            end);

            return function() -- Line: 104
                -- upvalues: u18 (ref), u17 (copy)
                u18 = false;
                u17:DoCleaning();
            end;
        end, {});
        local v28 = {
            BackgroundTransparency = 0.4,
            Size = u6.Size,
            BackgroundColor3 = ColorUtil.BLACK,
            LayoutOrder = u6.LayoutOrder
        };
        local v29 = {};
        local v30 = #v29;
        local v31;

        if v10.perk == true then
            v31 = u3.createElement("UIStroke", {
                Color = ColorUtil.WHITE
            }, { u3.createElement("UIGradient", {
                    Rotation = -88,
                    Color = ColorSequence.new(ColorUtil.hexColor(15360512), ColorUtil.hexColor(16766464))
                }) });
        else
            v31 = false;
        end;

        if v31 then
            v29[v30 + 1] = v31;
        end;

        local v32 = #v29;
        v29[v32 + 1] = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01592356687898089, 0)
        });
        v29[v32 + 2] = u3.createElement("ImageLabel", {
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.09554140127388536, 0.7605633802816901),
            Image = v8
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v33 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.2760084925690021, 0.7605633802816901)
        };
        local v34 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.035211267605633804, 0)
            }), u3.createElement("TextLabel", {
                LayoutOrder = 0,
                TextScaled = true,
                BackgroundTransparency = 1,
                AutoLocalize = false,
                Text = not u6.ContractInfo.target and "spleenhook" or GamePlayerUtil.getGamePlayer(u6.ContractInfo.target):getDisplayName(),
                Size = UDim2.fromScale(1, 0.37037037037037035),
                Font = Enum.Font.ArialBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE
            }) };
        local v35 = #v34;

        if v9 then
            v9 = u3.createElement("TextLabel", {
                LayoutOrder = 1,
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = string.upper(v9.name) .. " TEAM",
                Size = UDim2.fromScale(1, 0.23148148148148148),
                Font = Enum.Font.ArialBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = v9.color
            });
        end;

        if v9 then
            v34[v35 + 1] = v9;
        end;

        v34[#v34 + 1] = u3.createElement("TextLabel", {
            LayoutOrder = 2,
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = v11,
            Size = UDim2.fromScale(1, 0.23148148148148148),
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.hexColor(9408399)
        });
        v29[v32 + 3] = u3.createElement(Empty, v33, v34);
        local v36 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.3184713375796178, 0.7605633802816901)
        };
        local v37 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.035211267605633804, 0)
            }) };
        local v38 = #v37;
        local v39 = {
            LayoutOrder = 0,
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = string.upper(v10.display),
            Size = UDim2.fromScale(1, 0.37037037037037035),
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Left
        };
        local v40;

        if v10.perk then
            v40 = ColorUtil.WHITE;
        else
            v40 = ColorUtil.hexColor(13158600);
        end;

        v39.TextColor3 = v40;
        local v41 = {};
        local v42 = #v41;
        local v43;

        if v10.perk == true then
            v43 = u3.createElement("UIGradient", {
                Rotation = -88,
                Color = ColorSequence.new(ColorUtil.hexColor(15360512), ColorUtil.hexColor(16766464))
            });
        else
            v43 = false;
        end;

        if v43 then
            v41[v42 + 1] = v43;
        end;

        v37[v38 + 1] = u3.createElement("TextLabel", v39, v41);
        v37[v38 + 2] = u3.createElement("TextLabel", {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            TextWrap = true,
            Text = v10.description(u6.ContractInfo.rewardValue),
            Size = UDim2.fromScale(1, 0.7037037037037037),
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextColor3 = ColorUtil.WHITE,
            TextSize = u6.DescriptionTextSize
        });
        v29[v32 + 4] = u3.createElement(Empty, v36, v37);
        v29[v32 + 5] = u3.createElement(Empty, {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0, 1)
        });
        local createElement = u3.createElement;
        local v44 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(0.22823779193205945, 0.5),
            BackgroundColor3 = ColorUtil.WHITE,

            [u3.Event.MouseButton1Click] = function() -- Line: 250
                -- upvalues: u6 (copy), u15 (copy), KnitClient (ref)
                if u6.ActiveContract then
                    if u15 == 0 then
                        KnitClient.Controllers.BloodAssassinController:updateActiveContract(nil, true);
                    end;

                    return nil;
                end;

                KnitClient.Controllers.BloodAssassinController:updateActiveContract(u6.ContractInfo, true);
            end
        };
        local v45 = {};
        local v46 = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement2 = u3.createElement;
        local v47 = {
            Rotation = -45
        };
        local v48;

        if u6.ActiveContract and u15 > 0 then
            v48 = ColorSequence.new(ColorUtil.hexColor(2105636));
        else
            v48 = ColorSequence.new(ColorUtil.hexColor(16727614), ColorUtil.hexColor(15278112));
        end;

        v47.Color = v48;
        v45[1], v45[2], v45[3] = v46, createElement2("UIGradient", v47), u3.createElement("TextLabel", {
    RichText = true,
    TextScaled = true,
    BackgroundTransparency = 1,
    Position = UDim2.fromScale(0.5, 0.5),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.fromScale(1, 0.45),
    Text = "<b>" .. (not u6.ActiveContract and "ACCEPT" or (u15 == 0 and "DROP" or "DROP " .. tostring(u15) .. "s")) .. "</b>",
    Font = Enum.Font.JosefinSans,
    TextColor3 = ColorUtil.WHITE
});
        v29[v32 + 6] = createElement("ImageButton", v44, v45);

        return u3.createElement("Frame", v28, v29);
    end)
};