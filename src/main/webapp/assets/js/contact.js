$(function () {
    $('form#contact_form').submit(function (e) {

        $('form#contact_form.error').remove();
        var hasError = false;
        var $name = $('form input[name="name');
        var $surname = $('form input[name="surname');
        var $username = $('form input[name="username');
        var $password = $('form input[name="password');
        var $title = $('form input[name="title');
        var $description = $('form input[name="description');
        var $categories = $('form input[name="categories');

        if ($name.val() === '') {
            $('#nameErrorMessage').show();
            $('#name').addClass('inputError');
            hasError = true;
        } else {
            $('#nameErrorMessage').hide();
        }
        if ($surname.val() === '') {
            $('#surnameErrorMessage').show();
            $('#surname').addClass('inputError');
            hasError = true;
        } else {
            $('#surnameErrorMessage').hide();
        }
        if ($username.val() === '') {
            $('#usernameErrorMessage').show();
            $('#username').addClass('inputError');
            hasError = true;
        } else {
            $('#usernameErrorMessage').hide();
        }
        if ($password.val() === '') {
            $('#passwordErrorMessage').show();
            $('#password').addClass('inputError');
            hasError = true;
        } else {
            $('#passwordErrorMessage').hide();
        }
        if ($title.val() === '') {
            $('#titleErrorMessage').show();
            $('#title').addClass('inputError');
            hasError = true;
        } else {
            $('#titleErrorMessage').hide();
        }

        if ($description.val() === '') {
            $('#descriptionErrorMessage').show();
            $('#description').addClass('inputError');
            hasError = true;
        } else {
            $('#descriptionErrorMessage').hide();
        }


        if (hasError) {
            e.preventDefault();
        }


    });
});
