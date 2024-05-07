<%-- 
    Document   : Home
    Created on : Apr 27, 2024, 6:27:57 PM
    Author     : Kavindu Piyumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="<link rel=" stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <link rel="stylesheet" href="Home.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <script>

    function bttonFunction() {
        var imageContainer = document.getElementById("imageContainer");
        var btnText = document.getElementById("Viewbtn");

        if (moreText.style.display === "none") {
            imageContainer.style.display = "grid";
            btnText.innerHTML = "View Less";
        } else {
            imageContainer.style.display = "none";
            btnText.innerHTML = "View More";
        }
    }
</script>
    <body>
         <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/c1.jpg" alt="Los Angeles" width="1100" height="200">
            </div>
            <div class="carousel-item">
                <img src="images/c2.jpg" alt="Chicago" width="1100" height="200">
            </div>
            <div class="carousel-item">
                <img src="images/imgcaro1.jpg" alt="New York" width="1100" height="200">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <!--add catogories-->
    <div class="container">
        <br><br>
        <div class="title">
            <h3>Shop by Category</h3>
        </div>
        <div class="ImageContainer">
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/bakery.jpg" alt="bakery" >
                </div>
                <h5 style="text-align: center;">Bakery</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/beauty.jpg" alt="beauty">
                </div>
                <h5 style="text-align: center;">Beauty</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/beverages.jpg" alt="beverages">
                </div>
                <h5 style="text-align: center;">Beverages</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/cooking_essentials.jpg" alt="cooke" >
                </div>
                <h5 style="text-align: center;">Cooking Essentials</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/dairy.jpg" alt="dairy" >
                </div>
                <h5 style="text-align: center;">Dairy</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/desserts.jpg" alt="desserts" >
                </div>
                <h5 style="text-align: center;">Desserts</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/fruits.jpg" alt="fruits" >
                </div>
                <h5 style="text-align: center;">Fruits</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/household.jpg" alt="household" >
                </div>
                <h5 style="text-align: center;">Household</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/meats.jpg" alt="meats" >
                </div>
                <h5 style="text-align: center;">Meats</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/rice.jpg" alt="rice" >
                </div>
                <h5 style="text-align: center;">Rice</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/seafood.jpg" alt="seafood" >
                </div>
                <h5 style="text-align: center;">Seafood</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/seeds&spices.jpg" alt="sesp" >
                </div>
                <h5 style="text-align: center;">Seeds & Spices</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/snacks.jpg" alt="snacks" >
                </div>
                <h5 style="text-align: center;">Snacks</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/tea&coffee.jpg" alt="teacoffie" >
                </div>
                <h5 style="text-align: center;">Tea & Coffee</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/catogaris/vegetables.jpg" alt="veg" >
                </div>
                <h5 style="text-align: center;">Vegetables</h5>
            </div>
        </div>
    </div>
<br><br><br><br>
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/carosal2.1jpg.png" alt="carosel" width="1100" height="200">
            </div>
            <div class="carousel-item">
                <img src="images/imgcaro.jpg" alt="Chicago" width="1100" height="200">
            </div>
            
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div><br><br><br>

    <!-- Products -->
    <section class="product"> 
        <h2 class="product-category">best selling</h2>
        <button class="pre-btn"><img src="images/arrow.png" alt=""></button>
        <button class="nxt-btn"><img src="images/arrow.png" alt=""></button>
        <div class="product-container">
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card1.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card2.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card3.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card4.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card5.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card6.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card7.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card8.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card9.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
            <div class="product-card">
                <div class="product-image">
                    <span class="discount-tag">50% off</span>
                    <img src="images/card10.jpg" class="product-thumb" alt="">
                    <button class="card-btn">add to wishlist</button>
                </div>
                <div class="product-info">
                    <h2 class="product-brand">brand</h2>
                    <p class="product-short-description">a short line about the cloth..</p>
                    <span class="price">$20</span><span class="actual-price">$40</span>
                </div>
            </div>
        </div>
    </section>



    <br><br><br>
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/caro22.jpg" alt="carousel2" width="1100" height="200">
            </div>
            <div class="carousel-item">
                <img src="images/caro23.jpg" alt="carousel2" width="1100" height="200">
            </div>
            
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
<br><br><br><br>
       <!--add catogories-->
       <div class="container">
        <br><br>
        <div class="title">
            <h3>Shop by Category</h3>
        </div>
        <div class="ImageContainer">
            <div class="item">
                <div class="img">
                    <img src="images/sellar/kist.jpg" alt="kist" >
                </div>
                <h5 style="text-align: center;">Kist</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/kotmale.jpg" alt="kothmale">
                </div>
                <h5 style="text-align: center;">Kothmale</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/magic.jpg" alt="magic">
                </div>
                <h5 style="text-align: center;">Magic</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/motha.png" alt="motha" >
                </div>
                <h5 style="text-align: center;">Motha</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/munchee.jpg" alt="munchee" >
                </div>
                <h5 style="text-align: center;">Munchee</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/sunlight.jpg" alt="sunlight" >
                </div>
                <h5 style="text-align: center;">Sunlight</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="image/sellar/unilever.jpg" alt="unilever" >
                </div>
                <h5 style="text-align: center;">Unilever</h5>
            </div>
            <div class="item">
                <div class="img">
                    <img src="images/sellar/wijaya.jpg" alt="vijaya" >
                </div>
                <h5 style="text-align: center;">Vijaya</h5>
            </div>
          
        </div>
    </div>
    </body>
</html>
