-- Decompiled with Potassium's decompiler.

local createSignal = require(script.Parent.createSignal);
local Symbol = require(script.Parent.Symbol);
local Type = require(script.Parent.Type);
local u1 = require(script.Parent.GlobalConfig).get();
local u2 = Symbol.named("BindingImpl");
local u3 = {};
local u8 = {
    __index = {
        getValue = function(p4) -- Line: 13, Name: getValue
            -- upvalues: u3 (copy)
            return u3.getValue(p4);
        end,

        map = function(p5, p6) -- Line: 17, Name: map
            -- upvalues: u3 (copy)
            return u3.map(p5, p6);
        end
    },

    __tostring = function(p7) -- Line: 23, Name: __tostring
        return string.format("RoactBinding(%s)", (tostring(p7:getValue())));
    end
};

function u3.update(p9, p10) -- Line: 28
    -- upvalues: u2 (copy)
    return p9[u2].update(p10);
end;

function u3.subscribe(p11, p12) -- Line: 32
    -- upvalues: u2 (copy)
    return p11[u2].subscribe(p12);
end;

function u3.getValue(p13) -- Line: 36
    -- upvalues: u2 (copy)
    return p13[u2].getValue();
end;

function u3.create(p14) -- Line: 40
    -- upvalues: createSignal (copy), Type (copy), u2 (copy), u8 (copy)
    local u15 = {
        value = p14,
        changeSignal = createSignal()
    };

    function u15.subscribe(p16) -- Line: 46
        -- upvalues: u15 (copy)
        return u15.changeSignal:subscribe(p16);
    end;

    function u15.update(p17) -- Line: 50
        -- upvalues: u15 (copy)
        u15.value = p17;
        u15.changeSignal:fire(p17);
    end;

    function u15.getValue() -- Line: 55
        -- upvalues: u15 (copy)
        return u15.value;
    end;

    return setmetatable({
        [Type] = Type.Binding,
        [u2] = u15
    }, u8), u15.update;
end;

function u3.map(u18, u19) -- Line: 65
    -- upvalues: u1 (copy), Type (copy), u3 (copy), u2 (copy), u8 (copy)
    if u1.typeChecks then
        local v20 = Type.of(u18) == Type.Binding;
        assert(v20, "Expected arg #1 to be a binding");
        local v21 = typeof(u19) == "function";
        assert(v21, "Expected arg #1 to be a function");
    end;

    return setmetatable({
        [Type] = Type.Binding,
        [u2] = {
            subscribe = function(u22) -- Line: 73, Name: subscribe
                -- upvalues: u3 (ref), u18 (copy), u19 (copy)
                return u3.subscribe(u18, function(p23) -- Line: 74
                    -- upvalues: u22 (copy), u19 (ref)
                    u22(u19(p23));
                end);
            end,

            update = function(p24) -- Line: 79, Name: update
                error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
            end,

            getValue = function() -- Line: 83, Name: getValue
                -- upvalues: u19 (copy), u18 (copy)
                return u19(u18:getValue());
            end
        }
    }, u8);
end;

function u3.join(u25) -- Line: 93
    -- upvalues: u1 (copy), Type (copy), u3 (copy), u2 (copy), u8 (copy)
    if u1.typeChecks then
        local v26 = typeof(u25) == "table";
        assert(v26, "Expected arg #1 to be of type table");

        for i, v in pairs(u25) do
            if Type.of(v) ~= Type.Binding then
                local v27 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(i)));
                error(v27, 2);
            end;
        end;
    end;

    local v28 = {};

    local function getValue() -- Line: 109
        -- upvalues: u25 (copy)
        local v29 = {};

        for i, v in pairs(u25) do
            v29[i] = v:getValue();
        end;

        return v29;
    end;

    function v28.subscribe(u30) -- Line: 119
        -- upvalues: u25 (copy), u3 (ref), getValue (copy)
        local u31 = {};

        for i, v in pairs(u25) do
            u31[i] = u3.subscribe(v, function(p32) -- Line: 123
                -- upvalues: u30 (copy), getValue (ref)
                u30((getValue()));
            end);
        end;

        return function() -- Line: 128
            -- upvalues: u31 (ref)
            if u31 == nil then
                return;
            end;

            for _, v in pairs(u31) do
                v();
            end;

            u31 = nil;
        end;
    end;

    function v28.update(p33) -- Line: 141
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;

    function v28.getValue() -- Line: 145
        -- upvalues: getValue (copy)
        return getValue();
    end;

    return setmetatable({
        [Type] = Type.Binding,
        [u2] = v28
    }, u8);
end;

return u3;