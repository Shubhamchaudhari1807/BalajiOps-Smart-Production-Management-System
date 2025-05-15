function validateAndSubmitForm() {
    $(".validation-message").text("");
    $(".form-control").css("border-color", "");
    var isValid = true;

    var itemName = $("#idItemName").val().trim();
    if (itemName === "") {
        $("#ItemNameSpan").text("Please Enter Item Name").css("color", "red");
        $("#idItemName").css("border-color", "red");
        isValid = false;
    } else {
        $("#ItemNameSpan").text("");
        $("#idItemName").css("border-color", "");
    }

    var maxQty = $("#idMaxQty").val().trim();
    if (maxQty === "") {
        $("#MaxQtySpan").text("Please Enter Max Quantity").css("color", "red");
        $("#idMaxQty").css("border-color", "red");
        isValid = false;
    } else {
        $("#MaxQtySpan").text("");
        $("#idMaxQty").css("border-color", "");
    }

    var minQty = $("#idMinQty").val().trim();
    if (minQty === "") {
        $("#MinQtySpan").text("Please Enter Min Quantity").css("color", "red");
        $("#idMinQty").css("border-color", "red");
        isValid = false;
    } else {
        $("#MinQtySpan").text("");
        $("#idMinQty").css("border-color", "");
    }
    $("#idproductDropdown").change(function () {
        var productName = $(this).val();
        if (!productName) {
            $("#ProductNameSpan").text("Please Select a Product").css("color", "red");
            $(this).css("border-color", "red");
            isValid = false;
        } else {
            $("#ProductNameSpan").text("");
            $(this).css("border-color", "");
        }
    });

    if (isValid) {
        $("#itemForm").submit();
    }
}
