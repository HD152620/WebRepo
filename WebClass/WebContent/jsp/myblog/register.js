$(document).ready(function () {
     $('#registerForm').submit(function (event) {
              event.preventDefault();
              var id= $('#id2').val();
              var pwd= $('#pwd2').val();
              console.log(id, pwd);
      $.post("http://httpbin.org/post",
                    {"id":id,"pwd":pwd},
                    function(data){
                       var myModal = $('#registerModal');
                       myModal.modal();
                       myModal.find('.modal-body').text(data.form.id+'님 회원가입 되었습니다.');
                    });
              });
  });