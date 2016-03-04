<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="http://www.platform.co.kr" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<html>
<head>
<title>main</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head>
<body>

<div class="container">
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
		</div>
		<!--logo start-->
		<a href="/" class="logo"><b>DASHGUM FREE</b></a>
		<!--logo end-->
		<div class="nav notify-row" id="top_menu">
			<!--  notification start -->
			<ul class="nav top-menu">
				<!-- inbox dropdown start-->
				<li id="header_inbox_bar" class="dropdown">
				<a href="/calculator/salary">
					<i class="fa fa-money"></i> 
				</a>
				<!-- inbox dropdown end -->
			</ul>
			<!--  notification end -->
		</div>
		<div class="top-menu">
			<ul class="nav pull-right top-menu">
				<li><a class="logout" href="login.html">Logout</a></li>
			</ul>
		</div>
	</header>
	<!--header end-->
	
	<div class="wrapper">
			<form name="inputFrm">
			<table border="0" cellpadding="0" cellspacing="0" class="calculator">
			     <tbody><tr>
			      <td class="terms">
			       <div class="terms_title"></div>
			       <ul>
			            <li>
			                <span class="fl">연봉/월급 선택</span>
			                <span class="fr">
			                    <input type="radio" id="total_salary" name="salary_type" checked="" onclick="showTr()" value="NaN"><label for="total_salary">연봉</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <input type="radio" id="salary" name="salary_type" onclick="hideTr()" value="NaN"><label for="salary">월급</label>
			                </span>
			            </li>
			            <li>
			                <span class="fl">퇴직금</span>
			                <span id="severance_pay_show" class="fr">
			                    <input type="radio" id="addition" name="severance_pay_yn" checked="" value="NaN"><label for="addition">별도</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <input type="radio" id="include" name="severance_pay_yn" value="NaN"><label for="include">포함</label>
			                </span>
			                <span id="severance_pay_hide" style="display:none; padding-top:7px" class="fr">연봉인 경우만 선택</span>
			            </li>
			            <li>
			                <span id="annual" class="fl">연봉</span>
			                <span id="monthly" class="fl" style="display:none">월급</span>
			                <span class="fr">
			                    <input type="text" class="terms_textbox_01" name="pay" maxlength="10" onkeyup="trans_han(this.name,'trans_price');"> 원
			                    <div class="amount"><span style="color:#7157d3;" id="trans_price"></span>원</div>
			                </span>
			            </li>
			            <li>
			                <span class="fl">비과세액 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말"></span>
			                <span class="fr"><input type="text" class="terms_textbox_02" name="tax_free" value="100000" maxlength="10" onkeyup="numChk(this)" disabled=""> 원<div class="enter"><input type="checkbox" id="tax_free_chk" onclick="chkTaxFree()" value="NaN"><label for="tax_free_chk">직접입력</label></div></span>
			            </li>
			            <li>
			                <span class="fl">부양가족수 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" ></span>
			                <span class="fr"><input type="text" class="terms_textbox_03" name="dependent" maxlength="2" value="1" onkeyup="dependentChk(this)"> 명<span class="text"> (본인포함)</span>
			            </span></li>
			            <li>
			                <span class="fl">20세이하 자녀수 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" ></span>
			                <span class="fr" style="vertical-align:top;"><input type="text" class="terms_textbox_03" name="under_twenty" maxlength="2" value="0" onkeyup="dependentChk(this)"> 명 
			                </span>
			            </li>
			             <li style="background:none;" class="btn">
			                 <img src="//www.saraminimage.co.kr/buttons/default/btn_sum.gif" alt="계산하기" hspace="5" onmouseover="this.style.cursor='hand';return true;" onclick="salaryCalc()" style="cursor: pointer;">
			                <img src="//www.saraminimage.co.kr/buttons/default/btn_resum.gif" alt="다시 계산하기" hspace="5" onmouseover="this.style.cursor='hand';return true;" onclick="reseting()" style="cursor: pointer;">
			            </li>
			       </ul>
			      </td>
			      <td class="calculator_arrow"><img src="//www.saraminimage.co.kr/guide/job_help/arrow.gif"></td>
			      <td class="receipt">
			       <div class="receipt_title"></div>
			       <ul>
			        <li>
			            <span class="fl">국민연금 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp4');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp4');"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="national_pension" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">건강보험 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp5');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp5');" style="cursor: pointer;"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="health_insurance" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">장기요양 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp6');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp6');"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="longterm_care_insurance" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">고용보험 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp7');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp7');" style="cursor: pointer;"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="unemployment_insurance" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">소득세 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp8');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp8');"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="income_tax" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">지방소득세 <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp9');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp9');"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="residence_tax" readonly=""> 원</span>
			        </li>
			        <li>
			            <span class="fl">공제액 합계</span>
			            <span class="fr"><input type="text" class="receipt_textbox_01" name="total_tax_deduction" readonly=""> 원</span>
			        </li>
			        <li class="bg">
			            <span class="fl" style="padding-bottom:4px;"><span class="sum">예상 실수령액(월)</span> <img src="//www.saraminimage.co.kr/guide/job_help/calculator_tip.gif" alt="도움말" onmouseover="showTip(this, 'calcHelp10');this.style.cursor='hand';return true;" onmouseout="hideTip('calcHelp10');"></span>
			            <span class="fr"><input type="text" class="receipt_textbox_02" name="after_tax_income" readonly=""> 원</span>
			        </li>
			       </ul>
			      </td>
			     </tr>
			    </tbody></table>
			</form>







	</div>
</div>
	

<script type="text/javascript">
	var mainRouter = {};
	mainRouter.goSalary = function() {
		window.location = "/calculator/salary";
	};
	
	// 연봉/월급 선택
	function hideTr () {
	  var objRadio = $('severance_pay_show');
	  var objSpan = $('severance_pay_hide');
	  var objAnnual = $('annual');
	  objRadio.style.display = 'none';
	  objSpan.style.display = '';
	  document.getElementById('annual').innerHTML = '월급';

	}

	function showTr () {
	  var objRadio = $('severance_pay_show');
	  var objSpan = $('severance_pay_hide');
	  var objAnnual = $('annual');
	  objRadio.style.display = '';
	  objSpan.style.display = 'none';
	  document.getElementById('annual').innerHTML = '연봉';
	}

	// 비과세 직접 입력 체크
	function chkTaxFree () {
	    var form = document.inputFrm;
	    var objBox = $('tax_free_chk');
	    if (objBox.checked == true) {
	        form.tax_free.disabled = false;
	        form.tax_free.value = '';
	        form.tax_free.focus();
	        form.tax_free.style.background = "";
	        form.tax_free.style.border = "1px solid #8b75dc";
	        form.tax_free.style.color = "#444";
	    } else {
	        form.tax_free.disabled = true;
	        form.tax_free.value = '100000';
	        form.tax_free.style.background = "#f3f3f3";
	        form.tax_free.style.border = "1px solid #cfcfcf";
	        form.tax_free.style.color = "#cccccc";
	    }
	}

	// 콤마 지우기
	function comma_del(box) {
	    var i=0;
	    var d;
	    var outstr="";
	    
	    for(d = 0; d < box.value.length ; d++) {
	        var subt= box.value.substring(d,d+1);
	        if (subt != ",") {
	            outstr += subt;
	        }
	    }     
	    box.value=outstr;
	    return true;
	}

	// 콤마 넣기
	function comma_add(box) {
	    var i; 
	    var inits = "";
	    var num_len = box.value.length;
	    for(i=0; i<num_len; i++) {
	        var sect=box.value.substring(i,i+1);
	        if (sect != ",") {
	            inits += sect;
	        }  
	    }
	    box.value = parseInt(inits);
	    
	    ing=box.value.length % 3; 
	    num_len=(box.value.length - ing) / 3;
	    sect=box.value.substring(0,ing);
	    
	    for(i=0; i<num_len; i++) {
	        if ((ing == 0) && (i == 0)) {
	            sect += box.value.substring(ing+(3*i),ing+3+(3*i));  
	        } else {
	            sect += ",";
	            sect += box.value.substring(ing+(3*i),ing+3+(3*i));  
	        }
	    }
	    box.value = sect; 
	    
	    return true; 
	}

	// 숫자인지 체크하고 콤마 넣기
	var oldText = "";

	function replaceComma(str) { // 콤마 없애기 
	    while(str.indexOf(",") > -1) { 
	        str = str.replace(",", ""); 
	    } 
	    while(str.indexOf(" ") > -1) { // 공백 없애기
	        str = str.replace(" ", "");
	    }
	    if(str.length > 10) {
	        str = str.substring(0,10);
	    }
	    return str; 
	} 
	 
	function numChk(num){
	    var rightchar = replaceComma(num.value);
	    var moneychar = "";

	    for(index = rightchar.length-1; index>=0; index--) {
	        splitchar = rightchar.charAt(index);
	        if (isNaN(splitchar)) {
	            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
	            num.value = "";      //num.value = oldText; 이전text반환
	            num.focus();
	            return;
	        }
	        moneychar = splitchar+moneychar;
	    }
	    oldText = moneychar;
	}

	function dependentChk(num){
	    var form = document.inputFrm;
	    var rightchar = replaceComma(num.value);
	    var moneychar = "";

	    for(index = rightchar.length-1; index>=0; index--) {
	        splitchar = rightchar.charAt(index);
	        if (isNaN(splitchar)) {
	            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
	            num.value = "";      //num.value = oldText; 이전text반환
	            num.focus();
	            return;

	        }
	        moneychar = splitchar+moneychar;
	        if (index%3==rightchar.length%3&&index!=0) {
	            moneychar=','+moneychar;
	        }
	        
	    }
	    num.value = moneychar;
	    
	    if(num.value > 11){
	    	alert("부양가족수 12명 이상은 11명과 동일하게 계산되므로\r11명까지만 입력이 가능합니다.");
	    	num.value = 10;      //num.value = oldText; 이전text반환
	    }
	    
	    if(num.value == 0 || num.value == '') {
	        num.value = 0;
	    }
	}

	function trans_han(sour, targ){ 
	   s = replaceComma(document.getElementsByName(sour)[0].value); 
	   t = $(targ); 
	   
	   var rightchar = replaceComma(document.getElementsByName(sour)[0].value);
	   var moneychar = "";
	   
	   b1 = ' 일이삼사오육칠팔구'; 
	   b2 = '천백십조천백십억천백십만천백십원'; 
	   tmp = ''; 
	   cnt = 0; 
	   while(s != '') { 
	       cnt++; 
	       tmp1 = b1.substring(s.substring(s.length-1,s.length), Number(s.substring(s.length-1,s.length))+1); // 숫자 
	       tmp2 = b2.substring(b2.length-1,b2.length); // 단위 
	       if (tmp1==' ') { // 숫자가 0일때 
	           if (cnt%4 == 1) { // 4자리로 끊어 조,억,만,원 단위일때만 붙여줌 
	               tmp = tmp2 + tmp; 
	           } 
	       } else { 
	           if (tmp1 == '일' && cnt%4 != 1) { // 단위가 조,억,만,원일때만 숫자가 일을 붙여주고 나머지는 생략 ex) 삼백일십만=> 삼백십만 
	               tmp = tmp2 + tmp; 
	           } else { 
	               tmp = tmp1 + tmp2 + tmp; // 그외에는 단위와 숫자 모두 붙여줌 
	           } 
	       } 
	       b2 = b2.substring(0, b2.length-1); 
	       s = s.substring(0, s.length-1); 
	   } 
	   tmp = tmp.replace('억만','억').replace('조억','조').replace('원',''); // 조,억,만,원 단위는 모두 붙였기 때문에 필요없는 단위 제거 //원 제거
	   if(tmp == '') {
	       tmp = '- ';
	   }
	   t.innerHTML = tmp; 
	   
	   for (index = rightchar.length-1; index>=0; index--) {
	        splitchar = rightchar.charAt(index);
	        if (isNaN(splitchar)) {
	            alert(splitchar +"는 숫자가 아닙니다. \n다시 입력해주세요.");
	            $('trans_price').innerHTML = "- ";
	            document.getElementsByName(sour)[0].value = "";
	            document.getElementsByName(sour)[0].focus();
	            return;
	        }
	        moneychar = splitchar+moneychar;
	    }
	    oldText = moneychar;
	}

	// 풍선도움말 보이기
	function showTip (el, num) {
	    var elt         = $(el),
	        elPos       = elt.positionedOffset(),
	        elPosTop    = elPos.top,
	        tipLayer    = $(num),
	        dimensions  = tipLayer.getDimensions(),
	        tipLayerTop = elPosTop - dimensions.height;
	    
	    tipLayer.style.top     = tipLayerTop;
	    tipLayer.style.display = '';
	}

	// 풍선도움말 숨기기
	function hideTip (num) {
	    $(num).style.display = 'none';
	}

	// 입력값 초기화
	function reseting() {
	    var form = document.inputFrm;
	    showTr();
	    form.reset();
	    form.tax_free.disabled = true;
	    form.tax_free.style.background = "#f3f3f3";
	    form.tax_free.style.border = "1px solid #cfcfcf";
	    form.tax_free.style.color = "#f14c37";
	    $('trans_price').innerHTML = "- ";
	    form.under_twenty.value = 0;
	    
	    for (var i=1; i<=10; i++) {
	        $('calcHelp' + i).style.display = 'none';
	    }
	    cc=0;
	    
	}
	// 20세 이하 사람수 늘리기.
	function plusUnderTwenty(){
		 var form = document.inputFrm;
		 if(parseInt(form.under_twenty.value) < 10){
			 form.under_twenty.value ++;
		 }
		 else{
			 alert("20세 이하 자녀수는 10명 이상은 10명과 동일하게\r 계산되므로 10명까지만 입력이 가능합니다.");
		 }
	}
	 
	// 20세 이하 사람수 줄이기.
	function minusUnderTwenty(){
		 var form = document.inputFrm;
		 if(parseInt(form.under_twenty.value) > 0){
		 form.under_twenty.value --;
		 }
	}
	 
	//#################################################  계산하기 시작 #################################################//
	function salaryCalc() {
		
	    var form = document.inputFrm;
	    
	    // =================================== validation ====================================== //
	    if (form.pay.value == "") {
	        if (form.salary_type[0].checked == true) {
	            alert("연봉이 입력되지 않았습니다.");
	        } else if (form.salary_type[1].checked == true) {
	            alert("월급이 입력되지 않았습니다.");
	        }
	        form.pay.focus();
	        return false;
	    }
	    if (form.tax_free.value == "") {
	        alert("비과세액이 입력되지 않았습니다.");
	        form.tax_free.focus();
	        return false;
	    }
	    if(parseInt(form.under_twenty.value) >= parseInt(form.dependent.value)){
	    	alert("20세이하자녀수가 부양가족수보다 크거나 같습니다.");
	    	 form.dependent.focus();
	         return false;
	    }
	    if (form.dependent.value == ""|| form.dependent.value == "0") {
	        alert("부양가족수가 입력되지 않았습니다.\n본인도 부양가족수에 해당함으로, 1 이상의 수를 입력하세요.");
	        form.dependent.focus();
	        return false;
	    }
	    // 입력받은 값에서 콤마 지우기
	    for (i = 0 ; i < form.elements.length ; i++) {
	        if (form.elements[i].type == "text") {
	            comma_del(form.elements[i]);
	        }
	    }

	    // =================================== 변수 설정 ====================================== //
	    //사용자 입력값받기
	    var input_pay = parseInt(form.pay.value);  // 급여액
	    var tax_free = parseInt(form.tax_free.value); // 비과세액
	    var dependent = parseInt(form.dependent.value); // 부양가족수
	    var under_twenty = parseInt(form.under_twenty.value); // 20세이하자녀수

	    //radio box 값 받기 - 선택된 인덱스(0or1)를 값에 넣어준다.
	    var choose_period = null; // 연봉/월급 선택
	    var retirement_include = null; // 퇴직금 선택
	    if(form.salary_type[0].checked){
	    	choose_period = 0;
	    	if(form.severance_pay_yn[0].checked){
	    		retirement_include = 0;
	    	} else if(form.severance_pay_yn[1].checked){
	    		retirement_include = 1;
	    	}
	    } else if(form.salary_type[1].checked) {
	    	choose_period = 1;
	    }
	    
		// ==================================== api 호출 ======================================== //
	    new Ajax.Request( "/zf_user/tools/salary-calculator-result", {
			method: 'POST',
			evalJSON: true,
			parameters : { 
				input_pay : input_pay,
			    tax_free : tax_free,
			    dependent : dependent,
			    under_twenty : under_twenty,
			    choose_period : choose_period,
			    retirement_include : retirement_include
			},
			onSuccess: function (result) {
				var json = result.responseText.evalJSON();
				
				if (json) {
					form.national_pension.value = json.national_pension;
					form.health_insurance.value = json.health_insurance;
					form.longterm_care_insurance.value = json.longterm_care_insurance;
					form.unemployment_insurance.value = json.unemployment_insurance;
					form.income_tax.value = json.income_tax;
					form.residence_tax.value = json.residence_tax;
					form.total_tax_deduction.value = json.total_tax_deduction;
					form.after_tax_income.value = json.after_tax_income;
					
					for (i = 0 ; i < form.elements.length ; i++) {
				            comma_add(form.elements[i]);
				    }
				}else {
					alert("값이 없습니다.");
				}
			},
			onComplete: function () {},
			onException: function(e) {
			}
		}); 
	}

</script>

</body>
</html>
