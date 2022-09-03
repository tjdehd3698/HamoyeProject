 
	//로그인 Func
    function check_pw(){
    	 
        var password = document.getElementById('mypage_password').value;
        var passcheck = document.getElementById('mypage_passcheck').value;
        var check_SC = 0;

        if(password.length < 6 || password.length >16){
            alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('mypage_password').value='';
            document.getElementById('mypage_password').focus();
        }
        if(password !='' && passcheck !=''){
            if(password ==passcheck){
                document.getElementById('mypage_check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('mypage_check').style.color='blue';
            }
            else{
                document.getElementById('mypage_check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('mypage_check').style.color='red';
            }
        }
    }
    //현재 취득한 이자계산
    function nowInterest(id, primeRate, balance, participationCount, totalCount){
    	var rate = parseFloat(primeRate)+0.5;
		var balance= balance;
		var participationRate = participationCount/totalCount;
		var nowBalance = parseInt(balance*rate/100*participationRate);
		document.getElementById(id).append(nowBalance+'원');   
    }
    //만료시 취득할 이자 계산
    function winInterest (id, primeRate, balance){
    	var rate = parseFloat(primeRate)+0.5;
		var balance= balance;
    	var winBalance = parseInt((balance*rate)/100);  
    	$('#winInterest').append(winBalance+'원 ');
    }
    //금액 롤링
    function RollingNum(id, number, type) {
    	  var $cntBox = document.getElementById(id);
    	  var $cntNum = number;
    	  var $cntLen = $cntNum.length;
    	  var $numArr=$cntNum.split('');
    	  var delay = 300;
    	  var speed = 100; 
    	  
    	  // 카운트
    	  for ( var i=0; i<$cntLen; i++){ 
    	    var bckI = ($cntLen - i*1) -1;
    	    var num = document.createElement('span');
    	    num.classList.add('num', 'idx'+bckI);
    	    num.setAttribute('data-num',$numArr[i]);
    	    
    	    $cntBox.append(num);
    	    setNum (num, i);
    	  }
    	  
    	  //,처리
    	  if ($cntLen>3) {
    	    for (var i=1; i<=Math.floor($cntLen/3); i++) {
    	      var idx3n = $cntBox.querySelector('.idx'+i*3);
    	      var pointEl = document.createElement('span');
    	      pointEl.classList.add('point');
    	      idx3n.after(pointEl);
    	    }
    	    setTimeout(function(){
    	      var point = $cntBox.querySelectorAll('.point');
    	      point.forEach(el => {
    	        el.innerText=','
    	      });
    	    },(speed*10) + ($cntLen * delay) + speed);
    	  };

    	  function setNum (el, n){
    	    if (type == 'slide') {
    	      setTimeout(function(){
    	        var no=0;
    	        var numHeight = 30;
    	        // style 추가
    	        var style = document.createElement('style');
    	        style.innerHTML=
    	          ".num, .point {display: inline-block;vertical-align: middle;}\
    	          .num {overflow: hidden;}\
    	          .numList {display: inline-block;margin-top:0;text-align: center;transition: all "+(speed/1000)+"s;}"
    	        document.body.appendChild(style);

    	        var numbersDiv = document.createElement('span');
    	        var numbers = '0\n1\n2\n3\n4\n5\n6\n7\n8\n9';
    	        el.style='height:'+numHeight+'px;line-height:'+numHeight+'px;';
    	        numbersDiv.classList.add('numList');
    	        numbersDiv.innerText = numbers;
    	        el.append(numbersDiv);

    	        var intervalNo = setInterval(function(){
    	          no++;
    	          numbersDiv.style='margin-top:'+(no * numHeight * -1)+'px;';
    	          if(no == 10) {
    	            clearInterval(intervalNo);
    	            numbersDiv.style='margin-top:'+(el.getAttribute('data-num') * numHeight * -1)+'px';
    	          }
    	        },speed);
    	      }, delay*i);
    	    }else {
    	      setTimeout(function(){
    	        var no=0;
    	        var intervalNo = setInterval(function(){
    	          el.innerText = no++;
    	          if(no == 10) {
    	            clearInterval(intervalNo);
    	            el.innerText = el.getAttribute('data-num');
    	          }
    	        },speed);
    	      }, delay*i);
    	    }
    	  }
    	}
     
    function checkVisible( elm, eval ) {
        eval = eval || "object visible";
        var viewportHeight = $(window).height(), // Viewport Height
            scrolltop = $(window).scrollTop(), // Scroll Top
            y = $(elm).offset().top,
            elementHeight = $(elm).height();   
        
        if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        if (eval == "above") return ((y < (viewportHeight + scrolltop)));
    }
 