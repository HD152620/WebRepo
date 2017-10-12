/**
 * 
 */
  $(document).ready(function () {
     $('#loginForm').submit(function (event) {
              // 자동으로 submit되는 걸 막기
              event.preventDefault();
              
              //id,pwd값 가져오기
              //document.getElementById("id").value
              var id= $('#id').val();
              var pwd= $('#pwd').val();
              console.log(id, pwd);
              
              //서버로 post전송(ajax)
              $.post("http://httpbin.org/post",
                    {"id":id,"pwd":pwd},
                    function(data){
                      // alert(data.form.id+'님 로그인 되었습니다.');
                      var myModal = $('#myModal');
                      myModal.modal();
                      myModal.find('.modal-body').text(data.form.id + '님 로그인 되었습니다.')
                    });
     });
  });  