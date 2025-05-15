function validateAndSubmitForm() {
    $(".validation-message").text("");
    $(".form-control").css("border-color", "");
    var isValid = true;

    if ($("#companyDropdown").val() == "") {
        $("#CompanyNameSpan").text("Please Enter Company Name").css("color", "red");
        $("#CompanyName").css("border-color", "red");
        isValid = false;
    } else {
        $("#CompanyNameSpan").text("");
        $("#CompanyName").css("border-color", "");
    }

    if ($("#idPlantName").val() == "") {
        $("#PlantNameSpan").text("Please Enter GST").css("color", "red");
        $("#idPlantName").css("border-color", "red");
        isValid = false;
    } else {
        $("#PlantNameSpan").text("");
        $("#idPlantName").css("border-color", "");
    }

    if ($("#idCapacity").val() == "") {
        $("#CapacitySpan").text("Please Enter Company Address").css("color", "red");
        $("#idCapacity").css("border-color", "red");
        isValid = false;
    } else {
        $("#CapacitySpan").text("");
        $("#idCapacity").css("border-color", "");
    }
    if ($("#idCapacity").val() == "") {
        $("#CapacitySpan").text("Please Enter Company Address").css("color", "red");
        $("#idCapacity").css("border-color", "red");
        isValid = false;
    } else {
        $("#CapacitySpan").text("");
        $("#idCapacity").css("border-color", "");
    }
    if (isValid) {
        $("#plantForm").submit();
    }
}
