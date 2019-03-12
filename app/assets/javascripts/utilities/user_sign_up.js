document.addEventListener('turbolinks:load', function(){
  var conf = document.querySelector('input[id=user_password_confirmation]');
  if (conf) {
     conf.addEventListener('input', comparePasswords);
   }
})

function comparePasswords() {
  pass = document.querySelector('input[id=user_password]');
  pass_conf = document.querySelector('input[id=user_password_confirmation]');
  icon_x = document.querySelector('.octicon-x');
  icon_check = document.querySelector('.octicon-check');
  group = document.querySelector('.input-group-append');

  if (pass_conf.value == "") {
    group.classList.add('hide');
    return;
  }

  group.classList.remove('hide');

  if (pass_conf.value == pass.value) {
    icon_check.classList.remove('hide');
    icon_x.classList.add('hide');
  }
  else {
    icon_x.classList.remove('hide');
    icon_check.classList.add('hide');
  }

}
