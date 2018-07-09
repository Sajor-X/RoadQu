$(document).ready(function(){
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
	//收藏
	$("li>.btn-favor").live("click",function(){
		var iflogin=$("#iflogin").val();
		if(!iflogin){
			needLogin();
			return false;
		}else{
			var data = {};
			data.ztid = $(this).attr("data-ztid");
			data.action="addsc";
			date = $.param(data);
			$.ajax({
		        type: "POST",
		        url: "/api/web/zhuanti.php",
		        data: data,
		        success: function (msg) {
		        	if(msg=="have"){
		        		$.l.autoClose('你以前收藏过该专题', 2, 2);
		        		setTimeout(function(){
		        			window.location.href="/zhuanti/my/sc";
						  },1000*2);
		        	}
		        	else{
		        		$.l.autoClose('收藏成功', 2, 2);
		        		setTimeout(function(){
		        			window.location.href="/zhuanti/my/sc";
						  },1000*2);
		        	}
		         } 
		    });
		}
	 });
	//下载
	$("li>.btn-download").live("click",function(){
		var iflogin=$("#iflogin").val();
		if(!iflogin){
			needLogin();
			return false;
		}
//		else{
//			var data = {};
//			data.ztid = $(this).attr("data-ztid");
//			data.action="addload";
//			date = $.param(data);
//			$.ajax({
//		        type: "POST",
//		        url: "/api/web/zhuanti.php",
//		        data: data,
//		        success: function (msg) {
//		         } 
//		    });
//		}
	 });
	//显示更多
	$(".show-more-page-btn").live("click",function(){
		$(".moreinterestloading").show();
		$("#more-page-warp").hide();
	    var page = $("#page").val();
	    var page_num = $("#page_num").val();
		var aftertotal = $("#page_aftertotal").val();
		var data = {};
		var html='';
		data.action = 'showmorezhuanti';
		data.page = page;
		data.page_num = page_num;
		date = $.param(data);
	    $.ajax({
	        type: "POST",
	        url: "/api/web/zhuanti.php",
	        data: data,
	        success: function (msg) {
				$(".moreinterestloading").hide();
		        $("#more-page-warp").show();
	            if (msg != "error") {
	                var morePageJson = jQuery.parseJSON(msg);
	                $(morePageJson).each(function (i) {
	                	var desc=morePageJson[i].desc;
	                	if(desc.length>20){
	                		desc=desc.substring(0,20)+"...";
	                	}
						html+="<li class='ui-box zhuanti-item'>";
                        html+="<a target='_blank' href='"+morePageJson[i].url+"'><img src='"+morePageJson[i].img+"' alt='"+morePageJson[i].title+"' width='655' height='235'></a>";
                        html+="<div class='zhuanti-info fn-left'>";
                        html+="<h3>"+morePageJson[i].title+"</h3>";
                        html+="<p><a target='_blank' href='"+morePageJson[i].url+"'>"+desc+"</a></p>"; 
                        html+="</div>";
                        html+="<ul class='zhuanti-act fn-right'>";
                        html+="<li><a href='javascript:;' data-ztid='"+morePageJson[i].ztid+"' class='btn-favor'>收藏</a></li>";
                        html+="<li><a href='/zhuanti/load/"+morePageJson[i].pdfurl+"?name="+encodeURIComponent(morePageJson[i].title)+"' data-ztid='"+morePageJson[i].ztid+"' target='_blank' class='btn-download'>下载</a></li>";
                        html+="<li><a target='_blank' href='"+morePageJson[i].url+"' class='btn-link'>去看看</a></li>";
                        html+="</ul></li>";
                        //zhuanti/load/<!--{$ztlist[n].pdfurl}-->?name=<!--{$ztlist[n].title|escape:url}-->
	                });
	                $(".zhuanti-list").append(html);
	                $("#page").val(parseInt(page)+1);
	                aftertotal=parseInt(aftertotal);
	                page_num=parseInt(page_num);	
	                var page_aftertotal =aftertotal - page_num;
	                //var page_aftertotal = parseInt(aftertotal) - parseInt(page_num);	
	                $("#page_aftertotal").val(page_aftertotal);
	                if(parseInt(page_aftertotal)<=0){
	                    $("#showmorepage").hide();
	                }
	            } 
	        }
	    });
	});
});