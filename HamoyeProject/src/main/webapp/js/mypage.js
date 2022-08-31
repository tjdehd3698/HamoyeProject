 

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
