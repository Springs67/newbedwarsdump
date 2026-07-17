-- Decompiled with Potassium's decompiler.

local Logging = require(script.Parent.Logging);
local u1 = {};
u1.__index = u1;

function u1.new(p2) -- Line: 23
    -- upvalues: u1 (copy)
    return setmetatable({
        _status = "Disabled",
        _isResuming = false,
        _suspendedEventQueue = {},
        _connections = {},
        _listeners = {},
        _instance = p2
    }, u1);
end;

function u1.connectEvent(p3, p4, p5) -- Line: 51
    p3:_connect(p4, p3._instance[p4], p5);
end;

function u1.connectPropertyChange(u6, u7, p8) -- Line: 55
    local success, result = pcall(function() -- Line: 56
        -- upvalues: u6 (copy), u7 (copy)
        return u6._instance:GetPropertyChangedSignal(u7);
    end);

    if not success then
        error(("Cannot get changed signal on property %q: %s"):format(tostring(u7), result), 0);
    end;

    u6:_connect("Change." .. u7, result, p8);
end;

function u1._connect(u9, u10, p11, p12) -- Line: 67
    if p12 == nil then
        if u9._connections[u10] ~= nil then
            u9._connections[u10]:Disconnect();
            u9._connections[u10] = nil;
        end;

        u9._listeners[u10] = nil;

        return;
    end;

    if u9._connections[u10] == nil then
        u9._connections[u10] = p11:Connect(function(...) -- Line: 78
            -- upvalues: u9 (copy), u10 (copy)
            if u9._status == "Enabled" then
                u9._listeners[u10](u9._instance, ...);

                return;
            end;

            if u9._status == "Suspended" then
                local v13 = { u10, select("#", ...), ... };
                table.insert(u9._suspendedEventQueue, v13);
            end;
        end);
    end;

    u9._listeners[u10] = p12;
end;

function u1.suspend(p14) -- Line: 95
    p14._status = "Suspended";
end;

function u1.resume(p15) -- Line: 99
    -- upvalues: Logging (copy)
    if p15._isResuming then
        return;
    end;

    p15._isResuming = true;
    local v16 = 1;

    while v16 <= #p15._suspendedEventQueue do
        local v17 = p15._suspendedEventQueue[v16];
        local v18 = p15._listeners[v17[1]];
        local v19 = v17[2];

        if v18 ~= nil then
            local v20 = coroutine.create(v18);
            local v21, v22 = coroutine.resume(v20, p15._instance, unpack(v17, 3, 2 + v19));

            if not v21 then
                Logging.warn("%s", v22);
            end;
        end;

        v16 = v16 + 1;
    end;

    p15._isResuming = false;
    p15._status = "Enabled";
    p15._suspendedEventQueue = {};
end;

return u1;