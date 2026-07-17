-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local TextInputComponent = v1.TextInputComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PaginationPageButton = RuntimeLib.import(script, script.Parent, "pagination-page-button").PaginationPageButton;

return {
    Pagination = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), PaginationPageButton (copy), ColorUtil (copy), Padding (copy), TextInputComponent (copy), Empty (copy)
        local _ = p5.useState;
        local NumPagesAroundCurr = u4.NumPagesAroundCurr;
        local v6 = NumPagesAroundCurr == nil and 2 or NumPagesAroundCurr;
        local v7 = false;
        local v8 = 1;

        local function v10(p9) -- Line: 19
            -- upvalues: u4 (copy)
            u4.OnPageChage(p9);
        end;

        local v11 = {};

        while true do
            if v7 then
                v8 = v8 + 1;
            else
                v7 = true;
            end;

            if v8 > math.min(u4.Page - 1, v6) then
                break;
            end;

            local v12 = u2.createElement(PaginationPageButton, {
                Page = u4.Page - v8,
                CurrentPage = u4.Page,
                SetPage = v10
            });
            table.insert(v11, v12);
        end;

        local v13 = false;
        local v14 = 1;
        local v15 = {};

        while true do
            if v13 then
                v14 = v14 + 1;
            else
                v13 = true;
            end;

            local TotalPages = u4.TotalPages;
            local v16;

            if TotalPages == 0 or (TotalPages ~= TotalPages or not TotalPages) then
                v16 = v6;
            else
                v16 = u4.TotalPages - u4.Page;
            end;

            if v14 > math.min(v16, v6) then
                local v17 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local FrameProps = u4.FrameProps;

                if FrameProps then
                    for i, v in FrameProps do
                        v17[i] = v;
                    end;
                end;

                local v18 = { u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Right",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 4)
                    }) };
                local v19 = #v18;
                local v20;

                if v6 < u4.Page - 1 then
                    v20 = u2.createFragment({
                        PREV = u2.createFragment({
                            PREV = u2.createElement("TextButton", {
                                Text = "PREV",
                                Size = UDim2.new(0.1, 0, 1, 0),
                                TextColor3 = ColorUtil.WHITE,
                                TextScaled = true,
                                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                BackgroundColor3 = Color3.fromRGB(21, 21, 38),
                                BorderSizePixel = 0,

                                [u2.Event.Activated] = function() -- Line: 98
                                    -- upvalues: u4 (copy)
                                    if u4.Page == 1 then
                                        return nil;
                                    end;

                                    u4.OnPageChage(u4.Page - 1);
                                end,

                                LayoutOrder = 1
                            }, { u2.createElement(Padding, {
                                    Padding = {
                                        Horizontal = 6,
                                        Vertical = 6
                                    }
                                }), u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.2, 0)
                                }) })
                        }),
                        u2.createElement(PaginationPageButton, {
                            Page = 1,
                            CurrentPage = u4.Page,
                            SetPage = v10
                        }),
                        u2.createElement(TextInputComponent, {
                            ClearTextOnEnter = true,

                            OnFocusLost = function(p21) -- Line: 123, Name: OnFocusLost
                                -- upvalues: u4 (copy)
                                local v22 = tonumber(p21);

                                if v22 ~= 0 and (v22 == v22 and v22) then
                                    local TotalPages2 = u4.TotalPages;

                                    if TotalPages2 ~= 0 and (TotalPages2 == TotalPages2 and TotalPages2) then
                                        v22 = math.clamp(v22, 1, u4.TotalPages);
                                    end;

                                    u4.OnPageChage(v22);
                                end;
                            end,

                            TextBox = {
                                PlaceholderText = "...",
                                ClearTextOnFocus = true,
                                LayoutOrder = 2,
                                Size = UDim2.new(0.125, 0, 1, 0)
                            },
                            MaxCharacters = #tostring(u4.TotalPages)
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1.75
                            }) })
                    });
                else
                    v20 = false;
                end;

                if v20 then
                    v18[v19 + 1] = v20;
                end;

                local v23 = #v18;

                for i, v in v11 do
                    v18[v23 + i] = v;
                end;

                local v24 = #v18;
                v18[v24 + 1] = u2.createElement(PaginationPageButton, {
                    Page = u4.Page,
                    CurrentPage = u4.Page,
                    SetPage = v10
                });

                for i, v in v15 do
                    v18[v24 + 1 + i] = v;
                end;

                local v25 = #v18;
                local v26;

                if u4.TotalPages == nil or v6 > u4.TotalPages - u4.Page then
                    v26 = false;
                else
                    v26 = u2.createFragment({ u2.createElement(TextInputComponent, {
                            ClearTextOnEnter = true,

                            OnFocusLost = function(p27) -- Line: 163, Name: OnFocusLost
                                -- upvalues: u4 (copy)
                                local v28 = tonumber(p27);

                                if v28 ~= 0 and (v28 == v28 and v28) then
                                    local v29 = math.clamp(v28, 1, u4.TotalPages);
                                    u4.OnPageChage(v29);
                                end;
                            end,

                            TextBox = {
                                PlaceholderText = "...",
                                ClearTextOnFocus = true,
                                Size = UDim2.new(0.125, 0, 1, 0),
                                LayoutOrder = u4.Page + 3
                            },
                            MaxCharacters = #tostring(u4.TotalPages)
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1.75
                            }) }), u2.createElement(PaginationPageButton, {
                            Page = u4.TotalPages,
                            CurrentPage = u4.Page,
                            SetPage = v10
                        }) });
                end;

                if v26 then
                    v18[v25 + 1] = v26;
                end;

                local _ = #v18;
                local v30 = {
                    Text = "NEXT",
                    Size = UDim2.new(0.1, 0, 1, 0),
                    TextColor3 = ColorUtil.WHITE,
                    TextScaled = true,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    BackgroundColor3 = Color3.fromRGB(21, 21, 38),
                    BorderSizePixel = 0,

                    [u2.Event.Activated] = function() -- Line: 200
                        -- upvalues: u4 (copy)
                        if u4.Page == u4.TotalPages then
                            return nil;
                        end;

                        u4.OnPageChage(u4.Page + 1);
                    end
                };
                local TotalPages2 = u4.TotalPages;

                if TotalPages2 == nil then
                    TotalPages2 = u4.Page + 1;
                end;

                v30.LayoutOrder = TotalPages2;
                v18.NEXT = u2.createElement("TextButton", v30, { u2.createElement(Padding, {
                        Padding = {
                            Horizontal = 6,
                            Vertical = 6
                        }
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.2, 0)
                    }) });

                return u2.createFragment({
                    Pagination = u2.createElement(Empty, v17, v18)
                });
            end;

            local v31 = u2.createElement(PaginationPageButton, {
                Page = u4.Page + v14,
                CurrentPage = u4.Page,
                SetPage = v10
            });
            table.insert(v15, v31);
        end;
    end)
};