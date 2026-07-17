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
    it("should throw on mount if not overridden", function() -- Line: 13
        -- upvalues: Component (copy), createElement (copy), u1 (copy)
        local u2 = createElement((Component:extend("MyComponent")));
        local success, result = pcall(function() -- Line: 20
            -- upvalues: u1 (ref), u2 (copy)
            u1.mountVirtualNode(u2, nil, "Test");
        end);
        expect(success).to.equal(false);
        expect(result:match("MyComponent")).to.be.ok();
        expect(result:match("render")).to.be.ok();
    end);
    it("should be invoked when a component is mounted", function() -- Line: 29
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v3 = Component:extend("Foo");
        local u4 = nil;
        local u5 = nil;
        local v7 = createSpy(function(p6) -- Line: 34
            -- upvalues: u4 (ref), u5 (ref)
            u4 = p6.props;
            u5 = p6.state;
        end);
        v3.render = v7.value;
        local v8 = createElement(v3);
        u1.mountVirtualNode(v8, nil, "Foo Test");
        expect(v7.callCount).to.equal(1);
        local v9 = v7:captureValues("self");
        expect(Type.of(v9.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(u4, {});
        assertDeepEqual(u5, {});
    end);
    it("should be invoked when a component is updated via props", function() -- Line: 55
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v10 = Component:extend("Foo");
        local u11 = nil;
        local u12 = nil;
        local v14 = createSpy(function(p13) -- Line: 60
            -- upvalues: u11 (ref), u12 (ref)
            u11 = p13.props;
            u12 = p13.state;
        end);
        v10.render = v14.value;
        local v15 = {
            a = 2
        };
        local v16 = createElement(v10, v15);
        local v17 = u1.mountVirtualNode(v16, nil, "Foo Test");
        expect(v14.callCount).to.equal(1);
        local v18 = v14:captureValues("self");
        local v19 = u11;
        local v20 = u12;
        expect(Type.of(v18.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v19, v15);
        assertDeepEqual(v20, {});
        local v21 = {
            a = 3
        };
        local v22 = createElement(v10, v21);
        u1.updateVirtualNode(v17, v22);
        expect(v14.callCount).to.equal(2);
        local v23 = v14:captureValues("self");
        local v24 = u11;
        expect(Type.of(v23.self)).to.equal(Type.StatefulComponentInstance);
        expect(v24).never.to.equal(v19);
        assertDeepEqual(v24, v21);
        expect(u12).to.equal(v20);
    end);
    it("should be invoked when a component is updated via state", function() -- Line: 104
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy)
        local v25 = Component:extend("Foo");
        local u26 = nil;

        function v25.init(u27) -- Line: 108
            -- upvalues: u26 (ref)
            u26 = function(...) -- Line: 109
                -- upvalues: u27 (copy)
                return u27:setState(...);
            end;
        end;

        local u28 = nil;
        local u29 = nil;
        local v31 = createSpy(function(p30) -- Line: 116
            -- upvalues: u28 (ref), u29 (ref)
            u28 = p30.props;
            u29 = p30.state;
        end);
        v25.render = v31.value;
        local v32 = createElement(v25);
        u1.mountVirtualNode(v32, nil, "Foo Test");
        expect(v31.callCount).to.equal(1);
        local v33 = v31:captureValues("self");
        expect(Type.of(v33.self)).to.equal(Type.StatefulComponentInstance);
        u26({});
        expect(v31.callCount).to.equal(2);
        local v34 = v31:captureValues("self");
        expect(Type.of(v34.self)).to.equal(Type.StatefulComponentInstance);
        expect(u28).to.equal(u28);
        expect(u29).never.to.equal(u29);
    end);
    itSKIP("Test defaultProps on initial render", function() -- Line: 147
    end);
    itSKIP("Test defaultProps on prop update", function() -- Line: 148
    end);
    itSKIP("Test defaultProps on state update", function() -- Line: 149
    end);
end;