document.addEventListener('turbolinks:load', function(){
  var progressBar = document.querySelector('.progress-val');
  if (progressBar) {
      var num = progressBar.dataset.num;
      var total = progressBar.dataset.total;
      var barWidth = Math.round((num/total)*100) + "%";
      progressBar.style.width =  barWidth;
    }
})
