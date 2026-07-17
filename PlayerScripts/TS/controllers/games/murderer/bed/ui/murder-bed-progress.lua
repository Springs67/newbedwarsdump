-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local TimedProgressBar = v1.TimedProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants");
local MurderBedState = v4.MurderBedState;
local MurderGameConstants = v4.MurderGameConstants;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    MurderBed = v3.new(u2)(function(p5, p6) -- Line: 16
        -- upvalues: MurderGameConstants (copy), u2 (copy), MurderBedState (copy), ProgressBar (copy), Empty (copy), getItemMeta (copy), TimedProgressBar (copy), Workspace (copy), Countdown (copy)
        local _ = p6.useState;
        local v7 = MurderGameConstants:getBedStageInfo(p5.BedStage);
        local v8 = {
            StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5),
            ResetOnSpawn = false,
            MaxDistance = 200,
            Adornee = p5.Adornee,
            Size = UDim2.fromScale(6, 3.5)
        };
        local v9 = {};
        local _ = #v9;
        local v10 = {
            Image = "rbxassetid://10667281451",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = Color3.fromRGB(255, 18, 87)
        };
        local v11 = {};
        local _ = #v11;
        local v12 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.6),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.68)
        };
        local v13 = {};
        local v14;

        if p5.BedStage > #MurderGameConstants.BED_REPAIR_STAGES then
            v14 = u2.createFragment({
                Title = u2.createElement("TextLabel", {
                    Text = "<b>BED REPAIRED!</b>",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.25),
                    Font = Enum.Font.RobotoMono,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            });
        else
            v14 = u2.createFragment({
                Title = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>Repair Bed (Stage " .. tostring(p5.BedStage) .. " of " .. tostring(#MurderGameConstants.BED_REPAIR_STAGES) .. ")</b>",
                    Size = UDim2.fromScale(1, 0.25),
                    Font = Enum.Font.RobotoMono,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            });
        end;

        v13[1] = v14;
        local _ = #v13;
        local v15 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.75),
            Position = UDim2.fromScale(0, 0.35)
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }) };
        local v17 = #v16;
        local v18;

        if p5.BedState == MurderBedState.IDLE then
            if v7 then
                v18 = u2.createFragment({ u2.createElement(ProgressBar, {
                        AcceptZero = true,
                        Size = UDim2.fromScale(1, 0.3),
                        Progress = p5.Progress / v7.cost,
                        BarColor = Color3.fromRGB(255, 179, 64)
                    }), u2.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.6)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.03, 0)
                        }),
                        u2.createElement("ImageLabel", {
                            ScaleType = "Fit",
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.2, 0.8),
                            Image = getItemMeta(v7.currency).image
                        }),
                        ProgressText = u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            RichText = true,
                            TextScaled = true,
                            LayoutOrder = 3,
                            Text = "<b>(" .. tostring(p5.Progress) .. "/" .. tostring(v7.cost) .. ") " .. getItemMeta(v7.currency).displayName .. "</b>",
                            Size = UDim2.fromScale(0.77, 0.8),
                            Font = Enum.Font.RobotoMono,
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        })
                    }) });
            else
                v18 = v7;
            end;
        else
            v18 = false;
        end;

        if v18 then
            v16[v17 + 1] = v18;
        end;

        local v19 = #v16;

        if p5.BedState == MurderBedState.REPAIRING then
            if v7 then
                v7 = u2.createFragment({ u2.createElement(TimedProgressBar, {
                        Size = UDim2.fromScale(1, 0.35),
                        EndTime = Workspace:GetServerTimeNow() + v7.repairDuration
                    }), u2.createElement(Countdown, {
                        PreText = "Repairing ",
                        PostText = "s",
                        EndTime = Workspace:GetServerTimeNow() + v7.repairDuration,
                        CountdownConfig = {
                            days = false,
                            hours = false,
                            minutes = false
                        },
                        TextLabel = {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            RichText = true,
                            TextScaled = true,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.3),
                            Font = Enum.Font.RobotoMono,
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }
                    }) });
            end;
        else
            v7 = false;
        end;

        if v7 then
            v16[v19 + 1] = v7;
        end;

        v13.Body = u2.createElement("Frame", v15, v16);
        v11.UsableArea = u2.createElement("Frame", v12, v13);
        v9.BillboardFrame = u2.createElement("ImageLabel", v10, v11);

        return u2.createElement("BillboardGui", v8, v9);
    end)
};