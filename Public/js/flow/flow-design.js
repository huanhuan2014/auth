function init() {
    if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
    var $ = go.GraphObject.make;  // for conciseness in defining templates
    myDiagram = $(go.Diagram, "myDiagramDiv",  // must name or refer to the DIV HTML element
        {
            initialContentAlignment: go.Spot.Center,
            allowDrop: true,  // must be true to accept drops from the Palette
            "LinkDrawn": showLinkLabel,  // this DiagramEvent listener is defined below
            "LinkRelinked": showLinkLabel,
            scrollsPageOnFocus: false,
            "undoManager.isEnabled": true  // enable undo & redo
        });
    // when the document is modified, add a "*" to the title and enable the "Save" button
    myDiagram.addDiagramListener("Modified", function(e) {
        var button = document.getElementById("btn-save");
        if (button) button.disabled = !myDiagram.isModified;

        var buttonDraft = document.getElementById("btn-save-draft");
        if (buttonDraft) buttonDraft.disabled = !myDiagram.isModified;
        var idx = document.title.indexOf("*");
        if (myDiagram.isModified) {
            if (idx < 0) document.title += "*";
        } else {
            if (idx >= 0) document.title = document.title.substr(0, idx);
        }
    });
    //节点点击事件
    myDiagram.addDiagramListener("ObjectDoubleClicked", function(e){
        var select_port = e.subject.part.data.key;
        var select_category = e.subject.part.data.category;
        var figure = e.subject.part.data.figure;
        if(select_port==undefined){
            //连接线双击事件
            if(e.subject.fromNode.data.figure === "Diamond"){
                //条件节点下面的连接线
            }
        }
        if(select_category == undefined && figure !="Diamond"){
            //步骤双击事件
            showDisposeModal(select_port);
        }
    });

    myDiagram.addDiagramListener("mouseDrop", function(e, grp){
        console.info(e);
        console.info(grp);
    });

    //节点删除事件,
    //有可能删除多个结单，part 可能为多个
    //e.subject ->Ow
    myDiagram.addDiagramListener("SelectionDeleting", function(e){
        var parts = e.subject;
        var delKeys = new Array();
        parts.copy().each(function(p) {
            if (p instanceof go.Node) {
                if(p.category == "" && p.figure !="Diamond"){
                    delKeys.push(p.key);
                }
            }
        });
        console.info(delKeys);
        //如果是节点实例
        if(part instanceof go.Node){
            // var delResult = delNode(select_port);
            // if(!delResult){
            //     return false;
            // }
        }
    });

    // helper definitions for node templates
    function nodeStyle() {
        return [
            // The Node.location comes from the "loc" property of the node data,
            // converted by the Point.parse static method.
            // If the Node.location is changed, it updates the "loc" property of the node data,
            // converting back using the Point.stringify static method.
            new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
            {
                // the Node.location is at the center of each node
                locationSpot: go.Spot.Center,
                //isShadowed: true,
                //shadowColor: "#888",
                // handle mouse enter/leave events to show/hide the ports
                mouseEnter: function (e, obj) { showPorts(obj.part, true); },
                mouseLeave: function (e, obj) { showPorts(obj.part, false); }
            }
        ];
    }
    // Define a function for creating a "port" that is normally transparent.
    // The "name" is used as the GraphObject.portId, the "spot" is used to control how links connect
    // and where the port is positioned on the node, and the boolean "output" and "input" arguments
    // control whether the user can draw links from or to the port.
    function makePort(name, spot, output, input) {
        // the port is basically just a small circle that has a white stroke when it is made visible
        return $(go.Shape, "Circle",
            {
                fill: "transparent",
                stroke: null,  // this is changed to "white" in the showPorts function
                desiredSize: new go.Size(8, 8),
                alignment: spot, alignmentFocus: spot,  // align the port on the main Shape
                portId: name,  // declare this object to be a "port"
                fromSpot: spot, toSpot: spot,  // declare where links may connect at this port
                fromLinkable: output, toLinkable: input,  // declare whether the user may draw links to/from here
                cursor: "pointer"  // show a different cursor to indicate potential link point
            });
    }
    // define the Node templates for regular nodes
    var lightText = 'whitesmoke';
    myDiagram.nodeTemplateMap.add("",  // the default category
        $(go.Node, "Spot", nodeStyle(),
            // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
            $(go.Panel, "Auto",//形状自动填充适合
                $(go.Shape, "Rectangle", { fill: "#23527c", stroke: null }, new go.Binding("figure", "figure")),
                $(go.TextBlock,
                    {
                        font: "bold 11pt Helvetica, Arial, sans-serif",
                        stroke: lightText,
                        margin: 5,
                        maxSize: new go.Size(100, NaN),
                        wrap: go.TextBlock.WrapFit,
                        editable: false
                    },
                    new go.Binding("text").makeTwoWay())
            ),
            //图形上连接点
            makePort("T", go.Spot.Top, false, true),
            makePort("L", go.Spot.Left, true, true),
            makePort("R", go.Spot.Right, true, true),
            makePort("B", go.Spot.Bottom, true, false)
        ));
    myDiagram.nodeTemplateMap.add("Start",
        $(go.Node, "Spot", nodeStyle(),
            $(go.Panel, "Auto",//形状自动填充适合
                $(go.Shape, "Circle", { minSize: new go.Size(40, 40), fill: "#23527c", stroke: null }),
                $(go.TextBlock, "Start", { font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText,editable:false }, new go.Binding("text"))
            ),
            //图形上连接点
            makePort("L", go.Spot.Left, true, false),
            makePort("R", go.Spot.Right, true, false),
            makePort("B", go.Spot.Bottom, true, false)
        ));
    myDiagram.nodeTemplateMap.add("End",
        $(go.Node, "Spot", nodeStyle(),
            $(go.Panel, "Auto",//形状自动填充适合
                $(go.Shape, "Circle", { minSize: new go.Size(40, 40), fill: "#23527c", stroke: null }),
                $(go.TextBlock, "End",{ font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText,editable:false }, new go.Binding("text"))
            ),
            //图形上连接点
            makePort("T", go.Spot.Top, false, true),
            makePort("L", go.Spot.Left, false, true),
            makePort("R", go.Spot.Right, false, true)
        ));
    myDiagram.nodeTemplateMap.add("Comment",
        $(go.Node, "Auto", //形状自动填充适合
            nodeStyle(),
            $(go.Shape, "File", { fill: "#23527c", stroke: null }),
            $(go.TextBlock,
                {
                    margin: 5,
                    maxSize: new go.Size(200, NaN),
                    wrap: go.TextBlock.WrapFit,
                    textAlign: "center",
                    editable: true,
                    font: "bold 12pt Helvetica, Arial, sans-serif",
                    stroke: '#fff'
                },
                new go.Binding("text").makeTwoWay())
            // no ports, because no links are allowed to connect with a comment
        ));
    // replace the default Link template in the linkTemplateMap
    myDiagram.linkTemplate =
        $(go.Link,  // the whole link panel
            {
                routing: go.Link.AvoidsNodes,
                curve: go.Link.JumpOver,
                corner: 5, toShortLength: 4,
                relinkableFrom: true,
                relinkableTo: true,
                reshapable: true,
                resegmentable: true,
                // mouse-overs subtly highlight links:
                mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
                mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; }
            },
            new go.Binding("points").makeTwoWay(),
            $(go.Shape,  // the highlight shape, normally transparent
                { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }),
            $(go.Shape,  // the link path shape
                { isPanelMain: true, stroke: "gray", strokeWidth: 2 }),
            $(go.Shape,  // the arrowhead
                { toArrow: "standard", stroke: null, fill: "gray"}),
            $(go.Panel, "Auto",  // the link label, normally not visible
                { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},
                new go.Binding("visible", "visible").makeTwoWay(),
                $(go.Shape, "RoundedRectangle",  // the label shape
                    { fill: "#F8F8F8", stroke: null }),
                $(go.TextBlock, "Yes",  // the label
                    {
                        textAlign: "center",
                        font: "10pt helvetica, arial, sans-serif",
                        stroke: "#333333",
                        editable: true
                    },
                    new go.Binding("text").makeTwoWay())
            )
        );
    // Make link labels visible if coming out of a "conditional" node.
    // This listener is called by the "LinkDrawn" and "LinkRelinked" DiagramEvents.
    function showLinkLabel(e) {
        var label = e.subject.findObject("LABEL");
        if (label !== null) {
            label.visible = (e.subject.fromNode.data.figure === "Diamond");
        }
    }
    // temporary links used by LinkingTool and RelinkingTool are also orthogonal:
    myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
    myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;
    load();  // load an initial diagram from some JSON text
    // initialize the Palette that is on the left side of the page
    myPalette =
        $(go.Palette, "myPaletteDiv",  // must name or refer to the DIV HTML element
            {
                scrollsPageOnFocus: false,
                nodeTemplateMap: myDiagram.nodeTemplateMap,  // share the templates used by myDiagram
                model: new go.GraphLinksModel([  // specify the contents of the Palette
                    { category: "Start", text: "开始" },
                    { text: "步骤" , type: "step"},
                    { text: "判断", figure: "Diamond" },
                    { category: "End", text: "结束" },
                    { category: "Comment", text: "备    注" }
                ])
            });
} // end init
// Make all ports on a node visible when the mouse is over the node
function showPorts(node, show) {
    var diagram = node.diagram;
    if (!diagram || diagram.isReadOnly || !diagram.allowLink) return;
    node.ports.each(function(port) {
        port.stroke = (show ? "white" : null);
    });
}
// Show the diagram's model in JSON format that the user may edit
function save() {
    document.getElementById("mySavedModel").value = myDiagram.model.toJson();
    myDiagram.isModified = false;
}
function load() {
    myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
}
// add an SVG rendering of the diagram at the end of this page
function makeSVG() {
    var svg = myDiagram.makeSvg({
        scale: 0.5
    });
    svg.style.border = "1px solid black";
    obj = document.getElementById("SVGArea");
    obj.appendChild(svg);
    if (obj.children.length > 0) {
        obj.replaceChild(svg, obj.children[0]);
    }
}

var nodeIndex = 0;
function showDisposeModal (nodeKey){
    nodeIndex = 0;
    getNodeIndex(nodeKey);
    alert(nodeIndex);return;
    $("#disposeModal").modal();
}

//获取该节点是第几个节点(平衡节点存在重复)
function getNodeIndex(nodeKey){
    var json = myDiagram.model.toJson();
    json = $.parseJSON(json);
    var linkDataArray = json.linkDataArray;
    var nodeDataArray = json.nodeDataArray;
    for(var k in linkDataArray){
        var link = linkDataArray[k];
        if(link.to != nodeKey){
            continue;
        }
        var formKey = link.from;
        //开始节点不参与累加
        for(var nodeKeyTemp in nodeDataArray){
            if(nodeDataArray[nodeKeyTemp].key == formKey && nodeDataArray[nodeKeyTemp].category == "Start"){
                return;
            }
        }
        nodeIndex ++;
        getNodeIndex(formKey);
    }
}

$(function(){
    var height = $(document).height();
    height = height - 46;
    $("#myDiagramDiv").height(height);
    $("#myPaletteDiv").height(height);
});

function ajaxSave(draft){
    var json = myDiagram.model.toJson();
    $.ajax({
        url:"/Flow/FlowDesign/ajax_save",
        data:{'process_code':processCode,'json':json, 'draft':draft},
        dataType:"json",
        type:"get",
        success:function(data){
            alert(data.msg);
            if(data.code ==1){
                window.location.reload();
            }
        }
    });
}

function delNode(nodeKey){
    var result = false;
    $.ajax({
        url:"__URL__/ajax_delete",
        data:{"process_code":processCode, "node_key":nodeKey},
        dataType:"json",
        type:"get",
        async:false,
        success:function(data){
            alert(data.msg);
            if(data.code == 1){
                result = true;
            }
        }
    });
    return result;
}