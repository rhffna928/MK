<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function checkSave(){
    var fm = document.frm;

    if(fm.m_email.value == ""){
        alert("이메일을 입력해주세요");
        fm.m_email.focus();
        return;
    }else if(fm.m_id.value ==""){
        alert("아이디를 입력해주세요");
        fm.m_id.focus();
        return;
    }else if(fm.m_pw.value != fm.m_pw2.value){
        alert("비밀번호가 일치하지 않습니다.");
        fm.m_pw.focus();
        return;
    }else if(fm.m_id.value ==""){
        alert("이메일을 입력해주세요");
        fm.m_email.focus();
        return;
    }else if(fm.m_id.value ==""){
        alert("이메일을 입력해주세요");
        fm.m_email.focus();
        return;
    }else if(fm.m_id.value ==""){
        alert("이메일을 입력해주세요");
        fm.m_email.focus();
        return;
    }else if(fm.m_id.value ==""){
        alert("이메일을 입력해주세요");
        fm.m_email.focus();
        return;
    }
    fm.method = "post";
    fm.action = "${pageContext.request.contextPath}/saveProcess.do";
    fm.submit();
}
    $(document).ready(function(){
		$('#m_pw').blur(function(){
			let pw = $("#m_pw").val();
			let gd2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+~])[a-zA-Z\d!@#$%^&*()_+~]{8,}$/;
			if(pw.match(gd2) != null ){
				result = "good";
		  		$(".successPwChk").text(result).css("color","blue");
		  		$(".pwChk").val(true);
		 	}else{
		 		result = "비밀번호는 8자 이상, 하나 이상의 문자,숫자,특수문자를 넣어주세요";
				$(".successPwChk").text(result).css("color","red");
		  		$(".pwChk").val(false);
		    }
	    });
	});
$(document).ready(function(){

    $("#m_pw").blur(function(){
        $("#successPwChk").text('123');
    });
    $("#m_pw2").blur(function(){
        if($("#m_pw").val() != $("#m_pw2").val()){
        result = "비밀번호가 일치하지 않습니다.";
        $(".successPwChk2").html(result).css("color","red");
        $('#m_pw').val("").trigger("focus");
        $(".pwChk").val(false);
        }else{
        result = "비밀번호가 일치합니다.";
        $(".successPwChk2").html(result).css("color","green");
        $(".PwChk").val(true);
        }return;
    });

    $("#idCheck").click(function(){
        var m_id = $("#m_id").val();
        alert(m_id);
        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/idCheck.do",
            data : {"m_id":m_id
            },
            success : function(data){
                if(data == "N"){
                    $("#search_id").html("사용 가능한 아이디입니다.").css("color","blue");
                }else{
                    $("#search_id").html("이미 사용중인 아이디입니다.").css("color","red");
                    $("#m_id").focus();
                }
            }, error: function(error){alert(error);}
        });
    });
});
</script>
    <%@ include file="/resources/include/header.jsp" %>

        <!-- Section-->
        <section class="py-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <form name="frm">
                    <div>
                    <input class="form-control text-center" type="text" name="m_email" placeholder="이메일">
                    </div>
                    <div>
                    <input class="form-label" type="text" name="m_id" placeholder="아이디" id="m_id">
                    <input type="button" class="btn btn-dark" value="아이디 중복 체크" id="idCheck">
                    </div>
                    <div>
                    <span id="search_id"></span>
                    </div>
                    <div>
                    <input class="form-control-lg text-lowercase" type="password" name="m_pw" placeholder="비밀번호" id="m_pw">
                    <input type="hidden" id="PwChk" name="PwChk">
                    </div>
                    <div>
                    <span class="point successPwChk">비밀번호는 8자 이상, 하나 이상의 문자,숫자,특수문자를 넣어주세요</span>
                    </div>
                    <div>
                    <input class="form-control-lg form-control " type="password" name="m_pw2" placeholder="비밀번호확인" id="m_pw2">
                    </div>
                    <div>
                    <span class="point successPwChk2"></span>
                    <input type="hidden" id="PwChk2" name="PwChk2">
                    </div>
                    <div>
                    <input class="form-control-lg link-secondary" type="text" name="m_tel" placeholder="전화번호">
                    </div>
                    <div>
                    <input class="form-control" type="text" name="m_jumin" placeholder="생년월일 ex)000101">
                    </div>
                    <div class="align-baseline">
                    <input class="form-check-input ratio" style="width: 43%;" id="M" type="checkbox" name="m_gender" value="남" checked>남
                    <input class="form-check-input ratio" style="width: 43%;" id="G" type="checkbox" name="m_gender" value="여">여
                    </div>
                    <div>
                    <input type="button" class="btn btn-dark" value="회원가입" onclick="checkSave();">
                    </div>
                </div>
            </form>

        </section>

    <%@ include file="/resources/include/footer.jsp" %>