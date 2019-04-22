document.addEventListener('turbolinks:load', function(){
  var type_selector = document.getElementById('badge_rule_type');
  if (type_selector) {
    type_selector.addEventListener('change', setValueSelector);
  };
})

//var ruleValueSelector = document.getElementById('badge_rule_value');

function setValueSelector() {
  var value_selector = document.getElementById('rule_value');
  var new_selector_name = 'rule_value_' + this.selectedIndex;
  var new_selector = document.getElementById(new_selector_name);
  if ((new_selector) && (value_selector)) {
    value_selector.innerHTML = new_selector.innerHTML
  }
  else {
    value_selector.innerHTML = '';
  }
}
