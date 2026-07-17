-- Decompiled with Potassium's decompiler.

local Type = require(script.Parent.Type);
local ElementKind = require(script.Parent.ElementKind);
local ElementUtils = require(script.Parent.ElementUtils);
local Children = require(script.Parent.PropMarkers.Children);
local Symbol = require(script.Parent.Symbol);
local internalAssert = require(script.Parent.internalAssert);
local u1 = require(script.Parent.GlobalConfig).get();
local u2 = Symbol.named("InternalData");

return function(u3) -- Line: 25, Name: createReconciler
    -- upvalues: u1 (copy), internalAssert (copy), Type (copy), ElementUtils (copy), ElementKind (copy), Children (copy), u2 (copy)
    local u4 = nil;
    local u5 = nil;
    local u6 = nil;
    local u7 = nil;

    local function replaceVirtualNode(p8, p9) -- Line: 37
        -- upvalues: u7 (ref), u5 (ref)
        local hostParent = p8.hostParent;
        local hostKey = p8.hostKey;
        local depth = p8.depth;
        local parent = p8.parent;
        local v10 = p8.originalContext or p8.context;
        local parentLegacyContext = p8.parentLegacyContext;

        if not p8.wasUnmounted then
            u7(p8);
        end;

        local v11 = u5(p9, hostParent, hostKey, v10, parentLegacyContext);

        if v11 ~= nil then
            v11.depth = depth;
            v11.parent = parent;
        end;

        return v11;
    end;

    local function updateChildren(p12, p13, p14) -- Line: 70
        -- upvalues: u1 (ref), internalAssert (ref), Type (ref), ElementUtils (ref), u6 (ref), u7 (ref), u5 (ref)
        if u1.internalTypeChecks then
            internalAssert(Type.of(p12) == Type.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;

        p12.updateChildrenCount = p12.updateChildrenCount + 1;
        local updateChildrenCount = p12.updateChildrenCount;
        local v15 = {};

        for i, v in pairs(p12.children) do
            local v16 = u6(v, (ElementUtils.getElementByKey(p14, i)));

            if p12.updateChildrenCount ~= updateChildrenCount then
                if v16 and v16 ~= p12.children[i] then
                    u7(v16);
                end;

                return;
            end;

            if v16 == nil then
                v15[i] = true;
            else
                p12.children[i] = v16;
            end;
        end;

        for i in pairs(v15) do
            p12.children[i] = nil;
        end;

        for i, v in ElementUtils.iterateElements(p14) do
            local v17;

            if i == ElementUtils.UseParentKey then
                v17 = p12.hostKey;
            else
                v17 = i;
            end;

            if p12.children[i] == nil then
                local v18 = u5(v, p13, v17, p12.context, p12.legacyContext);

                if p12.updateChildrenCount ~= updateChildrenCount then
                    if v18 then
                        u7(v18);
                    end;

                    return;
                end;

                if v18 ~= nil then
                    v18.depth = p12.depth + 1;
                    v18.parent = p12;
                    p12.children[i] = v18;
                end;
            end;
        end;
    end;

    local function updateVirtualNodeWithRenderResult(p19, p20, p21) -- Line: 147
        -- upvalues: Type (ref), updateChildren (copy)
        if Type.of(p21) == Type.Element or (p21 == nil or typeof(p21) == "boolean") then
            updateChildren(p19, p20, p21);

            return;
        end;

        error(("%s\n%s"):format("Component returned invalid children:", p19.currentElement.source or "<enable element tracebacks>"), 0);
    end;

    u7 = function(p22) -- Line: 164, Name: unmountVirtualNode
        -- upvalues: u1 (ref), internalAssert (ref), Type (ref), ElementKind (ref), u3 (copy), u4 (ref), u7 (ref)
        if u1.internalTypeChecks then
            internalAssert(Type.of(p22) == Type.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;

        p22.wasUnmounted = true;
        local v23 = ElementKind.of(p22.currentElement);

        if v23 == ElementKind.Host then
            u3.unmountHostNode(u4, p22);

            return;
        end;

        if v23 == ElementKind.Function then
            for _, v in pairs(p22.children) do
                u7(v);
            end;

            return;
        end;

        if v23 == ElementKind.Stateful then
            p22.instance:__unmount();

            return;
        end;

        if v23 == ElementKind.Portal then
            for _, v in pairs(p22.children) do
                u7(v);
            end;

            return;
        end;

        if v23 == ElementKind.Fragment then
            for _, v in pairs(p22.children) do
                u7(v);
            end;

            return;
        end;

        error(("Unknown ElementKind %q"):format((tostring(v23))), 2);
    end;

    local function updateFunctionVirtualNode(p24, p25) -- Line: 195
        -- upvalues: updateVirtualNodeWithRenderResult (copy)
        local v26 = p25.component(p25.props);
        updateVirtualNodeWithRenderResult(p24, p24.hostParent, v26);

        return p24;
    end;

    local function updatePortalVirtualNode(p27, p28) -- Line: 203
        -- upvalues: u3 (copy), u7 (ref), u5 (ref), Children (ref), updateChildren (copy)
        local target = p27.currentElement.props.target;
        local target2 = p28.props.target;
        local v29 = u3.isHostObject(target2);
        assert(v29, "Expected target to be host object");

        if target2 == target then
            updateChildren(p27, target2, p28.props[Children]);

            return p27;
        end;

        local hostParent = p27.hostParent;
        local hostKey = p27.hostKey;
        local depth = p27.depth;
        local parent = p27.parent;
        local v30 = p27.originalContext or p27.context;
        local parentLegacyContext = p27.parentLegacyContext;

        if not p27.wasUnmounted then
            u7(p27);
        end;

        local v31 = u5(p28, hostParent, hostKey, v30, parentLegacyContext);

        if v31 ~= nil then
            v31.depth = depth;
            v31.parent = parent;
        end;

        return v31;
    end;

    local function updateFragmentVirtualNode(p32, p33) -- Line: 222
        -- upvalues: updateChildren (copy)
        updateChildren(p32, p32.hostParent, p33.elements);

        return p32;
    end;

    u6 = function(p34, p35, p36) -- Line: 240, Name: updateVirtualNode
        -- upvalues: u1 (ref), internalAssert (ref), Type (ref), u7 (ref), u5 (ref), ElementKind (ref), u3 (copy), u4 (ref), updateVirtualNodeWithRenderResult (copy), Children (ref), updateChildren (copy)
        if u1.internalTypeChecks then
            internalAssert(Type.of(p34) == Type.VirtualNode, "Expected arg #1 to be of type VirtualNode");
        end;

        if u1.typeChecks then
            local v37 = (Type.of(p35) == Type.Element or typeof(p35) == "boolean") and true or p35 == nil;
            assert(v37, "Expected arg #2 to be of type Element, boolean, or nil");
        end;

        if p34.currentElement == p35 and p36 == nil then
            return p34;
        end;

        if typeof(p35) == "boolean" or p35 == nil then
            u7(p34);

            return nil;
        end;

        if p34.currentElement.component == p35.component then
            local v38 = ElementKind.of(p35);
            local v39 = true;

            if v38 == ElementKind.Host then
                p34 = u3.updateHostNode(u4, p34, p35);
            elseif v38 == ElementKind.Function then
                local v40 = p35.component(p35.props);
                updateVirtualNodeWithRenderResult(p34, p34.hostParent, v40);
            elseif v38 == ElementKind.Stateful then
                v39 = p34.instance:__update(p35, p36);
            elseif v38 == ElementKind.Portal then
                local target = p34.currentElement.props.target;
                local target2 = p35.props.target;
                local v41 = u3.isHostObject(target2);
                assert(v41, "Expected target to be host object");

                if target2 == target then
                    updateChildren(p34, target2, p35.props[Children]);
                else
                    local hostParent = p34.hostParent;
                    local hostKey = p34.hostKey;
                    local depth = p34.depth;
                    local parent = p34.parent;
                    local v42 = p34.originalContext or p34.context;
                    local parentLegacyContext = p34.parentLegacyContext;

                    if not p34.wasUnmounted then
                        u7(p34);
                    end;

                    p34 = u5(p35, hostParent, hostKey, v42, parentLegacyContext);

                    if p34 ~= nil then
                        p34.depth = depth;
                        p34.parent = parent;
                    end;
                end;
            elseif v38 == ElementKind.Fragment then
                updateChildren(p34, p34.hostParent, p35.elements);
            else
                error(("Unknown ElementKind %q"):format((tostring(v38))), 2);
            end;

            if not v39 then
                return p34;
            end;

            p34.currentElement = p35;

            return p34;
        end;

        local hostParent = p34.hostParent;
        local hostKey = p34.hostKey;
        local depth = p34.depth;
        local parent = p34.parent;
        local v43 = p34.originalContext or p34.context;
        local parentLegacyContext = p34.parentLegacyContext;

        if not p34.wasUnmounted then
            u7(p34);
        end;

        local v44 = u5(p35, hostParent, hostKey, v43, parentLegacyContext);

        if v44 ~= nil then
            v44.depth = depth;
            v44.parent = parent;
        end;

        return v44;
    end;

    local function createVirtualNode(p45, p46, p47, p48, p49) -- Line: 297
        -- upvalues: u1 (ref), internalAssert (ref), u3 (copy), Type (ref)
        if u1.internalTypeChecks then
            internalAssert(u3.isHostObject(p46) or p46 == nil, "Expected arg #2 to be a host object");
            internalAssert(typeof(p48) == "table" and true or p48 == nil, "Expected arg #4 to be of type table or nil");
            internalAssert(typeof(p49) == "table" and true or p49 == nil, "Expected arg #5 to be of type table or nil");
        end;

        if u1.typeChecks then
            assert(p47 ~= nil, "Expected arg #3 to be non-nil");
            local v50 = Type.of(p45) == Type.Element and true or typeof(p45) == "boolean";
            assert(v50, "Expected arg #1 to be of type Element or boolean");
        end;

        return {
            [Type] = Type.VirtualNode,
            currentElement = p45,
            depth = 1,
            parent = nil,
            children = {},
            hostParent = p46,
            hostKey = p47,
            updateChildrenCount = 0,
            wasUnmounted = false,
            legacyContext = p49,
            parentLegacyContext = p49,
            context = p48 or {},
            originalContext = nil
        };
    end;

    local function mountFunctionVirtualNode(p51) -- Line: 345
        -- upvalues: updateVirtualNodeWithRenderResult (copy)
        local currentElement = p51.currentElement;
        local v52 = currentElement.component(currentElement.props);
        updateVirtualNodeWithRenderResult(p51, p51.hostParent, v52);
    end;

    local function mountPortalVirtualNode(p53) -- Line: 353
        -- upvalues: Children (ref), u3 (copy), updateChildren (copy)
        local currentElement = p53.currentElement;
        local target = currentElement.props.target;
        local v54 = currentElement.props[Children];
        local v55 = u3.isHostObject(target);
        assert(v55, "Expected target to be host object");
        updateChildren(p53, target, v54);
    end;

    local function mountFragmentVirtualNode(p56) -- Line: 364
        -- upvalues: updateChildren (copy)
        updateChildren(p56, p56.hostParent, p56.currentElement.elements);
    end;

    u5 = function(p57, p58, p59, p60, p61) -- Line: 375, Name: mountVirtualNode
        -- upvalues: u1 (ref), internalAssert (ref), u3 (copy), Type (ref), ElementKind (ref), createVirtualNode (copy), u4 (ref), updateVirtualNodeWithRenderResult (copy), Children (ref), updateChildren (copy)
        if u1.internalTypeChecks then
            internalAssert(u3.isHostObject(p58) or p58 == nil, "Expected arg #2 to be a host object");
            internalAssert(typeof(p61) == "table" and true or p61 == nil, "Expected arg #5 to be of type table or nil");
        end;

        if u1.typeChecks then
            assert(p59 ~= nil, "Expected arg #3 to be non-nil");
            local v62 = Type.of(p57) == Type.Element and true or typeof(p57) == "boolean";
            assert(v62, "Expected arg #1 to be of type Element or boolean");
        end;

        if typeof(p57) == "boolean" then
            return nil;
        end;

        local v63 = ElementKind.of(p57);
        local v64 = createVirtualNode(p57, p58, p59, p60, p61);

        if v63 == ElementKind.Host then
            u3.mountHostNode(u4, v64);

            return v64;
        end;

        if v63 == ElementKind.Function then
            local currentElement = v64.currentElement;
            local v65 = currentElement.component(currentElement.props);
            updateVirtualNodeWithRenderResult(v64, v64.hostParent, v65);

            return v64;
        end;

        if v63 == ElementKind.Stateful then
            p57.component:__mount(u4, v64);

            return v64;
        end;

        if v63 ~= ElementKind.Portal then
            if v63 == ElementKind.Fragment then
                updateChildren(v64, v64.hostParent, v64.currentElement.elements);

                return v64;
            end;

            error(("Unknown ElementKind %q"):format((tostring(v63))), 2);

            return v64;
        end;

        local currentElement = v64.currentElement;
        local target = currentElement.props.target;
        local v66 = currentElement.props[Children];
        local v67 = u3.isHostObject(target);
        assert(v67, "Expected target to be host object");
        updateChildren(v64, target, v66);

        return v64;
    end;

    u4 = {
        mountVirtualTree = function(p68, p69, p70) -- Line: 424, Name: mountVirtualTree
            -- upvalues: u1 (ref), Type (ref), u3 (copy), u2 (ref), u5 (ref)
            if u1.typeChecks then
                local v71 = Type.of(p68) == Type.Element;
                assert(v71, "Expected arg #1 to be of type Element");
                local v72 = u3.isHostObject(p69) or p69 == nil;
                assert(v72, "Expected arg #2 to be a host object");
            end;

            local v73 = {
                [Type] = Type.VirtualTree,
                [u2] = {
                    rootNode = nil,
                    mounted = true
                }
            };
            v73[u2].rootNode = u5(p68, p69, p70 == nil and "RoactTree" or p70);

            return v73;
        end,

        unmountVirtualTree = function(p74) -- Line: 455, Name: unmountVirtualTree
            -- upvalues: u2 (ref), u1 (ref), Type (ref), u7 (ref)
            local v75 = p74[u2];

            if u1.typeChecks then
                local v76 = Type.of(p74) == Type.VirtualTree;
                assert(v76, "Expected arg #1 to be a Roact handle");
                assert(v75.mounted, "Cannot unmounted a Roact tree that has already been unmounted");
            end;

            v75.mounted = false;

            if v75.rootNode ~= nil then
                u7(v75.rootNode);
            end;
        end,

        updateVirtualTree = function(p77, p78) -- Line: 473, Name: updateVirtualTree
            -- upvalues: u2 (ref), u1 (ref), Type (ref), u6 (ref)
            local v79 = p77[u2];

            if u1.typeChecks then
                local v80 = Type.of(p77) == Type.VirtualTree;
                assert(v80, "Expected arg #1 to be a Roact handle");
                local v81 = Type.of(p78) == Type.Element;
                assert(v81, "Expected arg #2 to be a Roact Element");
            end;

            v79.rootNode = u6(v79.rootNode, p78);

            return p77;
        end,

        createVirtualNode = createVirtualNode,
        mountVirtualNode = u5,
        unmountVirtualNode = u7,
        updateVirtualNode = u6,

        updateVirtualNodeWithChildren = function(p82, p83, p84) -- Line: 143, Name: updateVirtualNodeWithChildren
            -- upvalues: updateChildren (copy)
            updateChildren(p82, p83, p84);
        end,

        updateVirtualNodeWithRenderResult = updateVirtualNodeWithRenderResult
    };

    return u4;
end;