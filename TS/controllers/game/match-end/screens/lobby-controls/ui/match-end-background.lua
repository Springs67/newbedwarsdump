-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v6.Lighting;
local TweenService = v6.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local u7 = nil;

local function MatchEndBackgroundWrapper(p8) -- Line: 129
    -- upvalues: u4 (copy), u7 (ref)
    return u4.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 90,
        ScreenInsets = Enum.ScreenInsets.None
    }, { u4.createElement(u7, {
            store = p8.store
        }) });
end;

u7 = v5.new(u4)(function(p9, p10) -- Line: 16
    -- upvalues: u4 (copy), DeviceUtil (copy), u3 (copy), Lighting (copy), u2 (copy), ClientSyncEvents (copy), TweenService (copy), MatchEndScreensMeta (copy), ClientStore (copy), ColorUtil (copy)
    local _ = p10.useState;
    local useEffect = p10.useEffect;
    local u11 = u4.createRef();
    useEffect(function() -- Line: 21
        -- upvalues: u11 (copy), DeviceUtil (ref), u3 (ref), Lighting (ref), u2 (ref), ClientSyncEvents (ref), TweenService (ref), MatchEndScreensMeta (ref), ClientStore (ref)
        local u12 = u11:getValue();
        local u13 = nil;
        local u14 = false;

        local function enableBlur() -- Line: 25
            -- upvalues: DeviceUtil (ref), u13 (ref), u3 (ref), Lighting (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local v15 = u13;

            if v15 ~= nil then
                v15:Destroy();
            end;

            u13 = u3("BlurEffect", {
                Parent = Lighting
            });
            u13.Size = 12;
        end;

        local function disableBlur() -- Line: 38
            -- upvalues: u13 (ref)
            local v16 = u13;

            if v16 ~= nil then
                v16:Destroy();
            end;

            u13 = nil;
        end;

        local function mountTopBar() -- Line: 45
            -- upvalues: DeviceUtil (ref), u2 (ref)
            if not DeviceUtil.isHoarceKat() then
                u2.Controllers.TopBarController:mountHud();
            end;
        end;

        local function unmountTopBar() -- Line: 50
            -- upvalues: DeviceUtil (ref), u2 (ref)
            if not DeviceUtil.isHoarceKat() then
                u2.Controllers.TopBarController:unmountHud();
            end;
        end;

        ClientSyncEvents.MatchEndScreenEnd:connect(function(p17) -- Line: 56
            -- upvalues: u14 (ref), u12 (copy), u13 (ref), DeviceUtil (ref), u2 (ref)
            if p17.matchEndScreenType ~= 5 then
                return nil;
            end;

            u14 = true;
            u12.Transparency = 1;
            local v18 = u13;

            if v18 ~= nil then
                v18:Destroy();
            end;

            u13 = nil;

            if not DeviceUtil.isHoarceKat() then
                u2.Controllers.TopBarController:mountHud();
            end;
        end);
        ClientSyncEvents.MatchEndScreenStart:connect(function(p19) -- Line: 66
            -- upvalues: u14 (ref), TweenService (ref), u12 (copy), DeviceUtil (ref), u13 (ref), u3 (ref), Lighting (ref), u2 (ref)
            if p19.matchEndScreenType ~= 2 then
                return nil;
            end;

            if u14 then
                return nil;
            end;

            TweenService:Create(u12, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                BackgroundTransparency = 0.4
            }):Play();

            if not DeviceUtil.isHoarceKat() then
                local v20 = u13;

                if v20 ~= nil then
                    v20:Destroy();
                end;

                u13 = u3("BlurEffect", {
                    Parent = Lighting
                });
                u13.Size = 12;
            end;

            if not DeviceUtil.isHoarceKat() then
                u2.Controllers.TopBarController:unmountHud();
            end;
        end);
        ClientSyncEvents.MatchEndScreenStart:connect(function(p21) -- Line: 80
            -- upvalues: u14 (ref), MatchEndScreensMeta (ref), TweenService (ref), u12 (copy), DeviceUtil (ref), u2 (ref)
            if p21.matchEndScreenType ~= 5 then
                return nil;
            end;

            if u14 then
                return nil;
            end;

            local displaySecs = MatchEndScreensMeta[5].displaySecs;
            task.delay((displaySecs == nil and 1 or displaySecs) - 0.4, function() -- Line: 93
                -- upvalues: u14 (ref), TweenService (ref), u12 (ref), DeviceUtil (ref), u2 (ref)
                if not u14 then
                    TweenService:Create(u12, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        BackgroundTransparency = 1
                    }):Play();

                    if not DeviceUtil.isHoarceKat() then
                        u2.Controllers.TopBarController:mountHud();
                    end;
                end;
            end);
        end);
        ClientStore.changed:connect(function(p22, p23) -- Line: 103
            -- upvalues: u12 (copy), DeviceUtil (ref), u13 (ref), u3 (ref), Lighting (ref), u2 (ref)
            if p22.Game.matchEndSummaryVisible == p23.Game.matchEndSummaryVisible then
                return nil;
            end;

            if p22.Game.matchEndSummaryVisible then
                u12.Transparency = 0.4;

                if not DeviceUtil.isHoarceKat() then
                    local v24 = u13;

                    if v24 ~= nil then
                        v24:Destroy();
                    end;

                    u13 = u3("BlurEffect", {
                        Parent = Lighting
                    });
                    u13.Size = 12;
                end;

                if not DeviceUtil.isHoarceKat() then
                    u2.Controllers.TopBarController:unmountHud();
                end;
            else
                u12.Transparency = 1;
                local v25 = u13;

                if v25 ~= nil then
                    v25:Destroy();
                end;

                u13 = nil;

                if not DeviceUtil.isHoarceKat() then
                    u2.Controllers.TopBarController:mountHud();
                end;
            end;
        end);
    end, {});

    return u4.createFragment({
        DarkBackground = u4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BackgroundColor3 = ColorUtil.BLACK,
            ZIndex = -100,
            [u4.Ref] = u11
        })
    });
end);

return {
    MatchEndBackgroundWrapper = MatchEndBackgroundWrapper,
    MatchEndBackground = u7
};