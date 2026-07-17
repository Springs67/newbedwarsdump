-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;

return {
    SummonerKitCastBarUI = v3.new(u2)(function(u5, p6) -- Line: 11
        -- upvalues: Workspace (copy), u2 (copy), RunService (copy), ProgressBar (copy), Empty (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local StartTime = u5.StartTime;

        if StartTime == nil then
            StartTime = Workspace:GetServerTimeNow();
        end;

        local EndTime = u5.EndTime;
        local v7 = EndTime - StartTime;
        local v8 = (v7 - (EndTime - Workspace:GetServerTimeNow())) / v7;
        local v9, u10 = useState((math.clamp(v8, 0, 1)));
        local v11, u12 = useState(false);
        local _, _ = useState("Spell Level 0");
        local v13, u14 = useState({});
        local _, u15 = useState({});
        useEffect(function() -- Line: 28
            -- upvalues: u5 (copy), u2 (ref), u14 (copy), u15 (copy), u12 (copy), Workspace (ref), RunService (ref), u10 (copy)
            if u5.PlayerSpellLevel > 1 then
                local v16 = false;
                local v17 = 0;
                local v18 = {};
                local v19 = {};

                while true do
                    if true then
                        if v16 then
                            v17 = v17 + 1;
                        else
                            v16 = true;
                        end;
                    end;

                    if v17 >= u5.PlayerSpellLevel then
                        break;
                    end;

                    local v20 = Color3.fromRGB(255, 255, 255);
                    table.insert(v18, v20);
                end;

                local v21 = false;
                local v22 = 0;

                while true do
                    if true then
                        if v21 then
                            v22 = v22 + 1;
                        else
                            v21 = true;
                        end;
                    end;

                    if v22 >= u5.PlayerSpellLevel - 1 then
                        break;
                    end;

                    local v23 = u2.createFragment({
                        Divider = u2.createElement("Frame", {
                            BackgroundTransparency = 0,
                            BorderSizePixel = 0,
                            ZIndex = 5,
                            Size = UDim2.fromScale(0.05, 1.2),
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.fromScale((v22 + 1) / u5.PlayerSpellLevel, 0.5),
                            BackgroundColor3 = v18[v22 + 1]
                        })
                    });
                    table.insert(v19, v23);
                end;

                u14(v19);
                u15(v18);
            end;

            u12(false);
            local StartTime2 = u5.StartTime;

            if StartTime2 == nil then
                StartTime2 = Workspace:GetServerTimeNow();
            end;

            local EndTime2 = u5.EndTime;
            local u24 = EndTime2 - StartTime2;
            local u25 = nil;
            u25 = RunService.Heartbeat:Connect(function(p26) -- Line: 87
                -- upvalues: u24 (copy), EndTime2 (copy), Workspace (ref), u10 (ref), u5 (ref), u2 (ref), u14 (ref), u15 (ref), u12 (ref), u25 (ref)
                local v27 = u24 - (EndTime2 - Workspace:GetServerTimeNow());
                local v28 = math.clamp(v27 / u24, 0, 1);
                u10(v28);

                if u5.PlayerSpellLevel > 1 then
                    local v29 = false;
                    local v30 = 0;
                    local v31 = {};
                    local v32 = {};

                    while true do
                        if true then
                            if v29 then
                                v30 = v30 + 1;
                            else
                                v29 = true;
                            end;
                        end;

                        if v30 >= u5.PlayerSpellLevel then
                            break;
                        end;

                        if v30 + 1 / u5.PlayerSpellLevel <= v28 then
                            local v33 = Color3.fromRGB(255, 201, 38);
                            table.insert(v31, v33);
                        else
                            local v34 = Color3.fromRGB(204, 204, 204);
                            table.insert(v31, v34);
                        end;
                    end;

                    local v35 = false;
                    local v36 = 0;

                    while true do
                        if true then
                            if v35 then
                                v36 = v36 + 1;
                            else
                                v35 = true;
                            end;
                        end;

                        if v36 >= u5.PlayerSpellLevel - 1 then
                            break;
                        end;

                        local v37 = u2.createFragment({
                            Divider = u2.createElement("Frame", {
                                BackgroundTransparency = 0,
                                BorderSizePixel = 0,
                                ZIndex = 5,
                                Size = UDim2.fromScale(0.01, 1),
                                AnchorPoint = Vector2.new(0, 0.5),
                                Position = UDim2.fromScale((v36 + 1) / u5.PlayerSpellLevel, 0.5),
                                BackgroundColor3 = v31[v36 + 1]
                            })
                        });
                        table.insert(v32, v37);
                    end;

                    u14(v32);
                    u15(v31);
                end;

                if u24 < v27 then
                    if u5.HideOnComplete then
                        u12(true);
                        u10(0);
                    end;

                    u25:Disconnect();
                end;
            end);

            return function() -- Line: 162
                -- upvalues: u25 (ref)
                u25:Disconnect();
            end;
        end, { u5.EndTime, u5.StartTime });
        local v38 = {
            Size = u5.Size,
            Position = u5.Position,
            AnchorPoint = u5.AnchorPoint
        };
        local v39 = {};
        local v40 = #v39;
        local v41 = {
            LayoutOrder = 1,
            Progress = v9,
            Hide = v11,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local ProgressBarConfig = u5.ProgressBarConfig;

        if ProgressBarConfig then
            for i, v in ProgressBarConfig do
                v41[i] = v;
            end;
        end;

        local v42 = {};
        local v43 = #v42;
        local v44 = u5[u2.Children];

        if v44 then
            for i, v in v44 do
                if type(i) == "number" then
                    v42[v43 + i] = v;
                else
                    v42[i] = v;
                end;
            end;
        end;

        v39[v40 + 1] = u2.createElement(ProgressBar, v41, v42);
        local v45 = #v13 > 0;

        if v45 then
            local v46 = {
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5)
            };
            local v47 = {};
            local v48 = #v47;

            for i, v in v13 do
                v47[v48 + i] = v;
            end;

            v45 = u2.createFragment({
                PillDividersWrapper = u2.createElement(Empty, v46, v47)
            });
        end;

        if v45 then
            v39[v40 + 2] = v45;
        end;

        return u2.createElement(Empty, v38, v39);
    end)
};