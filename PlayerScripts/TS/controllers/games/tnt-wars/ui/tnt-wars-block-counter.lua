-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local TNT_WARS_IMAGE_ID = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v2 = u1.Component:extend("TNTWarsBlockCounter");

function v2.init(p3) -- Line: 11
    -- upvalues: u1 (copy)
    p3.avatarRef = u1.createRef();
    p3.counterRef = u1.createRef();
    p3.blockCount = 0;
end;

function v2.render(p4) -- Line: 16
    -- upvalues: u1 (copy), Theme (copy), TNT_WARS_IMAGE_ID (copy)
    return u1.createFragment({
        BlockDestroyedCounter = u1.createElement("Frame", {
            BackgroundTransparency = 0.2,
            Size = UDim2.fromScale(0.225, 0.1),
            Position = UDim2.fromScale(0.5, -0.1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Theme.Gray
        }, {
            u1.createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            u1.createElement("UICorner"),
            BlockImage = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = TNT_WARS_IMAGE_ID.GRASS_BLOCK,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(-0.1, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
                Size = UDim2.fromScale(0.3, 0.3)
            }),
            CounterText = u1.createElement("TextLabel", {
                [u1.Ref] = p4.counterRef,
                Text = "X" .. tostring(p4.blockCount) .. " DESTROYED",
                Font = Enum.Font.Arcade,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                TextScaled = true,
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeTransparency = 0,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            }, { u1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 5)
                }) }),
            AvatarImage = u1.createElement("ImageLabel", {
                [u1.Ref] = p4.avatarRef,
                BackgroundTransparency = 0,
                BackgroundColor3 = Theme.Gray,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(1.125, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
                Size = UDim2.fromScale(0.25, 0.25)
            }, { u1.createElement("UIStroke", {
                    Thickness = 3,
                    Color = Color3.fromRGB(255, 255, 255)
                }), u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 30)
                }) })
        })
    });
end;

function v2.didMount(p5) -- Line: 77
    p5:setAvatar();
    p5:handleBlockUpdates();
end;

function v2.setAvatar(p6) -- Line: 81
    -- upvalues: Players (copy)
    local v7 = p6.avatarRef:getValue();

    if not v7 then
        return nil;
    end;

    v7.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
end;

function v2.handleBlockUpdates(u8) -- Line: 89
    -- upvalues: default (copy)
    local u9 = u8.counterRef:getValue();

    if not u9 then
        return nil;
    end;

    default.Client:WaitFor("BlocksBrokenByExplosion"):expect():Connect(function(p10) -- Line: 94
        -- upvalues: u8 (copy), u9 (copy)
        local v11 = u8;
        v11.blockCount = v11.blockCount + p10.amount;
        u9.Text = "X" .. tostring(u8.blockCount) .. " DESTROYED";
    end);
end;

return {
    TNTWarsBlockCounter = v2
};