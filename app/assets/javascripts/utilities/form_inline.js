document.addEventListener('turbolinks:load', function(){
  var controls = document.querySelectorAll('.form-inline-link');
  if (controls.length) {
    for (var i = 0; i < controls.length; i++){
      controls[i].addEventListener('click', formInlineLinkHandler);
    }
  }

  var errors = document.querySelector('.resource-errors');

  if (errors) {
    var resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault();
  var testId = this.dataset.testId;
  formInlineHandler(testId);
}

function formInlineHandler(id) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + id + '"]');
  var testTitle = document.querySelector('.test-title[data-test-id="' + id + '"]');
  var formInline = document.querySelector('.form-inline[data-test-id="' + id + '"]');

  if (!(link && testTitle && formInline)) {
    return;
  }

  if (formInline.classList.contains('hide')) {
    formInline.classList.remove('hide');
    testTitle.classList.add('hide');
    link.textContent = 'Cancel';
  }
  else {
    formInline.classList.add('hide');
    testTitle.classList.remove('hide');
    link.textContent = 'Edit';
  }
}
