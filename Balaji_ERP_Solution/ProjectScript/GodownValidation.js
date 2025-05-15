function validateAndSubmitForm() {
    $(".validation-message").text("");
    $(".form-control").css("border-color", "");
    var isValid = true;

    if ($("#CompanyId").val() == "") {
        $("#CompanyNameSpan").text("Please Enter Company Name").css("color", "red");
        $("#CompanyId").css("border-color", "red");
        isValid = false;
    } else {
        $("#CompanyNameSpan").text("");
        $("#CompanyId").css("border-color", "");
    }

    if ($("#ddlPlant").val() == "") {
        $("#PlantSpan").text("Please Enter GST").css("color", "red");
        $("#ddlPlant").css("border-color", "red");
        isValid = false;
    } else {
        $("#PlantSpan").text("");
        $("#ddlPlant").css("border-color", "");
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


    if (isValid) {
        $("#GodownForm").submit();
    }
}
