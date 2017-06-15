$( document ).on('turbolinks:load', function() {
  $('form.edit_form').on('click', '#enable-password-field', function() {
    $('#enable-password-field').hide();
    $('#disable-password-field').show();
    $('#form_customer_password').removeAttr('disabled');
    $('label[for=form_customer_password]').addClass('required');
  });

  $('form.edit_form').on('click', '#disable-password-field', function() {
    $('#disable-password-field').hide();
    $('#enable-password-field').show();
    $('#form_customer_password').attr('disabled', 'disabled');
    $('label[for=form_customer_password]').removeClass('required');
  });

  var toggle_home_address_fields = function() {
    var checked = $('input#form_inputs_home_address').prop('checked');
    $('fieldset#home-address-fields input').prop('disabled', !checked);
    $('fieldset#home-address-fields select').prop('disabled', !checked);
    $('fieldset#home-address-fields').toggle(checked);
  };

  var toggle_work_address_fields = function() {
    var checked = $('input#form_inputs_work_address').prop('checked');
    $('fieldset#work-address-fields input').prop('disabled', !checked);
    $('fieldset#work-address-fields select').prop('disabled', !checked);
    $('fieldset#work-address-fields').toggle(checked);
  };

  toggle_home_address_fields();
  toggle_work_address_fields();

  $('input#form_inputs_home_address').on('click', function() {
    toggle_home_address_fields();
  });

  $('input#form_inputs_work_address').on('click', function() {
    toggle_work_address_fields();
  });
});
