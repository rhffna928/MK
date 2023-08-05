<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function check(){

		var len=document.getElementsByClassName('file').length;
		//alert(len);
		var fileCheck=0;
		for(var i=0 ; i<len;i++){
			//alert(i);
			var f=document.getElementsByClassName("file")[i].value;
			//alert(f);
			if(!f ){
			    fileCheck++;
			}
        }
        var fm = document.frm;

        if(fm.p_name.value == ""){
            alert("상품명을 작성해 주세요");
            fm.p_name.focus();
            return;
        }else if(fm.p_cate_idx.value =="yet"){
            alert("상품 카테고리를 선택해 주세요");
            fm.p_cate_idx.focus();
            return;
        }else if(fm.p_cate_name.value =="yet"){
            alert("상품 카테고리를 선택해 주세요");
            fm.p_cate_name.focus();
            return;
        }else if(fm.p_cate_idx.value =="yet"){
            alert("상품 카테고리를 선택해 주세요");
            fm.p_cate_name.focus();
            return;
        }else if(fileCheck != 0){
            alert("상품 이미지를 선택해 주세요");
            fm.p_img1.focus();
            return;
        }else if(fm.p_price.value ==""){
            alert("상품 가격을 정해 주세요");
            fm.p_price.focus();
            return;
        }else if(fm.p_sale.value == ""){
            alert("상품 할인률을 정해주세요 [ ex)0 ]")
            fm.p_sale.focus();
            return;
        }else if(fm.p_cnt.value == ""){
            alert("상품 수량을 입력해 주세요")
            fm.p_cnt.focus();
            return;
        }
        alert(fm.p_cate_idx.value);
        alert("상품등록 완료");
        fm.enctype = "multipart/form-data";
        fm.action = "${pageContext.request.contextPath}/productAddProcess.do";
        fm.method = "post";
        fm.submit();


    }
    //파일 추가
    function addFile() {
   		var str = "<div class='form-group' id='file-list'><div class='file-group'><input type='file' name='file' id='file' class='file' accept='.jpg, .png'><a href='#this' name='file-delete'>삭제</a></div></div>";
   		$("#file-list").append(str);
		$("a[name='file-delete']").on("click",function(e){
			e.preventDefault();
			deleteFile($(this));
			});
		}
	//파일 추가 끝

	//파일 삭제
	$(document).ready(function(){
	    $("a[name='file-delete']").on("click",function(e){
	        e.preventDefault();
	        deleteFile($(this));
	    });
	});
	function deleteFile(obj){
		obj.parent().remove();
	}
</script>
<script>
    function categoryChange(e){
        var clothes = ["------","상의","하의","신발","모자","원피스","양말","속옷","아우터"];
        var accessory = ["------","마스크","목걸이","팔찌","반지","벨트","스카프/반다나","장갑","기타 액세서리"];
        var living = ["------","가구","주방용품","생활용품","욕실용품","사무용품","홈인테리어","조명","침구"];
        var target = document.getElementById("p_cate_name");


        if(e.value == 100000) var d = clothes;
        else if(e.value == 200000) var d = accessory;
        else if(e.value == 300000) var d = living;

        //alert(e.value);

        target.options.length = 0;

        for (x in d) {
        	var opt = document.createElement("option");
        	opt.value = d[x];
        	opt.innerHTML = d[x];
        	target.append(opt);
        }
    }
</script>

    <%@ include file="/resources/include/header.jsp" %>

        <!-- Section-->
        <section class="py-5">
            <form name="frm">
                <table border="1"  style="margin-left:0;">
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" name="p_name" placeholder="상품명">
    				        <input type="button" id="checkP_n" value="중복검사"/>
    				    </td>
    				</tr>
                    <tr>
                        <th>분류</th>
                        <td>
                            <select class="form-select" name ="p_cate_idx" id="p_cate_idx" onchange="categoryChange(this)" style="margin-bottom:10px;">
                            	<option value="yet" >------</option>
                            	<option value="100000">의류</option>
                                <option value="200000">악세사리</option>
                                <option value="300000">리빙</option>
                            </select>
                            <select class="form-select" name ="p_cate_name" id="p_cate_name" >
                            	<option value="yet" >------</option>
                            </select>
    				    </td>
    				</tr>
    				<tr>
				        <th>상품이미지</th>
                        <td>
						    <div class="form-group" id="file-list">
                                <a href="#this" onclick ="addFile()">파일추가</a>
                                <div class="file-group">
                                    <input type="file" name="file"  id='file' class='file' accept=".jpg, .png">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>상품가격</th>
                        <td>
                            <input type="text" name="p_price" placeholder="상품가격" id="p_price">
                        </td>
                    </tr>
                    <tr>
                        <th>상품할인률</th>
                        <td>
                            <input type="text" name="p_sale" placeholder="상품할인률" id="p_sale">
                        </td>
                    </tr>
                    <tr>
                        <th>상품할인가</th>
                        <td>
                            <input type="text" name="p_disprice" id="p_disprice" maxlength="100" value="" placeholder="적용버튼을 누르세요" readonly>
                            <input type="button"  class="btn btn-light" value="적용"  onClick="calPrice2()" />
                        </td>
                    </tr>
                    <tr>
                        <th>상품수량</th>
                        <td>
                            <input type="text" name="p_cnt" placeholder="상품수량" id="p_cnt">
                        </td>
                    </tr>
                </table>
                <input type="button" class="btn btn-light" value="등록하기" onclick="check();">
            </form>

        </section>

    <%@ include file="/resources/include/footer.jsp" %>