-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ImageInput = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "image-input").ImageInput;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanManagementEmblemUpload = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: KnitClient (copy), Flamework (copy), u2 (copy), Empty (copy), ImageInput (copy), ButtonComponent (copy), Theme (copy)
        local useState = p5.useState;
        local CurrentEmblem = u4.CurrentEmblem;
        local u6, u7 = useState(CurrentEmblem == nil and "" or CurrentEmblem);
        local v8, u9 = useState(false);

        local function v11() -- Line: 20
            -- upvalues: u9 (copy), KnitClient (ref), u6 (copy), u4 (copy), Flamework (ref)
            u9(true);
            KnitClient.Controllers.ClanController:updateClanEmblem(u6, u4.ClanId):andThen(function(p10) -- Line: 23
                -- upvalues: u9 (ref), Flamework (ref)
                u9(false);

                if not p10.success then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = p10.errorMessage
                    });
                end;
            end);
        end;

        return u2.createFragment({
            EmblemUploadContainer = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 60)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 0)
                }), u2.createElement(ImageInput, {
                    InputBoxLabel = "Clan Emblem",
                    StartingValue = u6,

                    OnInput = function(p12) -- Line: 48, Name: OnInput
                        -- upvalues: u7 (copy)
                        u7(p12);
                    end,

                    ContainerProps = {
                        LayoutOrder = 1,
                        Size = UDim2.new(0.5, 0, 1, 0)
                    }
                }), u2.createElement(ButtonComponent, {
                    Text = "<b>Update Emblem</b>",
                    Selectable = false,
                    LayoutOrder = 3,
                    Size = UDim2.new(0.2, 0, 0, 30),
                    BackgroundColor3 = Theme.backgroundSuccess,
                    OnClick = v8 and function() -- Line: 61
                    end or v11,
                    Loading = v8
                }) })
        });
    end)
};