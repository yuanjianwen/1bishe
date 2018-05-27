function my$(id) {
    return document.getElementById(id);
}
var recR = document.getElementById("recR");
var lis = recR.getElementsByTagName("li")
var Content = document.getElementById("Content");
var uls = Content.getElementsByTagName("ul");
for (var i = 0; i < lis.length; i++) {
    lis[i].index = i;
    lis[i].onmouseover = function () {
        for (var i = 0; i < lis.length; i++) {
            lis[i].style.color = "#666666";
            lis[i].style.borderBottom = "2px solid #666666";
            uls[i].style.display = "none";
        }
        this.style.color = "#CBA25F";
        this.style.borderBottom = "2px solid #CBA25F";
        uls[this.index].style.display = "block";
    }
}

setClassName("Span","span","span1","uL" ,"div");
function setClassName(ParentId, chilTagName, className,relId,relTagName) {
    var parent = document.getElementById(ParentId);
    var children = parent.getElementsByTagName(chilTagName);
    var relid = document.getElementById(relId);
    var relChildren = relid.getElementsByTagName(relTagName);
    for (var i = 0; i < children.length; i++) {
        children[i].index = i;
        children[i].onmouseover = function () {
            for (var i = 0; i < children.length; i++) {
                children[i].className = ""
            }
            this.className = className;
        }
        children[i].onclick = function () {
            for (var i = 0; i < relChildren.length;i++){
                relChildren[i].style.display = "none";
            }
            relChildren[this.index].style.display = "block";
        }
    }
}
var box = document.getElementById("box");
var sel = document.getElementById("sel");
var scroll = document.getElementById("scroll");
var bar = document.getElementById("bar");
//1.根据内容大小，计算滚动条高度
//滚动条的高度 /  scroll的高度 = box的高度 / sel的高度
// offsetHeight     元素的大小 + padding + border
// clientHeight     元素的大小 + padding
// scrollHeight     内容的大小 + padding
var barHeight = 0;
if (sel.scrollHeight > box.clientHeight){
    barHeight = box.clientHeight / sel.scrollHeight * scroll.clientHeight;
}
bar.style.height = barHeight + "px";
//当鼠标按下时的拖拽  当鼠标按下  鼠标在滚动条中的位置
bar.onmousedown = function (e) {
    e = e || window.event;
    var y = getPage(e).pageY - box.offsetTop - bar.offsetTop;
    document.onmousemove = function (e) {
        var barY = getPage(e).pageY - y - box.offsetTop;
        barY = barY < 0 ? 0 : barY;
        var barYMax =  scroll.offsetHeight - bar.offsetHeight;
        barY = barY > barYMax ? barYMax : barY;
        bar.style.top = barY + "px";
        //此时内容的滚动距离   内容滚动的距离 / 内容最大滚动的距离 = 滚动条距离 / 滚动条最大滚动距离
        var selMax = sel.scrollHeight - box.clientHeight;
        var selY = barY / barYMax * selMax;
        sel.style.top = -selY + "px";
    }
    document.onmouseup = function () {
        document.onmousemove = null;
    }
}
var navLan = document.getElementById("navLan");
var Lis = navLan.getElementsByTagName("li");
for(var i = 0;i < Lis.length;i++){
    Lis[i].onmouseover = function () {
        for (var i = 0;i < Lis.length;i++){
            Lis[i].className = "";
        }
        this.className = "brown";
    }
}
getShadow("shadow","li","Shadow");
getShadow("shadow1","li","Shadow");
getShadow("shadow2","li","Shadow");
getShadow("shadow3","li","Shadow");
getShadow("shadow4","li","Shadow");
getShadow("shadow5","li","Shadow");
getShadow("shadow6","li","Shadow");
getShadow("shadow7","li","Shadow");
getShadow("shadow8","li","Shadow");
getShadow("shadow9","li","Shadow");
function getShadow(ParentId,chilTagName,className) {
    var parent = document.getElementById(ParentId);
    var children = parent.getElementsByTagName(chilTagName);
    for(var i = 0;i < children.length;i++){
        children[i].onmouseover = function () {
            for(var i = 0;i < children.length;i++){
                children[i].className = "";
            }
             this.className = className;
        }
        children[i].onmouseout = function () {
            this.className = "";
        }
    }
}
