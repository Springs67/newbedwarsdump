-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Type = require(script.Parent.Parent.Type);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked when unmounted", function() -- Line: 12
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy)
        local v2 = Component:extend("MyComponent");
        local v3 = createSpy();
        v2.willUnmount = v3.value;

        function v2.render(p4) -- Line: 19
            return nil;
        end;

        local v5 = createElement(v2);
        local v6 = u1.mountVirtualNode(v5, nil, "Test");
        u1.unmountVirtualNode(v6);
        expect(v3.callCount).to.equal(1);
        local v7 = v3:captureValues("self");
        expect(Type.of(v7.self)).to.equal(Type.StatefulComponentInstance);
    end);
end;