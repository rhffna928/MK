<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
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
        var living = ["------","상의","하의","신발","모자"];
        var target = document.getElementById("p_category_s");


        if(e.value == 1) var d = clothes;
        else if(e.value == 2) var d = accessory;
        else if(e.value == 3) var d = living;

        alert(e.value);

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
                            <select class="form-select" name = "p_category_l" id="p_category_l" onchange="categoryChange(this)" style="margin-bottom:10px;">
                            	<option value="yet" >------</option>
                            	<option value="1">의류</option>
                                <option value="2">악세사리</option>
                                <option value="3">리빙</option>
                            </select>
                            <select class="form-select" name ="p_category_s" id="p_category_s" >
                            	<option value="yet" >------</option>
                            </select>
    				    </td>
    				</tr>
    				<tr>
				        <th>상품이미지</th>
                        <td>
						    <div class="form-group" id="file-list">
                                <input type="text" name="p_img1" placeholder="상품이미지">
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
                            <input type="text" name="p_sale" placeholder="할인가" id="p_sale">
                            <input type="text" name="p_disprice" id="p_disprice" maxlength="100" value="" placeholder="적용버튼을 누르세요" readonly>
                            <input type="button"  class="btn btn-light" value="적용"  onClick="calPrice2()" />
                        </td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" name="p_cnt" placeholder="상품수량" id="p_cnt">
                        </td>
                    </tr>
                </table>
                <input type="button" value="상품등록" onclick="check();">
            </form>

        </section>

    <%@ include file="/resources/include/footer.jsp" %>