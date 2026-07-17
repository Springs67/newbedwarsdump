-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SocialConnectionsConnectInfoCard = RuntimeLib.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;

return {
    SocialConnectionsGroup = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: DeviceUtil (copy), KnitClient (copy), ImageId (copy), u2 (copy), ButtonComponent (copy), SoundManager (copy), GameSound (copy), Theme (copy), SocialConnectionsConnectInfoCard (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(false);
        local v8, u9 = useState("");
        useEffect(function() -- Line: 19
            -- upvalues: u4 (copy), DeviceUtil (ref), KnitClient (ref), u9 (copy)
            local u10 = true;

            if not (u4.store.SocialConnections.supportTasks.joinedGroup or DeviceUtil.isHoarceKat()) then
                task.spawn(function() -- Line: 22
                    -- upvalues: KnitClient (ref), u10 (ref), u9 (ref)
                    while true do
                        KnitClient.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p11) -- Line: 26
                            -- upvalues: u10 (ref), u9 (ref)
                            if p11 then
                                u10 = false;
                                u9("");
                            end;
                        end);
                        local v12 = task.wait(10);

                        if v12 ~= 0 and (v12 == v12 and v12) then
                            v12 = u10;
                        end;

                        if v12 == 0 or (v12 ~= v12 or not v12) then
                            return;
                        end;
                    end;
                end);
            end;

            return function() -- Line: 41
                -- upvalues: u10 (ref)
                u10 = false;
            end;
        end, {});
        local v13 = {};
        local v14 = {
            Text = "<b>Join</b> the Easy.gg Roblox Group",
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 46),
            ImageId = ImageId.USERS_SOLID
        };
        local v15 = {};
        local v16 = #v15;
        local v18 = not u4.store.SocialConnections.supportTasks.joinedGroup and u2.createFragment({ u2.createElement(ButtonComponent, {
                Text = "Verify",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -10, 0.5, 0),
                Size = UDim2.new(0.25, -10, 0.5, 0),
                Loading = v6,

                OnClick = function() -- Line: 62, Name: OnClick
                    -- upvalues: u7 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), u9 (copy)
                    u7(true);
                    KnitClient.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p17) -- Line: 65
                        -- upvalues: SoundManager (ref), GameSound (ref), u9 (ref), u7 (ref)
                        if p17 then
                            if p17 then
                                u9("");
                            end;
                        else
                            SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                            u9("Not joined");
                        end;

                        u7(false);
                    end);
                end
            }), u2.createElement("TextLabel", {
                RichText = true,
                TextSize = 12,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -10, 0.87, 0),
                Size = UDim2.new(0.25, -10, 0, 12),
                Text = v8,
                TextColor3 = Theme.backgroundError,
                TextXAlignment = Enum.TextXAlignment.Center,
                Font = Enum.Font.Roboto
            }) });

        if v18 then
            v15[v16 + 1] = v18;
        end;

        v13[#v13 + 1] = u2.createElement(SocialConnectionsConnectInfoCard, v14, v15);

        return u2.createFragment(v13);
    end)
};