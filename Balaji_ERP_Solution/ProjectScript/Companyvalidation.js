function validateAndSubmitForm() {
    $(".validation-message").text("");
    $(".form-control").css("border-color", "");
    var isValid = true;

    if ($("#CompanyName").val() == "") {
        $("#CompanyNameSpan").text("Please Enter Company Name").css("color", "red");
        $("#CompanyName").css("border-color", "red");
        isValid = false;
    } else {
        $("#CompanyNameSpan").text("");
        $("#CompanyName").css("border-color", "");
    }

    if ($("#GST").val() == "") {
        $("#GSTSpan").text("Please Enter GST").css("color", "red");
        $("#GST").css("border-color", "red");
        isValid = false;
    } else {
        $("#GSTSpan").text("");
        $("#GST").css("border-color", "");
    }

    if ($("#CompanyAddress").val() == "") {
        $("#CompanyAddressSpan").text("Please Enter Company Address").css("color", "red");
        $("#CompanyAddress").css("border-color", "red");
        isValid = false;
    } else {
        $("#CompanyAddressSpan").text("");
        $("#CompanyAddress").css("border-color", "");
    }

    var companyContact = $("#idCompanyContact").val().trim();
    if (companyContact === "") {
        $("#CompanyContactSpan").text("Please Enter Contact Number").css("color", "red");
        $("#idCompanyContact").css("border-color", "red");
        isValid = false;
    } else if (!/^\d{10}$/.test(companyContact)) {
        $("#CompanyContactSpan").text("Contact Number must be 10 digits").css("color", "red");
        $("#idCompanyContact").css("border-color", "red");
        isValid = false;
    } else {
        $("#CompanyContactSpan").text("");
        $("#idCompanyContact").css("border-color", "");
    }


    if (isValid ) {
        $("#companyForm").submit();
    }
}
