function CheckNameProduct() {
    const inputNameProduct = document.querySelector("#inputNameProduct");
    const nameProductIconCheck = document.querySelector(".name-product-icon-check");
    const nameProductIconError = document.querySelector(".name-product-icon-error");
    const nameProductErrorMessage = document.querySelector("#name-product-error");

    if (inputNameProduct.value === '') {
        inputNameProduct.style.borderBottom = '1px solid red';
        nameProductErrorMessage.innerHTML = 'Please enter name product!';
        nameProductIconError.style.display = 'block';
        nameProductIconCheck.style.display = 'none';
    } else {
        inputNameProduct.style.borderBottom = '1px solid green';
        nameProductErrorMessage.innerHTML = '';
        nameProductIconError.style.display = 'none';
        nameProductIconCheck.style.display = 'block';
    }
}

function CheckPriceProduct() {
    const inputPriceProduct = document.querySelector("#inputPriceProduct");
    const priceProductIconCheck = document.querySelector(".price-product-icon-check");
    const priceProductIconError = document.querySelector(".price-product-icon-error");
    const priceProductErrorMessage = document.querySelector("#price-product-error");

    if (inputPriceProduct.value === '') {
        inputPriceProduct.style.borderBottom = '1px solid red';
        priceProductErrorMessage.innerHTML = 'Please enter price product!';
        priceProductIconError.style.display = 'block';
        priceProductIconCheck.style.display = 'none';
    } else {
        inputPriceProduct.style.borderBottom = '1px solid green';
        priceProductErrorMessage.innerHTML = '';
        priceProductIconError.style.display = 'none';
        priceProductIconCheck.style.display = 'block';
    }
}

function CheckBrandProduct() {
    const selectBrandProduct = document.querySelector("#selectBrandProduct");
    const brandProductIconCheck = document.querySelector(".brand-product-icon-check");
    const brandProductIconError = document.querySelector(".brand-product-icon-error");
    const brandProductErrorMessage = document.querySelector("#brand-product-error");

    if (selectBrandProduct.value === '') {
        selectBrandProduct.style.borderBottom = '1px solid red';
        brandProductErrorMessage.innerHTML = 'Please select brand product!';
        brandProductIconError.style.display = 'block';
        brandProductIconCheck.style.display = 'none';
    } else {
        selectBrandProduct.style.borderBottom = '1px solid green';
        brandProductErrorMessage.innerHTML = '';
        brandProductIconError.style.display = 'none';
        brandProductIconCheck.style.display = 'block';
    }
}

function CheckProductType() {
    const selectProductType = document.querySelector("#selectProductType");
    const productTypeIconCheck = document.querySelector(".product-type-icon-check");
    const productTypeIconError = document.querySelector(".product-type-icon-error");
    const productTypeErrorMessage = document.querySelector("#product-type-error");

    if (selectProductType.value === '') {
        selectProductType.style.borderBottom = '1px solid red';
        productTypeErrorMessage.innerHTML = 'Please select product type!';
        productTypeIconError.style.display = 'block';
        productTypeIconCheck.style.display = 'none';
    } else {
        selectProductType.style.borderBottom = '1px solid green';
        productTypeErrorMessage.innerHTML = '';
        productTypeIconError.style.display = 'none';
        productTypeIconCheck.style.display = 'block';
    }
}

function CheckQuantityProduct() {
    const inputQuantityProduct = document.querySelector("#inputQuantityProduct");
    const quantityProductIconCheck = document.querySelector(".quantity-product-icon-check");
    const quantityProductIconError = document.querySelector(".quantity-product-icon-error");
    const quantityProductErrorMessage = document.querySelector("#quantity-product-error");

    if (inputQuantityProduct.value === '') {
        inputQuantityProduct.style.borderBottom = '1px solid red';
        quantityProductErrorMessage.innerHTML = 'Please enter quantity product!';
        quantityProductIconError.style.display = 'block';
        quantityProductIconCheck.style.display = 'none';
    } else {
        inputQuantityProduct.style.borderBottom = '1px solid green';
        quantityProductErrorMessage.innerHTML = '';
        quantityProductIconError.style.display = 'none';
        quantityProductIconCheck.style.display = 'block';
    }
}

function CheckDescriptionProduct() {
    const inputDescriptionProduct = document.querySelector("#inputDescriptionProduct");
    const descriptionProductIconCheck = document.querySelector(".description-product-icon-check");
    const descriptionProductIconError = document.querySelector(".description-product-icon-error");
    const descriptionProductErrorMessage = document.querySelector("#description-product-error");

    if (inputDescriptionProduct.value === '') {
        inputDescriptionProduct.style.borderBottom = '1px solid red';
        descriptionProductErrorMessage.innerHTML = 'Please enter description product!';
        descriptionProductIconError.style.display = 'block';
        descriptionProductIconCheck.style.display = 'none';
    } else {
        inputDescriptionProduct.style.borderBottom = '1px solid green';
        descriptionProductErrorMessage.innerHTML = '';
        descriptionProductIconError.style.display = 'none';
        descriptionProductIconCheck.style.display = 'block';
    }
}

function CheckContentProduct() {
    const inputContentProduct = document.querySelector("#inputContentProduct");
    const contentProductIconCheck = document.querySelector(".content-product-icon-check");
    const contentProductIconError = document.querySelector(".content-product-icon-error");
    const contentProductErrorMessage = document.querySelector("#content-product-error");

    if (inputContentProduct.value === '') {
        inputContentProduct.style.borderBottom = '1px solid red';
        contentProductErrorMessage.innerHTML = 'Please enter content product!';
        contentProductIconError.style.display = 'block';
        contentProductIconCheck.style.display = 'none';
    } else {
        inputContentProduct.style.borderBottom = '1px solid green';
        contentProductErrorMessage.innerHTML = '';
        contentProductIconError.style.display = 'none';
        contentProductIconCheck.style.display = 'block';
    }
}