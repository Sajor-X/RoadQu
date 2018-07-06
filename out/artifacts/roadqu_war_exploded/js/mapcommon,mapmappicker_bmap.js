$.bmap={_loadjs:function(file){var script=document.createElement("script");script.type="text/javascript";script.src=file;document.body.appendChild(script);},load:function(callback){this._loadjs("http://api.map.baidu.com/api?v=1.3&callback="+callback);},_innerCallBack:function(){var domid=$.bmap._domid;var lat=$.bmap._lat;var lng=$.bmap._lng;var callback=$.bmap._callback;var map=new BMap.Map(domid);var point;if(lat&&lng){point=new BMap.Point(lng,lat);}else{point=this.getCurrentCityLatLng();}
map.centerAndZoom(point,12);$.bmap.map=map;var ctrl_nav=new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});map.addControl(ctrl_nav);var ctrl_ove=new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});map.addControl(ctrl_ove);var ctrl_sca=new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});map.addControl(ctrl_sca);map.enableDragging();map.enableScrollWheelZoom();map.enableDoubleClickZoom();map.enableKeyboard();if(callback){eval('window.'+callback+'();');}},initMap:function(domid,lat,lng,callback){$.bmap._callback=callback;$.bmap._domid=domid;$.bmap._lat=lat;$.bmap._lng=lng;this.load('$.bmap._innerCallBack');},getCurrentCityLatLng:function(){if(!$.bmap._currentCityLatLng){$.bmap._currentCityLatLng=new BMap.Point(c_cityinfo.lng,c_cityinfo.lat);}
return $.bmap._currentCityLatLng;},createLocationMarker:function(){if(!$.bmap.map){return null;}
var point=$.bmap.map.getCenter();var myIcon=new BMap.Icon("/static/image/map/location.png",new BMap.Size(30,70));myIcon.setInfoWindowAnchor(new BMap.Size(10,0));var marker=new BMap.Marker(point,{icon:myIcon});marker.enableDragging();$.bmap.map.addOverlay(marker);return marker;}}
$.gmap={callbackname:null,callback:function(){eval('window.'+$.gmap.callbackname+'();');$("#traficMap").css('background','none');$("#googleMap").css('background','none');$("#googleMap2").css('background','none');},loadjs:function(file){var script=document.createElement("script");script.type="text/javascript";script.src=file;document.body.appendChild(script);},load:function(callback){this.loadjs("http://maps.google.com/maps/api/js?sensor=false&callback="+callback);},degreesPerRadian:180.0/Math.PI,drawArrow:function(latlng1,latlng2,status){var angle=this.calcAngle(latlng1.lat(),latlng1.lng(),latlng2.lat(),latlng2.lng());angle=this.fixAngle(angle);var icon='/static/image/traffic/arrow'+angle+'.png';if(status=='slow'){icon='/static/image/traffic/arrow_slow'+angle+'.png';}
var marker=this.createMarker(latlng1,'',icon,this.createAnchorPoint(angle));return marker;},calcAngle:function(lat1,lon1,lat2,lon2){var lat1=this.radians(lat1);var lon1=this.radians(lon1);var lat2=this.radians(lat2);var lon2=this.radians(lon2);var angle=-Math.atan2(Math.sin(lon1-lon2)*Math.cos(lat2),Math.cos(lat1)*Math.sin(lat2)-Math.sin(lat1)*Math.cos(lat2)*Math.cos(lon1-lon2));if(angle<0.0)angle+=Math.PI*2.0;angle=angle*this.degreesPerRadian;angle=angle.toFixed(1);return angle;},angles:null,anchors:null,fixAngle:function(angle){var angles=this.angles;if(!angles){angles=new Array();var i=0;for(var temp=0;temp<360;temp=temp+15){angles[i]=temp;i++;}}
for(var i=0;i<angles.length;i++){var a=Math.abs(angles[i]-angle);if(a<7.5){return angles[i];}}
return 0;},radians:function(degree){return degree*(Math.PI/180);},createAnchorPoint:function(angle){if(!this.anchors){this.anchors=new Object();anchors=this.anchors;anchors['0']=new Object();anchors['0'].w=23;anchors['0'].h=47;anchors['15']=new Object();anchors['15'].w=19;anchors['15'].h=39;anchors['30']=new Object();anchors['30'].w=25;anchors['30'].h=37;anchors['45']=new Object();anchors['45'].w=31;anchors['45'].h=31;anchors['60']=new Object();anchors['60'].w=38;anchors['60'].h=26;anchors['75']=new Object();anchors['75'].w=50;anchors['75'].h=21;}
var w=0;var h=0;if(angle>=0&&angle<90){w=anchors[angle].w;h=anchors[angle].h;}else if(angle>=90&&angle<180){angle=angle-90;w=anchors[angle].h;h=anchors[angle].w;}else if(angle>=180&&angle<270){angle=angle-180;w=anchors[angle].w;h=anchors[angle].h;}else if(angle>=270&&angle<360){angle=angle-270;w=anchors[angle].h;h=anchors[angle].w;}
return new google.maps.Point(w/2,h/2);},createMarker:function(latLng,title,icon,anchorPoint){if(icon){var image=new google.maps.MarkerImage(icon,null,new google.maps.Point(0,0),anchorPoint);return new google.maps.Marker({position:latLng,title:title,icon:image});}else{return new google.maps.Marker({position:latLng,title:title});}},createLocationMarker:function(latLng,title){var icon='/static/image/map/location.png';var marker=new google.maps.Marker({position:latLng,title:title,draggable:true,icon:icon});return marker;},createStyleMarker:function(latLng,title,color,seq){var styleIconClass=new StyledIcon(StyledIconTypes.CLASS,{color:color});var marker=new StyledMarker({styleIcon:new StyledIcon(StyledIconTypes.MARKER,{text:seq},styleIconClass),position:latLng,title:title});return marker;},_currentCityLatLng:null,getCurrentCityLatLng:function(){if(!$.gmap._currentCityLatLng){$.gmap._currentCityLatLng=new google.maps.LatLng(c_cityinfo.lat,c_cityinfo.lng);}
return $.gmap._currentCityLatLng;}};
;(function($){var locationMarker;var kaikenMarker;var eachpage=10;var isOpenMap=false;var hasLoadMap=false;var _searchType;function getSearchType(){return _searchType;}
function setSearchType(searchType){_searchType=searchType;}
var _uiStyle="1";function getUIStyle(){return _uiStyle;}
function setUIStyle(style){_uiStyle=style;}
function initChangeUIStyle(){$("#listmodel").click(function(){if(getUIStyle()==1){if($(this).text()=="常用地点"){handlelocusual();}
return false;}
setUIStyle(1);_resetLayout();$(this).text("常用地点");$("#mapsearchmodel").show();$("#kaikenmodel").text("开垦地盘");return false;});$("#mapsearchmodel").click(function(){if(getUIStyle()==2){return false;}
setUIStyle(2);_resetLayout();$(this).hide();$("#listmodel").text("文本搜索");$("#kaikenmodel").text("开垦地盘");return false;});$("#kaikenmodel").live('click',function(){setUIStyle(3);_resetLayout();$(this).text("开垦向导");$("#listmodel").text("文本搜索");$("#mapsearchmodel").show();return false;});}
var locationElement=null;function getLocationMarkerElement(){if(!locationElement){locationElement=$("#map_picker_googleMap img[src='/static/image/map/location.png']");}
return locationElement;}
function _initMap(){var cid=$.cookie('mappicker_cid');locationMarker=$.bmap.createLocationMarker();locationMarker.addEventListener('dragend',function(){searchByLocation();});$.bmap.map.addEventListener('dragend',function(){locationMarker.setPosition($.bmap.map.getCenter());searchByLocation();});locationMarker.disableMassClear();hasLoadMap=true;if(getUIStyle()==2){var q=getKeyWordInput().val();if(!$.isEmptyObject(q)){searchByName();return;}
searchByLocation();closeKaiKenButton();}
if(getUIStyle()==3){showKaikenButton();}else{openInfoBubbleTips();closeKaiKenButton();}}
function initMap(){var lat=$.cookie('mappicker_lat');var lng=$.cookie('mappicker_lng');$.bmap.initMap("map_picker_googleMap",lat,lng,"$.mapPicker._initMap");}
function sendTalkCallback(){}
function initLocationSend(){$("#btnlocation_picker").click(function(){var model=$(this).hasClass('mapmodel');if(model){if(!hasLoadMap){initMap();}else{if(!$.bmap.map){$.l.alert("地图没有初始化");return;}}
$(this).removeClass('mapmodel');$(this).val('文本搜索');}else{$(this).addClass('mapmodel');$(this).val('地图模式');var q=$("#searchmap .searchname").val();if(!$.isEmptyObject(q)){if(q!="请输入地点名称、地址等"){searchByName();}}}
isOpenMap=model;_resetLayout(isOpenMap);});}
var _keyWordInput=null;function getKeyWordInput(){if($.isEmptyObject(_keyWordInput)||_keyWordInput.size()==0){_keyWordInput=$("#keyword");}
return _keyWordInput;}
var _cityInfoDiv;function getCityInfoDiv(){if($.isEmptyObject(_cityInfoDiv)||_cityInfoDiv.size()==0){_cityInfoDiv=$("#cityinfo");}
return _cityInfoDiv;}
function initSearch(){getKeyWordInput().focus(function(){$("#searchlabel").hide();});getKeyWordInput().blur(function(){if($(this).val()==''){$("#searchlabel").show();}});$('#searchMapform').submit(function(){if(getUIStyle()>1&&$.bmap.map){var value=getKeyWordInput().val();value=$.trim(value);var rs=value.match(/\(?(-?\d+\.?\d*)[,， ]+(-?\d+\.?\d*)\)?/i);if(rs&&rs.length==3){var lat=rs[1];var lng=rs[2];var latlng=new BMap.Point(lng,lat);$.bmap.map.setCenter(latlng);locationMarker.setPosition(latlng);searchByLocation();return false;}}
searchByName();return false;});getKeyWordInput().autocomplete("/api/web/poi/searchname",{width:320,max:10,highlight:false,scroll:true,scrollHeight:300,dataType:"json",parse:function(data){if(data.count<=0){return[];}
var ret=$.map(data.data,function(row){return{data:row,value:row.code,result:row.name}});var key=getKeyWordInput().val();var searchItems=[{data:{name:'搜索:'+key,id:-1,key:key},value:-1,result:'搜索:'+key}];ret=searchItems.concat(ret);return ret;},formatItem:function(item){if(item.cityname){return item.name+" 【"+item.cityname+"】";}
return item.name;},extraParams:{cityid:function(){return getCityInfoDiv().attr('citycode');},typeid:function(){return 0;}}}).result(function(handler,data){if(data!=null&&data.id==-1){getKeyWordInput().val(data.key);}
searchByName();});}
function initSearchResult(){$("#dataList li").live('click',function(){var id=this.id;if(id){id=id.substring(2);}
select(id);});$("#dataList li .poilocation").live('click',function(){var item=$(this).closest("li");var lat=item.attr('lat');var lng=item.attr('lng');if(lat!=0&&lng!=0){var latlng=new BMap.Point(lng,lat);locationMarker.setPosition(latlng)
$.bmap.map.setCenter(latlng);geocode(lat,lng);showKaikenButton();}
return false;});$("#search_type").change(function(){if(getSearchType()=='name'){searchByName();}else{searchByLocation();}});$("#searchmap .range").change(function(){if(getSearchType()=='name'){searchByName();}else{searchByLocation();}});$(".range .searchBtns").click(function(){if(this.id=='btnMap'){return;}
$(".range .searchBtns").removeClass('current');$(this).addClass('current');if(getSearchType()=='name'){searchByName();}else{searchByLocation();}});$("#searchbar .pre").click(function(){var page=$("#searchbar .current").text();page=parseInt(page)-1;if(page==0){$.l.alert("已经是第一页了");return false;}
if(getSearchType()=='name'){searchByName(page);}else{searchByLocation(page);}
return false;});$("#searchbar .next").click(function(){var page=$("#searchbar .current").text();page=parseInt(page);var totalpage=$("#searchbar .searchpages").text();totalpage=parseInt(totalpage);if(page>=totalpage){$.l.alert("已经是最后一页");return false;}
page=parseInt(page)+1;if(page>10){$.l.alert("翻页太多,建议重新搜索,或者定位");return false;}
if(getSearchType()=='name'){searchByName(page);}else{searchByLocation(page);}
return false;});}
var _kaikenForm=null;function getKaikenForm(){if($.isEmptyObject(_kaikenForm)||_kaikenForm.size()==0){_kaikenForm=$("#dataList .kaiken");}
return _kaikenForm;}
var infowindow=null;function initKaiken(){$("#dataList .kaiken").live('submit',kaiken);$("#dataList .kaiken .btnmore").live('click',function(){$("#dataList .kaiken .moreField").toggleClass('disnone');return false;});$("#dataList .goWritrBlog").live('click',function(){var a=$(this).find(".sendblog");_data=new Object();_data.id=a.attr('lid');_data.name=a.attr('title');_data.lat=a.attr('lat');_data.lng=a.attr('lng');closeMapPicker();});}
var loc_usual_data=false;var city_popup=null;function initAction(){initChangeUIStyle();initSearch();initSearchResult();initKaiken();$("#map_picker_city .hot_city a").live('click',function(){handleSelectCity(this);return false;});$("#map_changecity").live('click',function(){var option=$("#map_city option:selected");handleSelectCity(option);return false;});$('#chg_city').click(function(){if(city_popup){city_popup.show();$('.changePlace').css({'background-color':'#E4F5F9'})
return false;}
city_popup=$("#map_picker_city");city_popup.bind('selectcity',function(evn,city){});city_popup.load('/static/html/city_picker_map.html?1006',function(){city_popup.find('.btn_close').click(function(){city_popup.hide();return false;});})
city_popup.show();return false;});}
function handleSelectCity(city){var lat=$(city).attr('lat');var lng=$(city).attr('lng');if(lat!=0&&lng!=0){var cname=$(city).html();$('#cityinfo').html(cname);var cityid=$(city).attr('cityid');if(!cityid){cityid=$(city).val();}
$('#cityinfo').attr('citycode',cityid);$.cookie('mappicker_cid',cityid,{expires:365});$.cookie('mappicker_cname',cname,{expires:365});$.cookie('mappicker_lat',lat,{expires:365});$.cookie('mappicker_lng',lng,{expires:365});if($.bmap.map){var latlng=new BMap.Point(lng,lat);$.bmap.map.setCenter(latlng);locationMarker.setPosition(latlng);}
city_popup.hide();$(".ac_results ul").empty();var style=getUIStyle();if(style==1){searchByName();}else{searchByLocation();}}else{$.l.alert("暂未设置经纬度,不能切换");}}
function handlelocusual(){$("#searchbar").hide();if($("#getusuallocation").size()>0){var u_div=$('#dataList');u_div.empty();u_div.append($("#getusuallocation").html());return;}
$.ajax({url:'/api/web/poi/getusuallocation',dataType:'json',success:function(data){if(!data.success)
return;loc_usual_data=true;var u_div=$('#dataList');var a=null;u_div.empty();u_div.append("<h3>常用地点</h3>");data=data.data;var size=data.length;var items="<ul>";for(var i=0;i<size;i++){var item=data[i];var seq=i+1;var shortname=item.name;if(shortname&&shortname.length>9){shortname=shortname.substring(0,8)+"..";}
var elem="<li id='l_"+item.code+"' lat='"
+item.lat+"' lng='"+item.lng+"' title='"+item.name+"'><span>选择</span>"
+seq+". "+shortname+"</li>";items=items+elem;}
items=items+"</ul>";u_div.append(items);var u_div_hide=u_div.clone();u_div_hide.hide();u_div_hide.attr('id','getusuallocation');$("#map_picker_content").append(u_div_hide);}});$("#searchbar").hide();return false;}
function validKaiKenForm(){var isValid=true;var form=getKaikenForm();form.find('.validspan').remove();var nameInput=form.find('.name');var nameval=nameInput.val();if($.isEmptyObject(nameval)){nameInput.after("<span class='validspan' style='color: red'> 名称不能为空 </span>");isValid=false;}else if($.l.getWordsLen(nameval)>20){nameInput.after("<span class='validspan' style='color: red'> 不超过20个汉字 </span>");isValid=false;}
var mobileInput=form.find('.mobile');if(!$.isEmptyObject(mobileInput.val())){var mobileReg=/^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/;if(!mobileReg.test(mobileInput.val())){isValid=false;mobileInput.after("<span class='validspan' style='color: red'> 手机格式不正确 </span>");}}
var phoneInput=form.find('.phone');if(!$.isEmptyObject(phoneInput.val())){var phoneReg=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;if(!phoneReg.test(phoneInput.val())){isValid=false;phoneInput.after("<span class='validspan' style='color: red'> 电话格式不正确 </span>");}}
return isValid;}
function kaiken(){var valid=validKaiKenForm();if(!valid){return false;}
var url="/api/web/poi/explore";var data=new Object();data.lat=locationMarker.getPosition().lat;data.lng=locationMarker.getPosition().lng;data.name=$(this).find(".name").val();data.address=$(this).find(".address").val();data.phone=$(this).find(".phone").val();data.mobile=$(this).find(".mobile").val();data.traffic=$(this).find(".traffic").val();data.provinceid=$("#dataList .mapexp_province").val();data.cityid=$("#dataList .mapexp_city").val();data.typeid=$(this).find(".type").val();data.description=$(this).find(".description").val();data.aid=$(this).find(".area").val();if(data.cityid==undefined){data.cityid=0;}
if(data.provinceid==undefined){data.provinceid=0;}
if(data.subcityid==undefined){data.subcityid=0;}
if(data.description==undefined){data.description="";}
if(routeInfo){data.province=routeInfo.province;data.city=routeInfo.city;data.subcity=routeInfo.subcity;if(data.address){data.address=routeInfo.address;}}else{data.cityid=getCityInfoDiv().attr('citycode');}
if(!(data.cityid)&&!(data.city)){data.cityid=c_cityinfo.id;}
$.post(url,$.param(data),function(data){if(data&&data.success){data=data.data;$("#dataList").empty();var div=$("#map_picker_template .kaikenSuccess").clone();var a=div.find(".sendblog");a.attr('lat',data.lat);a.attr('lat',data.lng);a.attr('lid',data.lid);a.attr('title',data.name);var name=data.name;if(name&&name.length>15){name=name.substring(0,14)+"..";}
div.find(".seAct").attr('href','/profile/'+userjson.username+'/explorepois');div.find(".name").text(name);$("#dataList").append(div);}else{$.l.autoClose('开垦失败:'+data.data,1,2);}});return false;}
function openKaikan(){$("#dataList").empty();_kaikenForm=null;$("#dataList").append($("#map_picker_template .kaiken").clone());$("#searchbar").hide();var keyword=getKeyWordInput().val();if(/\(?(-?\d+\.?\d*)[,， ](-?\d+\.?\d*)\)?/i.test(keyword)){keyword="";}
$('#dataList .kaiken .name').val(keyword);if(routeInfo){$('#dataList .kaiken .address').val(routeInfo.address)
changeCityForKaiKen(routeInfo);}else{$('#dataList .kaiken .address').val('')}}
var searchMarkers=new Object();function getSearchParams(){return{radius:1000,cityid:getCityInfoDiv().attr('citycode'),lat:locationMarker.getPosition().lat,lng:locationMarker.getPosition().lng,eachpage:eachpage}}
function searchByLocation(page){if(!locationMarker){return false;}
var data=getSearchParams();if($.isEmptyObject(page)||page<1){page=1;}
data.startpos=(page-1)*eachpage;$("#searchbar .current").text(page);var url='/api/web/poi/searchlocation';clearSearchMarkers();$.post(url,$.param(data),function(data){if(data){handleSearchData(data);}});geocode(locationMarker.getPosition().lat,locationMarker.getPosition().lng);setSearchType('location');showKaikenButton();return false;}
function handleLoadData($datas){$("#result").show();var div=$("#scrollList").empty();var _ul=$("<ul class='thumbList'></ul>");var template=$("#template")
var ul=_ul.clone();for(var i=0;i<$datas.length;i++){if(ul.children().size()==6){div.append(ul);ul=_ul.clone();}
var item=$datas[i];if($.isEmptyObject(item.tag)){}
var li=null;if(item.type==2){li=template.find("li.pic").clone();li.find("a.zoom_out").attr('href',item.url);li.find(".zoom_out img").attr('src',item.image);li.find(".misc .tag").html(item.tag);li.find('.misc .block').html(item.nickname);}else if(item.type==3){li=template.find("li.video").clone();li.find("a.zoom_out").attr('href',item.url);li.find(".zoom_out img").attr('src',item.image);li.find(".misc .tag").html(item.tag);li.find('.misc .block').html(item.nickname);}else{li=template.find("li.txt").clone();li.find("a.text").attr('href',item.url);li.find("a.text").html(item.content);li.find(".misc .tag").html(item.tag);li.find('.misc .block').html(item.nickname);}
if($.isEmptyObject(item.tag)){li.find(".tag-wrapper").remove();}
ul.append(li);}
if(ul.children().size()==6){div.append(ul);}else{ul.remove();}
_ul.remove();resetThumbs('.zoom_out',150,150);}
function addSearchMarker(id,marker){searchMarkers[id]=marker;searchaddListener(marker,id);}
function clearSearchMarkers(){if($.bmap.map){$.bmap.map.clearOverlays();}}
function searchaddListener(marker,id){marker.addEventListener('click',function(event){select(id);});}
function addTosearchMarkerClusterer(searchMarker){if(!searchMarkerClusterer){searchMarkerClusterer=new MarkerClusterer(map);}
searchMarkerClusterer.addMarker(searchMarker,true);}
function clearsearchMarkerClusterer(){if(!searchMarkerClusterer){return;}
searchMarkerClusterer.clearMarkers();}
function refreshSearchMarkerToMap(){$.each(searchMarkers,function(key,value){if(value){$.bmap.map.addOverlay(value);}});}
function handleSearchData(data){if(city_popup){city_popup.hide();}
var searchBar=$("#searchbar");var page=$("#searchbar .current").text();if(!page||page<=1){searchBar.find(".searchcount").html(0);searchBar.find(".searchpages").html(0);}
$("#getusuallocation").hide();var data_list=$('#dataList');data_list.empty();if(!data||data.count==0){var name=getKeyWordInput().val();var content="<div class='searchFeedBack noresult'> "+"<h4 class=''>抱歉，没有找到<em>"+name+"</em>相关地点 </h4>"+"<h5 onclick='$(\"#kaikenmodel\").trigger(\"click\")'> <a href='#'>立即开垦</a></h5></div>";data_list.append(content);searchBar.hide();return;}
searchBar.show();searchBar.find(".searchcount").html(data.count);var pages=parseInt(data.count/10);if(data.count%10!=0){pages=pages+1;}
searchBar.find(".searchpages").html(pages);var start=0;var page=searchBar.find(".current").text();if(!$.isEmptyObject(page)){page=new Number(page);start=(page-1)*eachpage;}
var flag_i=0;var items="<ul>";var uiStyle=getUIStyle();if(uiStyle>=2){items="<ul class='mapAside' >";}
for(var i=0;i<data.data.length;i++){var item=data.data[i];var dist="";if(item.geodist){dist=Math.round(item.geodist)+"米";}
var id=item.code;if(!id){id=item.code;}
var seq=start+i+1;if(flag_i+i>=eachpage)
break;var district="";if(item.provincename){district=item.provincename;}
if(item.cityname&&item.cityname!=item.provincename){district=district+item.cityname;}
if(district!=""){district=$.l.truncateStr(district,8,'..');district="<em> 【"+district+"】</em>";}
var elem="";var shortname=item.name;if(shortname&&shortname.length>9){shortname=shortname.substring(0,8)+"..";}
if(uiStyle==1){var elem="<li id='l_"+id+"' lat='"+item.lat+"' lng='"
+item.lng+"' title='"+item.name+"'>"
+seq+"."+shortname+district+"  <em class='dist'>"+dist+"</em></li>";items=items+elem;}else if(uiStyle==2){var elem="<li id='l_"+id+"' lat='"+item.lat+"' lng='"
+item.lng+"' title='"+item.name+"'>"
+seq+"."+shortname+district+"  <em class='dist'>"+dist+"</em></li>";items=items+elem;}else{var elem="<li id='l_"+id+"' lat='"+item.lat+"' lng='"
+item.lng+"' title='"+item.name+"'><span class='poilocation'>定位</span>"
+seq+"."+shortname+district+"  <em class='dist'>"+dist+"</em></li>";items=items+elem;}
if($.bmap.map){var marker=createPoiMarker(item,seq);}}
items=items+"</ul>";data_list.append(items);if($.bmap.map){$.bmap.map.setZoom(14);$.bmap.map.setCenter(locationMarker.getPosition());}}
function createPoiMarker(item,seq){var lat=item.lat;var lng=item.lng;var point=new BMap.Point(lng,lat);var icon=new BMap.Icon("/static/image/map/marker/"+seq+".png",new BMap.Size(30,40));var marker=new BMap.Marker(point,{title:item.name,icon:icon});marker.data_id=item.code;marker.addEventListener('click',function(event){select(this.data_id);});$.bmap.map.addOverlay(marker);return marker;}
function showKaikenButton(){if(getUIStyle()!=3){return;}
if(!locationMarker){return;}
var point=locationMarker.getPosition();if(!kaikenMarker){var icon=new BMap.Icon("/static/image/map/kaiken.png",new BMap.Size(70,26));kaikenMarker=new BMap.Marker(point,{title:"开垦",icon:icon,offset:new BMap.Size(0,-46),enableDragging:false});kaikenMarker.disableMassClear();kaikenMarker.addEventListener('click',function(){openKaikan();});}else{kaikenMarker.setPosition(point);}
$.bmap.map.addOverlay(kaikenMarker);}
function closeKaiKenButton(){if(kaikenMarker){$.bmap.map.removeOverlay(kaikenMarker);}}
function searchByName(page){var data=new Object();data.cityid=getCityInfoDiv().attr('citycode');data.q=getKeyWordInput().val();data.eachpage=eachpage;if($.isEmptyObject(page)||page<1){page=1;}
data.startpos=(page-1)*eachpage;$("#searchbar .current").text(page);var url='/api/web/poi/searchname';clearSearchMarkers();$("#dataList").empty();$.post(url,$.param(data),function(data){if(data){handleSearchData(data);var item=$("#dataList li:first");if(item&&item.size()>0){var lat=item.attr('lat');var lng=item.attr('lng');if($.bmap.map){var point=new BMap.Point(lng,lat);$.bmap.map.setCenter(point);locationMarker.setPosition(point);showKaikenButton();}}}});setSearchType('name');}
var infoBubbleArea;function getInfoBubbleArea(){if(!infoBubbleArea){infoBubbleArea=new InfoBubble({maxWidth:500,arrowSize:5,arrowStyle:2});}
return infoBubbleArea;}
var infoBubbleTips;function openInfoBubbleTips(content){if(!infoBubbleTips){infoBubbleTips=new BMap.InfoWindow({width:0,height:0});}
if(content==null){content='请拖动大头针,选择地点';}
infoBubbleTips.setContent(content);locationMarker.openInfoWindow(infoBubbleTips);setTimeout(closeInfoBubbleTips,60000);return infoBubbleTips;}
function closeInfoBubbleTips(){if(infoBubbleTips&&infoBubbleTips.isOpen()){locationMarker.closeInfoWindow();}}
var geocoder;var routeInfo;function geocode(lat,lng){if(!geocoder){geocoder=new BMap.Geocoder();}
geocoder.getLocation(new BMap.Point(lng,lat),function(result){if(result){routeInfo=new Object();routeInfo.address=result.address;if(result.addressComponents){routeInfo.province=result.addressComponents.province;routeInfo.city=result.addressComponents.city;routeInfo.subcity=result.addressComponents.district;routeInfo.street=result.addressComponents.street;}
if(routeInfo.country=="TW"){routeInfo.city=routeInfo.province;routeInfo.province='台湾';}
if(routeInfo.country=="MO"){routeInfo.city='澳门';routeInfo.province='澳门';}
if(routeInfo.country=="HK"){routeInfo.city='香港';routeInfo.province='香港';}
routeInfo.lat=locationMarker.getPosition().lat;routeInfo.lng=locationMarker.getPosition().lng;}});}
var _data;function select(id){_data=new Object();_data.id=id;var li=$("#l_"+id);_data.name=li.attr('title');_data.dist=li.find('.dist').text();_data.lat=li.attr('lat');_data.lng=li.attr('lng');closeMapPicker();}
function getData(){return _data;}
var successcallback;function openMapPicker(element,callback){successcallback=callback;var element=$(element);var div=$("#map_picker_content");if(!div.hasClass('maploaded')){div.load("/static/html/map_picker.html?t=3000",function(){div.addClass("maploaded");initAction();handlelocusual();initFancyBox();showFancyBox();var cityInfo=$('#cityinfo');var cid=$.cookie('mappicker_cid');var cname=$.cookie('mappicker_cname');if(!$.isEmptyObject(cid)&&!$.isEmptyObject(cname)){cityInfo.html(cname);cityInfo.attr('citycode',cid);}});}else{showFancyBox();}}
function _resetLayout(){var style=getUIStyle();var popChoose=$("#map_picker_content .popChoose");var isMapModel=popChoose.hasClass("mapModel");var keyword=getKeyWordInput().val();if(style==1){if(isMapModel){popChoose.removeClass("mapModel");$("#fancybox-content,#fancybox-content >div").width(401);$("#fancybox-wrap").css('width',411);}
if($.isEmptyObject(keyword)){handlelocusual();}else{searchByName();}}else{if(!isMapModel){$("#fancybox-content,#fancybox-content >div").css('width',745);$("#fancybox-wrap").css('width',755);popChoose.addClass("mapModel");if(!hasLoadMap){initMap();}else{if(!$.bmap.map){$.l.alert("地图初始化失败,请刷新页面试试");return;}}}
if(style==2){if($.isEmptyObject(keyword)){searchByLocation();}else{searchByName();}}else{$("#dataList").empty();$("#dataList").append($("#map_picker_template .kaikenGuide").clone());$("#searchbar").hide();if($.bmap.map){clearSearchMarkers();showKaikenButton();}}
loadCityForKaiken();}}
function closeMapPicker(){var data=getData();if(data!=null&&successcallback!=null){successcallback(data);}
closeFancyBox();$(".ac_results").hide();if(city_popup){city_popup.hide();}}
function initFancyBox(){$("a#mappickerfancybox").fancybox({'padding':5,'centerOnScroll':true,'hideOnOverlayClick':false});}
function showFancyBox(){$("a#mappickerfancybox").trigger('click');var popChoose=$("#map_picker_content .popChoose");var isMapModel=popChoose.hasClass("mapModel");if(isMapModel){$("#fancybox-content,#fancybox-content >div").css('width',745);$("#fancybox-wrap").css('width',755);}
var tag_href=window.location.href;if(tag_href.indexOf('active=true')>0){setTimeout(function(){setUIStyle(3);_resetLayout();$("#kaikenmodel").text("开垦向导");$("#listmodel").text("文本搜索");$("#mapsearchmodel").show();},1000*1);}}
function closeFancyBox(){$("#fancybox-close").trigger('click');}
$(window).scroll(function(){var ac=$(".ac_results");if(ac.is(":visible")){ac.hide();window.setTimeout(function(){var top=$("#fancybox-wrap").css('top');top=parseInt(top)+59;ac.css('top',top+"px");ac.show();},200);}});function loadCityForKaiken(){var templateDiv=$("#map_picker_template");if(templateDiv.is(".loadcity")){return;}
templateDiv.addClass('loadcity');$.post("/api/web/district.php",{action:'getProvinces'},function(result){if(result.success){$("#map_picker_template .mapexp_province").append(result.province);$("#map_picker_template .mapexp_city").append(result.city);}},'json');$("#dataList .mapexp_province").live('change',function(){var selectedprovince=$("#dataList .mapexp_province option:selected");var upid=selectedprovince.val();if(upid==1||upid==2||upid==9||upid==22||upid==33||upid==34){var options=selectedprovince.clone(false);$("#dataList .mapexp_city").empty().append(options);return;}
if(upid==null){alert("数据错误");}
var url="/api/web/district.php?action=district&upid="+upid;$.getJSON(url,function(data){if(!data){return;}
data=$.parseJSON(data);var options="";for(var i=0;i<data.length;i++){var item=data[i];var option="<option lat='"+item.lat+"' lng='"+item.lng+"' value='"+item.code+"'>"+item.name+"</option>";options=options+option;}
$("#dataList .mapexp_city").html(options);});});}
function changeCityForKaiKen(routeInfo){if(!routeInfo){return;}
var data=new Object();data.province=routeInfo.province;data.city=routeInfo.city;data.currentprovinceid=$("#dataList .mapexp_province").val();data.currentcityid=$("#dataList .mapexp_city").val();var url="/api/web/poi/changecityforkaiken";$.post(url,$.param(data),function(data){if(!data||!data.success){return;}
if(data.type=='notchange'){return;}
var cityElement=$("#dataList .mapexp_city");var cityid=data.cityid;var provinceid=data.provinceid;if(data.type=='changecity'){cityElement.val(cityid);return;}
$("#dataList .mapexp_province").val(provinceid);var items=data.data;var options="";for(var i=0;i<items.length;i++){var item=items[i];var option="";if(item.id==cityid){option="<option selected='selected' lat='"+item.lat+"' lng='"+item.lng+"' value='"+item.code+"'>"+item.name+"</option>";}else{option="<option lat='"+item.lat+"' lng='"+item.lng+"' value='"+item.code+"'>"+item.name+"</option>";}
options=options+option;}
$("#dataList .mapexp_city").html(options);},'json');}
$.mapPicker={_initMap:_initMap,getData:getData,open:openMapPicker,close:closeMapPicker}}(jQuery));