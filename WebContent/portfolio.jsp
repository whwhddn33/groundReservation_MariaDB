<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <meta charset='utf-8'>
    <meta charset="utf-8" />
	<meta name="viewport"content="width=device-width, initial-scale=1, user-scalable=no" />
    <link href="${pageContext.request.contextPath}/assets/css/portfolio.css" type="text/css" rel="stylesheet" />
    
</head>
<body>
    <div id = wrapper>
        <div id = header>
            <div id = navi>
                <ul>
                    <li>Top</li>
                    <li>About</li>
                    <li>Skills</li>
                    <li>Project</li>
                    <li>MoreInfo</li>
                </ul>
            </div>
        </div>
        <div id = contents>
            <div id = top>
                <h1>I LOVE DEVELOPE</h1>
            </div>
            <div id = about style="height: 30vh;">
                <div class = about_title>
                    <h1>About</h1>
                </div>
                <div class = about_content>
                    <section class = about_section>
                        <div id = about_content_1>노력과 습득</div>
                        <div id = about_content_2>해결과 극복</div>
                        <div id = about_content_3>성취와 인정에</div>
                        <div id = about_content_4>희열을 얻는 개발자</div>
                        <div id = about_content_5><strong style="font-weight: 600;"> 조종우</strong>입니다.</div>
                    </section>
                </div>
            </div>
            <div id = skills style="height: 70vh;">
                <h1 class = skill_title>
                    Skills
                </h1>
                <div class = skill_contents>
                    <h2>Front</h2>
                    <span>
                        <div class = imgwrapper>
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/html5.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/css-3.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/javascript-js-seeklogo.com.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/jquery.png" alt="" style="width: 200px;">
                        </div>
                    </span>
                    <h2>Back</h2>
                    <span>
                        <div class = imgwrapper>
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/c-programming-language-seeklogo.com.png" alt="">                        
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/c.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/java.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/javascript-js-seeklogo.com.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/python-seeklogo.com.png" alt="" style="width: 80px;">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/SeekPng.com_java-png_2646641.png" alt="" style="width: 80px;">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/spring-boot-seeklogo.com.png" alt="" >
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/MyBatis.png" alt="">
                        </div>
                    </span>
                    <h2>DB</h2>
                    <span>
                        <div class = imgwrapper>
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/Oracle.png" alt="" style="width: 180px;">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/MySQL.png" alt=""style="width: 150px;">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/mariadb.png" alt=""style="width: 100px;">
                        </div>
                    </span>
                    <h2>ETC</h2>
                        <div class = imgwrapper>
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/github-seeklogo.com.png" alt="">
                            <img class = imgthumbnail src="${pageContext.request.contextPath}/images/logopng/subversion-seeklogo.com.png" alt="">
                        </div>
                </div>
            </div>
            <div id = project>
                <h1 class = pjh1>Project</h1>
                <div class =  pj1frame>
                    <iframe src="http://jongwoo.info/" ></iframe>
                </div>

                <div class = pjinfo>
                    <h2 class = infoh2>프로젝트 소개 : HIGROUND <a href="http://jongwoo.info/" style="font-size: .5em; color: rgb(255, 81, 0);">바로가기</a></h2>
                    <section class = infop>
                        
                            <h3>기획배경</h3>
                            <p>
                                개인 혹은 단체를 대상으로 하는 구장 이용 서비스를 찾기엔 어려움이 있음.<br>
                                구장 소유주는 자신의 구장 제공을 서비스화 시키기 위한 홈페이지를 찾기에 어려움이 있음.
                            </p>
                            <h3>기획목적</h3>
                            <p>
                                개인의 구장 이용과 구장 소유주의 구장 제공 서비스를 용이하게 하기 위하여.
                            </p>
                            <h3>기대효과</h3>
                            <p>
                                개인의 구장 이용에 대한 어려움 해소.
                                구장 소유주의 경우 자신의 구장에 서비스를 제공하기 용이해짐 (이용률 증가).<br>
                                학교 혹은 지역사회와 협약을 맺어 학생들 혹은 동호회의 구장 이용을 용이해짐 (이용률 증가). 
                            </p>
                            <h3>기능요약</h3>
                            <p>
                                구장 이용을 원하는 사람과 구장 제공을 원하는 사람들 사이의 중계 역할.
                                풋살장에 대한 정보를 제공하며 예약이 가능.
                            </p>
                            <h3>개발환경(local)</h3>
                            <p>
                                Eclipse photon, JDK8, Dbeaver, Oracle11g, Apache Tomcat v8.5
                            </p>
                            <h3>개발환경(server)</h3>
                            <p>
                                Eclipse photon, JDK8, Dbeaver, Apache Tomcat v8.5, <strong style="font-weight: 500; color: rgb(158, 0, 0);">MariaDB(10.2),NCLOUD PLATFORM, centOS-7.3-64, Linux</strong>
                            </p>
                            <h3>API/LIB</h3>
                            <p>
                                KakaoMap, Daum주소찾기, 동네예보, Gson, AJAX, Jquery, Mybatis, jdbc, jstl, cos
                            </p>
                            <h3>개발기간</h3>
                            <p>
                                (team)2021.04.21~<br>(solo)2021.05.11~
                            </p>
                            <div class = infotable>
                                <img class = tableimg src="${pageContext.request.contextPath}/images/table.png" alt="">
                            </div>
                    </section>
                    
                </div>
                
                
            </div>
            <div id = moreinfo>
                <h1 class = Moreinfoh1>MoreInfo</h1>
                <div class = photo>
                    <img src="${pageContext.request.contextPath}/images/KakaoTalk_20210616_212019825.jpg" alt="">
                </div>
                    <p>BLOG : <a href="https://blog.naver.com/whddn0330">https://blog.naver.com/whddn0330</a></p>
                    <p>GITHUB : <a href="https://github.com/whwhddn33">https://github.com/whwhddn33</a></p>
                    <p>E-mail : whddn0330@naver.com</p>
                    <p>CALL : 010.2982.0330</p>
            </div>
            
        </div>
        <div id = footer>
        </div>

    </div>
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.cssscript.com/demo/simple-typewriter-effect-pure-javascript-typewriterjs/typewriter.js"></script>
<script>

 var typing = document.getElementById('top');
 var typewriter = new Typewriter(typing, {
     loop: true
 });
  
 typewriter.typeString('System.out.println(jongwoo.getClass().getName());')
     .pauseFor(2500)
     .deleteAll()
     .typeString('java.lang.Object')
     .start();
 
$('#navi').on('click','ul li',function(){
    if($(this).text()==='Top'){
        $('html, body').animate({scrollTop : $('#top').offset().top},400);
    }else if($(this).text()==='About'){
        $('html, body').animate({scrollTop : $('#about').offset().top},400);
    }else if($(this).text()==='Skills'){
        $('html, body').animate({scrollTop : $('#skills').offset().top},400);
    }else if($(this).text()==='Project'){
        $('html, body').animate({scrollTop : $('#project').offset().top},400);
    }else{
        $('html, body').animate({scrollTop : $('#moreinfo').offset().top},400);
    }
});
$(document).ready(function(){

    (async function(){
        for(var i = 1; i<6;i++){
    $('#about_content_'+i+'').fadeTo(800,1);
    await sleep(1500);
    }
    })();
});
function sleep(t){
   return new Promise(resolve=>setTimeout(resolve,t));
}
</script>
</html>