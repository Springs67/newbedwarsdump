-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local getLegacyMobileLayoutDimensions = v1.getLegacyMobileLayoutDimensions;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event");
local InputActionType = v4.InputActionType;
local MoveMountDirection = v4.MoveMountDirection;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MoveMountMobileUI = v3.new(u2)(function(p5, p6) -- Line: 17
        -- upvalues: DeviceUtil (copy), getLegacyMobileLayoutDimensions (copy), Flamework (copy), KnitClient (copy), GameCoreClientSyncEvents (copy), u2 (copy), MobileButton (copy), BedwarsImageId (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7;

        if DeviceUtil.isHoarceKat() then
            v7 = getLegacyMobileLayoutDimensions().MoveMountUp;
        else
            v7 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("MoveMountUp");
        end;

        local v8, u9 = useState(v7);
        local v10;

        if DeviceUtil.isHoarceKat() then
            v10 = getLegacyMobileLayoutDimensions().MoveMountDown;
        else
            v10 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("MoveMountDown");
        end;

        local v11, u12 = useState(v10);
        useEffect(function() -- Line: 22
            -- upvalues: DeviceUtil (ref), Flamework (ref), KnitClient (ref), u9 (copy), u12 (copy), GameCoreClientSyncEvents (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController");
            KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() -- Line: 27
                -- upvalues: u9 (ref), u13 (copy), u12 (ref)
                u9(u13:getLayoutDimensions("MoveMountUp"));
                u12(u13:getLayoutDimensions("MoveMountDown"));
            end);
            GameCoreClientSyncEvents.MobileLayoutRegistered:connect(function() -- Line: 31
                -- upvalues: u9 (ref), u13 (copy), u12 (ref)
                u9(u13:getLayoutDimensions("MoveMountUp"));
                u12(u13:getLayoutDimensions("MoveMountDown"));
            end);
        end, {});

        return u2.createFragment({ u2.createElement(MobileButton, {
                Image = BedwarsImageId.UP_MOBILE,
                Position = v8.position or UDim2.fromOffset(0, 0),
                Size = v8.size,

                OnPressDown = function() -- Line: 41, Name: OnPressDown
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.UP, InputActionType.PRESS);
                end,

                OnPressUp = function() -- Line: 44, Name: OnPressUp
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.UP, InputActionType.RELEASE);
                end
            }), u2.createElement(MobileButton, {
                Image = BedwarsImageId.DOWN_MOBILE,
                Position = v11.position or UDim2.fromOffset(0, 0),
                Size = v11.size,

                OnPressDown = function() -- Line: 52, Name: OnPressDown
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.DOWN, InputActionType.PRESS);
                end,

                OnPressUp = function() -- Line: 55, Name: OnPressUp
                    -- upvalues: ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
                    ClientSyncEvents.MoveMountButtonChange:fire(MoveMountDirection.DOWN, InputActionType.RELEASE);
                end
            }) });
    end)
};