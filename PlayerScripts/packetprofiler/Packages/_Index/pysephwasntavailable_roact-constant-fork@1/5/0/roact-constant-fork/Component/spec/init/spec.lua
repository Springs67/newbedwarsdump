-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Type = require(script.Parent.Parent.Type);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked with props when mounted", function() -- Line: 13
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v2 = Component:extend("MyComponent");
        local v3 = createSpy();
        v2.init = v3.value;

        function v2.render(p4) -- Line: 20
            return nil;
        end;

        local v5 = {
            a = 5
        };
        local v6 = createElement(v2, v5);
        u1.mountVirtualNode(v6, nil, "Some Component Key");
        expect(v3.callCount).to.equal(1);
        local v7 = v3:captureValues("self", "props");
        expect(Type.of(v7.self)).to.equal(Type.StatefulComponentInstance);
        expect((typeof(v7.props))).to.equal("table");
        assertDeepEqual(v7.props, v5);
    end);
end;