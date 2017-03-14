$( document ).on('turbolinks:load', function() {
  $('form.edit_staff_member').on('click', '#enable-password-field', function() {
    $('#enable-password-field').hide();
    $('#disable-password-field').show();
    $('#staff_member_password').removeAttr('disabled');
    $('label[for=staff_member_password]').addClass('required');
  });
  $('form.edit_staff_member').on('click', '#disable-password-field', function() {
    $('#disable-password-field').hide();
    $('#enable-password-field').show();
    $('#staff_member_password').attr('disabled', 'disabled');
    $('label[for=staff_member_password]').removeClass('required');
  });
});
