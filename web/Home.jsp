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
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
    </head>
    <body>
        <div id="container" class="container">
        <div id="left-col" class="left-col">
            <!-- Slides will be inserted here dynamically -->
        </div>
        <ul class="nav">
            <li class="slide-up"><a href="#" onclick="prevSlide(); return false;">&lt;</a></li>
            <li class="slide-down"><a href="#" id="down_button" onclick="nextSlide(); return false;">&gt;</a></li>
        </ul>
    </div>
</body>
<style>
    body {
    font-family: 'Lato', sans-serif;
    color: #d6f9dd;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.container {
    width: 100%;
    height: 100vh;
    background-color: #2C302E;
    display: flex;
    position: relative;
}
.left-col {
    width: 100%;
    overflow: hidden;
    position: relative;
}
.slide {
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: #333; 
    opacity: 0;
    transition: opacity 1s ease-in-out;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    color: #fff;
}
.current {
    opacity: 1;
}
.nav a {
    color: #fff;
    text-decoration: none;
    font-size: 2rem;
}

</style>
<script>
    let slideData = [
    "Slide 1 Content Here",
    "Slide 2 Content Here",
    "Slide 3 Content Here",
    "Slide 4 Content Here"
];

let currentSlide = 0;

function createSlides() {
    const leftCol = document.getElementById('left-col');
    slideData.forEach((content, index) => {
        let slide = document.createElement('div');
        slide.className = 'slide';
        slide.textContent = content;
        if (index === 0) slide.classList.add('current');
        leftCol.appendChild(slide);
    });
}

function nextSlide() {
    let slides = document.querySelectorAll('.slide');
    slides[currentSlide].classList.remove('current');
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].classList.add('current');
}

function prevSlide() {
    let slides = document.querySelectorAll('.slide');
    slides[currentSlide].classList.remove('current');
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    slides[currentSlide].classList.add('current');
}

window.onload = function() {
    createSlides();
    setInterval(nextSlide, 5000); 
};

</script>
    </body>
</html>
