$(function(){
	window.needClear = window.needClear == 'false' ? false : true;
	var businessShortRateArr6=[5.1,5.35,5.6,5.85,6.1,5.85,5.6,5.6,5.35,5.1,4.85,4.6,4.35],
	businessShortRateArr12=[5.56,5.81,6.06,6.31,6.56,6.31,6,5.6,5.35,5.1,4.85,4.6,4.35],
	businessShortRateArr36=[5.6,5.85,6.1,6.4,6.65,6.4,6.15,6,5.75,5.5,5.25,5,4.75],
	businessShortRateArr60=[5.96,6.22,6.45,6.65,6.9,6.65,6.4,6,5.75,5.5,5.25,5,4.75],
	businessLongRateArr=[6.14,6.4,6.6,6.8,7.05,6.8,6.55,6.15,5.9,5.65,5.4,5.15,4.9],
	PAFShortRateArr=[3.5,3.75,4,4.2,4.45,4.2,4,3.75,3.5,3.25,3,2.75,2.75],
	PAFLongRateArr=[4.05,4.3,4.5,4.7,4.9,4.7,4.5,4.25,4,3.75,3.5,3.25,3.25],
	CarYearRateArr=[4.35,4.75,4.75,4.75,4.75];
	var hashval = location.hash.slice(1);
	if(hashval){
		// alert(hashval);
		hashchangefun(hashval)
	}else{
		hashchangefun('biz')
	}
	$('.calc_btns').on('click',function(){
		var hash = $(this).data("hash");
		hashchangefun(hash);
	})
	function hashchangefun(hashval){
		var index = 0;
		if(hashval == 'biz'){
			index = 0;
		}else if(hashval == 'raf'){
			index = 1;
		}else if(hashval == 'comb'){
			index = 2;
		}else if(hashval == 'car'){
			index = 3;
		}
		$('.computer-tab dd').removeClass('on');
		$('.computer-tab dd').eq(index).addClass('on');
		$('.calc_ipts').hide();
		$('.calc_ipts').eq(index).show();

		if(window.needClear){
			clearIt($('.calc_ipts').eq(index));
			calcLilv($('.calc_ipts').eq(index),false,true,true,true);
		}else{
			window.needClear = true;
			calcResult();
		}
	}
	$('.deb_btns').on('click',function(){
		var index = $(this).data("index");
		$('.deb_list').hide();
		$('.deb_list').eq(index).show();
		$('.deb_btns').removeClass('on');
		$(this).addClass('on');
	})
	
	$('.downupdiv').on('click',function(){
		$('.downupdiv').removeClass('unfold');
		$(this).addClass('unfold');
		$('.downupdiv i').removeClass('select');
		$(this).find('i').addClass('select');
	}).on('mouseleave',function(){
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	}).on('click','a',function(e){//只有期限
		e.stopPropagation();
		$(this).parent().prev('.qixian').data('val',$(this).data('val'));
		$(this).parent().prev('.qixian').find('.qi_xian').html($(this).html());
		calcLilv($(this).parents('.calc_ipts'),false,true,false,true);
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	})
	
	$('.bussinessSelect>a').on('click',function(e){
		e.stopPropagation();
		var qixian = $(this).parents('.calc_ipts').find('.qixian').data('val');
		$(this).parent().data('val',$(this).data('val'));
		/* console.log($(this).data('val') == '-1'); */
		calcLilv($(this).parents('.calc_ipts'),($(this).data('val') == '-1'),$(this).parent().hasClass('bussinessSelect'),$(this).parent().hasClass('rafSelect'),$(this).parent().parent().hasClass('qixian'));
		$(this).parents('.txt-row').find('.baseinfo').html($(this).html());
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	})
	
	$('.shoufuSelect>a').on('click',function(e){
		e.stopPropagation();
		$(this).parent().data('val',$(this).data('val'));
		$(this).parents('.default-txt').find('.baseinfo_shoufubili').html($(this).html());
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	})
	
	$('.rafSelect>a').on('click',function(e){
		e.stopPropagation();
		var qixian = $(this).parents('.calc_ipts').find('.qixian').data('val');
		$(this).parent().data('val',$(this).data('val'));
		calcLilv($(this).parents('.calc_ipts'),false,false,true,false);
		$(this).parents('.txt-row').find('.baseinfo').html($(this).html());
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	})
	
	$('.carSelect>a').on('click',function(){
		$('.downupdiv').removeClass('unfold');
		$('.downupdiv i').removeClass('select');
	})
	
	$('.daikuan,.daikuan2').on('keyup',function(){
		$('.tip').hide();
		$(this).css('border','');
		$(this).val($(this).val().replace(/[^\d|\.]/g, ''));
		if($(this).val() !== ''){			
			if((isNaN($(this).val()) || $(this).val() < 0.1 || $(this).val() > 10000) && ($(this).val()!=='0' && $(this).val()!=='0.')){
				if($(this).val() < 0.1){					
					$(this).val('0.1');
				}else if($(this).val() > 10000){
					$(this).val('10000');
				}
			}
		}
	}).on('blur',function(){
		$(this).val($(this).val().replace(/[^\d|\.]/g, ''));
		if($(this).val() !== ''){
			if(isNaN($(this).val()) || $(this).val() < 0.1 || $(this).val() > 10000){
				if($(this).val() < 0.1){					
					$(this).val('0.1');
				}else if($(this).val() > 10000){
					$(this).val('10000');
				}
			}
		}
	})
	
	$('.lilv,.lilv2').on('keyup',function(){
		$('.tip').hide();
		$(this).css('border','');
		$(this).val($(this).val().replace(/[^\d|\.]/g, ''));
		if($(this).val() !== ''){			
			if((isNaN($(this).val()) || $(this).val() < 0.01 || $(this).val() > 100) && ($(this).val()!=='0' && $(this).val()!=='0.' && $(this).val()!=='0.0')){
				if($(this).val() < 0.01){					
					$(this).val('0.01');
				}else if($(this).val() > 100){
					$(this).val('100');
				}
			}
		}
	}).on('blur',function(){
		$(this).val($(this).val().replace(/[^\d|\.]/g, ''));
		if($(this).val() !== ''){			
			if(isNaN($(this).val()) || $(this).val() < 0.01 || $(this).val() > 10000){
				if($(this).val() < 0.01){					
					$(this).val('0.01');
				}else if($(this).val() > 100){
					$(this).val('100');
				}
			}
		}
	})
	
	$('.lilvzhekouSelect>a').on('click',function(){
		$(this).parent().data('val',$(this).data('val'));
		$(this).parents('.calc_ipts').find('.lilvzhekouInfo').html($(this).html());
		calcLilv($(this).parents('.calc_ipts'));
		$('.downupdiv').removeClass('unfold');
	})
	
	$('.calc_sub_btn').on('click',function(){
		calcResult();
	})
	
	function loadData(type,deb,daikuan,daikuan2,lilv,lilv2,qixian){
        var turl = "http://jinrong.sogou.com/calcjson?type="+type+"&deb="+deb+"&lilv="+lilv+"&lilv2="+lilv2+"&daikuan="+daikuan+"&daikuan2="+daikuan2+"&qixian="+qixian;
        /* console.log(turl); */
		$.ajax({
			url:turl,
			type:"get",
			timeout: 10000,
			dataType:"jsonp",
            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			success:function (result) {
				showData(deb, result)
			},
			error:function(result){
			}
		})
    }
	function showData(deb, result){
		var parentDiv;
		if(deb == '1'){//等额本息
			parentDiv = $('.deb_list').eq(0);
		}else if(deb == '2'){//等额本金
			parentDiv = $('.deb_list').eq(1);
		}
		if(result.month_dijian == 0){
			parentDiv.find('.month_dijian').eq(0).html('首月还款金额(元)');
		}else{
			parentDiv.find('.month_dijian').eq(0).html('首月还款金额(元)');
			/*parentDiv.find('.month_dijian').eq(0).html('每月递减&nbsp;'+result.month_dijian+'&nbsp;元');*/
		}
		parentDiv.find('.ysbx').eq(0).html(result.ysbx);
		parentDiv.find('.daikuan').eq(0).html(result.daikuan);
		parentDiv.find('.yslx_zonggong').eq(0).html(result.yslx_zonggong);
		parentDiv.find('.bx_zonggong').eq(0).html(result.bx_zonggong);
		var oneItem = eval(result.results); 
		parentDiv.find('.detail_list').eq(0).empty();
		$.each(oneItem,function(idx,item){
			var html = '<tr>';
				html += '<th>'+(idx+1)+'</th>';
				html += '<td>'+item.benxi+'</td>';
				html += '<td>'+item.lixi+'</td>';
				html += '<td>'+item.benjin+'</td>';
				html += '<td>'+item.shengyubenjin+'</td>';
				html += '</tr>';
			parentDiv.find('.detail_list').eq(0).append(html);
		});
	}
	
	function calcResult(){
		var targetIndex = $('.computer-tab dd[class="on"]').eq(0).data('index');
		var target = $('.calc_ipts').eq(targetIndex);
		var daikuan = target.find('.daikuan').eq(0).val();
		var daikuan2 = target.find('.daikuan2').eq(0).val();
		var lilv = target.find('.lilv').eq(0).val();
		var lilv2 = target.find('.lilv2').eq(0).val();
		var carShoufuVal = target.find('.shoufuSelect').eq(0).data('val');
		var flag = true;
//		console.log("daikuan:"+daikuan+",daikuan2:"+daikuan+",lilv:"+lilv+",lilv2:"+lilv2);
		//汽车。如果有首付比例，则需要将贷款金额打折
		if(daikuan != undefined && daikuan != ''){
			if(carShoufuVal !== undefined && carShoufuVal !== '' && !isNaN(carShoufuVal)){
				carShoufuVal = parseFloat(carShoufuVal);
				daikuan = daikuan * ( 1 - carShoufuVal);
			}
		}
		if(daikuan != undefined && daikuan == ''){
			flag = false;
			target.find('.daikuan').eq(0).css('border','1px solid red');
		}
		if(daikuan2 != undefined && daikuan2 == ''){
			flag = false;
			target.find('.daikuan2').eq(0).css('border','1px solid red');
		}
		if(lilv != undefined && lilv == ''){
			flag = false;
			target.find('.lilv').eq(0).css('border','1px solid red');
		}
		if(lilv2 != undefined && lilv2 == ''){
			flag = false;
			target.find('.lilv2').eq(0).css('border','1px solid red');
		}
		if(flag){
			$('.tip').hide();
			daikuan = (daikuan == undefined ? "":daikuan);
			target.find('.daikuan').eq(0).css('border','');
			daikuan2 = (daikuan2 == undefined ? "":daikuan2);
			lilv = (lilv == undefined ? "":lilv);
			lilv2 = (lilv2 == undefined ? "":lilv2);
			var qixian = target.find('.qixian').eq(0).data('val');
			qixian = (qixian == undefined ? "":qixian);
			var type = 1;
			loadData(type,1,daikuan,daikuan2,lilv,lilv2,qixian);
			loadData(type,2,daikuan,daikuan2,lilv,lilv2,qixian);
		}else{
			$('.tip').show();
		}
	}
	
	function calcLilv(target,shoudong,isBizSelect,isRafSelect,isQixian){
		if(shoudong == undefined) shoudong=false;
        if(isBizSelect == undefined) isBizSelect=true;
        if(isRafSelect == undefined) isRafSelect=false;
        if(isQixian == undefined) isQixian=false;
		/*console.log("[calcLilv]shoudong:"+shoudong+',isBizSelect:'+isBizSelect+',isRafSelect:'+isRafSelect+',isQixian:'+isQixian)*/
		var qixian = target.find('.qixian').eq(0).data('val');
		var baseBizVal = target.find('.bussinessSelect').eq(0).data('val');
		var baseCarVal = target.find('.carSelect').eq(0).data('val');
		var baseRafVal = target.find('.rafSelect').eq(0).data('val');
		var zhekou = target.find('.lilvzhekouSelect').eq(0).data('val');//只有商贷有折扣
		var biz_ret = 0;
		if(isBizSelect && baseBizVal !== undefined && baseBizVal !== ''){//商贷
			if(!isNaN(qixian)){
				qixian = parseInt(qixian);
				if(qixian <= 6){
					biz_ret = businessShortRateArr6[baseBizVal];
				}else if(qixian > 6 && qixian <= 12){
					biz_ret = businessShortRateArr12[baseBizVal];
				}else if(qixian > 12 && qixian <= 36){
					biz_ret = businessShortRateArr36[baseBizVal];
				}else if(qixian > 36 && qixian <= 60){
					biz_ret = businessShortRateArr60[baseBizVal];
				}else if(qixian > 60){
					biz_ret = businessLongRateArr[baseBizVal];
				}
				/*更改公积金基准利率的时候不更改商贷利率相关*/
                //if(!isRafSelect){
                    /*利率已是手动的情况下，更改期限，利率不变相关*/
                    if(isQixian && baseBizVal != '-1'){
                        target.find('.downupdiv_zhekou_biz').show();
                            if(!isNaN(zhekou)){
								zhekou = parseFloat(zhekou);
                                biz_ret = Math.round(zhekou * biz_ret*100)/100;
                                target.find('.lilv').val(biz_ret);
                				target.find('.lilv').eq(0).css('border','');
                            }else{
                                target.find('.lilv').val(biz_ret);
                				target.find('.lilv').eq(0).css('border','');
                            }
                    }else if(!isQixian){
                        if(baseBizVal == '-1' && shoudong){//手动输入
                            target.find('.downupdiv_zhekou_biz').hide();
                            target.find('.lilv').val('');
            				target.find('.lilv').eq(0).css('border','');
                        }else{
                            target.find('.downupdiv_zhekou_biz').show();
                            if(!isNaN(zhekou)){
								zhekou = parseFloat(zhekou);
                                biz_ret = Math.round(zhekou * biz_ret*100)/100;
                                target.find('.lilv').val(biz_ret);
                				target.find('.lilv').eq(0).css('border','');
                            }else{
                                target.find('.lilv').val(biz_ret);
                				target.find('.lilv').eq(0).css('border','');
                            }
                        }
                    }
                //}
			}
		}
		if(isRafSelect && baseRafVal !== undefined && baseRafVal !== ''){//公积金
			if(baseRafVal == '-1'){
                biz_ret = "";
            }else if(!isNaN(qixian)){
				qixian = parseInt(qixian);
				if(qixian <= 60){
					biz_ret = PAFShortRateArr[baseRafVal];
				}else{
					biz_ret = PAFLongRateArr[baseRafVal];
				}
			}
			target.find('.lilv2').val(biz_ret);
			target.find('.lilv2').eq(0).css('border','');
		}
		if(baseCarVal !== undefined && baseCarVal !== ''){//车贷
			if(zhekou == '-1'){
                biz_ret = "";
                target.find('.lilv').val(biz_ret);
            }else{            	
            	if(!isNaN(qixian)){
            		qixian = parseInt(qixian);
            		biz_ret = CarYearRateArr[qixian/12-1];
            	}
            	if(!isNaN(zhekou)){
            		zhekou = parseFloat(zhekou);
            		biz_ret = Math.round(zhekou * biz_ret*100)/100;
            		target.find('.lilv').val(biz_ret);
            		target.find('.lilv').eq(0).css('border','');
            	}else{
            		target.find('.lilv').val(biz_ret);
            		target.find('.lilv').eq(0).css('border','');
            	}
            }
		}
		/* console.log("qixian:"+qixian+",baseBizVal:"+baseBizVal+",baseRafVal:"+baseRafVal+",baseCarVal:"+baseCarVal+",zhekou:"+zhekou+",biz_ret:"+biz_ret); */
	}
	
	$('.calc_clr_btn').on('click',function(){
		clearIt($(this).parents('.calc_ipts'));
		calcLilv($(this).parents('.calc_ipts'));
	})
	function clearIt(target){
		/*重置贷款*/
		target.find('.daikuan').eq(0).val('');
		target.find('.daikuan2').eq(0).val('');
		/*重置基准利率*/
		target.find('.baseinfo').html('最新基准利率');
		target.find('.bizbaseinfo').html('商贷最新基准利率');
		target.find('.rafbaseinfo').html('公积金最新利率');
		/*重置车贷的首付比例*/
		target.find('.baseinfo_shoufubili').html('30%');
		target.find('.baseinfo_shoufubili').parent().parent().next().data('val','0.3');
		/*重置折扣*/
        if(target.hasClass('car')){
            target.find('.lilvzhekouInfo').eq(0).html('最新基准利率');
        }else{
            target.find('.lilvzhekouInfo').eq(0).html('无折扣');
        }
        target.find('.lilvzhekouSelect').eq(0).data('val','1');
        
		target.find('.bussinessSelect').eq(0).data('val','12');
		if(target.hasClass('car')){
			target.find('.qixian').eq(0).data('val',12);
			target.find('.qixian .qi_xian').eq(0).html('1年（12期）');			
		}else{			
			target.find('.qixian').eq(0).data('val',240);
			target.find('.qixian .qi_xian').eq(0).html('20年（240期）');
		}
		
		/*重置还款方式*/
        target.find('input:radio').eq(0).prop('checked',true);
		
		//clear css
		$('.tip').hide();
		target.find('.daikuan').eq(0).css('border','');
		target.find('.daikuan2').eq(0).css('border','');
		target.find('.lilv').eq(0).css('border','');
		target.find('.lilv2').eq(0).css('border','');
		
		//clear calc result list
		$('.deb_list').find('.ysbx').html('----');
		$('.deb_list').find('.month_dijian').html('首月还款金额(元)');
		$('.deb_list').find('.yslx_zonggong').html('--');
		$('.deb_list').find('.bx_zonggong').html('--');
		$('.deb_list').find('.detail_list').html('<tr><th>--</th><td>--</td><td>--</td><td>--</td><td>--</td></tr>')
		$('.deb_list').find('.daikuan').html('--');
	}
})