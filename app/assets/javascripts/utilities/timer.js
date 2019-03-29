document.addEventListener('turbolinks:load', function(){
  var timer = document.querySelector('.time_left');
  if (timer) {
    var end_time = timer.dataset.endTime;
    var timerId = setInterval(function() {
      var this_time = Math.floor(new Date() / 1000);
      var time_left = end_time - this_time;
      if (time_left < 0) {
        clearInterval(timerId);
        location = timer.dataset.path + '/result?timefailed=true';
        return;
      }
      var minutes = Math.trunc(time_left / 60);
      var seconds = time_left % 60;
      timer.innerHTML = leadZero(minutes) + ":" + leadZero(seconds);
      if ((minutes == 0) && (seconds < 16)) {timer.className = "time_left text-danger"};
    }, 1000);
  }
})

function leadZero(n) {
    return (n < 10 ? '0' : '') + n;
}
