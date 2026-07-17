-- Decompiled with Potassium's decompiler.

return function() -- Line: 15, Name: createSignal
    local u1 = {};
    local u2 = {};
    local u3 = false;

    return {
        subscribe = function(p4, u5) -- Line: 20, Name: subscribe
            -- upvalues: u3 (ref), u1 (copy), u2 (copy)
            local v6 = typeof(u5) == "function";
            assert(v6, "Can only subscribe to signals with a function.");
            local u7 = {
                disconnected = false,
                callback = u5
            };

            if u3 and not u1[u5] then
                u2[u5] = u7;
            end;

            u1[u5] = u7;

            return function() -- Line: 36, Name: disconnect
                -- upvalues: u7 (copy), u1 (ref), u5 (copy), u2 (ref)
                assert(not u7.disconnected, "Listeners can only be disconnected once.");
                u7.disconnected = true;
                u1[u5] = nil;
                u2[u5] = nil;
            end;
        end,

        fire = function(p8, ...) -- Line: 47, Name: fire
            -- upvalues: u3 (ref), u1 (copy), u2 (copy)
            u3 = true;

            for i, v in pairs(u1) do
                if not (v.disconnected or u2[i]) then
                    i(...);
                end;
            end;

            u3 = false;

            for i, _ in pairs(u2) do
                u2[i] = nil;
            end;
        end
    };
end;