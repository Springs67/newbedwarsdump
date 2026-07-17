-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventMissionsGeneratorSection = RuntimeLib.import(script, script.Parent, "event-missions-generator-section").EventMissionsGeneratorSection;
local u6 = nil;

local function v32(u7, p8) -- Line: 16
    -- upvalues: DeviceUtil (copy), u6 (ref), KnitClient (copy), EventMeta (copy), u2 (copy), u5 (copy), u3 (copy), EventMissionsGeneratorSection (copy), Padding (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
    local useEffect = p8.useEffect;
    local u9, u10 = p8.useState(nil);
    useEffect(function() -- Line: 20
        -- upvalues: DeviceUtil (ref), u10 (copy), u6 (ref), u7 (copy), KnitClient (ref)
        if DeviceUtil.isHoarceKat() then
            u10(u6(u7.EventType, u7.MissionsMap));

            return;
        end;

        KnitClient.Controllers.MissionsController:getMissionData():andThen(function(p11) -- Line: 25
            -- upvalues: u10 (ref)
            u10(p11);
        end);
    end, {});
    local v12 = #EventMeta[u7.EventType].missionGenerators ~= 0 and u9;

    if v12 then
        local v13 = u2.entries(u7.MissionsMap);

        local function v22(p14, p15) -- Line: 35
            -- upvalues: u5 (ref), u7 (copy), u9 (copy), EventMeta (ref), u3 (ref), EventMissionsGeneratorSection (ref)
            local u16 = p14[1];
            local v17 = p14[2];

            if not u5.includes(string.lower(v17[1].id), string.lower(u7.EventType)) then
                return nil;
            end;

            local v18 = {
                GeneratorId = u16,
                Missions = v17,
                PlayerMissionData = u9,
                ClaimedMissions = u7.ClaimedMissions,
                EventType = u7.EventType
            };

            local function _(p19) -- Line: 51
                -- upvalues: u16 (copy)
                return p19.id == u16;
            end;

            local v20 = {};
            local v21 = nil;

            for i, v in EventMeta[u7.EventType].missionGenerators do
                local _ = i - 1;

                if v.id == u16 == true then
                    v21 = v;
                    break;
                end;
            end;

            if v21 ~= nil then
                v21 = v21.layoutOrder;
            end;

            if v21 ~= nil then
                p15 = v21;
            end;

            v20.LayoutOrder = p15;
            v18.FrameProps = v20;

            return u3.createElement(EventMissionsGeneratorSection, v18);
        end;

        local v23 = 0;
        local v24 = {};

        for i, v in v13 do
            local v25 = v22(v, i - 1, v13);

            if v25 ~= nil then
                v23 = v23 + 1;
                v24[v23] = v25;
            end;
        end;

        local v26 = {
            AdditionalSpace = 200,
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Selectable = false,
                Size = UDim2.fromScale(1, 1)
            }
        };
        local v27 = { u3.createElement(Padding, {
                Padding = {
                    Vertical = 2,
                    Horizontal = 2
                }
            }), u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v28 = #v27;

        for i, v in v24 do
            v27[v28 + i] = v;
        end;

        v12 = u3.createFragment({
            MissionsList = u3.createElement(AutoCanvasScrollingFrame, v26, v27)
        });
    end;

    local v29 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v30 = {};
    local v31 = #v30;

    if v12 then
        v30[v31 + 1] = v12;
    end;

    return u3.createFragment({
        EventMissions = u3.createElement(Empty, v29, v30)
    });
end;

local v33 = v4.new(u3)(v32);

u6 = function(p34, p35) -- Line: 128
    -- upvalues: u2 (copy)
    local u36 = {};
    local u37 = {};
    local u38 = Random.new();
    local v39 = u2.entries(p35);

    local function v44(p40) -- Line: 133
        -- upvalues: u38 (copy), u36 (copy), u37 (copy)
        local _ = p40[1];
        local v41 = p40[2];

        local function v43(p42) -- Line: 136
            -- upvalues: u38 (ref), u36 (ref), u37 (ref)
            u36[p42.id] = {
                [p42.stages[1].type] = u38:NextInteger(0, p42.stages[1].progress)
            };
            u37[p42.id] = u38:NextInteger(0, #p42.stages - 1);
        end;

        for i, v in v41 do
            v43(v, i - 1, v41);
        end;
    end;

    for i, v in v39 do
        v44(v, i - 1, v39);
    end;

    return {
        progress = u36,
        stages = u37
    };
end;

return {
    EventMissions = v33
};