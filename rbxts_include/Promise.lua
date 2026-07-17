-- Decompiled with Potassium's decompiler.

local u1 = {
    __mode = "k"
};

local function isCallable(p2) -- Line: 10
    if type(p2) == "function" then
        return true;
    end;

    local v3 = type(p2) == "table" and getmetatable(p2);

    if v3 then
        local v4 = rawget(v3, "__call");

        if type(v4) == "function" then
            return true;
        end;
    end;

    return false;
end;

local function makeEnum(u5, p6) -- Line: 28
    local v7 = {};

    for _, v in ipairs(p6) do
        v7[v] = v;
    end;

    return setmetatable(v7, {
        __index = function(p8, p9) -- Line: 36, Name: __index
            -- upvalues: u5 (copy)
            error(string.format("%s is not in %s!", p9, u5), 2);
        end,

        __newindex = function() -- Line: 39, Name: __newindex
            -- upvalues: u5 (copy)
            error(string.format("Creating new members in %s is not allowed!", u5), 2);
        end
    });
end;

local u10 = {
    Kind = makeEnum("Promise.Error.Kind", { "ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut" })
};
u10.__index = u10;

function u10.new(p11, p12) -- Line: 64
    -- upvalues: u10 (ref)
    local v13 = p11 or {};
    local v14 = {
        error = tostring(v13.error) or "[This error has no error text.]",
        trace = v13.trace,
        context = v13.context,
        kind = v13.kind,
        parent = p12,
        createdTick = os.clock(),
        createdTrace = debug.traceback()
    };

    return setmetatable(v14, u10);
end;

function u10.is(p15) -- Line: 77
    if type(p15) == "table" then
        local v16 = getmetatable(p15);

        if type(v16) == "table" then
            local v17;

            if rawget(p15, "error") == nil then
                v17 = false;
            else
                local v18 = rawget(v16, "extend");
                v17 = type(v18) == "function";
            end;

            return v17;
        end;
    end;

    return false;
end;

function u10.isKind(p19, p20) -- Line: 89
    -- upvalues: u10 (ref)
    assert(p20 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    local v21 = u10.is(p19) and p19.kind == p20;

    return v21;
end;

function u10.extend(p22, p23) -- Line: 95
    -- upvalues: u10 (ref)
    local v24 = p23 or {};
    v24.kind = v24.kind or p22.kind;

    return u10.new(v24, p22);
end;

function u10.getErrorChain(p25) -- Line: 103
    local v26 = { p25 };

    while v26[#v26].parent do
        table.insert(v26, v26[#v26].parent);
    end;

    return v26;
end;

function u10.__tostring(p27) -- Line: 113
    local v28 = { string.format("-- Promise.Error(%s) --", p27.kind or "?") };

    for _, v in ipairs(p27:getErrorChain()) do
        table.insert(v28, table.concat({ v.trace or v.error, v.context }, "\n"));
    end;

    return table.concat(v28, "\n");
end;

local function pack(...) -- Line: 137
    return select("#", ...), { ... };
end;

local function packResult(p29, ...) -- Line: 144
    return p29, select("#", ...), { ... };
end;

local function makeErrorHandler(u30) -- Line: 148
    -- upvalues: u10 (ref)
    assert(u30 ~= nil, "traceback is nil");

    return function(p31) -- Line: 151
        -- upvalues: u10 (ref), u30 (copy)
        if type(p31) == "table" then
            return p31;
        end;

        return u10.new({
            error = p31,
            kind = u10.Kind.ExecutionError,
            trace = debug.traceback(tostring(p31), 2),
            context = "Promise created at:\n\n" .. u30
        });
    end;
end;

local function runExecutor(u32, p33, ...) -- Line: 171
    -- upvalues: packResult (copy), u10 (ref)
    local v34 = xpcall;
    assert(u32 ~= nil, "traceback is nil");

    return packResult(v34(p33, function(p35) -- Line: 151
        -- upvalues: u10 (ref), u32 (copy)
        if type(p35) == "table" then
            return p35;
        end;

        return u10.new({
            error = p35,
            kind = u10.Kind.ExecutionError,
            trace = debug.traceback(tostring(p35), 2),
            context = "Promise created at:\n\n" .. u32
        });
    end, ...));
end;

local function createAdvancer(u36, u37, u38, u39) -- Line: 179
    -- upvalues: runExecutor (copy)
    return function(...) -- Line: 180
        -- upvalues: runExecutor (ref), u36 (copy), u37 (copy), u38 (copy), u39 (copy)
        local v40, v41, v42 = runExecutor(u36, u37, ...);

        if v40 then
            u38(unpack(v42, 1, v41));

            return;
        end;

        u39(v42[1]);
    end;
end;

local function isEmpty(p43) -- Line: 191
    return next(p43) == nil;
end;

local u44 = {
    Error = u10,
    Status = makeEnum("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }),
    _getTime = os.clock,
    _timeEvent = game:GetService("RunService").Heartbeat,
    _unhandledRejectionCallbacks = {},
    prototype = {}
};
u44.__index = u44.prototype;

function u44._new(p45, u46, p47) -- Line: 230
    -- upvalues: u44 (copy), u1 (copy), runExecutor (copy)
    if p47 ~= nil and not u44.is(p47) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;

    local u48 = {
        _values = nil,
        _valuesLength = -1,
        _unhandledRejection = true,
        _cancellationHook = nil,
        _source = p45,
        _status = u44.Status.Started,
        _queuedResolve = {},
        _queuedReject = {},
        _queuedFinally = {},
        _parent = p47,
        _consumers = setmetatable({}, u1)
    };

    if p47 and p47._status == u44.Status.Started then
        p47._consumers[u48] = true;
    end;

    setmetatable(u48, u44);

    local function resolve(...) -- Line: 275
        -- upvalues: u48 (copy)
        u48:_resolve(...);
    end;

    local function reject(...) -- Line: 279
        -- upvalues: u48 (copy)
        u48:_reject(...);
    end;

    local function onCancel(p49) -- Line: 283
        -- upvalues: u48 (copy), u44 (ref)
        if p49 then
            if u48._status == u44.Status.Cancelled then
                p49();
            else
                u48._cancellationHook = p49;
            end;
        end;

        return u48._status == u44.Status.Cancelled;
    end;

    coroutine.wrap(function() -- Line: 295
        -- upvalues: runExecutor (ref), u48 (copy), u46 (copy), resolve (copy), reject (copy), onCancel (copy)
        local v50, _, v51 = runExecutor(u48._source, u46, resolve, reject, onCancel);

        if not v50 then
            reject(v51[1]);
        end;
    end)();

    return u48;
end;

function u44.new(p52) -- Line: 338
    -- upvalues: u44 (copy)
    return u44._new(debug.traceback(nil, 2), p52);
end;

function u44.__tostring(p53) -- Line: 342
    return string.format("Promise(%s)", p53._status);
end;

function u44.defer(u54) -- Line: 364
    -- upvalues: u44 (copy), runExecutor (copy)
    local u55 = debug.traceback(nil, 2);

    return u44._new(u55, function(u56, u57, u58) -- Line: 367
        -- upvalues: u44 (ref), runExecutor (ref), u55 (copy), u54 (copy)
        local u59 = nil;
        u59 = u44._timeEvent:Connect(function() -- Line: 369
            -- upvalues: u59 (ref), runExecutor (ref), u55 (ref), u54 (ref), u56 (copy), u57 (copy), u58 (copy)
            u59:Disconnect();
            local v60, _, v61 = runExecutor(u55, u54, u56, u57, u58);

            if not v60 then
                u57(v61[1]);
            end;
        end);
    end);
end;

u44.async = u44.defer;

function u44.resolve(...) -- Line: 407
    -- upvalues: pack (copy), u44 (copy)
    local u62, u63 = pack(...);

    return u44._new(debug.traceback(nil, 2), function(p64) -- Line: 409
        -- upvalues: u63 (copy), u62 (copy)
        p64(unpack(u63, 1, u62));
    end);
end;

function u44.reject(...) -- Line: 424
    -- upvalues: pack (copy), u44 (copy)
    local u65, u66 = pack(...);

    return u44._new(debug.traceback(nil, 2), function(p67, p68) -- Line: 426
        -- upvalues: u66 (copy), u65 (copy)
        p68(unpack(u66, 1, u65));
    end);
end;

function u44._try(p69, u70, ...) -- Line: 435
    -- upvalues: pack (copy), u44 (copy)
    local u71, u72 = pack(...);

    return u44._new(p69, function(p73) -- Line: 438
        -- upvalues: u70 (copy), u72 (copy), u71 (copy)
        p73(u70(unpack(u72, 1, u71)));
    end);
end;

function u44.try(p74, ...) -- Line: 466
    -- upvalues: u44 (copy)
    return u44._try(debug.traceback(nil, 2), p74, ...);
end;

function u44._all(p75, u76, u77) -- Line: 475
    -- upvalues: u44 (copy)
    if type(u76) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;

    for i, v in pairs(u76) do
        if not u44.is(v) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(i))), 3);
        end;
    end;

    if #u76 == 0 or u77 == 0 then
        return u44.resolve({});
    end;

    return u44._new(p75, function(u78, u79, p80) -- Line: 493
        -- upvalues: u77 (copy), u76 (copy)
        local u81 = {};
        local u82 = {};
        local u83 = 0;
        local u84 = 0;
        local u85 = false;

        local function resolveOne(p86, ...) -- Line: 511
            -- upvalues: u85 (ref), u83 (ref), u77 (ref), u81 (copy), u76 (ref), u78 (copy), u82 (copy)
            if u85 then
                return;
            end;

            u83 = u83 + 1;

            if u77 == nil then
                u81[p86] = ...;
            else
                u81[u83] = ...;
            end;

            if u83 >= (u77 or #u76) then
                u85 = true;
                u78(u81);

                for _, v in ipairs(u82) do
                    v:cancel();
                end;
            end;
        end;

        p80(function() -- Line: 504, Name: cancel
            -- upvalues: u82 (copy)
            for _, v in ipairs(u82) do
                v:cancel();
            end;
        end);

        for i, v in ipairs(u76) do
            u82[i] = v:andThen(function(...) -- Line: 536
                -- upvalues: resolveOne (copy), i (copy)
                resolveOne(i, ...);
            end, function(...) -- Line: 538
                -- upvalues: u84 (ref), u77 (ref), u76 (ref), u82 (copy), u85 (ref), u79 (copy)
                u84 = u84 + 1;

                if u77 == nil or #u76 - u84 < u77 then
                    for _, v2 in ipairs(u82) do
                        v2:cancel();
                    end;

                    u85 = true;
                    u79(...);
                end;
            end);
        end;

        if u85 then
            for _, v in ipairs(u82) do
                v:cancel();
            end;
        end;
    end);
end;

function u44.all(p87) -- Line: 580
    -- upvalues: u44 (copy)
    return u44._all(debug.traceback(nil, 2), p87);
end;

function u44.fold(p88, u89, p90) -- Line: 609
    -- upvalues: u44 (copy)
    local v91 = type(p88) == "table";
    assert(v91, "Bad argument #1 to Promise.fold: must be a table");
    local v92;

    if type(u89) == "function" then
        v92 = true;
    elseif type(u89) == "table" then
        local v93 = getmetatable(u89);

        if v93 then
            local v94 = rawget(v93, "__call");
            v92 = type(v94) == "function";
        else
            v92 = false;
        end;
    else
        v92 = false;
    end;

    assert(v92, "Bad argument #2 to Promise.fold: must be a function");
    local u95 = u44.resolve(p90);

    return u44.each(p88, function(u96, u97) -- Line: 614
        -- upvalues: u95 (ref), u89 (copy)
        u95 = u95:andThen(function(p98) -- Line: 615
            -- upvalues: u89 (ref), u96 (copy), u97 (copy)
            return u89(p98, u96, u97);
        end);
    end):andThen(function() -- Line: 618
        -- upvalues: u95 (ref)
        return u95;
    end);
end;

function u44.some(p99, p100) -- Line: 642
    -- upvalues: u44 (copy)
    local v101 = type(p100) == "number";
    assert(v101, "Bad argument #2 to Promise.some: must be a number");

    return u44._all(debug.traceback(nil, 2), p99, p100);
end;

function u44.any(p102) -- Line: 666
    -- upvalues: u44 (copy)
    return u44._all(debug.traceback(nil, 2), p102, 1):andThen(function(p103) -- Line: 667
        return p103[1];
    end);
end;

function u44.allSettled(u104) -- Line: 688
    -- upvalues: u44 (copy)
    if type(u104) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;

    for i, v in pairs(u104) do
        if not u44.is(v) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(i))), 2);
        end;
    end;

    if #u104 == 0 then
        return u44.resolve({});
    end;

    return u44._new(debug.traceback(nil, 2), function(u105, p106, p107) -- Line: 706
        -- upvalues: u104 (copy)
        local u108 = {};
        local u109 = {};
        local u110 = 0;

        local function u112(p111, ...) -- Line: 716
            -- upvalues: u110 (ref), u108 (copy), u104 (ref), u105 (copy)
            u110 = u110 + 1;
            u108[p111] = ...;

            if u110 >= #u104 then
                u105(u108);
            end;
        end;

        p107(function() -- Line: 726
            -- upvalues: u109 (copy)
            for _, v in ipairs(u109) do
                v:cancel();
            end;
        end);

        for i, v in ipairs(u104) do
            u109[i] = v:finally(function(...) -- Line: 735
                -- upvalues: u112 (copy), i (copy)
                u112(i, ...);
            end);
        end;
    end);
end;

function u44.race(u113) -- Line: 766
    -- upvalues: u44 (copy)
    local v114 = type(u113) == "table";
    assert(v114, string.format("Please pass a list of promises to %s", "Promise.race"));

    for i, v in pairs(u113) do
        local v115 = u44.is(v);
        local format = string.format;
        local v116 = tostring(i);
        assert(v115, format("Non-promise value passed into %s at index %s", "Promise.race", v116));
    end;

    return u44._new(debug.traceback(nil, 2), function(u117, u118, p119) -- Line: 773
        -- upvalues: u113 (copy)
        local u120 = {};
        local u121 = false;

        local function cancel() -- Line: 777
            -- upvalues: u120 (copy)
            for _, v in ipairs(u120) do
                v:cancel();
            end;
        end;

        local function finalize(u122) -- Line: 783
            -- upvalues: u120 (copy), u121 (ref)
            return function(...) -- Line: 784
                -- upvalues: u120 (ref), u121 (ref), u122 (copy)
                for _, v in ipairs(u120) do
                    v:cancel();
                end;

                u121 = true;

                return u122(...);
            end;
        end;

        if p119(function(...) -- Line: 784
            -- upvalues: u120 (copy), u121 (ref), u118 (copy)
            for _, v in ipairs(u120) do
                v:cancel();
            end;

            u121 = true;

            return u118(...);
        end) then
            return;
        end;

        for i, v in ipairs(u113) do
            u120[i] = v:andThen(function(...) -- Line: 784
                -- upvalues: u120 (copy), u121 (ref), u117 (copy)
                for _, v2 in ipairs(u120) do
                    v2:cancel();
                end;

                u121 = true;

                return u117(...);
            end, function(...) -- Line: 784
                -- upvalues: u120 (copy), u121 (ref), u118 (copy)
                for _, v2 in ipairs(u120) do
                    v2:cancel();
                end;

                u121 = true;

                return u118(...);
            end);
        end;

        if u121 then
            for _, v in ipairs(u120) do
                v:cancel();
            end;
        end;
    end);
end;

function u44.each(u123, u124) -- Line: 861
    -- upvalues: u44 (copy), u10 (ref)
    local v125 = type(u123) == "table";
    assert(v125, string.format("Please pass a list of promises to %s", "Promise.each"));
    local v126;

    if type(u124) == "function" then
        v126 = true;
    elseif type(u124) == "table" then
        local v127 = getmetatable(u124);

        if v127 then
            local v128 = rawget(v127, "__call");
            v126 = type(v128) == "function";
        else
            v126 = false;
        end;
    else
        v126 = false;
    end;

    assert(v126, string.format("Please pass a handler function to %s!", "Promise.each"));

    return u44._new(debug.traceback(nil, 2), function(p129, p130, p131) -- Line: 865
        -- upvalues: u123 (copy), u44 (ref), u10 (ref), u124 (copy)
        local v132 = {};
        local u133 = {};
        local u134 = false;

        local function _() -- Line: 871
            -- upvalues: u133 (copy)
            for _, v in ipairs(u133) do
                v:cancel();
            end;
        end;

        p131(function() -- Line: 877
            -- upvalues: u134 (ref), u133 (copy)
            u134 = true;

            for _, v in ipairs(u133) do
                v:cancel();
            end;
        end);
        local v135 = {};

        for i, v in ipairs(u123) do
            if u44.is(v) then
                if v:getStatus() == u44.Status.Cancelled then
                    for _, v2 in ipairs(u133) do
                        v2:cancel();
                    end;

                    return p130(u10.new({
                        error = "Promise is cancelled",
                        kind = u10.Kind.AlreadyCancelled,
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", i, v._source)
                    }));
                end;

                if v:getStatus() == u44.Status.Rejected then
                    for _, v2 in ipairs(u133) do
                        v2:cancel();
                    end;

                    return p130(select(2, v:await()));
                end;

                local v136 = v:andThen(function(...) -- Line: 910
                    return ...;
                end);
                table.insert(u133, v136);
                v135[i] = v136;
            else
                v135[i] = v;
            end;
        end;

        for i, v in ipairs(v135) do
            if u44.is(v) then
                local v137, v = v:await();

                if not v137 then
                    for _, v2 in ipairs(u133) do
                        v2:cancel();
                    end;

                    return p130(v);
                end;
            end;

            if u134 then
                return;
            end;

            local v138 = u44.resolve(u124(v, i));
            table.insert(u133, v138);
            local v139, v140 = v138:await();

            if not v139 then
                for _, v2 in ipairs(u133) do
                    v2:cancel();
                end;

                return p130(v140);
            end;

            v132[i] = v140;
        end;

        p129(v132);
    end);
end;

function u44.is(p141) -- Line: 960
    -- upvalues: u44 (copy)
    if type(p141) ~= "table" then
        return false;
    end;

    local v142 = getmetatable(p141);

    if v142 == u44 then
        return true;
    end;

    if v142 ~= nil then
        if type(v142) == "table" then
            local v143 = rawget(v142, "__index");

            if type(v143) == "table" then
                local v144 = rawget(v142, "__index");
                local v145 = rawget(v144, "andThen");
                local v146;

                if type(v145) == "function" then
                    v146 = true;
                else
                    local v147 = type(v145) == "table" and getmetatable(v145);

                    if v147 then
                        local v148 = rawget(v147, "__call");
                        v146 = type(v148) == "function";
                    else
                        v146 = false;
                    end;
                end;

                if v146 then
                    return true;
                end;
            end;
        end;

        return false;
    end;

    local andThen = p141.andThen;

    if type(andThen) == "function" then
        return true;
    end;

    local v149 = type(andThen) == "table" and getmetatable(andThen);

    if v149 then
        local v150 = rawget(v149, "__call");

        if type(v150) == "function" then
            return true;
        end;
    end;

    return false;
end;

function u44.promisify(u151) -- Line: 1009
    -- upvalues: u44 (copy)
    return function(...) -- Line: 1010
        -- upvalues: u44 (ref), u151 (copy)
        return u44._try(debug.traceback(nil, 2), u151, ...);
    end;
end;

local u152 = nil;
local u153 = nil;

function u44.delay(p154) -- Line: 1040
    -- upvalues: u44 (copy), u153 (ref), u152 (ref)
    local v155 = type(p154) == "number";
    assert(v155, "Bad argument #1 to Promise.delay, must be a number.");
    local u156 = (p154 < 0.016666666666666666 or p154 == (1 / 0)) and 0.016666666666666666 or p154;

    return u44._new(debug.traceback(nil, 2), function(p157, p158, p159) -- Line: 1048
        -- upvalues: u44 (ref), u156 (ref), u153 (ref), u152 (ref)
        local v160 = u44._getTime();
        local v161 = v160 + u156;
        local u162 = {
            resolve = p157,
            startTime = v160,
            endTime = v161
        };

        if u153 == nil then
            u152 = u162;
            u153 = u44._timeEvent:Connect(function() -- Line: 1060
                -- upvalues: u44 (ref), u152 (ref), u153 (ref)
                local v163 = u44._getTime();

                while u152 ~= nil and u152.endTime < v163 do
                    local v164 = u152;
                    u152 = v164.next;

                    if u152 == nil then
                        u153:Disconnect();
                        u153 = nil;
                    else
                        u152.previous = nil;
                    end;

                    v164.resolve(u44._getTime() - v164.startTime);
                end;
            end);
        elseif u152.endTime < v161 then
            local v165 = u152;
            local next2 = v165.next;

            while next2 ~= nil and next2.endTime < v161 do
                v165 = next2;
                next2 = next2.next;
            end;

            v165.next = u162;
            u162.previous = v165;

            if next2 ~= nil then
                u162.next = next2;
                next2.previous = u162;
            end;
        else
            u162.next = u152;
            u152.previous = u162;
            u152 = u162;
        end;

        p159(function() -- Line: 1105
            -- upvalues: u162 (copy), u152 (ref), u153 (ref)
            local next2 = u162.next;

            if u152 == u162 then
                if next2 == nil then
                    u153:Disconnect();
                    u153 = nil;
                else
                    next2.previous = nil;
                end;

                u152 = next2;

                return;
            end;

            local previous = u162.previous;
            previous.next = next2;

            if next2 ~= nil then
                next2.previous = previous;
            end;
        end);
    end);
end;

function u44.prototype.timeout(p166, u167, u168) -- Line: 1169
    -- upvalues: u44 (copy), u10 (ref)
    local u169 = debug.traceback(nil, 2);

    return u44.race({ u44.delay(u167):andThen(function() -- Line: 1173
            -- upvalues: u44 (ref), u168 (copy), u10 (ref), u167 (copy), u169 (copy)
            return u44.reject(u168 == nil and u10.new({
                error = "Timed out",
                kind = u10.Kind.TimedOut,
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", u167, u169)
            }) or u168);
        end), p166 });
end;

function u44.prototype.getStatus(p170) -- Line: 1193
    return p170._status;
end;

function u44.prototype._andThen(u171, u172, u173, u174) -- Line: 1202
    -- upvalues: u44 (copy), runExecutor (copy), u10 (ref)
    u171._unhandledRejection = false;

    return u44._new(u172, function(u175, u176) -- Line: 1206
        -- upvalues: u173 (copy), u172 (copy), runExecutor (ref), u174 (copy), u171 (copy), u44 (ref), u10 (ref)
        local v177;

        if u173 then
            local u178 = u172;
            local u179 = u173;

            v177 = function(...) -- Line: 180
                -- upvalues: runExecutor (ref), u178 (copy), u179 (copy), u175 (copy), u176 (copy)
                local v180, v181, v182 = runExecutor(u178, u179, ...);

                if v180 then
                    u175(unpack(v182, 1, v181));

                    return;
                end;

                u176(v182[1]);
            end;
        else
            v177 = u175;
        end;

        local v183;

        if u174 then
            local u184 = u172;
            local u185 = u174;

            v183 = function(...) -- Line: 180
                -- upvalues: runExecutor (ref), u184 (copy), u185 (copy), u175 (copy), u176 (copy)
                local v186, v187, v188 = runExecutor(u184, u185, ...);

                if v186 then
                    u175(unpack(v188, 1, v187));

                    return;
                end;

                u176(v188[1]);
            end;
        else
            v183 = u176;
        end;

        if u171._status == u44.Status.Started then
            table.insert(u171._queuedResolve, v177);
            table.insert(u171._queuedReject, v183);

            return;
        end;

        if u171._status == u44.Status.Resolved then
            v177(unpack(u171._values, 1, u171._valuesLength));

            return;
        end;

        if u171._status == u44.Status.Rejected then
            v183(unpack(u171._values, 1, u171._valuesLength));

            return;
        end;

        if u171._status == u44.Status.Cancelled then
            u176(u10.new({
                error = "Promise is cancelled",
                kind = u10.Kind.AlreadyCancelled,
                context = "Promise created at\n\n" .. u172
            }));
        end;
    end, u171);
end;

function u44.prototype.andThen(p189, p190, p191) -- Line: 1255
    local v192;

    if p190 == nil or type(p190) == "function" then
        v192 = true;
    elseif type(p190) == "table" then
        local v193 = getmetatable(p190);

        if v193 then
            local v194 = rawget(v193, "__call");
            v192 = type(v194) == "function";
        else
            v192 = false;
        end;
    else
        v192 = false;
    end;

    assert(v192, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    local v195;

    if p191 == nil or type(p191) == "function" then
        v195 = true;
    elseif type(p191) == "table" then
        local v196 = getmetatable(p191);

        if v196 then
            local v197 = rawget(v196, "__call");
            v195 = type(v197) == "function";
        else
            v195 = false;
        end;
    else
        v195 = false;
    end;

    assert(v195, string.format("Please pass a handler function to %s!", "Promise:andThen"));

    return p189:_andThen(debug.traceback(nil, 2), p190, p191);
end;

function u44.prototype.catch(p198, p199) -- Line: 1275
    local v200;

    if p199 == nil or type(p199) == "function" then
        v200 = true;
    elseif type(p199) == "table" then
        local v201 = getmetatable(p199);

        if v201 then
            local v202 = rawget(v201, "__call");
            v200 = type(v202) == "function";
        else
            v200 = false;
        end;
    else
        v200 = false;
    end;

    assert(v200, string.format("Please pass a handler function to %s!", "Promise:catch"));

    return p198:_andThen(debug.traceback(nil, 2), nil, p199);
end;

function u44.prototype.tap(p203, u204) -- Line: 1296
    -- upvalues: u44 (copy), pack (copy)
    local v205;

    if type(u204) == "function" then
        v205 = true;
    elseif type(u204) == "table" then
        local v206 = getmetatable(u204);

        if v206 then
            local v207 = rawget(v206, "__call");
            v205 = type(v207) == "function";
        else
            v205 = false;
        end;
    else
        v205 = false;
    end;

    assert(v205, string.format("Please pass a handler function to %s!", "Promise:tap"));

    return p203:_andThen(debug.traceback(nil, 2), function(...) -- Line: 1298
        -- upvalues: u204 (copy), u44 (ref), pack (ref)
        local v208 = u204(...);

        if not u44.is(v208) then
            return ...;
        end;

        local u209, u210 = pack(...);

        return v208:andThen(function() -- Line: 1303
            -- upvalues: u210 (copy), u209 (copy)
            return unpack(u210, 1, u209);
        end);
    end);
end;

function u44.prototype.andThenCall(p211, u212, ...) -- Line: 1331
    -- upvalues: pack (copy)
    local v213;

    if type(u212) == "function" then
        v213 = true;
    elseif type(u212) == "table" then
        local v214 = getmetatable(u212);

        if v214 then
            local v215 = rawget(v214, "__call");
            v213 = type(v215) == "function";
        else
            v213 = false;
        end;
    else
        v213 = false;
    end;

    assert(v213, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local u216, u217 = pack(...);

    return p211:_andThen(debug.traceback(nil, 2), function() -- Line: 1334
        -- upvalues: u212 (copy), u217 (copy), u216 (copy)
        return u212(unpack(u217, 1, u216));
    end);
end;

function u44.prototype.andThenReturn(p218, ...) -- Line: 1361
    -- upvalues: pack (copy)
    local u219, u220 = pack(...);

    return p218:_andThen(debug.traceback(nil, 2), function() -- Line: 1363
        -- upvalues: u220 (copy), u219 (copy)
        return unpack(u220, 1, u219);
    end);
end;

function u44.prototype.cancel(p221) -- Line: 1379
    -- upvalues: u44 (copy)
    if p221._status ~= u44.Status.Started then
        return;
    end;

    p221._status = u44.Status.Cancelled;

    if p221._cancellationHook then
        p221._cancellationHook();
    end;

    if p221._parent then
        p221._parent:_consumerCancelled(p221);
    end;

    for i in pairs(p221._consumers) do
        i:cancel();
    end;

    p221:_finalize();
end;

function u44.prototype._consumerCancelled(p222, p223) -- Line: 1405
    -- upvalues: u44 (copy)
    if p222._status ~= u44.Status.Started then
        return;
    end;

    p222._consumers[p223] = nil;

    if next(p222._consumers) == nil then
        p222:cancel();
    end;
end;

function u44.prototype._finally(u224, u225, u226, u227) -- Line: 1421
    -- upvalues: u44 (copy), runExecutor (copy)
    if not u227 then
        u224._unhandledRejection = false;
    end;

    return u44._new(u225, function(u228, u229) -- Line: 1427
        -- upvalues: u226 (copy), u225 (copy), runExecutor (ref), u227 (copy), u224 (copy), u44 (ref)
        local u230;

        if u226 then
            local u231 = u225;
            local u232 = u226;

            u230 = function(...) -- Line: 180
                -- upvalues: runExecutor (ref), u231 (copy), u232 (copy), u228 (copy), u229 (copy)
                local v233, v234, v235 = runExecutor(u231, u232, ...);

                if v233 then
                    u228(unpack(v235, 1, v234));

                    return;
                end;

                u229(v235[1]);
            end;
        else
            u230 = u228;
        end;

        local v236 = u227 and function(...) -- Line: 1435
            -- upvalues: u224 (ref), u44 (ref), u228 (copy), u230 (copy)
            if u224._status == u44.Status.Rejected then
                return u228(u224);
            end;

            return u230(...);
        end or u230;

        if u224._status == u44.Status.Started then
            table.insert(u224._queuedFinally, v236);

            return;
        end;

        v236(u224._status);
    end, u224);
end;

function u44.prototype.finally(p237, p238) -- Line: 1485
    local v239;

    if p238 == nil or type(p238) == "function" then
        v239 = true;
    elseif type(p238) == "table" then
        local v240 = getmetatable(p238);

        if v240 then
            local v241 = rawget(v240, "__call");
            v239 = type(v241) == "function";
        else
            v239 = false;
        end;
    else
        v239 = false;
    end;

    assert(v239, string.format("Please pass a handler function to %s!", "Promise:finally"));

    return p237:_finally(debug.traceback(nil, 2), p238);
end;

function u44.prototype.finallyCall(p242, u243, ...) -- Line: 1499
    -- upvalues: pack (copy)
    local v244;

    if type(u243) == "function" then
        v244 = true;
    elseif type(u243) == "table" then
        local v245 = getmetatable(u243);

        if v245 then
            local v246 = rawget(v245, "__call");
            v244 = type(v246) == "function";
        else
            v244 = false;
        end;
    else
        v244 = false;
    end;

    assert(v244, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local u247, u248 = pack(...);

    return p242:_finally(debug.traceback(nil, 2), function() -- Line: 1502
        -- upvalues: u243 (copy), u248 (copy), u247 (copy)
        return u243(unpack(u248, 1, u247));
    end);
end;

function u44.prototype.finallyReturn(p249, ...) -- Line: 1525
    -- upvalues: pack (copy)
    local u250, u251 = pack(...);

    return p249:_finally(debug.traceback(nil, 2), function() -- Line: 1527
        -- upvalues: u251 (copy), u250 (copy)
        return unpack(u251, 1, u250);
    end);
end;

function u44.prototype.done(p252, p253) -- Line: 1548
    local v254;

    if p253 == nil or type(p253) == "function" then
        v254 = true;
    elseif type(p253) == "table" then
        local v255 = getmetatable(p253);

        if v255 then
            local v256 = rawget(v255, "__call");
            v254 = type(v256) == "function";
        else
            v254 = false;
        end;
    else
        v254 = false;
    end;

    assert(v254, string.format("Please pass a handler function to %s!", "Promise:done"));

    return p252:_finally(debug.traceback(nil, 2), p253, true);
end;

function u44.prototype.doneCall(p257, u258, ...) -- Line: 1562
    -- upvalues: pack (copy)
    local v259;

    if type(u258) == "function" then
        v259 = true;
    elseif type(u258) == "table" then
        local v260 = getmetatable(u258);

        if v260 then
            local v261 = rawget(v260, "__call");
            v259 = type(v261) == "function";
        else
            v259 = false;
        end;
    else
        v259 = false;
    end;

    assert(v259, string.format("Please pass a handler function to %s!", "Promise:doneCall"));
    local u262, u263 = pack(...);

    return p257:_finally(debug.traceback(nil, 2), function() -- Line: 1565
        -- upvalues: u258 (copy), u263 (copy), u262 (copy)
        return u258(unpack(u263, 1, u262));
    end, true);
end;

function u44.prototype.doneReturn(p264, ...) -- Line: 1588
    -- upvalues: pack (copy)
    local u265, u266 = pack(...);

    return p264:_finally(debug.traceback(nil, 2), function() -- Line: 1590
        -- upvalues: u266 (copy), u265 (copy)
        return unpack(u266, 1, u265);
    end, true);
end;

function u44.prototype.awaitStatus(p267) -- Line: 1602
    -- upvalues: u44 (copy)
    p267._unhandledRejection = false;

    if p267._status == u44.Status.Started then
        local BindableEvent = Instance.new("BindableEvent");
        p267:finally(function() -- Line: 1608
            -- upvalues: BindableEvent (copy)
            BindableEvent:Fire();
        end);
        BindableEvent.Event:Wait();
        BindableEvent:Destroy();
    end;

    if p267._status == u44.Status.Resolved then
        return p267._status, unpack(p267._values, 1, p267._valuesLength);
    end;

    if p267._status == u44.Status.Rejected then
        return p267._status, unpack(p267._values, 1, p267._valuesLength);
    end;

    return p267._status;
end;

local function awaitHelper(p268, ...) -- Line: 1625
    -- upvalues: u44 (copy)
    return p268 == u44.Status.Resolved, ...;
end;

function u44.prototype.await(p269) -- Line: 1650
    -- upvalues: awaitHelper (copy)
    return awaitHelper(p269:awaitStatus());
end;

local function expectHelper(p270, ...) -- Line: 1654
    -- upvalues: u44 (copy)
    if p270 ~= u44.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;

    return ...;
end;

function u44.prototype.expect(p271) -- Line: 1687
    -- upvalues: expectHelper (copy)
    return expectHelper(p271:awaitStatus());
end;

u44.prototype.awaitValue = u44.prototype.expect;

function u44.prototype._unwrap(p272) -- Line: 1701
    -- upvalues: u44 (copy)
    if p272._status == u44.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;

    return p272._status == u44.Status.Resolved, unpack(p272._values, 1, p272._valuesLength);
end;

function u44.prototype._resolve(u273, ...) -- Line: 1711
    -- upvalues: u44 (copy), u10 (ref), pack (copy)
    if u273._status ~= u44.Status.Started then
        if u44.is((...)) then
            (...):_consumerCancelled(u273);
        end;

        return;
    end;

    if u44.is((...)) then
        if select("#", ...) > 1 then
            local v274 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", u273._source);
            warn(v274);
        end;

        local u275 = ...;
        local v277 = u275:andThen(function(...) -- Line: 1732
            -- upvalues: u273 (copy)
            u273:_resolve(...);
        end, function(...) -- Line: 1734
            -- upvalues: u275 (copy), u10 (ref), u273 (copy)
            local v276 = u275._values[1];

            if u275._error then
                v276 = u10.new({
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
                    error = u275._error,
                    kind = u10.Kind.ExecutionError
                });
            end;

            if u10.isKind(v276, u10.Kind.ExecutionError) then
                return u273:_reject(v276:extend({
                    error = "This Promise was chained to a Promise that errored.",
                    trace = "",
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", u273._source)
                }));
            end;

            u273:_reject(...);
        end);

        if v277._status == u44.Status.Cancelled then
            u273:cancel();

            return;
        end;

        if v277._status == u44.Status.Started then
            u273._parent = v277;
            v277._consumers[u273] = true;
        end;

        return;
    end;

    u273._status = u44.Status.Resolved;
    local v278, v279 = pack(...);
    u273._valuesLength = v278;
    u273._values = v279;

    for _, v in ipairs(u273._queuedResolve) do
        coroutine.wrap(v)(...);
    end;

    u273:_finalize();
end;

function u44.prototype._reject(u280, ...) -- Line: 1782
    -- upvalues: u44 (copy), pack (copy)
    if u280._status ~= u44.Status.Started then
        return;
    end;

    u280._status = u44.Status.Rejected;
    local v281, v282 = pack(...);
    u280._valuesLength = v281;
    u280._values = v282;

    if next(u280._queuedReject) == nil then
        local u283 = tostring((...));
        coroutine.wrap(function() -- Line: 1804
            -- upvalues: u44 (ref), u280 (copy), u283 (copy)
            u44._timeEvent:Wait();

            if not u280._unhandledRejection then
                return;
            end;

            local v284 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u283, u280._source);

            for _, v in ipairs(u44._unhandledRejectionCallbacks) do
                task.spawn(v, u280, unpack(u280._values, 1, u280._valuesLength));
            end;

            if u44.TEST then
                return;
            end;

            warn(v284);
        end)();
    else
        for _, v in ipairs(u280._queuedReject) do
            coroutine.wrap(v)(...);
        end;
    end;

    u280:_finalize();
end;

function u44.prototype._finalize(p285) -- Line: 1836
    -- upvalues: u44 (copy)
    for _, v in ipairs(p285._queuedFinally) do
        coroutine.wrap(v)(p285._status);
    end;

    p285._queuedFinally = nil;
    p285._queuedReject = nil;
    p285._queuedResolve = nil;

    if not u44.TEST then
        p285._parent = nil;
        p285._consumers = nil;
    end;
end;

function u44.prototype.now(p286, p287) -- Line: 1871
    -- upvalues: u44 (copy), u10 (ref)
    local v288 = debug.traceback(nil, 2);

    if p286._status == u44.Status.Resolved then
        return p286:_andThen(v288, function(...) -- Line: 1874
            return ...;
        end);
    end;

    local reject = u44.reject;

    if p287 == nil then
        p287 = u10.new({
            error = "This Promise was not resolved in time for :now()",
            kind = u10.Kind.NotResolvedInTime,
            context = ":now() was called at:\n\n" .. v288
        }) or p287;
    end;

    return reject(p287);
end;

function u44.retry(u289, u290, ...) -- Line: 1915
    -- upvalues: u44 (copy)
    local v291;

    if type(u289) == "function" then
        v291 = true;
    elseif type(u289) == "table" then
        local v292 = getmetatable(u289);

        if v292 then
            local v293 = rawget(v292, "__call");
            v291 = type(v293) == "function";
        else
            v291 = false;
        end;
    else
        v291 = false;
    end;

    assert(v291, "Parameter #1 to Promise.retry must be a function");
    local v294 = type(u290) == "number";
    assert(v294, "Parameter #2 to Promise.retry must be a number");
    local u295 = { ... };
    local u296 = select("#", ...);

    return u44.resolve(u289(...)):catch(function(...) -- Line: 1921
        -- upvalues: u290 (copy), u44 (ref), u289 (copy), u295 (copy), u296 (copy)
        if u290 > 0 then
            return u44.retry(u289, u290 - 1, unpack(u295, 1, u296));
        end;

        return u44.reject(...);
    end);
end;

function u44.retryWithDelay(u297, u298, u299, ...) -- Line: 1942
    -- upvalues: u44 (copy)
    local v300;

    if type(u297) == "function" then
        v300 = true;
    elseif type(u297) == "table" then
        local v301 = getmetatable(u297);

        if v301 then
            local v302 = rawget(v301, "__call");
            v300 = type(v302) == "function";
        else
            v300 = false;
        end;
    else
        v300 = false;
    end;

    assert(v300, "Parameter #1 to Promise.retry must be a function");
    local v303 = type(u298) == "number";
    assert(v303, "Parameter #2 (times) to Promise.retry must be a number");
    local v304 = type(u299) == "number";
    assert(v304, "Parameter #3 (seconds) to Promise.retry must be a number");
    local u305 = { ... };
    local u306 = select("#", ...);

    return u44.resolve(u297(...)):catch(function(...) -- Line: 1949
        -- upvalues: u298 (copy), u44 (ref), u299 (copy), u297 (copy), u305 (copy), u306 (copy)
        if u298 <= 0 then
            return u44.reject(...);
        end;

        u44.delay(u299):await();

        return u44.retryWithDelay(u297, u298 - 1, u299, unpack(u305, 1, u306));
    end);
end;

function u44.fromEvent(u307, p308) -- Line: 1984
    -- upvalues: u44 (copy)
    local u309 = p308 or function() -- Line: 1985
        return true;
    end;

    return u44._new(debug.traceback(nil, 2), function(u310, p311, p312) -- Line: 1989
        -- upvalues: u307 (copy), u309 (ref)
        local u313 = nil;
        local u314 = false;

        local function disconnect() -- Line: 1993
            -- upvalues: u313 (ref)
            u313:Disconnect();
            u313 = nil;
        end;

        u313 = u307:Connect(function(...) -- Line: 2002
            -- upvalues: u309 (ref), u310 (copy), u313 (ref), u314 (ref)
            local v315 = u309(...);

            if v315 ~= true then
                if type(v315) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;

                return;
            end;

            u310(...);

            if not u313 then
                u314 = true;

                return;
            end;

            u313:Disconnect();
            u313 = nil;
        end);

        if u314 and u313 then
            return disconnect();
        end;

        p312(disconnect);
    end);
end;

function u44.onUnhandledRejection(u316) -- Line: 2036
    -- upvalues: u44 (copy)
    table.insert(u44._unhandledRejectionCallbacks, u316);

    return function() -- Line: 2039
        -- upvalues: u44 (ref), u316 (copy)
        local v317 = table.find(u44._unhandledRejectionCallbacks, u316);

        if v317 then
            table.remove(u44._unhandledRejectionCallbacks, v317);
        end;
    end;
end;

return u44;