<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head> 

<script>
function fnSave(){
	location.href = '/ongo/member/join4.do';
}

function selectChange(){
  const target = arguments[0];
  
  const emadr = document.getElementById('USR_EMADR_2');
   
  const selectValue = target.options[target.selectedIndex].value
  const selectText = target.options[target.selectedIndex].text;
  
  if(selectValue == 99){
    emadr.value = '';
    emadr.disabled = false;
  }else{
    emadr.value = selectText;
    emadr.disabled = true;
  }
}
  //이메일
  const emadr1 = document.getElementById('USR_EMADR_1').value;
  const emadr2 = document.getElementById('USR_EMADR_2').value;
  document.getElementById('USR_EMADR').value = emadr1 +'@'+emadr2;

</script>
</head>
<body>
<!-- 이 아래부터  content부분 복사해서 붙여넣기 하시면 됩니다. 하단 footer부분 인클루트 시켜주세요 -->

<!-- content -->
<div id="contents">
        <!-- title -->
        <div class="sub_top">
            <div class="container">
                <h1>회원관리</h1>
            </div>
        </div>
        <!-- //title -->
 
        <!-- 게시판 -->
    <div class="container">
	<form id="saveForm" name="saveForm" action="/ongo/member/memberwrite" method="POST" onsubmit="return checkUsrSubmit()">
		<input type="hidden" id="PSLF_AHTN_INFO_KEYV" name="PSLF_AHTN_INFO_KEYV">
		<div class="cont-box-inner">
			<div class="title">
				<h3 class="h4">회원등록</h3>
				<p class="highlight org-txt">
					* 필수입력사항
				</p>
			</div>
			<div class="tbl grid-layout grid2">
				<div class="grid-item">
					<label for="USR_NM">성명<em class="org-txt asterisk" title="필수">*</em></label>
					<div class="tbl-basic-td">
						<div class="input-wrap">
							<input class="grid-input" type="text" role="textbox" id="USR_NM" name="member_name" maxlength="50" title="성명 입력">
						</div>
					</div>
				</div>
				<div class="grid-item">
					<label for="USR_MBTN">휴대전화번호<em class="org-txt asterisk" title="필수">*</em></label>
					<input type="hidden" id="USR_MBTN" name="USR_MBTN">
					<div class="tbl-basic-td">
						<div class="input-wrap w30" id="select_target_1">
							<select class="form-select grid-input" id="USR_MBTN_1" name="phone1" data-col="USR_MBTN_1" title="휴대전화번호">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						 -
						<div class="input-wrap w30">
							<input class="grid-input" type="text" role="textbox" id="USR_MBTN_2" name="phone2" maxlength="4" title="휴대전화번호 앞자리 입력">
						</div>
						 -
						<div class="input-wrap w30">
							<input class="grid-input" type="text" role="textbox" id="USR_MBTN_3" name="phone3" maxlength="4" title="휴대전화번호 뒷자리 입력">
						</div>
					</div>
				</div>
				<div class="grid-item colspan2">
					<label for="HOFS_ADDR">아이디<em class="org-txt asterisk" title="필수">*</em></label>
					<div class="tbl-basic-td">
						<div class="input-wrap">
							<input class="grid-input" type="text" role="textbox" id="USER_ID" name="member_id" maxlength="12" title="아이디 입력">
						</div>
						<button type="button" class="btn btn-light" onclick="fnIdCheck();"><i class="las la-search"></i>중복확인</button>
					</div>
				</div>
				<div class="grid-item colspan2">
					<label for="ENPWD">비밀번호<em class="org-txt asterisk" title="필수">*</em></label>
					<div class="tbl-basic-td">
						<div class="input-wrap">
							<input class="grid-input" type="password" role="textbox" id="ENPWD" name="member_pw" maxlength="20" title="비밀번호 입력">
						</div>
						<span>영문,숫자,특수문자($@!%*#?&^()-_=+~<>) 조합으로 입력해주세요.(9자리 이상, 20자리 이하)<span></span>
					</div>
				</div>
				<div class="grid-item colspan2">
					<label for="ENPWD2">비밀번호확인<em class="org-txt asterisk" title="필수">*</em></label>
					<div class="tbl-basic-td">
						<div class="input-wrap">
							<input class="grid-input" type="password" role="textbox" id="ENPWD2" name="member_pw2" maxlength="20" title="비밀번호확인 입력">
						</div>
						<span>비밀번호 확인을 위해 한번 더 입력해 주세요.</span>
					</div>
				</div>
				<div class="grid-item colspan2">
					<label for="HOFS_ADDR">주소</label>
					<div class="tbl-basic-td">
						<div class="input-wrap w10">
							<input class="grid-input" type="text" name="zipcode" title="우편번호">
						</div>
						<button type="button" class="btn btn-light">우편번호 검색</button>
						<div class="input-wrap">
							<br>
						</div>
						<div class="">
							<div class="input-wrap ">
								<input class="grid-input" type="text" name="member_addr1" title="주소">
							</div>
							<div class="input-wrap">
								<input class="grid-input" type="text" name="member_addr2" placeholder="상세주소를 입력해주세요.">
							</div>
						</div>
					</div>
				</div>
				<div class="grid-item colspan2">
					<label for="USR_EMADR">이메일주소<em class="org-txt asterisk" title="필수">*</em></label>
					<input type="hidden" id="USR_EMADR" name="USR_EMADR">
					<div class="tbl-basic-td">
						<div class="input-wrap">
							<input class="grid-input" type="text" role="textbox" id="USR_EMADR_1" n name="email1" maxlength="10" title="이메일주소 입력">
						</div>
						 @
						<div class="input-wrap">
							<input class="grid-input" type="text" role="textbox" id="USR_EMADR_2" name="USR_EMADR_2" title="이메일주소 입력" disabled>
						</div>
						<div class="input-wrap w20" id="select_target_3">
							<select class="form-select grid-input" id="" name="email2" data-col="" title="이메일" onchange="selectChange(this);">
								<option value=" ">이메일선택</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@nate.com">nate.com</option>
								<option value="99">직접입력하기</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="btn-area flex-row">
			<button class="btn btn-outline-primary btn-large" type="submit">등록하기</button>
			<button class="btn btn-outline-secondary btn-large" type="button" onclick="history.back()">취소</button>
		</div>
	</form>
</div>
    </div><!-- // content -->

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>
<!-- //Footer -->
</body>
</html>