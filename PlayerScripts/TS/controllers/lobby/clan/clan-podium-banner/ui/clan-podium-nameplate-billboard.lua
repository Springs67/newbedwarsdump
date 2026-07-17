-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color");
local ChatTagColorDefinition = v3.ChatTagColorDefinition;
local ClanChatTagColorOptions = v3.ClanChatTagColorOptions;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types");
local CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE = v4.CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE;
local CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE = v4.CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE;
local CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE = v4.CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function readPodiumTagChatColorOption(p5) -- Line: 31
    -- upvalues: CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE (copy), ClanChatTagColorOptions (copy)
    local v6 = p5:GetAttribute(CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE);

    if type(v6) == "number" then
        return v6;
    end;

    return ClanChatTagColorOptions.Default;
end;

return {
    getPodiumBillboardAdornee = function(p7) -- Line: 14, Name: getPodiumBillboardAdornee
        if p7:IsA("BasePart") then
            return p7;
        end;

        if not p7:IsA("Model") then
            return nil;
        end;

        local NameplateAdornee = p7:FindFirstChild("NameplateAdornee", true);
        local v8;

        if NameplateAdornee == nil then
            v8 = NameplateAdornee;
        else
            v8 = NameplateAdornee:IsA("BasePart");
        end;

        if v8 then
            return NameplateAdornee;
        end;

        return p7.PrimaryPart or p7:FindFirstChildWhichIsA("BasePart", true);
    end,

    getNameplateOffset = function(p9, p10) -- Line: 38, Name: getNameplateOffset
        local v11;

        if p9:IsA("Model") then
            v11 = p9:GetPivot();
        else
            v11 = p10.CFrame;
        end;

        return v11.RightVector * 4;
    end,

    ClanPodiumNameplateBillboard = v2.new(u1)(function(u12, p13) -- Line: 42
        -- upvalues: CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE (copy), CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE (copy), CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE (copy), ClanChatTagColorOptions (copy), ChatTagColorDefinition (copy), u1 (copy), Theme (copy)
        local useEffect = p13.useEffect;

        local function u18() -- Line: 45
            -- upvalues: u12 (copy), CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE (ref), CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE (ref), CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE (ref), ClanChatTagColorOptions (ref)
            local v14 = {};
            local v15 = u12.PodiumModel:GetAttribute(CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE);
            v14.name = v15 == nil and "" or v15;
            local v16 = u12.PodiumModel:GetAttribute(CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE);
            v14.tag = v16 == nil and "" or v16;
            local v17 = u12.PodiumModel:GetAttribute(CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE);

            if type(v17) ~= "number" then
                v17 = ClanChatTagColorOptions.Default;
            end;

            v14.tagChatColorOption = v17;

            return v14;
        end;

        local v19, u20 = p13.useState(u18);
        useEffect(function() -- Line: 63
            -- upvalues: u20 (copy), u18 (copy), u12 (copy), CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE (ref), CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE (ref), CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE (ref)
            local function v21() -- Line: 64
                -- upvalues: u20 (ref), u18 (ref)
                u20((u18()));
            end;

            local u22 = u12.PodiumModel:GetAttributeChangedSignal(CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE):Connect(v21);
            local u23 = u12.PodiumModel:GetAttributeChangedSignal(CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE):Connect(v21);
            local u24 = u12.PodiumModel:GetAttributeChangedSignal(CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE):Connect(v21);

            return function() -- Line: 70
                -- upvalues: u22 (copy), u23 (copy), u24 (copy)
                u22:Disconnect();
                u23:Disconnect();
                u24:Disconnect();
            end;
        end, {});
        local v25 = ChatTagColorDefinition[v19.tagChatColorOption];
        local v26 = {
            AlwaysOnTop = true,
            LightInfluence = 0.5,
            MaxDistance = 80,
            ResetOnSpawn = false,
            Adornee = u12.Adornee,
            Size = UDim2.fromOffset(200, 68),
            StudsOffsetWorldSpace = u12.StudsOffsetWorldSpace
        };
        local v27 = {};
        local _ = #v27;
        local v28 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v29 = {
            ClanName = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextSize = 22,
                TextScaled = true,
                TextWrapped = false,
                RichText = false,
                AutoLocalize = false,
                Size = UDim2.new(1, -8, 0, 28),
                Position = UDim2.fromOffset(4, 5),
                AutomaticSize = Enum.AutomaticSize.None,
                Text = v19.name,
                TextColor3 = Theme.textPrimary,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }, { u1.createElement("UITextSizeConstraint", {
                    MinTextSize = 18,
                    MaxTextSize = 26
                }) })
        };
        local _ = #v29;
        local v30 = v25.kind == "Gradient";

        if v30 then
            local v31 = {
                Color = v25.gradient
            };
            local rotation = v25.rotation;
            v31.Rotation = rotation == nil and 0 or rotation;
            v30 = u1.createElement("UIGradient", v31);
        end;

        local v32 = {
            BackgroundTransparency = 1,
            TextSize = 17,
            TextScaled = true,
            TextWrapped = false,
            AutoLocalize = false,
            Size = UDim2.new(1, -8, 0, 22),
            Position = UDim2.fromOffset(4, 38),
            Text = "[" .. v19.tag .. "]"
        };
        local v33;

        if v25.kind == "Color" then
            v33 = v25.color;
        else
            v33 = Color3.fromRGB(255, 255, 255);
        end;

        v32.TextColor3 = v33;
        v32.TextTransparency = v25.kind == "Gradient" and 0 or 0.25;
        v32.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v32.TextXAlignment = Enum.TextXAlignment.Center;
        v32.TextYAlignment = Enum.TextYAlignment.Center;
        local v34 = { u1.createElement("UITextSizeConstraint", {
                MinTextSize = 14,
                MaxTextSize = 20
            }) };
        local v35 = #v34;

        if v30 then
            v34[v35 + 1] = v30;
        end;

        v29.ClanTag = u1.createElement("TextLabel", v32, v34);
        v27.NameplateRoot = u1.createElement("Frame", v28, v29);

        return u1.createFragment({
            ClanPodiumNameplateBillboard = u1.createElement("BillboardGui", v26, v27)
        });
    end)
};