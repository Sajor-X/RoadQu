$LAB.script("/static/js/jquery.bxSlider.min.js")
    .wait(function () {
        $('#slider').bxSlider({
            auto:true,
            pager:true

        });

    })


$(document).ready(function () {


    // 幻灯片

    //$('#slider').nivoSlider({
    //captionOpacity: 0.6,
    ///effect: "fade",
    //directionNavHide: false
    //});

var score_str = {
    5 : '整体感觉非常不错，极力推荐！',
    4 : '休闲度假的好地方，值得一去！ ',
    3 : '环境还行，但短时间内不会去第二次！ ',
    2 : '感觉不好玩，不符合我的胃口！',
    1 : '印象很不好，下次不会去了！'
};

    //景点打分
    var $grade = $("#pop-grade"),
    $score = $("#score"),
    $desc = $("#desc");

    $grade.hover(function () {
        // Stuff to do when the mouse enters the element;
        // $grade.find('em').
        $score.addClass('em-hover');
    });
    $grade.find('b').hover(function() {
        $("#score-tips").hide()
        var $target = $(this);

        var txt = $target.attr('title');
        var star_index = $target.index();
        //console.info(star_index);
        var curpercent = 20 * star_index + '%'
        //console.info(curpercent);

        $score.css('width', curpercent);
        $("#score-input").val(star_index);
        $("#error-report").val(score_str[star_index]);
        $desc.text(txt)
    }) .click(function(){
         var $target = $(this);

        var star_index = $target.index();
        $("#score-input").val(star_index);
        $("#error-report").val(score_str[star_index]);
    });
    $("#user_score").click(function () {
        if (!uid) {
            needLogin();
            return false;
        }
        var $target = $(this);
        var star_index = $target.index();
        var txt = $target.attr('title');
        var score = star_index;
        var lid = $(this).attr("data-lid")
        var href = "/pages/poi/poi_score.php?lid=" + lid


        //console.info(curpercent);
        $.fancybox({
            'width':470,
            'height':315,
            'padding':5,
            'margin':0,
            'autoScale':false,
            'transitionIn':'none',
            'transitionOut':'none',
            'centerOnScroll':true,
            'hideOnOverlayClick':false,
            'type':'iframe',
            'href':href

        });


    })


    //打分结束
    //
    //	// 景点分享
    $("#share-friend").click(function () {

        var lid = $(this).attr('data-lid')

        // body...
        var href = "/pages/poi/poi_share.php?lid=" + lid
        $.fancybox({
            'width':473,
            'height':353,
            'padding':5,
            'margin':0,
            'autoScale':false,
            'transitionIn':'none',
            'transitionOut':'none',
            'centerOnScroll':true,
            'hideOnOverlayClick':false,
            'type':'iframe',
            'href':href
        })

    })


    // 地图
    $('#mapaction').click(function () {
        $("#googleMap").toggle();
        if ($(this).text() == '看地图') {
            $(this).text('收起地图');

        } else {
            $(this).text('看地图');
        }
        if (showmap) {
            $.gmap.load('initMap');
            showmap = false;
        }
    });

    $('#actArrow,#writeTwitter').click(function () {
        $('#postBox').slideToggle("normal", function () {
            var setFocusText = $("#contentbox");
            setFocus(setFocusText, $.l.getWordsLen(setFocusText.val()));

        });
        if ($('#writeTwitter').text() == "发布途说") {
            $('#writeTwitter').text("收起发布");
        } else {
            $('#writeTwitter').text("发布途说");
        }
    });

    $(".hot_blog .listenAction").click(function () {
        if (!uid) {
            needLogin();
            return false;
        }
        var node = $(".hot_blog .listenAction");
        var title = node.html();
        if (title == '已收听') {
            alert('已经收听');
            return false;
        }
        var touid = Number($(this).attr("uid"));
        var url = "/api/web/relation/subscribe";
        var data = new Object();
        data.touid = touid;
        data = $.param(data);
        $.post(url, data, function (data) {
            if (data && data.success) {
                node.html('已收听');
            }
        }, 'json');

    });

    $("#btnSubPoi").click(function () {
        var lid = $(this).attr("data-lid");
        $.l.subscribePoi(this, lid);
    });

    $(".wantGo").click(function () {
        var node = $(".wantGo");
        var flag = node.attr('data-flag');
        var lid = node.attr('data-lid');
        var count = node.children().html();
    })

    $(".wantGo").click(function () {
        if (!uid) {
            needLogin();
            return false;
        }
        var node = $(".wantGo");
        var flag = node.attr('data-flag');
        var lid = node.attr('data-lid');
        var count = node.children().html();

        if (flag == 1) {
            $.l.alert("你行囊里已经有该地点了！");
        } else {
            $.post('/api/web/common.php', {
                action:'addpoiwant',
                lid:lid
            }, function (result) {
                if (result != 'error') {
                    node.attr('data-flag', 1)
                    count = parseInt(count) + 1;
                    node.children().html(count);
                    $.l.alert("成功放入你的行囊！");
                    var msgjson = jQuery.parseJSON(result);
                    sync(msgjson.content, msgjson.pic, 'sinawb');
                    sync(msgjson.content, msgjson.pic, 'qqwb');
                } else {
                    $.l.alert('该地点放入行囊失败！');
                }
            });
        }
    });

    $(".aleadyGo").click(function () {
        if (!uid) {
            needLogin();
            return false;
        }
        var node = $(".aleadyGo");
        var flag = node.attr('data-flag');
        var lid = node.attr('data-lid');
        var count = node.children().html();

        if (flag == 1) {
            $.l.alert("你已到该地点游过了！");
        } else {
            $.post('/api/web/common.php', {
                action:'addpoigone',
                lid:lid
            }, function (result) {
                if (result > 0) {
                    node.attr('data-flag', 1)
                    count = parseInt(count) + 1;
                    node.children().html(count);
                    $.l.alert("成功标记到此一游！");
                    poigonemsg(result);
                } else {
                    $.l.alert('记录该地点的到此一游失败！');
                }
            });
        }
    });

    $("#weibo-post-btn").click(function () {
        if (!uid) {
            needLogin();
            return false;
        }
        $("#postBox").toggleClass('disnone');
        return false;
    });

    $(".icoClose").click(function () {
        if (!$(".blogBox").hasClass('disnone')) {
            $(".blogBox").addClass('disnone');
        }
        return false;
    });
    function poigonemsg(id) {
        $.post('/api/web/common.php', {
            action:'poigonemsg',
            id:id
        }, function (result) {
            if (result != 'error') {
                var msgjson = jQuery.parseJSON(result);
                //alert(msgjson.content);
                sync(msgjson.content, msgjson.pic, 'sinawb');
                sync(msgjson.content, msgjson.pic, 'qqwb');
            }
        });
    }

    if ($.fn.artZoom) {


        $('a.artZoom').artZoom();
    }

    if (!uid) {
        $("#change_place").click(function () {
            if (!uid) {
                needLogin();
                return false;
            }
        });
    }


    var album = $('#scene-thumbnail');
    album.find("a.thumbnail").fancybox({
        'padding':5
    });
    var map = $("#sceneMap");
    if (map.length > 0) {
        _poi_initMap();
    }

    $(".ico-expand").click(expandNear);

});

function poigonemsg(id) {
    $.post('/api/web/common.php', {
        action:'poigonemsg',
        id:id
    }, function (result) {
        if (result != 'error') {
            var msgjson = jQuery.parseJSON(result);
            //alert(msgjson.content);
            sync(msgjson.content, msgjson.pic, 'sinawb');
            sync(msgjson.content, msgjson.pic, 'qqwb');
        }
    });
}

function _poi_initMap() {
    var latlng = null;
    var lat = $("#mylat").val();
    var lng = $("#mylng").val();
    var name = $("#myname").val();
    var poilist = [];
    if (!lat || !lng) {
        var point = $.bmap.getCurrentCityLatLng();
        lat = point.lat;
        lng = point.lng;
    }
    poilist[0] = {
        lat:lat, 
        lng:lng, 
        name:name
    };
    var index = 1;
    $("#nearbyHotPlace a").each(function () {
        var lat = $(this).attr('data-lat');
        var lng = $(this).attr('data-lng');
        var title = $(this).attr('title');
        var name = $(this).text();
        name = $.trim(name) + " " + $.trim(title);
        poilist.push({
            lat:lat, 
            lng:lng, 
            name:name, 
            index:index++
        });
    });
    $.side.showSideMap("sceneMap", poilist);
}

function setFocus(objFocusEven, values) {
    objFocusEven.focus(); // 默认使用focus方法聚焦
    // 判断是否为Ie浏览器
    if ($.browser.msie) {
        var txt = objFocusEven[0].createTextRange(); // 将传入的控件对象转换为Dom对象，并创建一个TextRange对象
        txt.moveStart('character', values); // 设置光标显示的位置
        txt.collapse(true);
        txt.select();
    }
}

function expandNear() {
    $(".fn-clear.disnone").show();
    $(this).html("收起").unbind("click").click(closeNear);
}

function closeNear() {
    $(".fn-clear.expand").hide();
    $(this).html("展开").unbind("click").click(expandNear);
}


//显示更多兴趣微博
function showMoreAlbumBlog(albumid, atid) {
    $(".moreinterestloading").show();
    $("#more-page-warp").hide();
    var id = $("#page_endid").val();
    var page_num = $("#page_num").val();
    var data = {};
    data.id = id;
    data.page_num = page_num;
    data.albumid = albumid;
    data.atid = atid;
    //data = $.param(data);
    $.ajax({
        type:"POST",
        url:"/api/web/poi/playbloglist",
        data:data,
        success:function (msg) {
            $(".moreinterestloading").hide();
            $("#more-page-warp").show();
            if (msg.success) {
                var html = [];
                // getTransmitItemHtml getSendTalk
                var page_endid = 0;
                var morePageJson = msg.data;
                $(morePageJson).each(function (i) {
                    html.push(getAlbumBlogHtmlItem(morePageJson[i]));
                    page_endid = morePageJson[i].bid;
                });
                html = html.join('');
                $("#page_endid").val(page_endid);
                var page_aftertotal = $("#page_aftertotal").val();
                page_aftertotal = parseInt(page_aftertotal) - parseInt(page_num);
                $("#page_aftertotal").val(page_aftertotal);

                $("#blog-List").append(html);
                $("#blog-List").masonry('reload');
                if (parseInt(page_aftertotal) <= 0 || page_endid == 0) {
                    $("#showmorepage").hide();
                }
            } else {

            }

        }
    });
}


function getAlbumBlogHtmlItem(json) {
    var nickname = json.nickname;
    if (nickname.length > 5) {
        nickname = nickname.substring(0, 6);
    }
    var lname = json.lname;
    if (lname.length > 5) {
        lname = lname.substring(0, 2);
    }
    var html = [];
    html.push('<div class="blog-item">');
    var encodenickname = encodeURI(json.nickname);
    html.push('<div class="blog-head-wrap">');
    if (json.image != '') {
        html.push('<a class="blog-img" href="/weibo/' + json.bid + '" style=" background:url(' + json.image + ') no-repeat;width:200px; height:' + json.height + 'px"></a>');
        html.push('<p class="blog-head">');
    } else {
        //没有图片多一个样式
        html.push('<p class="blog-head nopic-weibo">');
    }
    html.push('<span class="fl">');
    html.push('<a class="blog-user-pic" href="/n/' + encodenickname + '">');
    html.push('<img src="' + json.avatar + '" title="' + json.nickname + '" class="js_avatar2" width="20px" height="20px"/>');
    html.push('</a>');
    html.push('<a href="/n/' + encodenickname + '" title="' + json.nickname + '"  class="blog-username">' + nickname + '</a>');
    html.push('</span>');
    html.push('<span class="fr">');
    html.push('<a href="/poi/' + json.lid + '" class="blog-locate"' + json.lname + '>' + lname + '</a></span>');
    html.push('</p >');
    html.push('</div>');

    html.push('<p class="blog-content">');
    html.push(json.content);
    if (json.showmore) {
        html.push("<a href='/weibo/" + json.bid + "' class='ico-more' title='更多'></a>");
    }
    html.push('</p>');
    if (json.commentlist != '') {
        html.push('<div class="blog-from">');
    } else {
        html.push('<div class="blog-from no-comments">');
    }
    html.push('<div class="fl"><cite><a href="/weibo/' + json.bid + '">' + json.dateline + '</a></cite></div>');
    html.push('<div class="fr">');
    html.push('<a href="/weibo/' + json.bid + '?action=transmit" class="blog-action">转发</a> <a href="/weibo/' + json.bid + '?action=comment" class="blog-action">评论</a>');
    html.push('</div>');
    html.push('</div>');


    if (json.commentlist != '') {
        html.push('<ul class="blog-commnet ">');
        var commentlist = json.commentlist;
        var len = commentlist.length;
        var i = 0;
        for (i = 0; i < len; i++) {
            if (i < 2) {
                html.push('<li>');
                html.push('<div class="ico-comment"></div>');
                html.push('<div class="comment-details">');
                html.push('<a class="blog-user-name" href="/' + commentlist[i].username + '">' + commentlist[i].nickname + '</a>：');
                html.push(commentlist[i].content + '</div>');
                html.push('</li>');
            } else {
                html.push('<li><a class="see-more-comment" href="/weibo/' + commentlist[i].bid + '?action=comment">查看更多评论</a></li>');
            }
        }

        html.push('</ul>');
    }
    html.push('</div>');
    return html.join('');
}
