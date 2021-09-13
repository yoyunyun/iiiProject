/*
 * jQuery myCart - v1.9 - 2020-12-03
 * http://asraf-uddin-ahmed.github.io/
 * Copyright (c) 2017 Asraf Uddin Ahmed; Licensed None
 */

(function ($) {

  "use strict";

  var OptionManager = (function () {
    var objToReturn = {};

    var _options = null;
    var DEFAULT_OPTIONS = {
      currencySymbol: '$',
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      classProductQuantity: 'my-product-quantity',
      classProductRemove: 'my-product-remove',
      classCheckoutCart: 'my-cart-checkout',
      clearCart: 'my-cart-clearCart',
      tableToExcel: 'my-cart-tableToExcel',
      affixCartIcon: true,
      showCheckoutModal: true,
      numberOfDecimals: 2,
      cartItems: null,
      clickOnAddToCart: function ($addTocart) {},
      afterAddOnCart: function (products, totalPrice,totalProtein,totalCarbohydrates,totalFat,totalSugar,totalNa, totalQuantity) {},
      clickOnCartIcon: function ($cartIcon, products, totalPrice,totalProtein,totalCarbohydrates,totalFat,totalSugar,totalNa, totalQuantity) {},
      checkoutCart: function (products, totalPrice,totalProtein,totalCarbohydrates,totalFat,totalSugar,totalNa, totalQuantity) {
        return false;
      },
      getDiscountPrice: function (products, totalPrice,totalProtein,totalCarbohydrates,totalFat,totalSugar,totalNa, totalQuantity) {
        return null;
      }
    };


    var loadOptions = function (customOptions) {
      _options = $.extend({}, DEFAULT_OPTIONS);
      if (typeof customOptions === 'object') {
        $.extend(_options, customOptions);
      }
    };
    var getOptions = function () {
      return _options;
    };

    objToReturn.loadOptions = loadOptions;
    objToReturn.getOptions = getOptions;
    return objToReturn;
  }());

  var MathHelper = (function () {
    var objToReturn = {};
    var getRoundedNumber = function (number) {
      if (isNaN(number)) {
        throw new Error('Parameter is not a Number');
      }
      number = number * 1;
      var options = OptionManager.getOptions();
      return number.toFixed(options.numberOfDecimals);
    };
    objToReturn.getRoundedNumber = getRoundedNumber;
    return objToReturn;
  }());

  var ProductManager = (function () {
    var objToReturn = {};

    /*
    PRIVATE
    */
    const STORAGE_NAME = "__mycart";
    localStorage[STORAGE_NAME] = localStorage[STORAGE_NAME] ? localStorage[STORAGE_NAME] : "";
    var getIndexOfProduct = function (id) {
      var productIndex = -1;
      var products = getAllProducts();
      $.each(products, function (index, value) {
        if (value.id == id) {
          productIndex = index;
          return;
        }
      });
      return productIndex;
    };
    var setAllProducts = function (products) {
      localStorage[STORAGE_NAME] = JSON.stringify(products);
    };
    var addProduct = function (id, name, summary, price,protein,carbohydrates,fat,sugar,na, quantity, image) {
      var products = getAllProducts();
      products.push({
        id: id,
        name: name,
        summary: summary,
        price: price,
        protein:protein,
        carbohydrates:carbohydrates,
        fat:fat,
        sugar:sugar,
        na:na,
        quantity: quantity,
        image: image
      });
      setAllProducts(products);
    };

    /*
    PUBLIC
    */
    var getAllProducts = function () {
      try {
        var products = JSON.parse(localStorage[STORAGE_NAME]);
        return products;
      } catch (e) {
        return [];
      }
    };
    var updatePoduct = function (id, quantity, increaseQuantity) {
      var productIndex = getIndexOfProduct(id);
      if (productIndex < 0) {
        return false;
      }
      var products = getAllProducts();
      if(increaseQuantity) {
        products[productIndex].quantity = products[productIndex].quantity * 1 + (typeof quantity === "undefined" ? 1 : quantity * 1);
      } else {
        products[productIndex].quantity = typeof quantity === "undefined" ? products[productIndex].quantity * 1 + 1 : quantity * 1;
      }
      setAllProducts(products);
      return true;
    };
    var setProduct = function (id, name, summary, price,protein,carbohydrates,fat,sugar,na, quantity, image) {
      if (typeof id === "undefined") {
        console.error("id required");
        return false;
      }
      if (typeof name === "undefined") {
        console.error("name required");
        return false;
      }
      if (typeof image === "undefined") {
        console.error("image required");
        return false;
      }
      if (!$.isNumeric(price)) {
        console.error("price is not a number");
        return false;
      }
      if (!$.isNumeric(quantity)) {
        console.error("quantity is not a number");
        return false;
      }
      summary = typeof summary === "undefined" ? "" : summary;

      if (!updatePoduct(id, quantity, true)) {
        addProduct(id, name, summary, price,protein,carbohydrates,fat,sugar,na, quantity, image);
      }
    };
    var clearProduct = function () {
      setAllProducts([]);
    };
    var removeProduct = function (id) {
      var products = getAllProducts();
      products = $.grep(products, function (value, index) {
        return value.id != id;
      });
      setAllProducts(products);
    };
    var getTotalQuantity = function () {
      var total = 0;
      var products = getAllProducts();
      $.each(products, function (index, value) {
        total += value.quantity * 1;
      });
      return total;
    };
    var getTotalPrice = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.price;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    
    var getTotalProtein = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.protein;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    
    var getTotalCarbohydrates = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.carbohydrates;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    
    var getTotalFat = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.fat;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    
    var getTotalSugar = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.sugar;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    
    var getTotalNa = function () {
      var products = getAllProducts();
      var total = 0;
      $.each(products, function (index, value) {
        total += value.quantity * value.na;
        total = MathHelper.getRoundedNumber(total) * 1;
      });
      return total;
    };
    

    objToReturn.getAllProducts = getAllProducts;
    objToReturn.updatePoduct = updatePoduct;
    objToReturn.setProduct = setProduct;
    objToReturn.clearProduct = clearProduct;
    objToReturn.removeProduct = removeProduct;
    objToReturn.getTotalQuantity = getTotalQuantity;
    objToReturn.getTotalPrice = getTotalPrice;
    objToReturn.getTotalProtein = getTotalProtein;
    objToReturn.getTotalCarbohydrates = getTotalCarbohydrates;
    objToReturn.getTotalFat = getTotalFat;
    objToReturn.getTotalSugar = getTotalSugar;
    objToReturn.getTotalNa = getTotalNa;
    return objToReturn;
  }());


  var loadMyCartEvent = function (targetSelector) {

    var options = OptionManager.getOptions();
    var $cartIcon = $("." + options.classCartIcon);
    var $cartBadge = $("." + options.classCartBadge);
    var classProductQuantity = options.classProductQuantity;
    var classProductRemove = options.classProductRemove;
    var classCheckoutCart = options.classCheckoutCart;
    var clearCart = options.clearCart;
    var tableToExcel = options.tableToExcel;

    var idCartModal = 'my-cart-modal';
    var idCartTable = 'my-cart-table';
    var idGrandTotal = 'my-cart-grand-total';
    var idGrand2Total = 'my-cart-grand2-total';
    var idProteinTotal = 'my-cart-Protein-total';
    var idCarbohydratesTotal = 'my-cart-Carbohydrates-total';
    var idFatTotal = 'my-cart-Fat-total';
    var idSugarTotal = 'my-cart-Sugar-total';
    var idNaTotal = 'my-cart-Na-total';
    var idEmptyCartMessage = 'my-cart-empty-message';
    var idDiscountPrice = 'my-cart-discount-price';
    var classProductTotal = 'my-product-total';
    var classAffixMyCartIcon = 'my-cart-icon-affix';


    if (options.cartItems && options.cartItems.constructor === Array) {
      ProductManager.clearProduct();
      $.each(options.cartItems, function () {
        ProductManager.setProduct(this.id, this.name, this.summary, this.price,this.protein,this.carbohydrates,this.fat,this.sugar,this.na,this.carbohydrates,this.fat,this.sugar,this.na, this.quantity, this.image);
      });
    }

    $cartBadge.text(ProductManager.getTotalQuantity());

    if (!$("#" + idCartModal).length) {
      $('body').append(
        '<div class="modal fade" id="' + idCartModal + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">' +
        '<div class="modal-dialog modal-xl" role="document">' +
        '<div class="modal-content">' +
        '<div class="modal-header">' +
        '<h4 class="modal-title" id="myModalLabel">食品計算機</h4>' +
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
        '</div>' +
        '<div class="modal-body modal-xl">' +
        '<table class="table table-hover" >'+
                '<thead>' +
        					'<tr>'+
						        '<th>食品名稱</th>'+
						        '<th>熱量(kcal)</th>'+
						        '<th>蛋白質(g)</th>'+
						        '<th>碳水化合物(g)</th>'+
						        '<th>脂肪(g)</th>'+
						        '<th>糖(g)</th>'+
						        '<th>鈉(mg)</th>'+
						        '<th>份數(每份/100g)</th>'+
						        '<th>總熱量(kcal)</th>'+
							'</tr>'+
        
        		'</thead>' +
        '</table>' +
        '<table class="table table-hover" id="' + idCartTable + '"></table>' +
        '</div>' +
        '<div class="modal-footer">' +
//        '<button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>' +
        '<button type="button" class="btn btn-primary ' + clearCart + '">清空</button>' +
        '<button type="button" class="btn btn-primary ' + tableToExcel + '">下載</button>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>'
      );
    }

    var drawTable = function () {
      var $cartTable = $("#" + idCartTable);
      $cartTable.empty();

      var products = ProductManager.getAllProducts();
      $.each(products, function () {
        var total = this.quantity * this.price;
        $cartTable.append(
          '<tr title="' + this.summary + '" data-id="' + this.id + '" data-price="' + this.price + '">' +
          '<td>' + this.name + '</td>' +
          '<td title="Unit Price" >' + options.currencySymbol + MathHelper.getRoundedNumber(this.price) + '</td>' +
          '<td>' + this.protein + '</td>' +
          '<td>' + this.carbohydrates + '</td>' +
          '<td class="text-right">' + this.fat + '</td>' +
          '<td class="text-right">' + this.sugar + '</td>' +
          '<td class="text-center">' + this.na + '</td>' +
          '<td title="Quantity"><input type="number" min="1" style="width: 70px;" class="' + classProductQuantity + '" value="' + this.quantity + '"/></td>' +
          '<td title="Total" class="text-right ' + classProductTotal + '">' + options.currencySymbol + MathHelper.getRoundedNumber(total) + '</td>' +
          '<td title="Remove from Cart" class="text-center" style="width: 30px;"><a href="javascript:void(0);" class="btn btn-xs btn-danger ' + classProductRemove + '">X</a></td>' +
          '</tr>'
        );
      });

      $cartTable.append(products.length ?
        '<tr style="color:red">' +
        '<td><strong>Total</strong></td>' +
        '<td ><strong id="' + idGrandTotal + '"></strong></td>' +
        '<td ><strong id="' + idProteinTotal + '"></strong></td>' +
        '<td ><strong id="' + idCarbohydratesTotal + '"></strong></td>' +
        '<td class="text-right"><strong id="' + idFatTotal + '"></strong></td>' +
        '<td class="text-right"><strong id="' + idSugarTotal + '"></strong></td>' +
        '<td class="text-center"><strong id="' + idNaTotal + '"></strong></td>' +
        '<td></td>' +
        '<td class="text-right"><strong id="' + idGrand2Total + '"></strong></td>' +
        '<td></td>' +
        '</tr>' : 
        '<div class="alert alert-danger" role="alert" id="' + idEmptyCartMessage + '">尚未加入食品</div>'
      );

//      var discountPrice = options.getDiscountPrice(products, ProductManager.getTotalPrice(), ProductManager.getTotalQuantity());
//      if (products.length && discountPrice !== null) {
//        $cartTable.append(
//          '<tr style="color: red">' +
//          '<td></td>' +
//          '<td><strong>Total (折扣)</strong></td>' +
//          '<td></td>' +
//          '<td></td>' +
//          '<td class="text-right"><strong id="' + idDiscountPrice + '"></strong></td>' +
//          '<td></td>' +
//          '</tr>'
//        );
//      }

      showGrandTotal();
      showGrand2Total();
      showProteinTotal();
      showCarbohydratesTotal();
      showFatTotal();
      showSugarTotal();
      showNaTotal();
      showDiscountPrice();
    };
    var showModal = function () {
      drawTable();
      $("#" + idCartModal).modal('show');
    };
    var updateCart = function () {
      $.each($("." + classProductQuantity), function () {
        var id = $(this).closest("tr").data("id");
        ProductManager.updatePoduct(id, $(this).val());
      });
    };
    var showGrandTotal = function () {
      $("#" + idGrandTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalPrice()));
    };
    var showGrand2Total = function () {
      $("#" + idGrand2Total).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalPrice()));
    };
    var showProteinTotal = function () {
      $("#" + idProteinTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalProtein()));
    };
    var showCarbohydratesTotal = function () {
      $("#" + idCarbohydratesTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalCarbohydrates()));
    };
    var showFatTotal = function () {
      $("#" + idFatTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalFat()));
    };
    var showSugarTotal = function () {
      $("#" + idSugarTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalSugar()));
    };
    var showNaTotal = function () {
      $("#" + idNaTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(ProductManager.getTotalNa()));
    };
    var showDiscountPrice = function () {
      $("#" + idDiscountPrice).text(options.currencySymbol + MathHelper.getRoundedNumber(options.getDiscountPrice(ProductManager.getAllProducts(), ProductManager.getTotalPrice(), ProductManager.getTotalQuantity())));
    };

    /*
    EVENT
    */
    if (options.affixCartIcon) {
      var cartIconBottom = $cartIcon.offset().top * 1 + $cartIcon.css("height").match(/\d+/) * 1;
      var cartIconPosition = $cartIcon.css('position');
      $(window).scroll(function () {
        $(window).scrollTop() >= cartIconBottom ? $cartIcon.addClass(classAffixMyCartIcon) : $cartIcon.removeClass(classAffixMyCartIcon);
      });
    }

    $cartIcon.click(function () {
      options.showCheckoutModal ? showModal() : options.clickOnCartIcon($cartIcon, ProductManager.getAllProducts(), ProductManager.getTotalPrice(),ProductManager.getTotalProtein(),ProductManager.getTotalCarbohydrates(),ProductManager.getTotalFat(),ProductManager.getTotalSugar(),ProductManager.getTotalNa(), ProductManager.getTotalQuantity());
    });

    $(document).on("input", "." + classProductQuantity, function () {
      var price = $(this).closest("tr").data("price");
      var id = $(this).closest("tr").data("id");
      var quantity = $(this).val();

      $(this).parent("td").next("." + classProductTotal).text(options.currencySymbol + MathHelper.getRoundedNumber(price * quantity));
      ProductManager.updatePoduct(id, quantity);

      $cartBadge.text(ProductManager.getTotalQuantity());
      showGrandTotal();
      showGrand2Total();
      showProteinTotal();
      showCarbohydratesTotal();
      showFatTotal();
      showSugarTotal();
      showNaTotal();
      showDiscountPrice();
    });

    $(document).on('keypress', "." + classProductQuantity, function (evt) {
      if (evt.keyCode >= 48 && evt.keyCode <= 57) {
        return;
      }
      evt.preventDefault();
    });

    $(document).on('click', "." + classProductRemove, function () {
      var $tr = $(this).closest("tr");
      var id = $tr.data("id");
      $tr.hide(500, function () {
        ProductManager.removeProduct(id);
        drawTable();
        $cartBadge.text(ProductManager.getTotalQuantity());
      });
    });

    $(document).on('click', "." + classCheckoutCart, function () {
      var products = ProductManager.getAllProducts();
      if (!products.length) {
        $("#" + idEmptyCartMessage).fadeTo('fast', 0.5).fadeTo('fast', 1.0);
        return;
      }
      updateCart();
      var isCheckedOut = options.checkoutCart(ProductManager.getAllProducts(), ProductManager.getTotalPrice(), ProductManager.getTotalProtein(),ProductManager.getTotalCarbohydrates(),ProductManager.getTotalFat(),ProductManager.getTotalSugar(),ProductManager.getTotalNa(), ProductManager.getTotalQuantity());
      if (isCheckedOut !== false) {
        ProductManager.clearProduct();
        $cartBadge.text(ProductManager.getTotalQuantity());
        $("#" + idCartModal).modal("hide");
      }
    });
    
    $(document).on('click', "." + clearCart, function () {
      updateCart();
      var isCheckedOut = options.checkoutCart(ProductManager.getAllProducts(), ProductManager.getTotalPrice(), ProductManager.getTotalProtein(),ProductManager.getTotalCarbohydrates(),ProductManager.getTotalFat(),ProductManager.getTotalSugar(),ProductManager.getTotalNa(), ProductManager.getTotalQuantity());
      if (isCheckedOut !== false) {
        ProductManager.clearProduct();
        $cartBadge.text(ProductManager.getTotalQuantity());
        $("#" + idCartModal).modal("hide");
      }
    });
    
    
    
    $(document).on('click', "." + tableToExcel, function () {
      var products = ProductManager.getAllProducts();
      let str = `食品名稱,熱量(kcal),蛋白質(g),碳水化合物(g),脂肪(g),糖(g),鈉(mg),(份/100g)\n`;
      $.each(products, function ()  {
	      var jsonData = [
	          {
	           name:this.name,
	           calories:this.price,
	           protein:this.protein,
	           carbohydrates:this.carbohydrates,
	           fat:this.fat,
	           sugar:this.sugar,
	           na:this.na
	          },
	      ]

            
            for(let i = 0 ; i < jsonData.length ; i++ ){
              for(let item in jsonData[i]){
                  str+=`${jsonData[i][item] + '\t'},`;     
              }
              str+='\n';
            }
            
      });
            let uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
            var link = document.createElement("a");
            link.href = uri;
            link.download =  "食品資料表.csv";
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);



      updateCart();
      var isCheckedOut = options.checkoutCart(ProductManager.getAllProducts(), ProductManager.getTotalPrice(), ProductManager.getTotalProtein(),ProductManager.getTotalCarbohydrates(),ProductManager.getTotalFat(),ProductManager.getTotalSugar(),ProductManager.getTotalNa(), ProductManager.getTotalQuantity());
      if (isCheckedOut !== false) {
        ProductManager.clearProduct();
        $cartBadge.text(ProductManager.getTotalQuantity());
        $("#" + idCartModal).modal("hide");
      }
    });



    $(document).on('click', targetSelector, function () {
      var $target = $(this);
      options.clickOnAddToCart($target);

      var id = $target.data('id');
      var name = $target.data('name');
      var summary = $target.data('summary');
      var price = $target.data('price');
      var protein =  $target.data('protein');
      var carbohydrates =  $target.data('carbohydrates');
      var fat =  $target.data('fat');
      var sugar =  $target.data('sugar');
      var na =  $target.data('na');
      var quantity = $target.data('quantity');
      var image = $target.data('image');

      ProductManager.setProduct(id, name, summary, price,protein,carbohydrates,fat,sugar,na, quantity, image);
      $cartBadge.text(ProductManager.getTotalQuantity());

      options.afterAddOnCart(ProductManager.getAllProducts(), ProductManager.getTotalPrice(), ProductManager.getTotalProtein(),ProductManager.getTotalCarbohydrates(),ProductManager.getTotalFat(),ProductManager.getTotalSugar(),ProductManager.getTotalNa(), ProductManager.getTotalQuantity());
    });

  };


  $.fn.myCart = function (userOptions) {
    OptionManager.loadOptions(userOptions);
    loadMyCartEvent(this.selector);
    return this;
  };


})(jQuery);