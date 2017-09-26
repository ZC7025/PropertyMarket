<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/19
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%=path%>/plugins/calc/style_v2.css">
<link rel="stylesheet" href="<%=path%>/plugins/calc/computer.css">
<style type="text/css">
    .default-input .select{
        -webkit-transform: rotate(180deg);
        -moz-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        -o-transform: rotate(180deg);
        transform: rotate(180deg);
    }
    .qi_xian,.baseinfo_shoufubili{
        font-style: normal;
    }
    .default-wrap{
        overflow: scroll;
        max-height: 300px;
    }
    .default-wrap.downuplist a {
        padding-left: 120px;
    }
</style>
<div class="computer-section computer-bg1">
    <div class="computer-wrap clearfix">
        <div class="computer">
            <div class="computer-tab">
                <dl class='house-box'>
                    <dt><i></i>买房计算器</dt>
                    <dd class='on' data-index="0"><a class="calc_btns" data-index="0" data-hash="biz" href="#biz">商业贷款</a></dd>
                    <dd data-index="1"><a class="calc_btns" data-index="1" data-hash="raf" href="#raf">公积金贷</a></dd>
                    <dd data-index="2"><a class="calc_btns" data-index="2" data-hash="comb" href="#comb">组合贷款</a></dd>
                </dl>
                <dl class='car-box'>
                    <dt><i></i>买车计算器</dt>
                    <dd data-index="3"><a class="calc_btns" data-index="3" data-hash="car" href="#car">车贷计算器</a></dd>
                </dl>
            </div>
            <div class="computer-box" style="width: 380px;">
                <div class="calc_ipts" style="display: block;">
                    <div class="input-txt">
                        <i>贷款金额</i>
                        <input type="text" id="calcValue" value="" class="daikuan" style="padding: 0 50px 0 130px;">
                        <span class="metric">万元</span>
                    </div>
                    <div class="default-txt width-1 mgt20 downupdiv">

                        <p class="default-input qixian" data-val="240">
                            <span class="input">贷款期限<em style="width: 53px;display: inline-block;"></em><em class="qi_xian">20年（240期）</em></span>
                            <i></i>
                        </p>

                        <div class="default-wrap downuplist">
                            <a href="javascript:void(0)" data-val="6">半年（6期）</a>
                            <a href="javascript:void(0)" data-val="12">1年（12期）</a>
                            <a href="javascript:void(0)" data-val="24">2年（24期）</a>
                            <a href="javascript:void(0)" data-val="36">3年（36期）</a>
                            <a href="javascript:void(0)" data-val="48">4年（48期）</a>
                            <a href="javascript:void(0)" data-val="60">5年（60期）</a>
                            <a href="javascript:void(0)" data-val="72">6年（72期）</a>
                            <a href="javascript:void(0)" data-val="84">7年（84期）</a>
                            <a href="javascript:void(0)" data-val="96">8年（96期）</a>
                            <a href="javascript:void(0)" data-val="108">9年（108期）</a>
                            <a href="javascript:void(0)" data-val="120">10年（120期）</a>
                            <a href="javascript:void(0)" data-val="132">11年（132期）</a>
                            <a href="javascript:void(0)" data-val="144">12年（144期）</a>
                            <a href="javascript:void(0)" data-val="156">13年（156期）</a>
                            <a href="javascript:void(0)" data-val="168">14年（168期）</a>
                            <a href="javascript:void(0)" data-val="180">15年（180期）</a>
                            <a href="javascript:void(0)" data-val="192">16年（192期）</a>
                            <a href="javascript:void(0)" data-val="204">17年（204期）</a>
                            <a href="javascript:void(0)" data-val="216">18年（216期）</a>
                            <a href="javascript:void(0)" data-val="228">19年（228期）</a>
                            <a href="javascript:void(0)" data-val="240">20年（240期）</a>
                            <a href="javascript:void(0)" data-val="252">21年（252期）</a>
                            <a href="javascript:void(0)" data-val="264">22年（264期）</a>
                            <a href="javascript:void(0)" data-val="276">23年（276期）</a>
                            <a href="javascript:void(0)" data-val="288">24年（288期）</a>
                            <a href="javascript:void(0)" data-val="300">25年（300期）</a>
                            <a href="javascript:void(0)" data-val="312">26年（312期）</a>
                            <a href="javascript:void(0)" data-val="324">27年（324期）</a>
                            <a href="javascript:void(0)" data-val="336">28年（336期）</a>
                            <a href="javascript:void(0)" data-val="344">29年（344期）</a>
                            <a href="javascript:void(0)" data-val="360">30年（360期）</a>
                        </div>
                    </div>
                    <div class="txt-row" style="width: 360px;">
                        <div class="default-txt width-2 downupdiv">

                            <p class="default-input">
                                <span class="input baseinfo">最新基准利率</span>
                                <i></i>
                            </p>
                            <div class="default-wrap bussinessSelect" data-val="12">

                                <a href="javascript:void(0)" data-val="-1">手动输入</a>
                                <a href="javascript:void(0)" data-val="12">最新基准利率</a>
                                <a href="javascript:void(0)" data-val="11">15-08-26基准利率</a>
                                <a href="javascript:void(0)" data-val="10">15-06-28基准利率</a>
                                <a href="javascript:void(0)" data-val="9">15-05-11基准利率</a>
                                <a href="javascript:void(0)" data-val="8">15-03-01基准利率</a>
                                <a href="javascript:void(0)" data-val="7">14-11-22基准利率</a>
                                <a href="javascript:void(0)" data-val="6">12-07-06基准利率</a>
                                <a href="javascript:void(0)" data-val="5">12-06-08基准利率</a>
                                <a href="javascript:void(0)" data-val="4">11-07-07基准利率</a>
                                <a href="javascript:void(0)" data-val="3">11-04-06基准利率</a>
                                <a href="javascript:void(0)" data-val="2">11-02-09基准利率</a>
                                <a href="javascript:void(0)" data-val="1">10-12-26基准利率</a>
                                <a href="javascript:void(0)" data-val="0">10-10-20基准利率</a>
                            </div>
                        </div>

                        <div class="default-txt mgl10 width-3 downupdiv downupdiv_zhekou_biz">

                            <p class="default-input">
                                <span class="input lilvzhekouInfo" style="width:auto">无折扣</span>
                                <i></i>
                            </p>
                            <div class="default-wrap lilvzhekouSelect" data-val="1">

                                <a href="javascript:void(0)" data-val="1">无折扣</a>
                                <a href="javascript:void(0)" data-val="0.7">7折</a>
                                <a href="javascript:void(0)" data-val="0.8">8折</a>
                                <a href="javascript:void(0)" data-val="0.85">85折</a>
                                <a href="javascript:void(0)" data-val="0.9">9折</a>
                                <a href="javascript:void(0)" data-val="1.1">1.1倍</a>
                                <a href="javascript:void(0)" data-val="1.2">1.2倍</a>
                                <a href="javascript:void(0)" data-val="1.3">1.3倍</a>
                            </div>
                        </div>

                        <span class="equal">=</span>
                        <div class="input-txt2">
                            <input type="text" value="" class="lilv" style="width: 60px;">
                            <i>%</i>
                        </div>
                    </div>
                    <div class="btn-row">
                        <a href="javascript:void(0)" class="btn2 calc_sub_btn">计算</a>
                        <a href="javascript:void(0)" class="btn3 calc_clr_btn">清空</a>
                    </div>
                </div>
                <div class="calc_ipts" style="display: none;">
                    <div class="input-txt">
                        <i>贷款金额</i>
                        <input type="text" value="" class="daikuan" style="padding: 0 50px 0 130px;">
                        <span class="metric">万元</span>
                    </div>
                    <div class="default-txt width-1 mgt20 downupdiv">

                        <p class="default-input qixian" data-val="240">
                            <span class="input">贷款期限<em style="width: 53px;display: inline-block;"></em><em class="qi_xian">20年（240期）</em></span>
                            <i></i>
                        </p>

                        <div class="default-wrap downuplist">
                            <a href="javascript:void(0)" data-val="6">半年（6期）</a>
                            <a href="javascript:void(0)" data-val="12">1年（12期）</a>
                            <a href="javascript:void(0)" data-val="24">2年（24期）</a>
                            <a href="javascript:void(0)" data-val="36">3年（36期）</a>
                            <a href="javascript:void(0)" data-val="48">4年（48期）</a>
                            <a href="javascript:void(0)" data-val="60">5年（60期）</a>
                            <a href="javascript:void(0)" data-val="72">6年（72期）</a>
                            <a href="javascript:void(0)" data-val="84">7年（84期）</a>
                            <a href="javascript:void(0)" data-val="96">8年（96期）</a>
                            <a href="javascript:void(0)" data-val="108">9年（108期）</a>
                            <a href="javascript:void(0)" data-val="120">10年（120期）</a>
                            <a href="javascript:void(0)" data-val="132">11年（132期）</a>
                            <a href="javascript:void(0)" data-val="144">12年（144期）</a>
                            <a href="javascript:void(0)" data-val="156">13年（156期）</a>
                            <a href="javascript:void(0)" data-val="168">14年（168期）</a>
                            <a href="javascript:void(0)" data-val="180">15年（180期）</a>
                            <a href="javascript:void(0)" data-val="192">16年（192期）</a>
                            <a href="javascript:void(0)" data-val="204">17年（204期）</a>
                            <a href="javascript:void(0)" data-val="216">18年（216期）</a>
                            <a href="javascript:void(0)" data-val="228">19年（228期）</a>
                            <a href="javascript:void(0)" data-val="240">20年（240期）</a>
                            <a href="javascript:void(0)" data-val="252">21年（252期）</a>
                            <a href="javascript:void(0)" data-val="264">22年（264期）</a>
                            <a href="javascript:void(0)" data-val="276">23年（276期）</a>
                            <a href="javascript:void(0)" data-val="288">24年（288期）</a>
                            <a href="javascript:void(0)" data-val="300">25年（300期）</a>
                            <a href="javascript:void(0)" data-val="312">26年（312期）</a>
                            <a href="javascript:void(0)" data-val="324">27年（324期）</a>
                            <a href="javascript:void(0)" data-val="336">28年（336期）</a>
                            <a href="javascript:void(0)" data-val="344">29年（344期）</a>
                            <a href="javascript:void(0)" data-val="360">30年（360期）</a>
                        </div>
                    </div>
                    <div class="txt-row">
                        <div class="default-txt width-2 downupdiv">

                            <p class="default-input">
                                <span class="input baseinfo">最新基准利率</span>
                                <i></i>
                            </p>
                            <div class="default-wrap rafSelect" data-val="12">

                                <a href="javascript:void(0)" data-val="-1">手动输入</a>
                                <a href="javascript:void(0)" data-val="12">最新基准利率</a>
                                <a href="javascript:void(0)" data-val="11">15-08-26基准利率</a>
                                <a href="javascript:void(0)" data-val="10">15-06-28基准利率</a>
                                <a href="javascript:void(0)" data-val="9">15-05-11基准利率</a>
                                <a href="javascript:void(0)" data-val="8">15-03-01基准利率</a>
                                <a href="javascript:void(0)" data-val="7">14-11-22基准利率</a>
                                <a href="javascript:void(0)" data-val="6">12-07-06基准利率</a>
                                <a href="javascript:void(0)" data-val="5">12-06-08基准利率</a>
                                <a href="javascript:void(0)" data-val="4">11-07-07基准利率</a>
                                <a href="javascript:void(0)" data-val="3">11-04-06基准利率</a>
                                <a href="javascript:void(0)" data-val="2">11-02-09基准利率</a>
                                <a href="javascript:void(0)" data-val="1">10-12-26基准利率</a>
                                <a href="javascript:void(0)" data-val="0">10-10-20基准利率</a>
                            </div>
                        </div>
                        <span class="equal">=</span>
                        <div class="input-txt2">
                            <input type="text" value="" class="lilv2" style="width: 60px;">
                            <i>%</i>
                        </div>
                    </div>
                    <div class="btn-row">
                        <a href="javascript:void(0)" id="calc" class="btn2 calc_sub_btn">计算</a>
                        <a href="javascript:void(0)" class="btn3 calc_clr_btn">清空</a>
                    </div>
                </div>
                <div class="calc_ipts" style="display: none;">
                    <div class="input-txt">
                        <i>商业贷款金额</i>
                        <input type="text" value="" class="daikuan" style="padding: 0 50px 0 130px;">
                        <span class="metric">万元</span>
                    </div>
                    <div class="input-txt mgt20">
                        <i>公积金贷款金额</i>
                        <input type="text" value="" class="daikuan2" style="padding: 0 50px 0 130px;">
                        <span class="metric">万元</span>
                    </div>
                    <div class="default-txt width-1 mgt20 downupdiv">

                        <p class="default-input qixian" data-val="240">
                            <span class="input">贷款期限<em style="width: 53px;display: inline-block;"></em><em class="qi_xian">20年（240期）</em></span>
                            <i></i>
                        </p>

                        <div class="default-wrap downuplist">
                            <a href="javascript:void(0)" data-val="6">半年（6期）</a>
                            <a href="javascript:void(0)" data-val="12">1年（12期）</a>
                            <a href="javascript:void(0)" data-val="24">2年（24期）</a>
                            <a href="javascript:void(0)" data-val="36">3年（36期）</a>
                            <a href="javascript:void(0)" data-val="48">4年（48期）</a>
                            <a href="javascript:void(0)" data-val="60">5年（60期）</a>
                            <a href="javascript:void(0)" data-val="72">6年（72期）</a>
                            <a href="javascript:void(0)" data-val="84">7年（84期）</a>
                            <a href="javascript:void(0)" data-val="96">8年（96期）</a>
                            <a href="javascript:void(0)" data-val="108">9年（108期）</a>
                            <a href="javascript:void(0)" data-val="120">10年（120期）</a>
                            <a href="javascript:void(0)" data-val="132">11年（132期）</a>
                            <a href="javascript:void(0)" data-val="144">12年（144期）</a>
                            <a href="javascript:void(0)" data-val="156">13年（156期）</a>
                            <a href="javascript:void(0)" data-val="168">14年（168期）</a>
                            <a href="javascript:void(0)" data-val="180">15年（180期）</a>
                            <a href="javascript:void(0)" data-val="192">16年（192期）</a>
                            <a href="javascript:void(0)" data-val="204">17年（204期）</a>
                            <a href="javascript:void(0)" data-val="216">18年（216期）</a>
                            <a href="javascript:void(0)" data-val="228">19年（228期）</a>
                            <a href="javascript:void(0)" data-val="240">20年（240期）</a>
                            <a href="javascript:void(0)" data-val="252">21年（252期）</a>
                            <a href="javascript:void(0)" data-val="264">22年（264期）</a>
                            <a href="javascript:void(0)" data-val="276">23年（276期）</a>
                            <a href="javascript:void(0)" data-val="288">24年（288期）</a>
                            <a href="javascript:void(0)" data-val="300">25年（300期）</a>
                            <a href="javascript:void(0)" data-val="312">26年（312期）</a>
                            <a href="javascript:void(0)" data-val="324">27年（324期）</a>
                            <a href="javascript:void(0)" data-val="336">28年（336期）</a>
                            <a href="javascript:void(0)" data-val="344">29年（344期）</a>
                            <a href="javascript:void(0)" data-val="360">30年（360期）</a>
                        </div>
                    </div>
                    <div class="txt-row" style="width: 380px;">
                        <div class="default-txt width-2 downupdiv">

                            <p class="default-input">
                                <span class="input baseinfo bizbaseinfo">商贷最新基准利率</span>
                                <i></i>
                            </p>
                            <div class="default-wrap bussinessSelect" data-val="12">

                                <a href="javascript:void(0)" data-val="-1">手动输入</a>
                                <a href="javascript:void(0)" data-val="12">商贷最新基准利率</a>
                                <a href="javascript:void(0)" data-val="11">15-08-26基准利率</a>
                                <a href="javascript:void(0)" data-val="10">15-06-28基准利率</a>
                                <a href="javascript:void(0)" data-val="9">15-05-11基准利率</a>
                                <a href="javascript:void(0)" data-val="8">15-03-01基准利率</a>
                                <a href="javascript:void(0)" data-val="7">14-11-22基准利率</a>
                                <a href="javascript:void(0)" data-val="6">12-07-06基准利率</a>
                                <a href="javascript:void(0)" data-val="5">12-06-08基准利率</a>
                                <a href="javascript:void(0)" data-val="4">11-07-07基准利率</a>
                                <a href="javascript:void(0)" data-val="3">11-04-06基准利率</a>
                                <a href="javascript:void(0)" data-val="2">11-02-09基准利率</a>
                                <a href="javascript:void(0)" data-val="1">10-12-26基准利率</a>
                                <a href="javascript:void(0)" data-val="0">10-10-20基准利率</a>
                            </div>
                        </div>

                        <div class="default-txt mgl10 width-3 downupdiv downupdiv_zhekou_biz">

                            <p class="default-input">
                                <span class="input lilvzhekouInfo" style="width:auto">无折扣</span>
                                <i></i>
                            </p>
                            <div class="default-wrap lilvzhekouSelect" data-val="1">

                                <a href="javascript:void(0)" data-val="1">无折扣</a>
                                <a href="javascript:void(0)" data-val="0.7">7折</a>
                                <a href="javascript:void(0)" data-val="0.8">8折</a>
                                <a href="javascript:void(0)" data-val="0.85">85折</a>
                                <a href="javascript:void(0)" data-val="0.9">9折</a>
                                <a href="javascript:void(0)" data-val="1.1">1.1倍</a>
                                <a href="javascript:void(0)" data-val="1.2">1.2倍</a>
                                <a href="javascript:void(0)" data-val="1.3">1.3倍</a>
                            </div>
                        </div>

                        <span class="equal">=</span>
                        <div class="input-txt2">
                            <input type="text" value="" class="lilv" style="width: 60px;">
                            <i>%</i>
                        </div>
                    </div>
                    <div class="txt-row">
                        <div class="default-txt width-2 downupdiv">

                            <p class="default-input">
                                <span class="input baseinfo rafbaseinfo">公积金最新利率</span>
                                <i></i>
                            </p>
                            <div class="default-wrap rafSelect" data-val="12">

                                <a href="javascript:void(0)" data-val="-1">手动输入</a>
                                <a href="javascript:void(0)" data-val="12">公积金最新利率</a>
                                <a href="javascript:void(0)" data-val="11">15-08-26基准利率</a>
                                <a href="javascript:void(0)" data-val="10">15-06-28基准利率</a>
                                <a href="javascript:void(0)" data-val="9">15-05-11基准利率</a>
                                <a href="javascript:void(0)" data-val="8">15-03-01基准利率</a>
                                <a href="javascript:void(0)" data-val="7">14-11-22基准利率</a>
                                <a href="javascript:void(0)" data-val="6">12-07-06基准利率</a>
                                <a href="javascript:void(0)" data-val="5">12-06-08基准利率</a>
                                <a href="javascript:void(0)" data-val="4">11-07-07基准利率</a>
                                <a href="javascript:void(0)" data-val="3">11-04-06基准利率</a>
                                <a href="javascript:void(0)" data-val="2">11-02-09基准利率</a>
                                <a href="javascript:void(0)" data-val="1">10-12-26基准利率</a>
                                <a href="javascript:void(0)" data-val="0">10-10-20基准利率</a>
                            </div>
                        </div>
                        <span class="equal">=</span>
                        <div class="input-txt2">
                            <input type="text" value="" class="lilv2" style="width: 60px;">
                            <i>%</i>
                        </div>
                    </div>
                    <div class="btn-row">
                        <a href="javascript:void(0)" class="btn2 calc_sub_btn">计算</a>
                        <a href="javascript:void(0)" class="btn3 calc_clr_btn">清空</a>
                    </div>
                </div>
                <div class="calc_ipts car" style="display: none;">
                    <div class="input-txt">
                        <i>汽车价格</i>
                        <input type="text" value="" class="daikuan">
                        <span class="metric">万元</span>
                    </div>
                    <div class="default-txt mgt20 width-1 downupdiv">
                        <div class="default-wrap carSelect" data-val="0" style="display: none">
                            <a href="javascript:void(0)" data-val="0">最新基准利率</a>
                        </div>

                        <p class="default-input shoufubili">
                            <span class="input">首付比例<em style="width: 53px;display: inline-block;"></em><em class="baseinfo_shoufubili">30%</em></span>
                            <i></i>
                        </p>
                        <div class="default-wrap shoufuSelect downuplist" data-val="0.3">

                            <a href="javascript:void(0)" data-val="0.2">20%</a>
                            <a href="javascript:void(0)" data-val="0.3">30%</a>
                            <a href="javascript:void(0)" data-val="0.4">40%</a>
                            <a href="javascript:void(0)" data-val="0.5">50%</a>
                            <a href="javascript:void(0)" data-val="0.6">60%</a>
                            <a href="javascript:void(0)" data-val="0.7">70%</a>
                            <a href="javascript:void(0)" data-val="0.8">80%</a>
                            <a href="javascript:void(0)" data-val="0.9">90%</a>
                        </div>
                    </div>
                    <div class="default-txt width-1 mgt20 downupdiv">

                        <p class="default-input qixian" data-val="12">
                            <span class="input">贷款期限<em style="width: 53px;display: inline-block;"></em><em class="qi_xian">1年（12期）</em></span>
                            <i></i>
                        </p>

                        <div class="default-wrap downuplist">
                            <a href="javascript:void(0)" data-val="12">1年（12期）</a>
                            <a href="javascript:void(0)" data-val="24">2年（24期）</a>
                            <a href="javascript:void(0)" data-val="36">3年（36期）</a>
                            <a href="javascript:void(0)" data-val="48">4年（48期）</a>
                            <a href="javascript:void(0)" data-val="60">5年（60期）</a>
                        </div>
                    </div>
                    <div class="txt-row">
                        <div class="default-txt width-2 downupdiv">

                            <p class="default-input">
                                <span class="input lilvzhekouInfo">最新基准利率</span>
                                <i></i>
                            </p>
                            <div class="default-wrap lilvzhekouSelect" data-val="1">

                                <a href="javascript:void(0)" data-val="-1">手动输入</a>
                                <a href="javascript:void(0)" data-val="0.7">最新基准利率7折</a>
                                <a href="javascript:void(0)" data-val="0.8">最新基准利率8折</a>
                                <a href="javascript:void(0)" data-val="0.85">最新基准利率85折</a>
                                <a href="javascript:void(0)" data-val="0.9">最新基准利率9折</a>
                                <a href="javascript:void(0)" data-val="1">最新基准利率</a>
                                <a href="javascript:void(0)" data-val="1.1">最新基准利率1.1倍</a>
                                <a href="javascript:void(0)" data-val="1.2">最新基准利率1.2倍</a>
                                <a href="javascript:void(0)" data-val="1.3">最新基准利率1.3倍</a>
                            </div>
                        </div>
                        <span class="equal">=</span>
                        <div class="input-txt2">
                            <input type="text" value="" class="lilv" style="width: 60px;">
                            <i>%</i>
                        </div>
                    </div>
                    <div class="btn-row">
                        <a href="javascript:void(0)" class="btn2 calc_sub_btn">计算</a>
                        <a href="javascript:void(0)" class="btn3 calc_clr_btn">清空</a>
                    </div>
                </div>
                <p class="tip" style="display: none;">请填写完整信息，开始计算</p>
            </div>
        </div>
        <div class="interest">
            <div class="interest-wrap">
                <div class="interest-tab">
                    <ul style="padding-top: 0;">
                        <li class=" on deb_btns" data-index="0"><a href="javascript:void(0)">等额本息</a></li>
                        <li class='  deb_btns' data-index="1"><a href="javascript:void(0)">等额本金</a></li>
                    </ul>
                </div>

                <div class="interest-box deb_list" style="display:block;">

                    <div>
                        <div class="repayment">
                            <div class="num">
                                <h2 class="ysbx">----</h2>
                                <p>每月还款金额(元)</p>
                            </div>
                        </div>
                        <div class="repayment-detail">
                            <ul>
                                <li><p>贷款金额</p><span><b class="daikuan">--</b>元</span></li>
                                <li><p>利息总额</p><span><strong class="yslx_zonggong">--</strong>元</span></li>
                                <li><p>还款总额</p><span><strong class="bx_zonggong">--</strong>元</span></li>
                            </ul>
                        </div>
                        <div class="repayment-list">
                            <dl class="repayment-thead">
                                <dt>期数</dt>
                                <dd>偿还本息</dd>
                                <dd>偿还利息</dd>
                                <dd>偿还本金</dd>
                                <dd>剩余本金</dd>
                            </dl>
                            <div class='repayment-table' style="height: 180px;">
                                <table width="100%">
                                    <tbody class="detail_list">
                                    <tr>
                                        <th>--</th>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="interest-box deb_list" style="display:none;">

                    <div>
                        <div class="repayment">
                            <div class="num">
                                <h2 class="ysbx">----</h2>
                                <p class="month_dijian">首月还款金额(元)</p>
                            </div>
                        </div>
                        <div class="repayment-detail">
                            <ul>
                                <li><p>贷款金额</p><span><b class="daikuan">--</b>元</span></li>
                                <li><p>利息总额</p><span><strong class="yslx_zonggong">--</strong>元</span></li>
                                <li><p>还款总额</p><span><strong class="bx_zonggong">--</strong>元</span></li>
                            </ul>
                        </div>
                        <div class="repayment-list">
                            <dl class="repayment-thead">
                                <dt>期数</dt>
                                <dd>偿还本息</dd>
                                <dd>偿还利息</dd>
                                <dd>偿还本金</dd>
                                <dd>剩余本金</dd>
                            </dl>
                            <div class='repayment-table' style="height: 180px;">
                                <table width="100%">
                                    <tbody class="detail_list">
                                    <tr>
                                        <th>--</th>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                        <td>--</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/plugins/calc/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/plugins/calc/calculator.js"></script>
<script type="text/javascript">
    window.needClear = '';
</script>
<script type="text/javascript">
    var uigs_para={"uigs_productid":"jinrong","pagetype":"jinrong_loan_calculator"};
    var client_yyid = "", client_ptid="", client_version="";
    $(function() {
        if (window.external.GetPartnerIDFromClient) {
            client_ptid = window.external.GetPartnerIDFromClient();
            if (client_ptid) {
                uigs_para.client_ptid = client_ptid;
            }
        }
        if (window.external.GetYYIDFromClient) {
            client_yyid = window.external.GetYYIDFromClient();
            if (client_yyid) { //get result
                uigs_para.client_yyid = client_yyid;
            }
        }

        if (window.external.GetVersionFromClient) {
            client_version = window.external.GetVersionFromClient();
            if (client_version) {
                uigs_para.client_version = client_version;
            }
        }
        $.getScript("https://zhibo.sogou.com/js/pb.js");
    });
    if (!client_yyid) { //没有获取到 暂时用测试yyid
        client_yyid="testfan";
    }
</script>
