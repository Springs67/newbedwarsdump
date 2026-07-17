-- Decompiled with Potassium's decompiler.

local Binding = require(script.Parent.Binding);
local Children = require(script.Parent.PropMarkers.Children);
local ElementKind = require(script.Parent.ElementKind);
local SingleEventManager = require(script.Parent.SingleEventManager);
local getDefaultInstanceProperty = require(script.Parent.getDefaultInstanceProperty);
local Ref = require(script.Parent.PropMarkers.Ref);
local Constant = require(script.Parent.PropMarkers.Constant);
local Type = require(script.Parent.Type);
local internalAssert = require(script.Parent.internalAssert);
local u1 = require(script.Parent.GlobalConfig).get();

local function identity(...) -- Line: 33
    return ...;
end;

local function applyRef(p2, p3) -- Line: 37
    -- upvalues: Type (copy), Binding (copy)
    if p2 == nil then
        return;
    end;

    if typeof(p2) == "function" then
        p2(p3);

        return;
    end;

    if Type.of(p2) == Type.Binding then
        Binding.update(p2, p3);

        return;
    end;

    error(("Invalid ref: Expected type Binding but got %s"):format((typeof(p2))));
end;

local function setRobloxInstanceProperty(p4, p5, p6) -- Line: 52
    -- upvalues: getDefaultInstanceProperty (copy)
    if p6 == nil then
        local v7;
        v7, p6 = getDefaultInstanceProperty(p4.ClassName, p5);
    end;

    p4[p5] = p6;
end;

local function removeBinding(p8, p9) -- Line: 65
    p8.bindings[p9]();
    p8.bindings[p9] = nil;
end;

local function attachBinding(u10, u11, p12) -- Line: 71
    -- upvalues: Constant (copy), getDefaultInstanceProperty (copy), identity (copy), Binding (copy)
    local function updateBoundProperty(u13) -- Line: 72
        -- upvalues: Constant (ref), u10 (copy), u11 (copy), getDefaultInstanceProperty (ref), identity (ref)
        if u13 == Constant.SkipBindingUpdate then
            return;
        end;

        local v17, v18 = xpcall(function() -- Line: 77
            -- upvalues: u10 (ref), u11 (ref), u13 (copy), getDefaultInstanceProperty (ref)
            local hostObject = u10.hostObject;
            local v14 = u11;
            local v15 = u13;

            if v15 == nil then
                local v16;
                v16, v15 = getDefaultInstanceProperty(hostObject.ClassName, v14);
            end;

            hostObject[v14] = v15;
        end, identity);

        if not v17 then
            local source = u10.currentElement.source;
            local v19 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v18, source == nil and "<enable element tracebacks>" or source);
            error(v19, 0);
        end;
    end;

    if u10.bindings == nil then
        u10.bindings = {};
    end;

    u10.bindings[u11] = Binding.subscribe(p12, updateBoundProperty);
    updateBoundProperty(p12:getValue());
end;

local function detachAllBindings(p20) -- Line: 102
    if p20.bindings ~= nil then
        for _, v in pairs(p20.bindings) do
            v();
        end;

        p20.bindings = nil;
    end;
end;

local function applyProp(p21, p22, p23, p24) -- Line: 111
    -- upvalues: Ref (copy), Children (copy), Type (copy), SingleEventManager (copy), attachBinding (copy), getDefaultInstanceProperty (copy)
    if p23 == p24 then
        return;
    end;

    if p22 == Ref or p22 == Children then
        return;
    end;

    local v25 = Type.of(p22);

    if v25 == Type.HostEvent or v25 == Type.HostChangeEvent then
        if p21.eventManager == nil then
            p21.eventManager = SingleEventManager.new(p21.hostObject);
        end;

        local name = p22.name;

        if v25 == Type.HostChangeEvent then
            p21.eventManager:connectPropertyChange(name, p23);

            return;
        end;

        p21.eventManager:connectEvent(name, p23);

        return;
    end;

    local v26 = Type.of(p23) == Type.Binding;

    if Type.of(p24) == Type.Binding then
        p21.bindings[p22]();
        p21.bindings[p22] = nil;
    end;

    if v26 then
        attachBinding(p21, p22, p23);

        return;
    end;

    local hostObject = p21.hostObject;

    if p23 == nil then
        local v27;
        v27, p23 = getDefaultInstanceProperty(hostObject.ClassName, p22);
    end;

    hostObject[p22] = p23;
end;

local function applyProps(p28, p29) -- Line: 153
    -- upvalues: applyProp (copy)
    for i, v in pairs(p29) do
        applyProp(p28, i, v, nil);
    end;
end;

local function updateProps(p30, p31, p32) -- Line: 159
    -- upvalues: applyProp (copy)
    for i, v in pairs(p32) do
        applyProp(p30, i, v, p31[i]);
    end;

    for i, v in pairs(p31) do
        if p32[i] == nil then
            applyProp(p30, i, nil, v);
        end;
    end;
end;

return {
    isHostObject = function(p33) -- Line: 179, Name: isHostObject
        return typeof(p33) == "Instance";
    end,

    mountHostNode = function(p34, u35) -- Line: 183, Name: mountHostNode
        -- upvalues: u1 (copy), internalAssert (copy), ElementKind (copy), applyProps (copy), identity (copy), Children (copy), applyRef (copy), Ref (copy)
        local currentElement = u35.currentElement;
        local hostParent = u35.hostParent;
        local hostKey = u35.hostKey;

        if u1.internalTypeChecks then
            internalAssert(ElementKind.of(currentElement) == ElementKind.Host, "Element at given node is not a host Element");
        end;

        if u1.typeChecks then
            assert(currentElement.props.Name == nil, "Name can not be specified as a prop to a host component in Roact.");
            assert(currentElement.props.Parent == nil, "Parent can not be specified as a prop to a host component in Roact.");
        end;

        local v36 = Instance.new(currentElement.component);
        u35.hostObject = v36;
        local v37, v38 = xpcall(function() -- Line: 199
            -- upvalues: applyProps (ref), u35 (copy), currentElement (copy)
            applyProps(u35, currentElement.props);
        end, identity);

        if not v37 then
            local source = currentElement.source;
            local v39 = ("Error applying props:\n\t%s\nIn element:\n%s\n"):format(v38, source == nil and "<enable element tracebacks>" or source);
            error(v39, 0);
        end;

        v36.Name = tostring(hostKey);
        local v40 = currentElement.props[Children];

        if v40 ~= nil then
            p34.updateVirtualNodeWithChildren(u35, u35.hostObject, v40);
        end;

        v36.Parent = hostParent;
        u35.hostObject = v36;
        applyRef(currentElement.props[Ref], v36);

        if u35.eventManager ~= nil then
            u35.eventManager:resume();
        end;
    end,

    unmountHostNode = function(p41, p42) -- Line: 232, Name: unmountHostNode
        -- upvalues: applyRef (copy), Ref (copy)
        applyRef(p42.currentElement.props[Ref], nil);

        for _, v in pairs(p42.children) do
            p41.unmountVirtualNode(v);
        end;

        if p42.bindings ~= nil then
            for _, v in pairs(p42.bindings) do
                v();
            end;

            p42.bindings = nil;
        end;

        p42.hostObject:Destroy();
    end,

    updateHostNode = function(p43, u44, p45) -- Line: 246, Name: updateHostNode
        -- upvalues: Ref (copy), applyRef (copy), updateProps (copy), identity (copy), Children (copy)
        local props = u44.currentElement.props;
        local props2 = p45.props;

        if u44.eventManager ~= nil then
            u44.eventManager:suspend();
        end;

        if props[Ref] ~= props2[Ref] then
            applyRef(props[Ref], nil);
            applyRef(props2[Ref], u44.hostObject);
        end;

        local v46, v47 = xpcall(function() -- Line: 260
            -- upvalues: updateProps (ref), u44 (copy), props (copy), props2 (copy)
            updateProps(u44, props, props2);
        end, identity);

        if not v46 then
            local source = p45.source;
            local v48 = ("Error updating props:\n\t%s\nIn element:\n%s\n"):format(v47, source == nil and "<enable element tracebacks>" or source);
            error(v48, 0);
        end;

        local v49 = p45.props[Children];

        if v49 ~= nil or props[Children] ~= nil then
            p43.updateVirtualNodeWithChildren(u44, u44.hostObject, v49);
        end;

        if u44.eventManager ~= nil then
            u44.eventManager:resume();
        end;

        return u44;
    end
};