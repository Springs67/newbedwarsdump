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
    VoidHunterMarkDurationUI = v3.new(u2)(function(u5, p6) -- Line: 11
        -- upvalues: Workspace (copy), RunService (copy), u2 (copy), ProgressBar (copy), Empty (copy)
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
        local v13, _ = useState({});
        local _, _ = useState({});
        useEffect(function() -- Line: 28
            -- upvalues: u12 (copy), u5 (copy), Workspace (ref), RunService (ref), u10 (copy)
            u12(false);
            local StartTime2 = u5.StartTime;

            if StartTime2 == nil then
                StartTime2 = Workspace:GetServerTimeNow();
            end;

            local EndTime2 = u5.EndTime;
            local u14 = EndTime2 - StartTime2;
            local u15 = nil;
            u15 = RunService.Heartbeat:Connect(function(p16) -- Line: 38
                -- upvalues: u14 (copy), EndTime2 (copy), Workspace (ref), u10 (ref), u5 (ref), u12 (ref), u15 (ref)
                local v17 = u14 - (EndTime2 - Workspace:GetServerTimeNow());
                u10((math.clamp(v17 / u14, 0, 1)));

                if u14 < v17 then
                    if u5.HideOnComplete then
                        u12(true);
                        u10(0);
                    end;

                    u15:Disconnect();
                end;
            end);

            return function() -- Line: 50
                -- upvalues: u15 (ref)
                u15:Disconnect();
            end;
        end, { u5.EndTime, u5.StartTime });
        local v18 = {
            Size = u5.Size,
            Position = u5.Position,
            AnchorPoint = u5.AnchorPoint
        };
        local v19 = {};
        local v20 = #v19;
        local v21 = {
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
                v21[i] = v;
            end;
        end;

        local v22 = {};
        local v23 = #v22;
        local v24 = u5[u2.Children];

        if v24 then
            for i, v in v24 do
                if type(i) == "number" then
                    v22[v23 + i] = v;
                else
                    v22[i] = v;
                end;
            end;
        end;

        v19[v20 + 1] = u2.createElement(ProgressBar, v21, v22);
        local v25 = #v13 > 0;

        if v25 then
            local v26 = {
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5)
            };
            local v27 = {};
            local v28 = #v27;

            for i, v in v13 do
                v27[v28 + i] = v;
            end;

            v25 = u2.createFragment({
                PillDividersWrapper = u2.createElement(Empty, v26, v27)
            });
        end;

        if v25 then
            v19[v20 + 2] = v25;
        end;

        return u2.createElement(Empty, v18, v19);
    end)
};