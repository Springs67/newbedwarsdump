-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local GoldenGooseConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golden-goose", "golden-goose-constants").GoldenGooseConstants;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GooseWorldIndicatorComponent = v4.new(u3)(function(u6, p7) -- Line: 16
        -- upvalues: Workspace (copy), GoldenGooseConstants (copy), u2 (copy), RunService (copy), KnitClient (copy), Players (copy), u3 (copy), ColorUtil (copy), Theme (copy), ProgressBar (copy)
        local useEffect = p7.useEffect;
        local useState = p7.useState;
        local useBinding = p7.useBinding;
        local v8 = (u6.despawnTime - Workspace:GetServerTimeNow()) / GoldenGooseConstants.GOLDEN_GOOSE_LIFETIME_SEC;
        local v9, u10 = useState((math.clamp(v8, 0, 1)));
        local v11, u12 = useBinding(0);

        local function applyTransparentPercent(p13, p14) -- Line: 24
            return p13 + (1 - p13) * p14;
        end;

        useEffect(function() -- Line: 27
            -- upvalues: u2 (ref), RunService (ref), Workspace (ref), u6 (copy), u12 (copy), u10 (copy), GoldenGooseConstants (ref)
            local u15 = u2.new();
            u15:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 29
                -- upvalues: Workspace (ref), u6 (ref), u12 (ref), u10 (ref), GoldenGooseConstants (ref)
                if Workspace.CurrentCamera and u6.billboardAdornee then
                    u12((math.clamp((300 - (Workspace.CurrentCamera.CFrame.Position - u6.billboardAdornee.Position).Magnitude) / 300, 0, 0.65)));
                end;

                local v16 = (u6.despawnTime - Workspace:GetServerTimeNow()) / GoldenGooseConstants.GOLDEN_GOOSE_LIFETIME_SEC;
                u10((math.clamp(v16, 0, 1)));
            end));

            return function() -- Line: 40
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end, {});
        local v17 = nil;
        local gooseHolderTeamId = u6.gooseHolderTeamId;

        if gooseHolderTeamId ~= "" and gooseHolderTeamId then
            local v18 = KnitClient.Controllers.TeamController:getTeamById(u6.gooseHolderTeamId);

            if v18 then
                v17 = {
                    name = v18.name,
                    color = v18.color
                };
                local v19 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

                if v19 ~= nil then
                    v19 = v19.id;
                end;

                v17.localTeam = v19 == v18.id;
            end;
        end;

        local createElement = u3.createElement;
        local v20 = {
            StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
            AlwaysOnTop = true,
            Size = UDim2.new(1, 60, 0.5, 40),
            SizeOffset = Vector2.new(0, 0.7)
        };
        local v21 = {};
        local createElement2 = u3.createElement;
        local v23 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = v11:map(function(p22) -- Line: 70
                return 0.3 + 0.7 * p22;
            end),
            BackgroundColor3 = Color3.fromRGB(6, 11, 18)
        };
        local v24 = {};
        local v25 = u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 2
        });
        local v26 = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        });
        local v28 = u3.createElement("ImageLabel", {
            Image = "rbxassetid://15378845302",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 2),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = v11:map(function(p27) -- Line: 87
                return 0 + 1 * p27;
            end)
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local createElement3 = u3.createElement;
        local v29 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.7, 1),
            Position = UDim2.fromScale(0.95, 0.5),
            AnchorPoint = Vector2.new(1, 0.5)
        };
        local v30 = {};
        local v31 = u3.createElement("TextLabel", {
            Text = "Golden Goose",
            TextScaled = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.3),
            Position = UDim2.fromScale(0, 0.05),
            TextColor3 = Color3.fromRGB(252, 228, 196),
            FontFace = Font.new("Inter", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left
        });
        local createElement4 = u3.createElement;
        local v32 = {
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1
        };
        local v33;

        if v17 then
            local v34 = ColorUtil.richTextColorWrap(v17.color, v17.name);
            local v35;

            if v17.localTeam then
                v35 = Theme.mcGreen;
            else
                v35 = Theme.mcRed;
            end;

            v33 = v34 .. " " .. ColorUtil.richTextColorWrap(v35, v17.localTeam and "(YOU)" or "(ENEMY)");
        else
            v33 = "Available";
        end;

        v32.Text = v33;
        v32.Size = UDim2.fromScale(1, 0.25);
        v32.Position = UDim2.fromScale(0, 0.35);
        v32.TextColor3 = ColorUtil.hexColor(15461613);
        v32.FontFace = Font.new("Inter", Enum.FontWeight.SemiBold);
        v32.TextXAlignment = Enum.TextXAlignment.Left;
        v30[1], v30[2], v30[3] = v31, createElement4("TextLabel", v32), u3.createElement(ProgressBar, {
    Progress = v9,
    Size = UDim2.fromScale(1, 0.1),
    Position = UDim2.fromScale(0, 0.95),
    AnchorPoint = Vector2.new(0, 1),
    BarColor = Color3.fromRGB(237, 253, 255)
});
        v24[1], v24[2], v24[3], v24[4] = v25, v26, v28, createElement3("Frame", v29, v30);
        v21[1] = createElement2("Frame", v23, v24);

        return createElement("BillboardGui", v20, v21);
    end)
};