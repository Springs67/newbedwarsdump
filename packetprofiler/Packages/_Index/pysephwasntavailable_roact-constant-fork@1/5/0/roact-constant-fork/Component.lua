-- Decompiled with Potassium's decompiler.

local assign = require(script.Parent.assign);
local ComponentLifecyclePhase = require(script.Parent.ComponentLifecyclePhase);
local Type = require(script.Parent.Type);
local Symbol = require(script.Parent.Symbol);
local invalidSetStateMessages = require(script.Parent.invalidSetStateMessages);
local internalAssert = require(script.Parent.internalAssert);
local u1 = require(script.Parent.GlobalConfig).get();
local u2 = Symbol.named("InternalData");
local u4 = {
    __tostring = function(p3) -- Line: 29, Name: __tostring
        return p3.__componentName;
    end
};
local v5 = {};
setmetatable(v5, u4);
v5[Type] = Type.StatefulComponentClass;
v5.__index = v5;
v5.__componentName = "Component";

function v5.extend(p6, p7) -- Line: 45
    -- upvalues: u1 (copy), Type (copy), u4 (copy)
    if u1.typeChecks then
        local v8 = Type.of(p6) == Type.StatefulComponentClass;
        assert(v8, "Invalid `self` argument to `extend`.");
        local v9 = typeof(p7) == "string";
        assert(v9, "Component class name must be a string");
    end;

    local v10 = {};

    for i, v in pairs(p6) do
        if i ~= "extend" then
            v10[i] = v;
        end;
    end;

    v10[Type] = Type.StatefulComponentClass;
    v10.__index = v10;
    v10.__componentName = p7;
    setmetatable(v10, u4);

    return v10;
end;

function v5.__getDerivedState(p11, p12, p13) -- Line: 71
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p11) == Type.StatefulComponentInstance, "Invalid use of `__getDerivedState`");
    end;

    local componentClass = p11[u2].componentClass;

    if componentClass.getDerivedStateFromProps ~= nil then
        local v14 = componentClass.getDerivedStateFromProps(p12, p13);

        if v14 ~= nil then
            if u1.typeChecks then
                local v15 = typeof(v14) == "table";
                assert(v15, "getDerivedStateFromProps must return a table!");
            end;

            return v14;
        end;
    end;

    return nil;
end;

function v5.setState(p16, p17) -- Line: 94
    -- upvalues: u1 (copy), Type (copy), u2 (copy), ComponentLifecyclePhase (copy), invalidSetStateMessages (copy), assign (copy)
    if u1.typeChecks then
        local v18 = Type.of(p16) == Type.StatefulComponentInstance;
        assert(v18, "Invalid `self` argument to `extend`.");
    end;

    local v19 = p16[u2];
    local lifecyclePhase = v19.lifecyclePhase;

    if lifecyclePhase == ComponentLifecyclePhase.ShouldUpdate or (lifecyclePhase == ComponentLifecyclePhase.WillUpdate or lifecyclePhase == ComponentLifecyclePhase.Render) then
        local v20 = invalidSetStateMessages[v19.lifecyclePhase]:format((tostring(v19.componentClass)));
        error(v20, 2);
    elseif lifecyclePhase == ComponentLifecyclePhase.WillUnmount then
        return;
    end;

    local pendingState = v19.pendingState;
    local v21 = nil;

    if typeof(p17) == "function" then
        v21 = p17(pendingState or p16.state, p16.props);

        if v21 == nil then
            return;
        end;
    elseif typeof(p17) == "table" then
        v21 = p17;
    else
        error("Invalid argument to setState, expected function or table", 2);
    end;

    local v22;

    if pendingState == nil then
        v22 = assign({}, p16.state, v21);
    else
        v22 = assign(pendingState, v21);
    end;

    if lifecyclePhase == ComponentLifecyclePhase.Init then
        p16.state = assign(v22, (p16:__getDerivedState(p16.props, v22)));

        return;
    end;

    if lifecyclePhase == ComponentLifecyclePhase.DidMount or (lifecyclePhase == ComponentLifecyclePhase.DidUpdate or lifecyclePhase == ComponentLifecyclePhase.ReconcileChildren) then
        v19.pendingState = assign(v22, (p16:__getDerivedState(p16.props, v22)));

        return;
    end;

    if lifecyclePhase == ComponentLifecyclePhase.Idle then
        p16:__update(nil, v22);

        return;
    end;

    local v23 = invalidSetStateMessages.default:format((tostring(v19.componentClass)));
    error(v23, 2);
end;

function v5.getElementTraceback(p24) -- Line: 178
    -- upvalues: u2 (copy)
    return p24[u2].virtualNode.currentElement.source;
end;

function v5.render(p25) -- Line: 189
    -- upvalues: u2 (copy)
    local v26 = ("The component %q is missing the `render` method.\n`render` must be defined when creating a Roact component!"):format((tostring(p25[u2].componentClass)));
    error(v26, 0);
end;

function v5.__getContext(p27, p28) -- Line: 201
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p27) == Type.StatefulComponentInstance, "Invalid use of `__getContext`");
        internalAssert(p28 ~= nil, "Context key cannot be nil");
    end;

    return p27[u2].virtualNode.context[p28];
end;

function v5.__addContext(p29, p30, p31) -- Line: 217
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy), assign (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p29) == Type.StatefulComponentInstance, "Invalid use of `__addContext`");
    end;

    local virtualNode = p29[u2].virtualNode;

    if virtualNode.originalContext == nil then
        virtualNode.originalContext = virtualNode.context;
    end;

    virtualNode.context = assign({}, virtualNode.context, {
        [p30] = p31
    });
end;

function v5.__validateProps(p32, p33) -- Line: 244
    -- upvalues: u1 (copy), u2 (copy)
    if not u1.propValidation then
        return;
    end;

    local validateProps = p32[u2].componentClass.validateProps;

    if validateProps == nil then
        return;
    end;

    if typeof(validateProps) ~= "function" then
        error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(validateProps), p32.__componentName));
    end;

    local v34, v35 = validateProps(p33);

    if not v34 then
        error(("Property validation failed in %s: %s\n\n%s"):format(p32.__componentName, tostring(v35 or "<Validator function did not supply a message>"), p32:getElementTraceback() or "<enable element tracebacks>"), 0);
    end;
end;

function v5.__mount(p36, p37, p38) -- Line: 283
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), ComponentLifecyclePhase (copy), u2 (copy), assign (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p36) == Type.StatefulComponentClass, "Invalid use of `__mount`");
        internalAssert(Type.of(p38) == Type.VirtualNode, "Expected arg #2 to be of type VirtualNode");
    end;

    local currentElement = p38.currentElement;
    local hostParent = p38.hostParent;
    local v39 = {
        pendingState = nil,
        reconciler = p37,
        virtualNode = p38,
        componentClass = p36,
        lifecyclePhase = ComponentLifecyclePhase.Init
    };
    local v40 = {
        [Type] = Type.StatefulComponentInstance,
        [u2] = v39
    };
    setmetatable(v40, p36);
    p38.instance = v40;
    local props = currentElement.props;

    if p36.defaultProps ~= nil then
        props = assign({}, p36.defaultProps, props);
    end;

    v40:__validateProps(props);
    v40.props = props;
    v40._context = assign({}, p38.legacyContext);
    v40.state = assign({}, v40:__getDerivedState(v40.props, {}));

    if v40.init ~= nil then
        v40:init(v40.props);
        assign(v40.state, v40:__getDerivedState(v40.props, v40.state));
    end;

    p38.legacyContext = v40._context;
    v39.lifecyclePhase = ComponentLifecyclePhase.Render;
    local v41 = v40:render();
    v39.lifecyclePhase = ComponentLifecyclePhase.ReconcileChildren;
    p37.updateVirtualNodeWithRenderResult(p38, hostParent, v41);

    if v40.didMount ~= nil then
        v39.lifecyclePhase = ComponentLifecyclePhase.DidMount;
        v40:didMount();
    end;

    if v39.pendingState ~= nil then
        v40:__update(nil, nil);
    end;

    v39.lifecyclePhase = ComponentLifecyclePhase.Idle;
end;

function v5.__unmount(p42) -- Line: 357
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy), ComponentLifecyclePhase (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p42) == Type.StatefulComponentInstance, "Invalid use of `__unmount`");
    end;

    local v43 = p42[u2];
    local virtualNode = v43.virtualNode;
    local reconciler = v43.reconciler;

    if p42.willUnmount ~= nil then
        v43.lifecyclePhase = ComponentLifecyclePhase.WillUnmount;
        p42:willUnmount();
    end;

    for _, v in pairs(virtualNode.children) do
        reconciler.unmountVirtualNode(v);
    end;
end;

function v5.__update(p44, p45, p46) -- Line: 382
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy), assign (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p44) == Type.StatefulComponentInstance, "Invalid use of `__update`");
        internalAssert(Type.of(p45) == Type.Element and true or p45 == nil, "Expected arg #1 to be of type Element or nil");
        internalAssert(typeof(p46) == "table" and true or p46 == nil, "Expected arg #2 to be of type table or nil");
    end;

    local v47 = p44[u2];
    local componentClass = v47.componentClass;
    local props = p44.props;

    if p45 ~= nil then
        props = p45.props;

        if componentClass.defaultProps ~= nil then
            props = assign({}, componentClass.defaultProps, props);
        end;

        p44:__validateProps(props);
    end;

    local v48 = 0;

    while true do
        local v49;

        if v47.pendingState == nil then
            v49 = nil;
        else
            v49 = v47.pendingState;
            v47.pendingState = nil;
        end;

        if p46 ~= nil or props ~= p44.props then
            if v49 == nil then
                v49 = p46 or p44.state;
            else
                v49 = assign(v49, p46);
            end;

            local v50 = p44:__getDerivedState(props, v49);

            if v50 ~= nil then
                v49 = assign({}, v49, v50);
            end;

            p46 = nil;
        end;

        if not p44:__resolveUpdate(props, v49) then
            return false;
        end;

        v48 = v48 + 1;

        if v48 > 100 then
            error(("The component %q has reached the setState update recursion limit.\nWhen using `setState` in `didUpdate`, make sure that it won\'t repeat infinitely!"):format((tostring(v47.componentClass))), 3);
        end;

        if v47.pendingState == nil then
            return true;
        end;
    end;
end;

function v5.__resolveUpdate(p51, p52, p53) -- Line: 459
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), u2 (copy), ComponentLifecyclePhase (copy)
    if u1.internalTypeChecks then
        internalAssert(Type.of(p51) == Type.StatefulComponentInstance, "Invalid use of `__resolveUpdate`");
    end;

    local v54 = p51[u2];
    local virtualNode = v54.virtualNode;
    local reconciler = v54.reconciler;
    local props = p51.props;
    local state = p51.state;

    if p52 == nil then
        p52 = props;
    end;

    if p53 == nil then
        p53 = state;
    end;

    if p51.shouldUpdate ~= nil then
        v54.lifecyclePhase = ComponentLifecyclePhase.ShouldUpdate;

        if not p51:shouldUpdate(p52, p53) then
            v54.lifecyclePhase = ComponentLifecyclePhase.Idle;

            return false;
        end;
    end;

    if p51.willUpdate ~= nil then
        v54.lifecyclePhase = ComponentLifecyclePhase.WillUpdate;
        p51:willUpdate(p52, p53);
    end;

    v54.lifecyclePhase = ComponentLifecyclePhase.Render;
    p51.props = p52;
    p51.state = p53;
    local v55 = virtualNode.instance:render();
    v54.lifecyclePhase = ComponentLifecyclePhase.ReconcileChildren;
    reconciler.updateVirtualNodeWithRenderResult(virtualNode, virtualNode.hostParent, v55);

    if p51.didUpdate ~= nil then
        v54.lifecyclePhase = ComponentLifecyclePhase.DidUpdate;
        p51:didUpdate(props, state);
    end;

    v54.lifecyclePhase = ComponentLifecyclePhase.Idle;

    return true;
end;

return v5;