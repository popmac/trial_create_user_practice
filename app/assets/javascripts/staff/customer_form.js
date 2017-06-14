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
});
