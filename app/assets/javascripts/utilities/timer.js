document.addEventListener('turbolinks:load', function(){
  var timer = document.querySelector('.time_left');
  if (timer) {
    var form = document.getElementById('test-passage-form');
    var end_time = timer.dataset.endTime;
    var timerId = setInterval(function() {
      var this_time = Math.floor(new Date() / 1000);
      var time_left = end_time - this_time;
      if (time_left < 0) {
        clearInterval(timerId);
        timer.value = 0;
        form.submit();
        return;
      }
      var minutes = Math.trunc(time_left / 60);
      var seconds = time_left % 60;
      timer.value = leadZero(minutes) + ":" + leadZero(seconds);
    }, 1000);
  }
})

function leadZero(n) {
    return (n < 10 ? '0' : '') + n;
}
