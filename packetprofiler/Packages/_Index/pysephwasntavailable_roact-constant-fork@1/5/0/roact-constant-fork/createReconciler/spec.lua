-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assign = require(script.Parent.assign);
    local createElement = require(script.Parent.createElement);
    local createFragment = require(script.Parent.createFragment);
    local createSpy = require(script.Parent.createSpy);
    local NoopRenderer = require(script.Parent.NoopRenderer);
    local Type = require(script.Parent.Type);
    local ElementKind = require(script.Parent.ElementKind);
    local createReconciler = require(script.Parent.createReconciler);
    local u1 = createReconciler(NoopRenderer);
    describe("tree operations", function() -- Line: 14
        -- upvalues: u1 (copy), createElement (copy)
        it("should mount and unmount", function() -- Line: 15
            -- upvalues: u1 (ref), createElement (ref)
            local v2 = u1.mountVirtualTree(createElement("StringValue"));
            expect(v2).to.be.ok();
            u1.unmountVirtualTree(v2);
        end);
        it("should mount, update, and unmount", function() -- Line: 23
            -- upvalues: u1 (ref), createElement (ref)
            local v3 = u1.mountVirtualTree(createElement("StringValue"));
            expect(v3).to.be.ok();
            u1.updateVirtualTree(v3, createElement("StringValue"));
            u1.unmountVirtualTree(v3);
        end);
    end);
    describe("booleans", function() -- Line: 34
        -- upvalues: u1 (copy), createElement (copy)
        it("should mount booleans as nil", function() -- Line: 35
            -- upvalues: u1 (ref)
            local v4 = u1.mountVirtualNode(false, nil, "test");
            expect(v4).to.equal(nil);
        end);
        it("should unmount nodes if they are updated to a boolean value", function() -- Line: 40
            -- upvalues: u1 (ref), createElement (ref)
            local v5 = u1.mountVirtualNode(createElement("StringValue"), nil, "test");
            expect(v5).to.be.ok();
            local v6 = u1.updateVirtualNode(v5, true);
            expect(v6).to.equal(nil);
        end);
    end);
    describe("invalid elements", function() -- Line: 51
        -- upvalues: u1 (copy), createElement (copy)
        it("should throw errors when attempting to mount invalid elements", function() -- Line: 52
            -- upvalues: u1 (ref), createElement (ref)
            local function u7() -- Line: 54
                return "Hello";
            end;

            local function u8() -- Line: 57
                return 1;
            end;

            local function u9() -- Line: 60
                return function() -- Line: 61
                end;
            end;

            local function u10() -- Line: 63
                return {};
            end;

            expect(function() -- Line: 70
                -- upvalues: u1 (ref), createElement (ref), u7 (copy)
                u1.mountVirtualNode(createElement(u7), nil, "Some Key");
            end).to.throw();
            expect(function() -- Line: 74
                -- upvalues: u1 (ref), createElement (ref), u8 (copy)
                u1.mountVirtualNode(createElement(u8), nil, "Some Key");
            end).to.throw();
            expect(function() -- Line: 78
                -- upvalues: u1 (ref), createElement (ref), u9 (copy)
                u1.mountVirtualNode(createElement(u9), nil, "Some Key");
            end).to.throw();
            expect(function() -- Line: 82
                -- upvalues: u1 (ref), createElement (ref), u10 (copy)
                u1.mountVirtualNode(createElement(u10), nil, "Some Key");
            end).to.throw();
        end);
    end);
    describe("Host components", function() -- Line: 88
        -- upvalues: createSpy (copy), NoopRenderer (copy), assign (copy), createReconciler (copy), createElement (copy), Type (copy)
        it("should invoke the renderer to mount host nodes", function() -- Line: 89
            -- upvalues: createSpy (ref), NoopRenderer (ref), assign (ref), createReconciler (ref), createElement (ref), Type (ref)
            local v11 = createSpy(NoopRenderer.mountHostNode);
            local v12 = createReconciler((assign({}, NoopRenderer, {
                mountHostNode = v11.value
            })));
            local v13 = createElement("StringValue");
            local v14 = v12.mountVirtualNode(v13, nil, "Some Key");
            expect(Type.of(v14)).to.equal(Type.VirtualNode);
            expect(v11.callCount).to.equal(1);
            local v15 = v11:captureValues("reconciler", "node");
            expect(v15.reconciler).to.equal(v12);
            expect(v15.node).to.equal(v14);
        end);
        it("should invoke the renderer to update host nodes", function() -- Line: 113
            -- upvalues: createSpy (ref), NoopRenderer (ref), assign (ref), createReconciler (ref), createElement (ref), Type (ref)
            local v16 = createSpy(NoopRenderer.updateHostNode);
            local v17 = createReconciler((assign({}, NoopRenderer, {
                mountHostNode = NoopRenderer.mountHostNode,
                updateHostNode = v16.value
            })));
            local v18 = createElement("StringValue");
            local v19 = v17.mountVirtualNode(v18, nil, "Key");
            expect(Type.of(v19)).to.equal(Type.VirtualNode);
            local v20 = createElement("StringValue");
            local v21 = v17.updateVirtualNode(v19, v20);
            expect(v21).to.equal(v19);
            expect(v16.callCount).to.equal(1);
            local v22 = v16:captureValues("reconciler", "node", "newElement");
            expect(v22.reconciler).to.equal(v17);
            expect(v22.node).to.equal(v19);
            expect(v22.newElement).to.equal(v20);
        end);
        it("should invoke the renderer to unmount host nodes", function() -- Line: 144
            -- upvalues: createSpy (ref), NoopRenderer (ref), assign (ref), createReconciler (ref), createElement (ref), Type (ref)
            local v23 = createSpy(NoopRenderer.unmountHostNode);
            local v24 = createReconciler((assign({}, NoopRenderer, {
                mountHostNode = NoopRenderer.mountHostNode,
                unmountHostNode = v23.value
            })));
            local v25 = createElement("StringValue");
            local v26 = v24.mountVirtualNode(v25, nil, "Key");
            expect(Type.of(v26)).to.equal(Type.VirtualNode);
            v24.unmountVirtualNode(v26);
            expect(v23.callCount).to.equal(1);
            local v27 = v23:captureValues("reconciler", "node");
            expect(v27.reconciler).to.equal(v24);
            expect(v27.node).to.equal(v26);
        end);
    end);
    describe("Function components", function() -- Line: 172
        -- upvalues: createSpy (copy), createElement (copy), u1 (copy), Type (copy), createFragment (copy)
        it("should mount and unmount function components", function() -- Line: 173
            -- upvalues: createSpy (ref), createElement (ref), u1 (ref), Type (ref)
            local v29 = createSpy(function(p28) -- Line: 174
                return nil;
            end);
            local v30 = createElement(v29.value, {
                someValue = 5
            });
            local v31 = u1.mountVirtualNode(v30, nil, "A Key");
            expect(Type.of(v31)).to.equal(Type.VirtualNode);
            expect(v29.callCount).to.equal(1);
            local v32 = v29:captureValues("props");
            expect(v32.props).to.be.a("table");
            expect(v32.props.someValue).to.equal(5);
            u1.unmountVirtualNode(v31);
            expect(v29.callCount).to.equal(1);
        end);
        it("should mount single children of function components", function() -- Line: 199
            -- upvalues: createSpy (ref), createElement (ref), u1 (ref), Type (ref)
            local u34 = createSpy(function(p33) -- Line: 200
                return nil;
            end);
            local v36 = createSpy(function(p35) -- Line: 204
                -- upvalues: createElement (ref), u34 (copy)
                return createElement(u34.value, {
                    value = p35.value + 1
                });
            end);
            local v37 = createElement(v36.value, {
                value = 13
            });
            local v38 = u1.mountVirtualNode(v37, nil, "A Key");
            expect(Type.of(v38)).to.equal(Type.VirtualNode);
            expect(v36.callCount).to.equal(1);
            expect(u34.callCount).to.equal(1);
            local v39 = v36:captureValues("props");
            local v40 = u34:captureValues("props");
            expect(v39.props).to.be.a("table");
            expect(v39.props.value).to.equal(13);
            expect(v40.props).to.be.a("table");
            expect(v40.props.value).to.equal(14);
            u1.unmountVirtualNode(v38);
            expect(v36.callCount).to.equal(1);
            expect(u34.callCount).to.equal(1);
        end);
        it("should mount fragments returned by function components", function() -- Line: 237
            -- upvalues: createSpy (ref), createFragment (ref), createElement (ref), u1 (ref), Type (ref)
            local u42 = createSpy(function(p41) -- Line: 238
                return nil;
            end);
            local u44 = createSpy(function(p43) -- Line: 242
                return nil;
            end);
            local v46 = createSpy(function(p45) -- Line: 246
                -- upvalues: createFragment (ref), createElement (ref), u42 (copy), u44 (copy)
                return createFragment({
                    A = createElement(u42.value, {
                        value = p45.value + 1
                    }),
                    B = createElement(u44.value, {
                        value = p45.value + 5
                    })
                });
            end);
            local v47 = createElement(v46.value, {
                value = 17
            });
            local v48 = u1.mountVirtualNode(v47, nil, "A Key");
            expect(Type.of(v48)).to.equal(Type.VirtualNode);
            expect(v46.callCount).to.equal(1);
            expect(u42.callCount).to.equal(1);
            expect(u44.callCount).to.equal(1);
            local v49 = v46:captureValues("props");
            local v50 = u42:captureValues("props");
            local v51 = u44:captureValues("props");
            expect(v49.props).to.be.a("table");
            expect(v49.props.value).to.equal(17);
            expect(v50.props).to.be.a("table");
            expect(v50.props.value).to.equal(18);
            expect(v51.props).to.be.a("table");
            expect(v51.props.value).to.equal(22);
            u1.unmountVirtualNode(v48);
            expect(v46.callCount).to.equal(1);
            expect(u42.callCount).to.equal(1);
            expect(u44.callCount).to.equal(1);
        end);
    end);
    describe("Fragments", function() -- Line: 291
        -- upvalues: createFragment (copy), u1 (copy), ElementKind (copy), createSpy (copy), createElement (copy)
        it("should mount fragments", function() -- Line: 292
            -- upvalues: createFragment (ref), u1 (ref), ElementKind (ref)
            local v52 = createFragment({});
            local v53 = u1.mountVirtualNode(v52, nil, "test");
            expect(v53).to.be.ok();
            expect(ElementKind.of(v53.currentElement)).to.equal(ElementKind.Fragment);
        end);
        it("should mount an empty fragment", function() -- Line: 300
            -- upvalues: createFragment (ref), u1 (ref)
            local v54 = createFragment({});
            local v55 = u1.mountVirtualNode(v54, nil, "test");
            expect(v55).to.be.ok();
            local v56 = next(v55.children);
            expect(v56).to.never.be.ok();
        end);
        it("should mount all fragment\'s children", function() -- Line: 310
            -- upvalues: createSpy (ref), createElement (ref), createFragment (ref), u1 (ref)
            local v58 = createSpy(function(p57) -- Line: 311
                return nil;
            end);
            local v59 = {};

            for i = 1, 5 do
                v59["key" .. tostring(i)] = createElement(v58.value, {});
            end;

            local v60 = createFragment(v59);
            local v61 = u1.mountVirtualNode(v60, nil, "test");
            expect(v61).to.be.ok();
            expect(v58.callCount).to.equal(5);
        end);
    end);
end;