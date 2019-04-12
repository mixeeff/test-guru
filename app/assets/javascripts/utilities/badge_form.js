document.addEventListener('turbolinks:load', function(){

  var categoryButton = document.getElementById('badge_rule_type_category_id');
  if (categoryButton) { categoryButton.addEventListener('change', showCategorySelect); };

  var levelButton = document.getElementById('badge_rule_type_level');
  if (levelButton) { levelButton.addEventListener('change', showLevelSelect); }

  var passButton = document.getElementById('badge_rule_type_pass');
  if (passButton) { passButton.addEventListener('change', setPass); };
})

//var ruleValueSelector = document.getElementById('badge_rule_value');

function changeSelectors() {

  var firstSelector = document.getElementById('badge_rule_value');
  var secondSelector = document.getElementById('badge_temp');

  if (!(firstSelector && secondSelector)) {
    return;
  }
  firstSelector.parentNode.classList.add('hide');
  secondSelector.parentNode.classList.remove('hide');

  firstSelector.name = 'badge[temp]';
  firstSelector.id = 'badge_temp';
  secondSelector.name = 'badge[rule_value]';
  secondSelector.id = 'badge_rule_value';
}

function showLevelSelect() {
  var cat = document.querySelector('.category-select');
  var lev = document.querySelector('.level-select');
  if (!(cat && lev)) {
    return;
  }
  lev.classList.remove('hide');
  lev.children[0].name = 'badge[rule_value]';
  cat.classList.add('hide');
  cat.children[0].name = 'badge[temp]';
}

function showCategorySelect() {
  var cat = document.querySelector('.category-select');
  var lev = document.querySelector('.level-select');
  if (!(cat && lev)) {
    return;
  }
  cat.classList.remove('hide');
  cat.children[0].name = 'badge[rule_value]';
  lev.classList.add('hide');
  lev.children[0].name = 'badge[temp]';
}

function setPass() {
  var cat = document.querySelector('.category-select');
  var lev = document.querySelector('.level-select');

  if (!(cat && lev)) {
    return;
  }
  lev.classList.add('hide');
  cat.classList.add('hide');
}
