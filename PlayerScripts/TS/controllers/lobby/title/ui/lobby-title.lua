-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta");
local LobbyTitleDefaults = v4.LobbyTitleDefaults;
local TitleMeta = v4.TitleMeta;

return {
    LobbyTitle = v2.new(u1)(function(p5, p6) -- Line: 10
        -- upvalues: u1 (copy), TitleMeta (copy), TweenService (copy), LobbyTitleDefaults (copy), u3 (copy)
        local useEffect = p6.useEffect;
        local u7, _ = p6.useState(u1.createRef());
        local u8 = TitleMeta[p5.TitleType];
        useEffect(function() -- Line: 15
            -- upvalues: u7 (copy), u8 (copy), TweenService (ref), LobbyTitleDefaults (ref)
            local u9 = true;
            local u10 = u7:getValue();

            if not u10 then
                return nil;
            end;

            local effects = u8.effects;

            if effects ~= nil then
                effects = effects.rgb;
            end;

            local u11 = nil;

            if effects then
                local u12 = 1;
                task.spawn(function() -- Line: 29
                    -- upvalues: u9 (ref), u10 (copy), u11 (ref), TweenService (ref), effects (copy), u12 (ref)
                    while u9 and u10.Parent ~= nil do
                        u11 = TweenService:Create(u10, TweenInfo.new(1), {
                            TextColor3 = effects[u12 + 1]
                        });
                        u11:Play();
                        u11.Completed:Wait();
                        u12 = u12 + 1;

                        if u12 >= #effects then
                            u12 = 0;
                        end;
                    end;
                end);
            else
                u10.TextColor3 = u8.color or LobbyTitleDefaults.color;
            end;

            return function() -- Line: 46
                -- upvalues: u9 (ref), u11 (ref)
                u9 = false;
                local v13 = u11;

                if v13 ~= nil then
                    v13:Cancel();
                end;
            end;
        end, { p5.TitleType });

        if not u8 then
            return u1.createFragment();
        end;

        local text = u8.text;
        local suffix = p5.suffix;

        if suffix ~= "" and suffix then
            text = text .. p5.suffix;
        end;

        local v14 = u3.includes(text, "<font") or u3.includes(text, "<b>") or (u3.includes(text, "<i>") or u3.includes(text, "<u>") or (u3.includes(text, "<s>") or u3.includes(text, "<stroke")));
        local v15 = {
            Text = text,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = u8.backgroundColor or LobbyTitleDefaults.backgroundColor
        };
        local backgroundTransparency = u8.backgroundTransparency;

        if backgroundTransparency == nil then
            backgroundTransparency = LobbyTitleDefaults.backgroundTransparency;
        end;

        v15.BackgroundTransparency = backgroundTransparency;
        v15.TextColor3 = u8.color or LobbyTitleDefaults.color;
        v15.TextScaled = true;
        v15.FontFace = Font.new(Font.fromEnum(u8.font or LobbyTitleDefaults.font).Family, u8.fontWeight or Enum.FontWeight.Regular);
        local stroke = u8.stroke;

        if stroke ~= nil then
            stroke = stroke.color;
        end;

        v15.TextStrokeColor3 = stroke;
        local stroke2 = u8.stroke;

        if stroke2 ~= nil then
            stroke2 = stroke2.transparency;
        end;

        v15.TextStrokeTransparency = stroke2 == nil and 1 or stroke2;
        v15.RichText = v14;
        v15.BorderSizePixel = 0;
        v15.AutoLocalize = true;
        v15[u1.Ref] = u7;
        local TextLabelProps = p5.TextLabelProps;

        if TextLabelProps then
            for i, v in TextLabelProps do
                v15[i] = v;
            end;
        end;

        local v16 = {};
        local v17 = #v16;
        local v18 = u8.stroke and u1.createElement("UIStroke", {
            Color = u8.stroke.color,
            Thickness = u8.stroke.thickness,
            Transparency = u8.stroke.transparency
        });

        if v18 then
            v16[v17 + 1] = v18;
        end;

        return u1.createFragment({
            LobbyTitle = u1.createElement("TextLabel", v15, v16)
        });
    end)
};