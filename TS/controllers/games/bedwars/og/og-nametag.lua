-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;

return {
    OGNameTag = v2.new(u1)(function(u4, p5) -- Line: 10
        -- upvalues: u1 (copy), CollectionService (copy), Players (copy), GamePlayerUtil (copy), KnitClient (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(u4.EntityInstance.Name);
        local v8, u9 = useState(Color3.fromRGB(255, 255, 255));
        local u10 = u1.createRef();
        useEffect(function() -- Line: 16
            -- upvalues: u10 (copy), CollectionService (ref), u4 (copy), Players (ref), u7 (copy), GamePlayerUtil (ref)
            local u11 = u10:getValue();
            local u12;

            if u11 then
                CollectionService:AddTag(u11, "EntityNameTag");
                u11.Adornee = u4.EntityInstance.Head;
                u12 = u4.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() -- Line: 22
                    -- upvalues: u4 (ref), u11 (copy)
                    local v13 = u4.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace");

                    if v13 then
                        u11.StudsOffsetWorldSpace = v13;
                    end;
                end);
            else
                u12 = nil;
            end;

            local u14 = Players:GetPlayerFromCharacter(u4.EntityInstance);

            if u14 then
                task.spawn(function() -- Line: 31
                    -- upvalues: u7 (ref), GamePlayerUtil (ref), u14 (copy)
                    u7(GamePlayerUtil.getGamePlayer(u14):getDisplayName());
                    u14:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(p15) -- Line: 34
                        -- upvalues: GamePlayerUtil (ref), u14 (ref), u7 (ref)
                        u7(GamePlayerUtil.getGamePlayer(u14):getDisplayName());
                    end);
                end);
            end;

            return function() -- Line: 40
                -- upvalues: u12 (ref)
                u12:Disconnect();
            end;
        end, {});
        useEffect(function() -- Line: 44
            -- upvalues: u4 (copy), KnitClient (ref), u9 (copy)
            local function _() -- Line: 45
                -- upvalues: u4 (ref), KnitClient (ref), u9 (ref)
                local v16 = u4.EntityInstance:GetAttribute("Team");
                local v17 = v16 ~= "" and (v16 and KnitClient.Controllers.TeamController:getTeamById(v16));

                if v17 then
                    u9(v17.color);
                end;
            end;

            local v18 = u4.EntityInstance:GetAttribute("Team");
            local v19 = v18 ~= "" and (v18 and KnitClient.Controllers.TeamController:getTeamById(v18));

            if v19 then
                u9(v19.color);
            end;

            u4.EntityInstance:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 55
                -- upvalues: u4 (ref), KnitClient (ref), u9 (ref)
                local v20 = u4.EntityInstance:GetAttribute("Team");
                local v21 = v20 ~= "" and (v20 and KnitClient.Controllers.TeamController:getTeamById(v20));

                if v21 then
                    u9(v21.color);
                end;
            end);
        end, {});

        return u1.createFragment({
            Nametag = u1.createElement("BillboardGui", {
                Size = UDim2.fromScale(5, 0.65),
                StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0),
                AlwaysOnTop = true,
                MaxDistance = 150,
                ResetOnSpawn = false,
                AutoLocalize = false,
                [u1.Ref] = u10
            }, {
                DisplayNameContainer = u1.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.75,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.8, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    DisplayName = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        AutoLocalize = false,
                        TextYAlignment = "Center",
                        TextXAlignment = "Center",
                        LayoutOrder = 3,
                        Text = v6,
                        Size = UDim2.fromScale(0.8, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextColor3 = v8,
                        Font = Enum.Font.GothamMedium
                    })
                })
            })
        });
    end)
};