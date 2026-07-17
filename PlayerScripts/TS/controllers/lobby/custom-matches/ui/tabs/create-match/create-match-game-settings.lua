-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local TextInputComponent = v1.TextInputComponent;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local ServerBrowserConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants;
local LiveServerVisibilityMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode;
local v6 = v2.values(LiveServerVisibilityMode);

local function _(p7) -- Line: 16
    return {
        text = string.upper(p7),
        value = p7
    };
end;

local u8 = table.create(#v6);

for i, v in v6 do
    local _ = i - 1;
    u8[i] = {
        text = string.upper(v),
        value = v
    };
end;

local function _(p9) -- Line: 30
    -- upvalues: getQueueMeta (copy)
    local v10 = getQueueMeta(p9);

    return v10.disableInCustom ~= true and {
        text = v10.title,
        value = p9
    } or nil;
end;

local v11 = 0;
local u12 = {};

for i, v in v2.values(QueueType) do
    local _ = i - 1;
    local v13 = getQueueMeta(v);
    local v14 = v13.disableInCustom ~= true and {
        text = v13.title,
        value = v
    } or nil;

    if v14 ~= nil then
        v11 = v11 + 1;
        u12[v11] = v14;
    end;
end;

table.sort(u12, function(p15, p16) -- Line: 51
    return p15.text < p16.text;
end);

return {
    CreateMatchGameSettings = v4.new(u3)(function(u17, p18) -- Line: 56
        -- upvalues: u3 (copy), u5 (copy), Empty (copy), DropdownComponent (copy), u8 (copy), u12 (copy), getQueueMeta (copy), ServerBrowserConstants (copy), TextInputComponent (copy)
        local _ = p18.useState;
        local v19 = u3.createRef();
        local GameInfo = u17.GameInfo;

        if GameInfo ~= nil then
            GameInfo = GameInfo.thumbnail;
        end;

        local v20;

        if GameInfo == "" or not GameInfo then
            v20 = GameInfo;
        else
            v20 = not u5.startsWith(GameInfo, "rbxassetid://");
        end;

        if v20 ~= "" and v20 then
            local _ = "rbxassetid://" .. GameInfo;
        end;

        local v21 = {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            ZIndex = 1000,
            Size = UDim2.new(1, 0, 0, 42)
        };
        local FrameProps = u17.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v21[i] = v;
            end;
        end;

        local v24 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement(Empty, {
                AutomaticSize = "X",
                LayoutOrder = 1,
                ZIndex = 1000,
                Size = UDim2.fromScale(0, 1)
            }, { u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "<b>VISIBILITY</b>",
                    RichText = true,
                    TextTransparency = 0.1,
                    TextSize = 14,
                    Size = UDim2.new(1, 0, 0, 14),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.new(1, 1, 1),
                    Font = Enum.Font.Roboto
                }), u3.createElement(DropdownComponent, {
                    MaxItemsPerDisplay = 8,
                    ExtraButtonWidth = 100,
                    Size = UDim2.fromOffset(100, 28),
                    Position = UDim2.new(0, 0, 0, 20),
                    DefaultItem = u8[2],
                    Items = u8,

                    OnItemSelected = function(p22) -- Line: 112, Name: OnItemSelected
                        -- upvalues: u17 (copy)
                        local v23 = {};

                        for i, v in u17.GameInfo do
                            v23[i] = v;
                        end;

                        v23.visibilityMode = p22;
                        u17.SetGameInfo(v23);
                    end
                }) }) };
        local v25 = #v24;
        local v26;

        if u17.SubTab == "official_maps" then
            v26 = u3.createFragment({
                SelectGamemodeSection = u3.createElement(Empty, {
                    AutomaticSize = "X",
                    ZIndex = 2,
                    LayoutOrder = 2,
                    Size = UDim2.new(0, 0, 1, 0)
                }, {
                    u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Text = "<b>SELECT A GAMEMODE</b>",
                        RichText = true,
                        TextTransparency = 0.1,
                        TextSize = 14,
                        Size = UDim2.new(1, 0, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextColor3 = Color3.new(1, 1, 1),
                        Font = Enum.Font.Roboto
                    }),
                    GamemodeDropdown = u3.createElement(DropdownComponent, {
                        MaxItemsPerDisplay = 8,
                        Position = UDim2.fromOffset(0, 22),
                        DefaultItem = {
                            text = u17.SelectedGamemode.metadata.title,
                            value = u17.SelectedGamemode.metadata.title
                        },
                        Items = u12,

                        OnItemSelected = function(p27) -- Line: 152, Name: OnItemSelected
                            -- upvalues: getQueueMeta (ref), u17 (copy)
                            local v28 = getQueueMeta(p27);

                            if not v28 then
                                return nil;
                            end;

                            u17.SetSelectedGamemode({
                                queueType = p27,
                                metadata = v28
                            });
                        end
                    })
                })
            });
        else
            v26 = false;
        end;

        if v26 then
            v24[v25 + 1] = v26;
        end;

        local v29 = {
            AutomaticSize = "X",
            LayoutOrder = 3,
            Size = UDim2.fromScale(0, 1)
        };
        local v30 = { u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "<b>GAME NAME</b>",
                RichText = true,
                TextTransparency = 0.1,
                TextSize = 14,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.new(1, 1, 1),
                Font = Enum.Font.Roboto
            }) };
        local v31 = {};
        local v32 = {
            PlaceholderText = "",
            Position = UDim2.new(0, 0, 0, 20),
            Size = UDim2.fromOffset(300, 28)
        };
        local GameInfo2 = u17.GameInfo;

        if GameInfo2 ~= nil then
            GameInfo2 = GameInfo2.title;
        end;

        v32.Text = GameInfo2;
        v32.TextXAlignment = Enum.TextXAlignment.Left;
        v32.ClearTextOnFocus = false;
        v31.TextBox = v32;
        v31.ClearTextOnEnter = false;

        function v31.OnFocusLost(p33) -- Line: 214
            -- upvalues: u17 (copy)
            local v34 = {};

            for i, v in u17.GameInfo do
                v34[i] = v;
            end;

            v34.title = p33;

            return u17.SetGameInfo(v34);
        end;

        v31.MaxCharacters = ServerBrowserConstants.GAME_NAME_MAX_CHARS;
        v31[u3.Ref] = v19;
        v30[#v30 + 1] = u3.createElement(TextInputComponent, v31);
        v24[#v24 + 1] = u3.createElement(Empty, v29, v30);

        return u3.createFragment({
            CreateMatchGameSettings = u3.createElement("Frame", v21, v24)
        });
    end)
};