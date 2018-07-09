/*删除 COOKIE 功能，引入专门COOKIE插件*/

  var $blogscroll_1 = true;
  var $blogscroll_2 = true;
var lockshowpage = false;

$(document).ready(function () {
	
	$(window).scroll( function() { 
	
	     var s_h = $(window).scrollTop(); 
	     if(s_h>800 && $blogscroll_1){
			$blogscroll_1 = false;
	     	$("#moreblog").trigger('click');
		 }  
	     if(s_h>1600 && $blogscroll_2){
			$blogscroll_2 = false;
			$("#moreblog").trigger('click');
		 }  
	
	 } );
	

	
	
	$(".placefrequentedpoi").live('click',function(){
		$('.change_place').html($(this).html());
		$("#location .id").html($(this).attr('lid'));
		$("#location .name").html($(this).html());
		$("#location .lat").html($(this).attr('lat'));
		$("#location .lng").html($(this).attr('lng'));
	})
	
	$("#feed_list .multiSmallPic").live('click',function(){
		$(this).hide();
		var html = [];
		$(this).find('img').each(function(i){
			var img_html = '<div class="clear"></div>';
			var big_image = $(this).attr('src').replace('_c','');
			var middle_image = $(this).attr('src').replace('_c','_m');
			img_html += '<a href="' + middle_image + '" rel="' + big_image + '"  class="miniImg artZoom" title="" ><img src="' + $(this).attr('src') + '" /></a>';
			/*
			if(img_html.indexOf('.gif') || img_html.indexOf('.GIF')){
				img_html = img_html.replace('_c','');
			}else{
				img_html = img_html.replace('_c','_m');
			}
			*/
			img_html = img_html.replace('_c','_m');
			img_html += '<div class="clear"></div>';
			img_html += $(this).attr('alt');
            html.push(img_html);
        });
		html = html.join('');
		$(this).next().html(html);
		return false;
		//$("#feed_list .miniImg").trigger('click');//不显示小图			
	})

	
	$(".multiBigPic .maxImgLink").live('click',function(){
		$(this).parent().prev().show();
		$(this).parent().parent().prev().show();
		var temp_html = $(this).parent().parent().parent().parent().html();
		temp_html = temp_html.toLowerCase();
		if(temp_html.indexOf('oricontent')>0){// 转发情况
			$("html,body").animate({scrollTop: $(this).parent().parent().parent().parent().parent().parent().offset().top}, 1000);
		}else{
			$("html,body").animate({scrollTop: $(this).parent().parent().parent().parent().offset().top}, 1000);
		}
		
		$(this).parent().parent().html('');
		return false;
	})
	
	
	$("#showimage").click(function(){
		var v = $("#showimage").attr('v');
		v = parseInt(v)==0?1:0;
		var data = {};
		data.showimage = v;
		$.ajax({
			type: "POST",
			url: "/api/web/user.php",
			data: data,
			success: function (msg) {
				if(msg!='error'){
				  $("#showimage").attr('v',v);
				  if(v==0){
					 $("#showimage").html('切换到大图模式');
				  }else{
					 $("#showimage").html('切换到小图模式');
				  }
				  window.location.reload();						
				}

			}
		});		
	})
	
	// 途说流收听安钮事件
	$("#feed_list .head_pic-warp .follow-action").live('click',function(){
		if(!uid){
			needLogin();
			return false;
		}
		if(!$(this).hasClass('follow-yes')){	
			//$("#feed_list .doListen").addClass('listenDone');
			var temp_uid = $(this).attr('uid');
			$("#feed_list .follow-action").each(function(i){
			   if($(this).attr('uid')==temp_uid){
				   $(this).addClass('follow-yes');
			   }
			});
			
			//$.l.addUserSubscribes(this,temp_uid);	
			$.side.subscribe(this,temp_uid);
		}				
	})
	
	// 翻页模式监听
	if ($(".newmoreblog").size() > 0) {
		$(".newmoreblog").mouseover(function () {
			$(".more-page-options").show();
		})
	
	    var pagemodeurl = window.location.href;
	    $(".page-mode li:eq(0)").live('click',function(){
		   $.cookie('pagetype', '');
		   window.location.reload();
		})
		
	    $(".page-mode li:eq(1)").live('click',function(){
		   $.cookie('pagetype', 1);
		   window.location.reload();
		})
	
		$('#blog-more-option,.no-pages-option').bt('<div class="more-page-options "><ul class="page-mode"><li> <a href="javascript:;">滚动模式</a></li><li> <a href="javascript:;">翻页模式</a></li> </ul></div>',        {
			positions: ['bottom', 'bottom'],
			width: 80,
			height: 65,
			padding: "5px",
			fill: '#FFFFFF',
			strokeWidth: 2,
			cornerRadius: 5,
			strokeStyle: '#666666',
			spikeLength: 10,
			spikeGirth: 15,
			trigger: ['mouseover', 'click'],
			contentSelector: "$('#example-14-content').html()"
		});
	}	


	
	
	
	//$("#feed_list .miniImg").trigger('click');//不显示小图
	






    


    if(uid){
		// 显示未读新途说 间隔60秒
		var location_href = window.location.href;
		var href_regu = /^http(.*)\/me\.php$/i;
		var href_re = new RegExp(href_regu);
		if (href_re.test(location_href)) { // 显示全部才出现最新消息
			setInterval("showNewBlog('num')", timeInterval);
		}
	}


    $("#save").click(function () {
        $("#cityLayer").dialog("close");
    });
});


function blog_face(obj) {

	var boxid=$issueBox.popface.attr("class");
	var $curTextarea=$('#' + boxid);
    //var html = $(id).val();
    //$(id).val(html + '[' + obj.title + ']');
	//$(id).setCaret();   
	//$(id).insertAtCaret('[' + obj.title + ']'); //在光标处插入表情
	$curTextarea.setCaret();   
	$curTextarea.insertAtCaret('[' + obj.title + ']'); //在光标处插入表情 
    /*关闭表情*/
    closePopface();
}








function ctrlEnter(e) {
    var ie = navigator.appName == "Microsoft Internet Explorer" ? true : false;
    if (ie) {
        if (event.ctrlKey && window.event.keyCode == 13) {
            sendTalk();
        }
    } else {
        if (isKeyTrigger(e, 13, true)) {
            sendTalk();
        }
    }
}




function sendTalkSimple(content) {
	data = {};
	data.action = 'msgsend';
    data.rank = GetRandomNum(1, 999999);
    data.content = content;
    var location = $("#location");
    data.lid = location.find(".id").text();
    data.lname = location.find(".name").text();
    data.lat = location.find(".lat").text();
    data.lng = location.find(".lng").text();
    data.typeid=0;//动态信息分析
    if (!data.lid || data.lid == "") {
        data.lid = 'd03f8050ea1ccf438b874a53f5bdf478';
        data.lname = '深圳';
        data.lat = '22.5563';
        data.lng = '114.0504';
    }
    // 转成字符串
    data = $.param(data);
    //提交
    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: data,
        success: function (msg) {
            if (msg != 'error') {
                // todo
            } 
        }
    });
}

function sync(content,pic,action){
	var data = {};
	data.content = content;
	data.pic = pic;
	data.action = action;
	$.ajax({
		type: "POST",
		url: "/api/web/sync.php",
		data: data,
		success: function (msg) {
			if(msg=='true'){
                
			}
		}
	});
}


function sendTagShare() {

    var cont = $("#description").val();
    var nums = $("#description_nums").html();
    nums = parseInt(nums);
	var description_val = $.trim($("#description").val());
    if ($.l.getWordsLen(description_val) > 140) {
        $.l.autoClose('已超出' + Math.abs(nums) + '字', 1, 2);
        return false;
    }

    if (!cont) {
        $.l.autoClose('您没有输入信息内容', 1, 2);
        return false;
    }
    var data = new Object();
    data.action = 'msgsend';
    data.content = cont;
    data.photopath = '';
    data.rank = GetRandomNum(1, 999999);
    data.typeid=0;//动态消息
    var location = $("#location");
    data.lid = location.find(".id").text();
    data.lname = location.find(".name").text();
    data.lat = location.find(".lat").text();
    data.lng = location.find(".lng").text();
    if (!data.lid || data.lid == "") {
        data.lid = 1;
        data.lname = '深圳';
        data.lat = '22.5563';
        data.lng = '114.0504';
    }


    // 转成字符串
    data = $.param(data);
    // 提交
    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: data,
        success: function (msg) {
            if (msg != 'error') {

                $("#tagShare").hide();
                $("#description").val('');
                $.l.autoClose('消息发表成功！', 1, 1);
            } else {
                $.l.autoClose('您没有输入信息内容', 1, 2);
            }
        }
    });
    return true;
}



// 展开评论框  更新2012-02-13 by freedyYang 新增问答广告tips


function commentajax(id,isloadcomment) {

	if(!uid){
		needLogin();
		return false;
	}
	if(isloadcomment==undefined){
		isloadcomment=true;
	}
    $('#transmit_' + id).html('');
    $('#transmitshow_' + id).html('');
	var $curCommentID=$('#comment_' + id);
	var commentshowID='commentshow_' + id;


    var str =$curCommentID.html();
    if (str == '') {

        var str = [];
        str.push('<div class="comtWrap"><div class="SA"><em>◆</em><span>◆</span></div>');
        str.push('<div class="top"></div>');
        str.push('<div class="cont">');
        str.push('<p class="feedback-tips disnone" id="feedback-tips_' + id + '" ><span></span><a class="close-ico feedback-tips-close " id="feedback-tips' + id + '" href="#" onclick="closeComTips('+id+');return false;">关闭</a></p>');
        str.push('<textarea replycid="" id="commentbox_' + id + '" class="talkBox" ></textarea>');
		str.push('<input onclick="commentsend(' + id + ')" type="button" value="评论" class="sendBtn" >');
        str.push('</div>');
        str.push('<div class="bot"><div class="fn-left">  <div class="comment_face" ><a href="javascript:;" >表情</a></div><label for="transmitCheckbox"><input value="1" type="checkbox" class="check1 transmitCheckbox" >同时转播</label>  </div>');
    
        str.push('<span class="countTxt">还能输入<em id="commentwordnum_' + id + '">140</em>字</span></div>');
        str.push('</div>')
		str.push(' <div class="commentshow" id="'+commentshowID+'"></div>')
		  
        str = str.join('');

        $curCommentID.append(str);
        
        _setfeedbacktips(id);//显示问答
		/*txt*/
        var $curCommentBox=$('#commentbox_' + id);

	     $curCommentBox.elastic();
		 	
		/*txt*/
		 
        //发布表情
        $curCommentID.find('.comment_face').click(function () {
		  
		    /*表情位置*/
			//$popface.show();
	        var posface_top=$curCommentID.offset().top+85;
	        var posface_left=$curCommentID.offset().left;
	        //$popface.offset({top:posface_top,left:posface_left});
		
			//$popface.attr("class",'commentbox_' + id) /*追加文本框ID到class属性,以便表情值返回到那个文本框*/
			showPopface('commentbox_' + id, posface_top, posface_left);
        });
     


       $("#commentbox_" + id).keyup(function () {
            var len = $.l.getWordsLen($("#commentbox_" + id).val());
            len = 140 - len;
            if (len < 0) {
				 $curCommentID.find(".countTxt").addClass('tipsError').html('已超出<em id="commentwordnum_' + id + '">' + Math.abs(len) + '</em>字');
            } else {
				$curCommentID.find(".countTxt").removeClass('tipsError');
                $curCommentID.find(".countTxt").html('还能输入<em id="commentwordnum_' + id + '">' + Math.abs(len) + '</em>字');
            }
            $("#commentwordnum_" + id).html(Math.abs(len));
        });

        userAutoTips({
            id: "commentbox_" + id
        }); // 收听人提示
        if(isloadcomment){
        	$.ajax({
        		type: "POST",
        		url: "/api/web/blog.php",
        		data: "action=loadcomment&bid=" + id + "&uid=" + uid + "&rank=" + GetRandomNum(1, 999999),
        		success: function (msg) {
        			
        			var location_href = window.location.pathname;
        			var href_regu = /^\/weibo\//i;
        			var href_re = new RegExp(href_regu);
        			//详细页面 不显示评论列表
        			if (!href_re.test(location_href)) { 
        				var list_num = 10; // 默认显示几条
        				var html = [];
        				html.push('<ul class="commentUL">');
        				var commentjson = jQuery.parseJSON(msg);
        				$(commentjson).each(function (i) {
        					html.push(getCommentItemHtml(commentjson[i],id));
        				});
        				var len = $("#commentnum_" + id).html();
        				len = parseInt(len);
        				if (len > list_num + 1) {
        					var num = len - list_num;
        					html.push('<li><div class="pages">后面还有' + num + '条评论，<a href="/weibo/' + id + '?&action=comment">点击查看>></a> </div></li></ul></div>')
        				}
        				// ;
        				html.push('</ul>');
        				html = html.join('');
						
						$("#"+commentshowID).html(html);
        				//$commentshowID.html(html);
						//$curCommentID.find('.comtWrap').append(html);
        			}
        			
        		}
        	});
        }

    } else {
       $curCommentID.html('');
	   closePopface();
	   
    }
}


//展开回复框
function replyajax(id,reply_nickname,bid) {
	if(!uid){
		needLogin();
		return false;
	}
	var $curReplyID=$("#reply_" + id);
    var str = $('#reply_' + id).html();
	
    if (str == '') {
        var str = [];
        str.push('<div class="talkWrap comtWrap"><div class="SA"><em>◆</em><span>◆</span></div>');
        str.push('<div class="top"><span class="left"><span class="replyTitle">点评原文，点评内容不会发送给你的听众</span></span><a title="关闭" class="close" href="javascript:void(0);" onclick="replyajax(' + id + ')" >关闭</a></div>');
        str.push('<div class="cont">&nbsp;<textarea replycid="" id="replybox_' + id + '" class="talkBox"></textarea>'
		);
		 str.push('<input onclick="replysend(' + id + ',' + bid + ')" type="button" value="回复" class="sendBtn" ></div>');
        str.push('<div class="bot"><div class="fn-left"><div class="comment_face" ><a href="javascript:;"">表情</a></div><label for="transmitCheckbox"><input value="1" type="checkbox" class="check1 transmitCheckbox" >同时转播</label></div><span class="countTxt">还能输入<em id="replywordnum_' + id + '">140</em>字</span>');
       
        str.push('</div>');
        str.push('<div class="comment_menu_face disnone"></div>');
        str = str.join('');
        $('#reply_' + id).html(str);

       
       //发布表情
        $curReplyID.find('.comment_face').click(function () {
		    /*表情位置*/
			//$popface.show();
	        var posface_top=$curReplyID.offset().top+115;
	        var posface_left=$curReplyID.offset().left;
	        //$popface.offset({top:posface_top,left:posface_left});
		
			//$popface.attr("class",'replybox_' + id) /*追加文本框ID到class属性,以便表情值返回到那个文本框*/
			showPopface('replybox_' + id, posface_top, posface_left);
        });



        replyComment(reply_nickname,'replybox_'+id,id);

        $("#replybox_" + id).keyup(function () {
			var len = $.l.getWordsLen($("#replybox_" + id).val());
            len = 140 - len;

            if (len < 0) {
                $("#reply_" + id + " .countTxt").addClass('tipsError').html('已超出<em id="replywordnum_' + id + '">' + Math.abs(len) + '</em>字');
            } else {
				$("#reply_" + id + " .countTxt").removeClass('tipsError');
                $("#reply_" + id + " .countTxt").html('还能输入<em id="replywordnum_' + id + '">' + Math.abs(len) + '</em>字');
            }

            $("#replywordnum_" + id).html(Math.abs(len));
        });

        userAutoTips({
            id: "replybox_" + id
        }); // 收听人提示

    } else {
        $('#reply_' + id).html('');
        $('#replyshow_' + id).html('');
    }



}
// 关闭评论 转发 tips
function closeComTips(id){
	var $ComTipsId=$("#feedback-tips_"+id);
	$ComTipsId.hide();


}
// 发表评论

function commentsend(id, transmit_cont) {
    if (cookielimit() == false) {
        return false;
    }
    var replycid = $("#commentbox_" + id).attr('replycid');
    var nums = $("#commentwordnum_" + id).html();
    nums = parseInt(nums);

    var commentbox_val = $.trim($('#commentbox_' + id).val());
    if (typeof (transmit_cont) != 'undefined') {
        var cont = transmit_cont;
    } else if (commentbox_val == "") {
        $.l.autoClose('您没有填写评论的内容！', 1, 2);
        return false;
    } else if ($.l.getWordsLen(commentbox_val) > 140) {
        $.l.autoClose('已超出' + Math.abs(nums) + '字', 1, 2);
        return false;
    } else {
        var cont = $.l.countCharacters($('#commentbox_' + id).val(), 140);
        var sendcomment = $.cookie('sendcomment');
        if (cont == sendcomment) {
            $('#commentbox_' + id).val("");
            $.l.autoClose('不能发表相同信息', 1, 2);
            return false;
        }
    }
    if (!$("#comment_" + id + " .sendBtn").hasClass("sending")) {
    	//data: "action=sendcomment&bid=" + id + "&replycid=" + replycid + "&uid=" + uid + "&commen_content=" + cont + "&rank=" + GetRandomNum(1, 999999),
    	var data=new Object();
    	data.action='sendcomment';
    	data.bid=id;
    	data.replycid=replycid;
    	data.uid=uid;
    	data.commen_content=cont;
    	data.rank=GetRandomNum(1, 999999);
        $("#comment_" + id + " .sendBtn").addClass("sending");
        $.ajax({
            type: "POST",
            url: "/api/web/blog.php",
            data: $.param(data),
            success: function (msg) {
                $("#comment_" + id + " .sendBtn").removeClass("sending");
                if (msg != "error") {
                    $.cookie('sendcomment', cont);
                    var commentnum = $("#commentnum_" + id).html();
                    $("#commentnum_" + id).html(parseInt(commentnum) + 1);
                    var commentjson = jQuery.parseJSON(msg);

                    // 同时转发
                    var checked = $("#comment_" + id + " .transmitCheckbox").attr('checked');
                    if (checked == true) {
                        transmitsend(id, cont);
                    }

                    //途说详细页面 评论数加1
                    var location_href = window.location.href;
                    var href_regu = /^\/weibo\//i;
                    var href_re = new RegExp(href_regu);
                    if (href_re.test(location_href)) { // 显示全部才出现最新消息
                        $("#all_num").html(parseInt($("#all_num").html()) + 1);
                        $("#comment_num").html(parseInt($("#comment_num").html()) + 1);
						
                        if ($(".tabs-details ul li:eq(0)").hasClass('cur') || $(".tabs-details ul li:eq(2)").hasClass('cur')) {
                            var html = getBlogDetailItemHtml(commentjson, '评论');
                            $(".comment-details-all ul").prepend(html);
                        }
                    } else {
                        var html = getCommentItemHtml(commentjson, id);
                        $("#commentshow_" + id + " ul").prepend(html);
                    }


                } else {
                    $.l.autoClose(msg, 1, 2);
                }
                $('#commentbox_' + id).val("");

            }
        });

    }

}



// 发布提到我的回复
function replysend(replycid,bid) {
    if (cookielimit() == false) {
        return false;
    }
    var nums = $("#commentwordnum_" + replycid).html();
    nums = parseInt(nums);

	var replybox_val = $.trim($('#replybox_' + replycid).val());
    if (replybox_val == "") {
        $.l.autoClose('您没有填写回复的内容！', 1, 2);
        return false;
    } else if ($.l.getWordsLen(replybox_val) > 140) {
        $.l.autoClose('已超出' + Math.abs(nums) + '字', 1, 2);
        return false;
    } else {

        var cont = $.l.countCharacters($('#replybox_' + replycid).val(), 140);
        var sendreply = $.cookie('sendreply');
        if (cont == sendreply) {
            $('#replybox_' + replycid).val("");
            $.l.autoClose('不能发表相同信息', 1, 2);
            return false;
        }
		
		if (!$("#reply_" + replycid + " .sendBtn").hasClass('sending')) {
			$("#reply_" + replycid + " .sendBtn").addClass('sending');
			$.ajax({
				type: "POST",
				url: "/api/web/blog.php",
				data: "action=sendcomment&bid=" + bid + "&replycid=" + replycid + "&uid=" + uid + "&commen_content=" + cont + "&rank=" + GetRandomNum(1, 999999),
				success: function (msg) {
					if (msg != "error") {
						$.cookie('sendreply', cont);
						var replynum = $("#replynum_" + replycid).html();
						$("#replynum_" + replycid).html(parseInt(replynum) + 1);
						var replyjson = jQuery.parseJSON(msg);
	
						// 同时转发
						var checked = $("#reply_" + replycid + " .transmitCheckbox").attr('checked');
						if (checked == true) {
							transmitsend(bid, cont);
						}
						$('#replybox_' + replycid).val('');
						$('#reply_' + replycid).html('');
						$.l.autoClose('回复成功', 1, 1);
					} else {
						$.l.autoClose(msg, 1, 2);
					}
	
	
				}
			});
			
		}
    }
}

function replyComment(nickname,id,replycid){
	var obj = $("#"+id);
    var content = obj.val();
	content = content.replace(/@(.*?):/ig,'');	
	var str = '@' + nickname + ':'; 
	var content = str + content;
	obj.attr('replycid',replycid);
	obj.val('');
	obj.setCaret(); 
	obj.insertAtCaret(content);
	
	
}


// 查找地址


function Enter(e) {
    if (e.keyCode == 13) {
        searchLocation();
        e.returnValue = false;
    }
}

function searchLocation() {
    var keywords = $("#keywords").val();
    $.ajax({
        type: "POST",
        url: "/api/web/location.php",
        data: "action=selectlocation&name=" + encodeURI(keywords) + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg != "error") {
                var locationjson = jQuery.parseJSON(msg);
                $("#position_list ul").empty();
                for (var i = 0; i < locationjson.length; i++) {
                    var item = locationjson[i];
                    var li = "<li lat='" + item.lat + "' lng='" + item.lng + "' lid='" + item.lid + "'>" + "<p>" + "<span class='sname'>" + "<a href='javascript:;' title='" + item.name + "'>" + item.name + "</a></span>" + "<span class='btnAdd'>" + "<a href='javascript:;'>选择</a></span>" + "</p>" + "<p>" + item.address + "</p></li>";
                    $("#position_list ul").append(li);
                    $("#hposition_list").hide();
                }
            } else {
                // alert("您查找的地址不存在，请先开垦相关地点O(∩_∩)O~")
            }


        }
    });

}


// 展开转发框 更新2012-02-13 by freedyYang 新增问答广告tips


function transmitajax(id) {
	
	if(!uid){
		needLogin();
		return false;
	}
// =========常用地点	
$.ajax({
    url: '/api/web/poi/getusuallocation',
    dataType: 'json',
    success: function (data) {
        data = data.data;
        var size = data.length;
        for (var i = 0; i < size; i++) {
			if(i==3){break;}
            var item = data[i];
            a = $('<a class="placefrequentedpoi" style="padding:2px;margin-left:5px;" href="javascript:;" />');
            a.html(item.name);
            a.attr('lid', item.code);
            a.attr('lat', item.lat);
            a.attr('lng', item.lng);
            
            $("#change_place_"+id).after(a);

        }
    }
});
//==============

    $('#comment_' + id).html('');
	var $commentshowID=$('#commentshow_' + id);
    $commentshowID.html('');
	var $curTransmitID=$('#transmit_' + id) 
    var str = $curTransmitID.html();
	var transmitshowID='transmitshow_' + id;
    if (str.length == 0) {

        var tt = '';

        var obj = $('#transmittitle_' + id);
        if (obj.html() != null) {
            tt = obj.clone();
			tt=tt.html();
			var nickname = obj.parent().find('.nickname').html();
			tt = tt.replace(/\s{2,}/i, '');
            tt = tt.replace(/<a[^>]+>(.*?)<\/a>/ig, '$1');
			tt = tt.replace(/<A[^>]+>(.*?)<\/A>/ig, '$1');
			$('#transmittitle_' + id + ' img').each(function(){
				var temp_src = $(this).attr('src');
				var temp_title = $(this).attr('title');
				var temp_imghtml = '<img title="' + temp_title + '" src="' + temp_src + '" width="22" height="22">';
                if(temp_imghtml.indexOf('face')>0){
					tt = tt.replace(/<img[^>]+thumb\.gif[^>]+>/ig,'[' + temp_title + ']');
				}	
			});
            tt = tt.replace('：', ':');
            tt = '//@' + nickname + ':' + tt;
        }
        var locationName = $("#location .name").html();
        var html = [];
        html.push('<div class="zfWrap"><div class="SA"><em>◆</em><span>◆</span></div>');
        html.push('<div class="top"><span class="left"> <span class="replyTitle"><b id="change_place_' + id +'">');
		if(locationName!=null){
		html.push('<span class="change_place">' + locationName + '</span>[<a href="javascript:;">修改</a>]');
		}
        html.push('</b>&nbsp;&nbsp;&nbsp;</span><span class="addReply" style="display: none;"></span> </span></div>');

        html.push('<div class="cont">');
        html.push('<p class="feedback-tips disnone" id="feedback-tips_' + id + '" ><span></span><a class="close-ico feedback-tips-close " id="feedback-tips' + id + '" href="#" onclick="closeComTips('+id+');return false;">关闭</a></p>');
 
        html.push('<textarea id="transmitbox_' + id + '" class="talkBox">' + tt + '</textarea>');
		
		  html.push('<input  onclick="transmitsend(' + id + ')" type="button" value="转发" class="sendBtn" ></div>');
		
        html.push('<div class="bot"><div class="fn-left"><div class="transmit_face" ><a href="javascript:;"">表情</a></div><label for="commentCheckbox"><input value="1" type="checkbox" class="check1 commentCheckbox" >同时评论</label></div>');
		html.push('<span class="countTxt">还能输入<em id="transmitwordnum_' + id + '">140</em>字</span> </div></div>');
		html.push('<div class="commentshow" id="'+transmitshowID+'"></div>');
     
  
        html = html.join('');
        $curTransmitID.html(html);	
		
		/*txt*/
	    $('#transmitbox_' + id).elastic();
		/*txt*/
	    	
	    _setfeedbacktips(id);//显示问答
        //发布表情
		
        $curTransmitID.find('.transmit_face').click(function () {
		  
		    /*表情位置*/
			//$popface.show();
	        var posface_top=$curTransmitID.offset().top+105;
	        var posface_left=$curTransmitID.offset().left;
	       // $popface.offset({top:posface_top,left:posface_left});
		
			//$popface.attr("class",'transmitbox_' + id) /*追加文本框ID到class属性,以便表情值返回到那个文本框*/
			showPopface('transmitbox_' + id, posface_top, posface_left)
        });
     
		
        //修改地点
		if(locationName!=null){
			dialogObj.open('change_place_'+id,'dialog');
		}		
		
		var $transmitboxID=  $("#transmitbox_" + id);
        $transmitboxID.setCurPos(0);

       $transmitboxID.keyup(function () {
		    var len = $.l.getWordsLen($transmitboxID.val());
            len = 140 - len;
            if (len < 0) {
				 $curTransmitID.find(".countTxt").addClass('tipsError').html('已超出<em id="transmitwordnum_' + id + '">' + Math.abs(len) + '</em>字');
            } else {
				 $curTransmitID.find(".countTxt").html('还能输入<em id="transmitwordnum_' + id + '">' + Math.abs(len) + '</em>字');
            }
            $("#transmitwordnum_" + id).html(Math.abs(len));
        });


		 
        userAutoTips({
            id: "transmitbox_" + id
        }); // 收听人提示
		
		//展开转发记录
		var len = $("#transmitnum_" + id).html();
		len = parseInt(len);
		if(len>0){
        	$.ajax({
        		type: "POST",
        		url: "/api/web/blog.php",
        		data: "action=loadtransmit&bid=" + id + "&uid=" + uid + "&rank=" + GetRandomNum(1, 999999),
        		success: function (msg) {
        			
        			var location_href = window.location.pathname;
        			var href_regu = /^\/weibo\//i;
        			var href_re = new RegExp(href_regu);
        			//详细页面 不显示评论列表
        			if (!href_re.test(location_href)) { 
        				var list_num = 10; // 默认显示几条
        				var html = [];
        				html.push('<ul class="commentUL transmitUL">');
        				var transmitjson = jQuery.parseJSON(msg);
        				$(transmitjson).each(function (i) {
        					html.push(getTransmitListItemHtml(transmitjson[i],id));
        				});
        				if (len > list_num + 1) {
        					var num = len - list_num;
        					html.push('<li><div class="pages">后面还有' + num + '条转发，<a href="/weibo/' + id + '?&action=transmit">点击查看>></a> </div></li></ul></div>')
        				}
        				// ;
        				html.push('</ul>');
        				html = html.join('');
						
						$("#"+transmitshowID).html(html);
        			}
        			
        		}
        	});
		}
		
    } else {
       $curTransmitID.html('');
        $('#transmitshow_' + id).html('');
			closePopface();
    }


}

// 发表转发
function transmitsend(id, comment_cont) {
    var default_val = '转发途说';
    if (cookielimit() == false) {
        return false;
    }
    var cont;
    var transmitbox_val = $.trim($('#transmitbox_' + id).val());
    if (parseInt(transmitbox_val.length) == 0) {
        cont = default_val;
    } else {
        cont = transmitbox_val;
    }
    if (typeof (comment_cont) != 'undefined') {
        cont = comment_cont;
    } else {
        var nums = $("#transmitwordnum_" + id).html();
        nums = parseInt(nums);
        if ($.l.getWordsLen(transmitbox_val) > 140) {
            $.l.autoClose('已超出' + Math.abs(nums) + '字', 1, 2);
            return false;
        } else {
            cont = $.l.countCharacters(cont, 140);
            var sendtransmit = $.cookie('sendtransmit');
            if (cont == sendtransmit && cont != default_val) {
                $('#transmitbox_' + id).val("");
                $.l.autoClose('不能发表相同信息', 1, 2);
                return false;
            }
        }
    }

    var location = $("#location");
    var lid = location.find(".id").text();
    var lname = location.find(".name").text();
    var lat = location.find(".lat").text();
    var lng = location.find(".lng").text();

    if (!lid || lid == "") {
        lid = 'd03f8050ea1ccf438b874a53f5bdf478';
        lname = '深圳';
        lat = '22.53763185258';
        lng = '113.957316618347';
    }
    // 拼出来的url特殊字符处理有问题 如:+号消失
    //"action=sendtransmit&bid=" + id + "&uid=" + uid + "&transmit_content=" + cont + "&lid=" + lid + "&lname=" + lname + "&lat=" + lat + "&lng=" + lng + "&rank=" + GetRandomNum(1, 999999)
    var data=new Object();
    data.action='sendtransmit';
    data.bid=id;
    data.uid=uid;
    data.transmit_content=cont;
    data.lid=lid;
    data.lname=lname;
    data.lat=lat;
    data.lng=lng;
    data.rank=GetRandomNum(1, 999999);
    if (!$("#transmit_" + id + " .sendBtn").hasClass('sending')) {

        $("#transmit_" + id + " .sendBtn").addClass('sending');
        $.ajax({
            type: "POST",
            url: "/api/web/blog.php",
            data: $.param(data),
            success: function (msg) {
                $("#transmit_" + id + " .sendBtn").removeClass('sending');
                if (msg != "error") {
                    $.cookie('sendtransmit', cont);

                    // 同时评论
                    var checked = $("#transmit_" + id + " .commentCheckbox").attr('checked');
                    if (checked == true) {
                        commentsend(id, cont);
                    }

                    var transmitjson = jQuery.parseJSON(msg);
                    var html;
                    str = getTransmitItemHtml(transmitjson);
                    $('#transmit_' + id).html('');
                    $('#transmitshow_' + id).html('');

                    var obj = $("#transmitnum_" + transmitjson.transmitblogid);
                    var showDetailTransmit = true;
                    if (obj != undefined) {
                        var transmitnum = obj.html();
                        $(obj).html(parseInt(transmitnum) + 1);
                        var obj = $("#feed_list li[bid=" + id + "] .oriTransmitsNum");
                        if (obj.size() > 0) {
                            var oriTransmitsNum = obj.html();
                            obj.html(parseInt(oriTransmitsNum) + 1);
                            showDetailTransmit = false;
                        }

                    }


                    var location_href = window.location.href;
                    var href_regu = /^\/weibo\//i;
                    var href_re = new RegExp(href_regu);
                    if (href_re.test(location_href)) { // 显示全部才出现最新消息
                        $("#all_num").html(parseInt($("#all_num").html()) + 1);
                        $("#transmit_num").html(parseInt($("#transmit_num").html()) + 1);
						
                        if ($(".tabs-details ul li:eq(0)").hasClass('cur') || $(".tabs-details ul li:eq(1)").hasClass('cur')) {
                            var html = getBlogDetailItemHtml(transmitjson, '转发');
                            $(".comment-details-all ul").prepend(html);
                        }
						
						
                        //$.l.autoClose('转发成功', 0, 1);
                        return false;
                    } else if (location_href.indexOf("traffic") > 0) {
                        return false;
                    } else if (location_href.indexOf("/blog/") > 0) {
                        //个人主页转发不在列表显示
                        //$.l.autoClose('转发成功', 0, 1);
                        return false;
                    } else {
                        $("#feed_list").prepend(str);
                    }

                    // 转发后，定议新的最大max_feeduserseq值
                    var max_feeduserseq = $("#max_feeduserseq").html();
                    if (parseInt(max_feeduserseq) < parseInt(transmitjson.feeduserseq)) {
                        $("#max_feeduserseq").html(transmitjson.feeduserseq);
                    }

                    //$.l.autoClose('转发成功', 0, 1);

                    //$(".miniImg").trigger('click');//不显示小图
                } else {
                    $.l.autoClose(msg, 1, 2);
                }
                $('#transmitbox_' + id).val("");

            }
        });

    }

}


// 删除途说

function deleteBlog(bid){
	$.l.confirm('确定删除这条途说吗？',function(){deleteBlogConfirm(bid);},{title: "提示信息"});
}


function deleteBlogConfirm(bid) {

    if (!uid) {
        window.location.href = '/login.php';
    }

    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: "action=deleteblog&bid=" + bid + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg != "error") {
                var deleteblogjson = jQuery.parseJSON(msg);
                if (deleteblogjson.success == 'true') {
                    $("#feed_list li[bid=" + bid + "]").hide();
                    //$.l.autoClose('删除成功', 2, 1);
                    // $("#fav_li_"+bid).hide();
                }

            } else {

            }

        }
    });

}

function deleteComment(cid){
	$.l.confirm('确定删除这条评论吗？',function(){deleteCommentConfirm(cid);},{title: "提示信息"});
}

function deleteCommentConfirm(cid){
	var data = {};
	data.cid = cid;
	date = $.param(data);
    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: "action=deletecomment&cid=" + cid + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg != "error") {
                var deletecommentjson = jQuery.parseJSON(msg);
                if (deletecommentjson.success == 'true') {
                    $("#c_"+cid).hide();
					var temp_num = $("#commentnum_"+deletecommentjson.bid).html();
					temp_num = parseInt(temp_num) - 1;
					$("#commentnum_"+deletecommentjson.bid).html(temp_num);
                }else{
					$.l.alert(deletecommentjson.msg);
				}
            } else {
				
            }

        }
    });
}






function showNewBlog(key) { // num 报几条消息 其它刚显示消息
    var max_feeduserseq = $("#max_feeduserseq").html();
    if (key == 'num') {
        $.ajax({
            type: "POST",
            url: "/api/web/page.php",
            data: "action=newblognum&rank=" + GetRandomNum(1, 999999),
            success: function (msg) {
                if (msg != "error") {
                    var usercount_json = jQuery.parseJSON(msg);
                    var newBlogNum = parseInt(usercount_json[0].feeds) - parseInt(max_feeduserseq);
                    if (newBlogNum > 0) {
                        $("#newBlog").html(newBlogNum);
                        $("#talkNew").show();
						var head_title = $("head title").html();
						head_title = head_title.replace(/\(\d+\)\s?/,'');
						document.title = '(' + newBlogNum + ') ' + head_title;
                    }
                } else {

                }


            }
        });
    } else if (key == 'show') {
    	var feed_list=$("#feed_list");
    	var max_bid = feed_list.attr("maxbid");
        $.ajax({
            type: "POST",
            url: "/api/web/page.php",
            data: "action=shownewblogs&max_bid=" + max_bid + "&rank=" + GetRandomNum(1, 999999),
            success: function (msg) {
                if (msg != "error") {
					var finalBid = $("#feed_list li:eq(0)").attr('bid');
                    var html = [];
                    // getTransmitItemHtml getSendTalk
                    var morePageJson = jQuery.parseJSON(msg);
					var li_total = morePageJson.length;
					max_feeduserseq=morePageJson.feeds;
					max_bid=morePageJson.maxbid;
                    $.each(morePageJson.data,function (i,item) {
                        if (item.transmitblogid > 0) { // 如果是转发
						    if(parseInt(item.bid)!=parseInt(finalBid)){
								html.push(getTransmitItemHtml(item));
							}
                        } else {
							if(parseInt(item.bid)!=parseInt(finalBid)){
                            html.push(getSendTalk(item));
							}
                        }
                    });
                    html = html.join('');
					var $feed_list=$("#feed_list");
					$feed_list.prepend(html);
					//$feed_list.find("li:lt(" + li_total + ") .miniImg").trigger('click');//不显示小图
                    $("#talkNew").hide();
                    $("#max_feeduserseq").html(max_feeduserseq);
                    feed_list.attr('maxbid',max_bid);
                    var head_title = $("head title").html();
					head_title = head_title.replace(/\(\d+\)\s?/,'');
					document.title = head_title;
                } else {

                }


            }
        });
    }
}


// 显示更多途说 我的首页


function showMoreBlog(type, pageuid,order,lid) {
    
	if(lockshowpage==true){
		return false;
	}
	lockshowpage = true;
    
	if(!uid){
		needLogin();
		return false;
	}
	$(".moreblogloading").removeClass('disnone');
	$("#more-page-warp").hide();
    var id = $("#page_endid").val();
    var page_num = $("#page_num").val();
    var url = "action=showmoreblog&id=" + id + "&page_num=" + page_num + "&type=" + type;
	if(typeof(order)!='undefined'){url += "&order=" + order;}
	if(typeof(lid)!='undefined' && parseInt(lid)>0){url += "&lid=" + lid;}
	url += "&rank=" + GetRandomNum(1, 999999);
    if (type == 'other') {
        url = url + '&otheruid=' + pageuid;
    } // 如果是个人空间
    if (type == 'onetag' || type == 'audio') {
        url = url + '&tid=' + pageuid;
    } // 如果是话题
    $.ajax({
        type: "POST",
        url: "/api/web/page.php",
        data: url,
        success: function (msg) {
			$(".moreblogloading").hide();
	        $("#more-page-warp").show();
            if (msg != "error") {
                var html = [];
                // getTransmitItemHtml getSendTalk
                var page_endid = 0;
                var morePageJson = jQuery.parseJSON(msg);
                $(morePageJson).each(function (i) {
                    if (morePageJson[i].transmitblogid > 0) { // 如果是转发
                        html.push(getTransmitItemHtml(morePageJson[i]));
                    } else {
                        html.push(getSendTalk(morePageJson[i]));
                    }

                    page_endid = morePageJson[i].page_endid;
                    if (parseInt(morePageJson[i].favorite_id) > 0) {
                        page_endid = morePageJson[i].favorite_id;
                    } // 兼容我的收藏
                });
                html = html.join('');
                $("#page_endid").val(page_endid);
                var page_aftertotal = $("#page_aftertotal").html();
                page_aftertotal = parseInt(page_aftertotal) - parseInt(page_num);	
                $("#page_aftertotal").html(page_aftertotal);
                $("#feed_list").append(html);//$("#showmorepage").before(html);
                if(parseInt(page_aftertotal)<=0 || page_endid==0){
                    $("#showmorepage").hide();
                }
                lockshowpage = false;
                //$(".miniImg").trigger('click');//不显示小图
            } else {

            }


        }
    });
}

//显示城市更多博客


function showMorePlaceBlog(type, oid) {
	if(lockshowpage==true){
		return false;
	}
	lockshowpage = true;
	if(!uid){
		needLogin();
		return false;
	}
    var id = $("#page_endid").val();
    var page_num = $("#page_num").val();
    var url = "action=moreplaceblog&id=" + id + "&page_num=" + page_num + "&oid=" + oid + "&type=" + type + "&rank=" + GetRandomNum(1, 999999);
    var morepagewarp=$("#more-page-warp");
    var moreblogloading=$(".moreblogloading");
	moreblogloading.show();
	morepagewarp.hide();
    $.ajax({
        type: "POST",
        url: "/api/web/page.php",
        data: url,
        success: function (msg) {
        	moreblogloading.hide();
        	morepagewarp.show();
            if (msg != "error") {
                var html = [];
                // getTransmitItemHtml getSendTalk
                var page_endid;
                var morePageJson = jQuery.parseJSON(msg);
                $(morePageJson).each(function (i) {
                    if (morePageJson[i].transmitblogid > 0) { // 如果是转发
                        html.push(getTransmitItemHtml(morePageJson[i]));
                    } else {
                        html.push(getSendTalk(morePageJson[i]));
                    }

                    if (parseInt(morePageJson[i].favorite_id) > 0) {
                        page_endid = morePageJson[i].favorite_id;
                    } // 兼容我的收藏
                });
                html = html.join('');

                $("#page_endid").val(parseInt(id) + parseInt(page_num));
                var page_aftertotal = $("#page_aftertotal").html();
                page_aftertotal = parseInt(page_aftertotal) - parseInt(page_num);
                $("#page_aftertotal").html(page_aftertotal);
                $("#feed_list").append(html)
                if (page_aftertotal <= 0) {
                    $("#showmorepage").hide();
                }

            } else {
            	$("#showmorepage").hide();
            }
			lockshowpage = false;
        }
    });
}
//地点下话题博客显示
function showMorePoiTagBlog(type,lid, tid) {
	if(lockshowpage==true){
		return false;
	}
	lockshowpage = true;
	if(!uid){
		needLogin();
		return false;
	}
    var id = $("#page_endid").val();
    var page_num = $("#page_num").val();
    var url = "action=moreplaceblog&id=" + id + "&page_num=" + page_num + "&lid=" + lid + "&tid=" + tid+ "&type=" + type + "&rank=" + GetRandomNum(1, 999999);
    var morepagewarp=$("#more-page-warp");
    var moreblogloading=$(".moreblogloading");
	moreblogloading.show();
	morepagewarp.hide();
    $.ajax({
        type: "POST",
        url: "/api/web/page.php",
        data: url,
        success: function (msg) {
        	moreblogloading.hide();
        	morepagewarp.show();
            if (msg != "error") {
                var html = [];
                // getTransmitItemHtml getSendTalk
                var page_endid;
                var morePageJson = jQuery.parseJSON(msg);
                $(morePageJson).each(function (i) {
                    if (morePageJson[i].transmitblogid > 0) { // 如果是转发
                        html.push(getTransmitItemHtml(morePageJson[i]));
                    } else {
                        html.push(getSendTalk(morePageJson[i]));
                    }

                    if (parseInt(morePageJson[i].favorite_id) > 0) {
                        page_endid = morePageJson[i].favorite_id;
                    } // 兼容我的收藏
                });
                html = html.join('');

                $("#page_endid").val(parseInt(id) + parseInt(page_num));
                var page_aftertotal = $("#page_aftertotal").html();
                page_aftertotal = parseInt(page_aftertotal) - parseInt(page_num);
                $("#page_aftertotal").html(page_aftertotal);
                $("#feed_list").append(html)
                if (page_aftertotal <= 0) {
                    $("#showmorepage").hide();
                }

            } else {
            	$("#showmorepage").hide();
            }
             lockshowpage = false;

        }
    });
}

function showMoreCityBlog(type, oid) {
	if(lockshowpage==true){
		return false;
	}
	lockshowpage = true;
	if(!uid){
		needLogin();
		return false;
	}
    var id = $("#page_endid").val();
    var page_num = $("#page_num").val();
    var url = "action=moreplaceblog&id=" + id + "&page_num=" + page_num + "&oid=" + oid + "&type=" + type + "&rank=" + GetRandomNum(1, 999999);
	
    $.ajax({
        type: "POST",
        url: "/api/web/page.php",
        data: url,
        success: function (msg) {		
			
			$(".moreblogloading").hide();
	        $("#more-page-warp").show();
            if (msg != "error") {
                var html = [];
                // getTransmitItemHtml getSendTalk
                var page_endid;
                var morePageJson = jQuery.parseJSON(msg);
                $(morePageJson).each(function (i) {
                    if (morePageJson[i].transmitblogid > 0) { // 如果是转发
                        html.push(getTransmitItemHtml(morePageJson[i]));
                    } else {
                        html.push(getSendTalk(morePageJson[i]));
                    }
                    page_endid=morePageJson[i].bid;
                    if (parseInt(morePageJson[i].favorite_id) > 0) {
                        page_endid = morePageJson[i].favorite_id;
                    } // 兼容我的收藏
                });
                html = html.join('');

                $("#page_endid").val(parseInt(page_endid));
                var page_aftertotal = $("#page_aftertotal").html();
                page_aftertotal = parseInt(page_aftertotal) - parseInt(page_num);
                $("#page_aftertotal").html(page_aftertotal);
                $("#feed_list").append(html);
                if (page_aftertotal <= 0) {
                    $("#showmorepage").hide();
                }

            } else {
            	$("#showmorepage").hide();
            }
             lockshowpage = false;

        }
    });
}

// 添加收藏


function addFavorite(obj, bid) {
	if(!uid){
		needLogin();
		return false;
	}

    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: "action=addfavorite&bid=" + bid + "&uid=" + uid + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg != "error") {
                var favoritejson = jQuery.parseJSON(msg);
                if (favoritejson.success == 'true') {
					var favoriteObj = $(obj).find('em');
                    var temp_num = favoriteObj.html();
					temp_num = parseInt(temp_num)+1;
					favoriteObj.html(temp_num);
					$.l.autoClose('操作成功', 1, 1);
					
					
                    //途说详细页面 赞数加1
                    var location_href = window.location.href;
                    var href_regu = /^\/weibo\//i;
                    var href_re = new RegExp(href_regu);
                    if (href_re.test(location_href)) {
						$("#favorite_num").html(temp_num);						
                        if ($(".tabstyle3 ul li:eq(3)").hasClass('select')) {
                            var html = getBlogDetailFavoriteItemHtml(favoritejson, '赞了一个');
                            $("#mail_list ul").prepend(html);
                        }
                    }
					
					
                } else if (favoritejson.favorited == 'true') {
                    $.l.autoClose('您已赞过此途说', 2, 2);
                }

            } else {

            }

        }
    });

}


// 删除收藏
function cancelFavorite(obj, bid){
	$.l.confirm('确定取消收藏这条途说吗？',function(){cancelFavoriteConfirm(obj, bid);},{title: "提示信息"});
}

function cancelFavoriteConfirm(obj, bid) {

    if (!uid) {
        window.location.href = '/login.php';
    }

    $.ajax({
        type: "POST",
        url: "/api/web/blog.php",
        data: "action=cancelfavorite&bid=" + bid + "&uid=" + uid + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg != "error") {
                var favoritejson = jQuery.parseJSON(msg);
                if (favoritejson.success == 'true') {
                    $.l.autoClose('取消成功', 2, 1);
                    $("#fav_li_" + bid).hide();
                } else if (favoritejson.favorited == 'true') {

                }

            } else {

            }

        }
    });

}

function cookielimit() {
    var optiontimes = Number($.cookie('optiontimes'));
    if (optiontimes > 3) {
        $.l.autoClose('你的操作太快，休息一下吧！', 1, 2);
        return false;
    }
    $.cookie("optiontimes", optiontimes + 1, {
        expires: 0.0001
    });
}

function getSendTalk(json) {
	
    var html = [];
	var totalnum = parseInt(json.transmits) + parseInt(json.comments);
    html.push("<li bid='" + json.bid + "'  class='cf' >");
	html.push("<div class='head_pic-warp'>");
	html.push("<a style='background: url(&quot;" + json.avatar + "?t=100&quot;) repeat scroll 0% 0% transparent;' class='head_pic js_avatar' href='/" + json.username + "'> </a>");
	if(json.uid!=uid && json.subscribed==false){
		html.push("<a title='"+json.nickname+"' href='javascript:;' class='follow-action' uid='"+json.uid+"'>+收听</a>");
	}
	html.push("</div>");
	html.push("<div class='feed_content'>");
	html.push("<p class='feed-head'>");
	html.push("<a href='/" + json.username + "' title='" + json.nickname + "' class='sns nickname "+json.ico_type+"'>" + json.nickname + "</a> <a class='locate js_locate' href='/poi/" + json.code + "'> " + $.l.truncateStr(json.lname,15,'.') + " </a> </p>");
	html.push("<p class='sms'>" + json.content + "</p>");
	html.push("<div class='feed_from'><div class='fl'>");
	html.push("<cite><a href='/weibo/" + json.bid + "'>" + json.dateline + "</a></cite> <span class='lat disnone'>22.562641</span> <span class='lng disnone'>114.055207</span>来自");
	html.push("<cite> <a href='/weibo/" + json.bid + "'>");
	if(json.typeid>=100 && json.srctypehtml!=''){
		html.push(json.srctypehtml);
	}else{
		html.push(json.srctypeid);
	}
	html.push("</a> </cite></div>");
	html.push("<div class='fr'> ");
    if (json.uid == uid) {
        html.push('<a onclick="deleteBlog(\'' + json.bid + '\');" href="javascript:;">删除</a> <span >|</span> ');
    }
	html.push(" <a class='ding' href='' onclick='addFavorite(this," + json.bid + ");return false;' >(<em class='favoritenum'>" + json.favorites + "</em>)</a>");
	html.push(" <span>|</span> <a target='_blank' href='/weibo/" + json.bid + "'>热度(" + totalnum + ")</a> <span>|</span> ");
	html.push("<a href='' onClick='transmitajax(" + json.bid + ");return false;'>转发(<span id='transmitnum_" + json.bid + "'>" + json.transmits +  "</span>)</a> <span>|</span> ");
	html.push("<a href='' onClick='commentajax(" + json.bid + ");return false;'>评论(<span id='commentnum_" + json.bid + "'>" + json.comments + "</span>)</a></div>");
	html.push("</div>");
	html.push("<div id='comment_" + json.bid + "'></div>");
	html.push("<div class='cf' id='transmit_" + json.bid + "'></div>");
	html.push("</div></li>");
	
    return html.join("");
}

function getCommentItemHtml(json,id) {
    var html = [];
    html.push('<li id="c_' + json.cid + '" class="cf"><div class="msgCnt"><a class="comment-user-pic" target="_blank" href="/' + json.username + '"><img src="' + json.avatar + '" with="30" height="30" class="js_avatar"/></a><a class="comment-username js_nickname" target="_blank" href="/' + json.username + '">' + json.nickname + '</a>: <span class="comment-content">' + json.content + '</span> <span >' + json.dateline + ' 来自' + json.srctypeid + '</span></div>');

	html.push('<div class="comment-funcs"><a onclick="replyComment(\'' + json.nickname + '\',\'commentbox_' + id + '\',' + json.cid + ');" href="javascript:;" >回复</a></div></li>');
    return html.join("");
}

function getBlogDetailItemHtml(json, type) {
    var html = [];
	html.push('<li class="cf">');
	html.push('<div class="head_pic-warp">');
	html.push('<a href="/' + json.username + '">');
	html.push(' <img height="30" width="30" src="' + json.avatar + '"></a> ');
	html.push('</div><div class="feed_content"><p class="sms">');
	html.push('<a title="' + json.nickname + '" target="_blank" href="/' + json.username + '">' + json.nickname + '</a>');
	html.push(' ' + type + ' ：' + json.content);
	html.push('</p>');
	html.push('<div class="feed_from"> ' + json.dateline + ' &nbsp; </div>');
	html.push('</div></li>');

    return html.join("");
}

function getBlogDetailFavoriteItemHtml(json, type) {
    var html = [];
    html.push('<li>');
    html.push('<div class="twit_item_pic">');
    html.push('<a target="_blank" href="/' + json.username + '"><img height="50" width="50" pop="true" title="' + json.nickname + '" src="' + json.avatar + '"></a>');
	if(json.uid!=uid && json.subscribed==false){
		html.push("<a title='"+json.nickname+"' href='javascript:;' class='follow-action' uid='"+json.uid+"'>+收听</a>");
	}
    html.push('</div>');
    html.push('<div class="twit_item_content">');
    html.push('<p> <a title="' + json.nickname + '" target="_blank" href="/' + json.username + '">' + json.nickname + '</a> <a>' + type + ' </a>');
    html.push('<div class="twit_item_time">' + json.dateline + ' </div>');
    html.push('</div>');
    html.push('</li>');
    return html.join("");
}

function getTransmitItemHtml(json) {
    var html = [];
	var totalnum = parseInt(json.transmits) + parseInt(json.comments);
    html.push('<li bid="' + json.bid + '" class="cf">');
	html.push('<div class="head_pic-warp">');
	html.push('<a style="background: url(&quot;' + json.avatar + '?t=100&quot;) repeat scroll 0% 0% transparent;" class="head_pic js_avatar" href="/' + json.username + '"></a> ');
	if(json.uid!=uid && json.subscribed==false){
		html.push("<a title='"+json.nickname+"' href='javascript:;' class='follow-action' uid='"+json.uid+"'>+收听</a>");
	}
	html.push('</div><div class="feed_content">');
	html.push('<p class="feed-head"> <a href="/' + json.username + '" title="' + json.nickname + '" class="sns nickname '+json.ico_type+'">' + json.nickname + '</a> <a class="locate js_locate" href="/poi/' + json.code + '"> ' + $.l.truncateStr(json.lname,15,'.') + ' </a> </p>');
	html.push('<p class="sms" id="transmittitle_' + json.bid + '">' + json.content + '</p>');
	html.push('<div class="oriTxt">');
	html.push('<div class="SA"><em>◆</em><span>◆</span></div>');
	html.push('<div class="oriContent">');
	
	html.push('<p class="source"> ');
    if(json.isdelete){
	  html.push(' 此途说已被原作者删除 ');	
    }else{
	  html.push('<a href="/' + json.transmitusername + '" class="sns">@' + json.transmitnickname + '</a><cite><a class="locate js_locate" href="/poi/' + json.transmitcode + '">' + json.transmitlname + '</a>：</cite>' + json.transmitcontent + ' ');
	  html.push('<span><a href="/weibo/' + json.transmitblogid + '?&amp;action=transmit"><strong>原文转发</strong><strong>(<em class="oriTransmitsNum">' + json.original_transmits + '</em>)</strong></a><span>|</span>');
	  html.push('<a href="/weibo/' + json.transmitblogid + '?&amp;action=comment"><strong>原文评论</strong><strong>(<em class="oriCommentsNum">' + json.original_comments + '</em>)</strong></a></span> ');
	}
	
	html.push('</p>');
	html.push('<div class="feed_preview"><div class="feed_img"></div></div></div></div>');
	html.push('<div class="feed_from"><div class="fl">');
	html.push('<cite><a href="/weibo/' + json.bid + '">' + json.dateline + '</a></cite> <span class="lat disnone">22.562641</span> <span class="lng disnone"> 114.055207</span>来自<cite>');
	html.push('<a class="from-intertest" href="/weibo/' + json.bid + '">' + json.srctypeid + '</a> </cite>');
	html.push('</div><div class="fr">');
    if (json.uid == uid) {
	html.push('<a href="javascript:;" onclick="deleteBlog(\'' + json.bid + '\');">删除</a> <span>|</span> ');
	}
	html.push("<a onclick='addFavorite(this," + json.bid + ");return false;'  href='' class='ding '>(<em>" + json.favorites + "</em>)</a> <span>|</span> ");
	html.push('<a target="_blank" href="/weibo/' + json.bid + '">热度(' + totalnum + ')</a> <span>|</span> <a href="" onclick="transmitajax(' + json.bid + ');return false;">转发</a> ');
	html.push('<span>|</span> <a href="" onclick="commentajax(' + json.bid + ');return false;">评论(<span id="commentnum_' + json.bid + '">' + json.comments + '</span>)</a> </div></div><div class="clear"></div>');
	html.push('<div class="cf" id="comment_' + json.bid + '"></div>');
	html.push('<div id="transmit_' + json.bid + '"></div>');
	html.push('</div>');
	html.push('</li>');

    return html.join("");
}

function getTransmitListItemHtml(json,id) {
    var html = [];
    html.push('<li id="t_' + json.cid + '" class="cf"><div class="msgCnt"><a class="comment-user-pic" target="_blank" href="/' + json.username + '"><img src="' + json.avatar + '" with="30" height="30" class="js_avatar"/></a><a class="comment-username js_nickname" target="_blank" href="/' + json.username + '">' + json.nickname + '</a>: <span class="comment-content">' + json.content + '</span> <span >' + json.dateline + ' 来自' + json.srctypeid + '</span></div>');
    if (json.userid == uid) {
	   //html.push('<a onclick="deleteComment(' + json.cid + ');" href="javascript:;" class="right">x</a>');
	}
	html.push('<div class="comment-funcs"></div></li>');
    return html.join("");
}


function cancelSubscribes(touid, targetid) {
	if(!uid){
		needLogin();
		return false;
	}
    var url = "/api/web/relation/unsubscribe";
    var data = new Object();
    data.touid = touid;
    data = $.param(data);
    if (!targetid) {
        targetid = "test";
    }
    var me = $("#" + targetid);
    if (me.hasClass("addAttention")) {
        return addSubscribes(touid, targetid)
    }
    $.post(url, data, function (data) {
        if (data) {
            if (me.hasClass("delAttention")) {
                me.removeClass("delAttention");
                me.addClass("addAttention");
            }
        }
    }, 'json');
}



function addSubscribes(touid, targetid) {
    // 提交
	if(!uid){
		needLogin();
		return false;
	}
    if (!targetid) {
        targetid = "test";
    }
    var me = $("#" + targetid);
    if (me.hasClass("delAttention")) {
        return cancelSubscribes(touid, targetid)
    }
    $.ajax({
        type: "POST",
        url: "/api/web/relation.php",
        data: "method=subscribe&touid=" + touid + "&rank=" + GetRandomNum(1, 999999),
        success: function (msg) {
            if (msg.success) {
                $.l.autoClose('收听成功', 0, 1);
                $("#uid" + touid).html("已收听");
                if (me.hasClass("addAttention")) {
                    me.removeClass("addAttention");
                    me.addClass("delAttention");
                }
            } else if (msg.subscripted) {
                $.l.autoClose('已收听过此人', 2, 2);
            } else {
                if (msg.data) {
                    $.l.autoClose(msg.data, 2, 2);
                }
            }

        }
    });
}








function showMorePicBlog(url) {
	if(!uid){
		needLogin();
		return false;
	}
	var moreblog=$("#moreblog");
	var moreblogloading=$("#showmorepage .moreblogloading");
	var morepagewarp=$("#more-page-warp");
	moreblogloading.show();
	morepagewarp.hide();
	var bid=moreblog.attr('bid');
	var pics=moreblog.attr('pics');
	var data={"bid":bid,"pics":pics};
	if(url.indexOf('?')>0){
		url=url+"&"+$.param(data);
	}else{
			url=url+"?"+$.param(data);
	}
	var thumbList=$("#thumbList");
	$.getJSON(url,function(msg){
		moreblogloading.hide();
		morepagewarp.show();
		if(msg.success){
			var tempUI=$("<ul></ul>");
			var _lis= thumbList.find("li").slice(0, 3);
			var data=msg.blogs;
			var length=data.length;
			for(var i=0;i<length;i++){ //数据为了保持连续性是正常排序的,需要逆序获取
				var item=data[i];
				var idx=i%3;
				var li=$(_lis[idx]).clone(true);
				//li.attr('id',item.id+"_"+item.img_seq);
				//li.attr('bid',item.bid);
				var picurl=item.img_m;
				var url="/weibo/"+item.bid;
				var a=li.find(".thumb-img").attr('href',picurl);
				a.css("background","url("+item.img_c+") no-repeat");
				li.find(".thumb-intro").attr('href',picurl);
				li.find('.js_content').html($.l.truncateStr(item.content,30,'...'));
				li.find('.js_nickname').html(item.nickname);
				li.find('.js_dateline').html(item.dateline);
				li.find('.js_lname').html(item.lname);
				
				var stats="<a title='热度' class='pic-hot' href='"+url+"'>"+item.hot+"</a>"+
						"<a title='转发' class='pic-zhuanfa'  href='/weibo/"+item.bid+"?action=transmit'>"+item.transmits+"</a>"+
						"<a title='评论' class='pic-comment icon-comment-number'  href='/weibo/"+item.bid+"?action=comment'>"+item.comments+"</a>";
				li.find('.js_statics').html(stats);
				//alert(rt);
				//alert(li.html());
				tempUI.append(li);
			}
			_showpic_resetThumbs(tempUI,130,130);
			thumbList.append(tempUI.children());
			
			moreblogloading.hide();
			if(length<18){
				$("#showmorepage").hide();
			}
			moreblog.attr('bid',msg.morebid);
			moreblog.attr('pics',msg.morepics);
		}
	},function(){
		moreblogloading.hide();
	});
}

function _showpic_resetThumbs(obj, W, H){
    $(obj).find('.thumb_img img').each(function () {
    	var url=this.src;
    	var rs=url.match(/.*data\/attachment.*-(\d+)-(\d+).*\..*/i);
    	if(rs==null||rs.length!=3){
    		return;
    	}
    	
        var w, h, t, l;
        var cw = rs[1];
        var ch = rs[2];
        //alert(cw);
        //alert(ch);
        w = W;
        h = ch * W / cw;
        if (h > H) {
            l = 0;
            t = (ch * W / cw - H) / 2;
        } else {
            h = H;
            w = H * cw / ch;
            l = (H * cw / ch - W) / 2;
            t = 0;
        }
        $(this).attr('style', 'width: ' + w + 'px; height: ' + h + 'px; left: -' + l + "px; top: -" + t + "px;");
        //$(this).show();
    });
	
}
//热门问答
function _setfeedbacktips(bid){
	var feedback=$("#feedback-tips_"+bid);
	var feedbackcontent=$("#feedbackcontent");
	if(feedbackcontent.size()==1){
		var name=feedbackcontent.attr("data-name");
		var url=feedbackcontent.attr("data-url");
		if(!$.isEmptyObject(name)){
			name=$.l.truncateStr(name,34);
			var content=name+" <a href='"+url+"' target='_blank'>了解详情&gt;&gt;</a>";
			feedback.find('span').html(content);
			feedback.show();
		}
	}else{
		$(document.body).append("<div id='feedbackcontent' class='disnone'/>")
		$.getJSON("/api/web/recommend/hotask",function(msg){
			if(msg.success){
				$("#feedbackcontent").attr('data-name',msg.data.name).attr('data-url',msg.data.url);
				_setfeedbacktips(bid);
			}
		});
	}
}


// -------------------------------------------------------------------------------------

// 获得与设置光标位置
jQuery.fn.extend({
    getCurPos: function () {
        var e = $(this).get(0);
        e.focus();
        if (e.selectionStart) { // FF
            return e.selectionStart;
        }
        if (document.selection) { // IE
            var r = document.selection.createRange();
            if (r == null) {
                return e.value.length;
            }
            var re = e.createTextRange();
            var rc = re.duplicate();
            re.moveToBookmark(r.getBookmark());
            rc.setEndPoint('EndToStart', re);
            return rc.text.length;
        }
        return e.value.length;
    },
    setCurPos: function (pos) {
        var e = $(this).get(0);
        e.focus();
        if (e.setSelectionRange) {
            e.setSelectionRange(pos, pos);
        } else if (e.createTextRange) {
            var range = e.createTextRange();
            range.collapse(true);
            range.moveEnd('character', pos);
            range.moveStart('character', pos);
            range.select();
        }
    }
});
