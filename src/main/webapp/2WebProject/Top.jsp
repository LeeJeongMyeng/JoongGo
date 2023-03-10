<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
       import="jspexp.a13_database.*"
   %>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/KakaoLogin.js" ></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/Top.css?after">
<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<link rel="stylesheet" type="text/css" href="css/LoginForm.css">
<style>
.help-tip{
	position: absolute;
    bottom: 2px;
    right: 51px;
    text-align: center;
    /* background-color: #BCDBEA; */
    background-image: url(img/main/bforAlram.jpg); 
    background-size: cover;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    font-size: 14px;
    line-height: 26px;
    cursor: default;
}
#tipalam{
	position: absolute;
    width: 31px;
    bottom: 5px;
    right: -27px;
}

.help-tip:before{
}

.help-tip:hover .tips{
	display:block;
	transform-origin: 0% 0%;
	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;
}

.help-tip .tips{
	display: none;
    text-align: left;
    background-color: #FDF5E6;
    padding: 20px;
    width: 300px;
    border: 1px solid black;
 
    border-radius: 3px;
    box-shadow: 1px 1px 1px rgb(0 0 0 / 20%);
    right: 100;
   
    color: black;
    font-size: 13px;
    margin-top: 40px;
    margin-left: -127px;
    line-height: 1.4;
}
.help-tip>.tips .tip{
 background-color:white;
 padding:5px;
 margin-bottom:15px;
 border:1px solid #c8c8c8;
}
.help-tip>.tips .tip ul li{
     margin-bottom: 5px;
     text-align:center;
}
.help-tip>.tips .tip ul li button{
   margin: 6px;
    background: #A83CA8;
    color: white;
    font-size: 16px;
    width: 75px;
    height: 32px;
    border-radius: 5px;
    border: none;
}

.help-tip .tips:before{
	position: absolute;
    content: '';
    width: 0;
    height: 0;
    border: 6px solid transparent;
    border-bottom-color: #1E2021;
    right: 10px;
    top: 40px;
}

.help-tip .tips:after{
	width:100%;
	height:40px;
	content:'';
	position: absolute;
	top:-40px;
	left:0;
}

@-webkit-keyframes fadeIn {
	0% { 
		opacity:0; 
		transform: scale(0.6);
	}
	100% {
		opacity:100%;
		transform: scale(1);
	}
}

@keyframes fadeIn {
	0% { opacity:0; }
	100% { opacity:100%; }
}??? 



</style> 
<script>


</script>
</head>
<body>

<div class="top_wrap">
				<div class="Logo"><a href="Main.jsp"><img src="img\main\Logo.png"></a></div>
					<div class="Top">
						<div class="Menubox">
						<div id="horizon_underLine"></div>
							<ul>
								<li><button type="button" class="MCBtn2" value="0">????????????</button></li>
								<li><button type="button" class="MCBtn2" value="1">??????????????????</button></li>
								<li><button type="button" class="MCBtn2" value="2">?????????TOP3</button></li>
								<li><button type="button" class="MCBtn2" value="3">???????????????</button></li>
							</ul>
						</div>
						<div>
						   <form class="SearchProdForm" action="ProdSearch.jsp">
							<input id="Top_Searchbox" name="productname" type="text" placeholder="?????? ?????? ?????? ??????"/>
							<input id="Top_Submit" type="submit" />
						   </form>
						</div>
						<div class="Top_UserInfo">
						  <c:choose>
						    <c:when test="${Login.id eq null}">
							    <div id="Top_SignUp"><a href="SignUp.jsp" >????????????</a></div>
								<input type="checkbox" id="popup">
								<label for="popup">?????????</label>
								<div>
									<div>
										<label for="popup"><div>X</div></label> <!-- ?????? -->
										<div>	
											<div> 
											<div id="New_MainText2" style="text-align:center;">?????????</div>
											<div id="Login_form">
											<!-- <form id="Login_form2" action="Login/LoginAccess.jsp"> -->										
											 <form id="Login_form2" action="CheckUser.jsp"> 									
													<input type="text" name="Login_id" placeholder=" ????????? ??????" ><br>
													<input type="password" name="Login_password" placeholder=" ???????????? ??????" ><br>
													<input type="hidden" name="CheckUser" value="NormalLogin"/>
													<div id="Login_find">????????? | ?????????????????? 
													<a href="Market_signUp.jsp" style="color:purple;">&nbsp;&nbsp;&nbsp;????????????</a></div><br>
													<ul>
														<li onclick="kakaoLogin();"><a href="javascript:void(0)"><img src="img\main\KakaoLoginLogo.png"></a></li>
													</ul>
												<input type="submit" value="?????????">
											</form>		
											</div>
											<c:set var="alamcount" scope="page" value="0"/> <%--???????????? ??????????????? --%>
											</div>
										</div>
									</div>
									<label for="popup"></label><!-- ??????????????? ?????? -->
								</div>
								    </c:when>
								    <c:when test="${Login.id ne null }">
								    	<c:choose> 
								    		<c:when test="${Login_profileimage ne null }">
								    			<div id="User_Profile_image"><img src="${Login_profileimage}"></div>
								    		</c:when>
								    		<c:otherwise>
								    		   <div id="User_Profile_image2"><img src="img\main\UnknownUser2.png"></div>
								    	</c:otherwise>
								    </c:choose>
								    
								    <jsp:useBean id="al" class="webproject.Alert"/>
								    <jsp:useBean id="alert" class="webproject.AlertVO"/>
								    	<jsp:setProperty property="id" name="alert" value="${Login.id }"/>
								    	<jsp:setProperty property="name" name="alert" value="${Login.username }"/>
								    <c:if test="${Login.userdiv=='?????????'}">
								  	 	<jsp:setProperty property="id" name="alert" value="${Login.userdiv}"/>
								    </c:if>
								    <c:set var="alamcount" scope="page" value="${al.countMAlert(alert) }"/>
								    
								    
								    <div class="help-tip"> <img id="tipalam" src="img/main/alam.png"/>
								    	<div class="tips">
								    	  <c:forEach var="pd" items="${al.getAlertList(alert)}">
								    		<div class="tip">
									    		<ul>
										    		
										    		<c:choose>
										    			<c:when test="${pd.alerttype=='????????????' }">
										    			<li>${pd.sendid}${pd.alertcontent }<br>
											    			<li>????????????: ${pd.resdate }<br>
											    			<li>????????????: ${pd.productno}???<br>	
											    			<li><button type="button" onclick="deletealert('call','${pd.alertno}',
											    			'${pd.moveurl}','${pd.id}')">??????</button>
										    			</c:when>
										    			<c:when test="${pd.alerttype=='??????' }">
											    			<li>${pd.sendid}${pd.alertcontent }<br>
											    			<li>????????????: ${pd.productno}???<br>	
											    			<li><button type="button" onclick="deletealert('move','${pd.alertno}',
											    			'${pd.moveurl}')">????????????</button>
										    			</c:when>
											    		<c:otherwise>
											    			<li>${pd.alertcontent }<br>
											    			<li>????????????: ${pd.qnano}???<br>	
											    			<li><button type="button" onclick="deletealert('move','${pd.alertno}',
											    			'${pd.moveurl}')">????????????</button>
											    		</c:otherwise>
										    		</c:choose>
										    		<button type="button" onclick="deletealert('del','${pd.alertno}')">??????</button> 
									    		</ul>
								    		</div>
								    		</c:forEach>
								
								    		
								    		
								    	
								    	</div>
								    	
								    </div>
						    	<div id="User_Information">
							    	<ul>
								    	<li><strong>?????????:</strong>${Login.username }</li>
								    	<li><strong>??????ID:</strong>${Login.nickname }</li>
								    	<li><strong>?????????:</strong>${Login.point }</li>
							    	</ul>
						    	</div>
						    	<div id="User_Count_Info">
							    	<ul>							    	
							    	<li><strong>????????????:</strong>${Login.salecount }???</li>
							    	<li><strong>????????????:</strong>${Login.buycount }???</li>
							    	<li><strong>????????????:</strong>${Login.declarationcount }???</li>
							    	
							    	</ul>
						    	</div>
						    	<div id="LogoutBtn" onclick="Insert('Logout')"><a href="#">????????????</a></div>
						    	<div id="MyPegeBtn"><a href="MyPage.jsp">???????????????</a></div>
						    </c:when>
						  </c:choose>
						  
						  
						</div>
						<div id="checkbox_wrap">
							<input type="checkbox" id="menuicon"> 
							<label for="menuicon">
								<span></span>
								<span></span>
								<span></span>
								<div>??????</div>
							</label>
							<div class="sidebar">
								
								<div class="UserMenu"> ?????? ??????
								<div id="vertical_nuderline"></div>
									<nav>
										<a href="#" onclick="Insert('userInfoUpdate')">??????????????????</a>
										<a href="#" onclick="Insert('Logout')">????????????</a>
										<a href="#" onclick="Insert('MyPage')">???????????????</a>
										<a href="#" onclick="Insert('userDelete')">????????????</a>
									</nav>						
								</div>
								<div class="OtherMenu"> ????????????
								<!-- <div class="vertical_nuderline"></div> -->
									<nav>
										<a href="ProdSearch.jsp">????????????</a>
										<a href="#" onclick="Insert('Insertprod')">????????????</a>
										<a href="#">????????????</a>
										<a href="#" onclick="Insert('InsertQnA')">????????????</a>
									</nav>						
								</div>
							</div>
						</div>
					</div>
			</div>	
</body>


<script>
/*????????? ????????? ????????? bar ????????????*/
var verticalnuderline = document.querySelector("#vertical_nuderline")
var verticalMenu = document.querySelectorAll(".sidebar nav a")
verticalMenu.forEach((menu)=>
	menu.addEventListener('mouseover',(e) => verticalLineEvent(e))
);

var horizonunderLine = document.querySelector("#horizon_underLine")
var horizonMenus = document.querySelectorAll (".MCBtn")
horizonMenus.forEach((menu)=>
	menu.addEventListener('mouseover',(e) => horizonLineEvent(e))
);
horizonMenus.forEach((menu)=>
menu.addEventListener('mouseout',(e) => horizonLineOutEvent(e))
);

function verticalLineEvent(e){
	verticalnuderline.style.right = e.currentTarget.offsetRight +"px";
	verticalnuderline.style.width = e.currentTarget.offsetWidth +"px";
	verticalnuderline.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";	
}
function horizonLineEvent(e){
	horizonunderLine.style.left = e.currentTarget.offsetLeft +"px";
	horizonunderLine.style.width = e.currentTarget.offsetWidth +"px";
	//horizonunderLine.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";
}
function horizonLineOutEvent(e){
	horizonunderLine.style.left = "0px";
	horizonunderLine.style.width = "0px";
	//horizonunderLine.style.top = e.currentTarget.offsetTop+e.currentTarget.offsetHeight +"px";
}
/*-----???????????? ????????????---------------------------------------------------------------------------------*/

/* $(document).ready(function(){ 
	$(".MCBtn").click(function(){
		var MCW = document.querySelector('.Main_Container_Wrap')
		if($(this).val() == 0){
			location.href="Main.jsp";
		}
		else{
		var value=$(this).val(); //?????? ????????? value??? ?????????
		//console.log(value)
		var valueM= -(value*100) // ??????value??? ????????? ??????????????? ??????
		//console.log(valueM)
		// ??????????????? translate??? ????????? ????????? ??????
		
		MCW.style.transform = 'translate('+valueM+'vw)';
		}
	})  
})
 */
 $(document).ready(function(){	
		$(".MCBtn2").click(function(){	
				location.href="Main.jsp?translate="+$(this).val();
		})
		
		
	})

	
	
function Insert(val){
	if(${Login.id==null}){
		alert("????????? ??? ?????????????????????.")
		return false;
	}else{
		if(val=='userDelete'){
			var a = prompt("????????? ?????? ????????? ??????????????? ??????????????????", "");
			
			if(a=='${Login.password}'){
			var winX = (document.body.offsetWidth / 2) - (400 / 2);
			var winY= (window.screen.height / 2) - (300 / 2);
			window.open("userRemove.jsp", "??????????????????",
			"width=500, height=210,left="+ winX + ", top="+ winY+", toolbar=no,menubar=no, scrollbars=no, resizable=yes" );
			}
		}else if(val=='Logout'){
			kakaoLogOut()
		}
		else{
		location.href=val+".jsp"
		}
	}
}

//??????????????????
var alamcount = ${alamcount};

		if(alamcount>0){
			$("#tipalam").css("display","block")
		}else{
			$("#tipalam").css("display","none")
		}

function deletealert(act,alertno,url){
	location.href="CheckAlert.jsp?alertval="+act+"&alertno="+alertno+
			      "&moveurl="+url
	
}



</script>
</html>