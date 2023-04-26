<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	



<div class="warningbox">
	<span class="icon"></span>			
	<div class="inner">
		<p>당진시에서는 시민의 의견을 수렴, 시정에 반영하고자 별도의 인증을 받고 있습니다.</p>
		<p>개인의 이메일 주소와 이름을 입력하여 주세요</p>
	</div>
</div>


<form action="" method="post" name="agreeForm">

	<div class="loginbox dubble auth">
		<span class="tp_icon circle circle1">
         <span class="tp_icon icon icon1"></span>
   	</span>
		<div class="row login_id">
			<label for="eduNumer">이메일</label>
			<div class="form-number">
				<input type="text" id="eduNumer" name="eduNumer" value="">
			</div>
		</div>
		<div class="row login_pw">
			<label for="eduPassword">이름</label>
			<div class="form-number">
				<input type="password" id="eduPassword" name="eduPassword" value="">
			</div>
		</div>
		<div class="bottom_button center"><input class="input_button color1" type="submit" value="확인"></div>
	</div>

</form>
