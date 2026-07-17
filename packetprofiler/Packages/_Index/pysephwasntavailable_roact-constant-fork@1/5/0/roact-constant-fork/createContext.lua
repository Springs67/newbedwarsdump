-- Decompiled with Potassium's decompiler.

local Symbol = require(script.Parent.Symbol);
local createFragment = require(script.Parent.createFragment);
local createSignal = require(script.Parent.createSignal);
local Children = require(script.Parent.PropMarkers.Children);
local Component = require(script.Parent.Component);

local function createContextEntry(p1) -- Line: 10
    -- upvalues: createSignal (copy)
    return {
        value = p1,
        onUpdate = createSignal()
    };
end;

local function createProvider(u2) -- Line: 17
    -- upvalues: Component (copy), createSignal (copy), createFragment (copy), Children (copy)
    local v3 = Component:extend("Provider");

    function v3.init(p4, p5) -- Line: 20
        -- upvalues: createSignal (ref), u2 (copy)
        p4.contextEntry = {
            value = p5.value,
            onUpdate = createSignal()
        };
        p4:__addContext(u2.key, p4.contextEntry);
    end;

    function v3.willUpdate(p6, p7) -- Line: 25
        if p7.value ~= p6.props.value then
            p6.contextEntry.value = p7.value;
        end;
    end;

    function v3.didUpdate(p8, p9) -- Line: 36
        if p9.value ~= p8.props.value then
            p8.contextEntry.onUpdate:fire(p8.props.value);
        end;
    end;

    function v3.render(p10) -- Line: 51
        -- upvalues: createFragment (ref), Children (ref)
        return createFragment(p10.props[Children]);
    end;

    return v3;
end;

local function createConsumer(u11) -- Line: 58
    -- upvalues: Component (copy)
    local v12 = Component:extend("Consumer");

    function v12.validateProps(p13) -- Line: 61
        if type(p13.render) == "function" then
            return true;
        end;

        return false, "Consumer expects a `render` function";
    end;

    function v12.init(p14, p15) -- Line: 69
        -- upvalues: u11 (copy)
        p14.contextEntry = p14:__getContext(u11.key);
    end;

    function v12.render(p16) -- Line: 75
        -- upvalues: u11 (copy)
        local v17;

        if p16.contextEntry == nil then
            v17 = u11.defaultValue;
        else
            v17 = p16.contextEntry.value;
        end;

        return p16.props.render(v17);
    end;

    function v12.didUpdate(p18) -- Line: 90
        if p18.contextEntry ~= nil then
            p18.lastValue = p18.contextEntry.value;
        end;
    end;

    function v12.didMount(u19) -- Line: 99
        if u19.contextEntry ~= nil then
            u19.disconnect = u19.contextEntry.onUpdate:subscribe(function(p20) -- Line: 110
                -- upvalues: u19 (copy)
                if p20 ~= u19.lastValue then
                    u19:setState({});
                end;
            end);
        end;
    end;

    function v12.willUnmount(p21) -- Line: 119
        if p21.disconnect ~= nil then
            p21.disconnect();
            p21.disconnect = nil;
        end;
    end;

    return v12;
end;

local u22 = {};
u22.__index = u22;

function u22.new(p23) -- Line: 132
    -- upvalues: Symbol (copy), u22 (copy)
    local v24 = {
        defaultValue = p23,
        key = Symbol.named("ContextKey")
    };

    return setmetatable(v24, u22);
end;

function u22.__tostring(p25) -- Line: 139
    return "RoactContext";
end;

return function(p26) -- Line: 143, Name: createContext
    -- upvalues: u22 (copy), createProvider (copy), createConsumer (copy)
    local v27 = u22.new(p26);

    return {
        Provider = createProvider(v27),
        Consumer = createConsumer(v27)
    };
end;