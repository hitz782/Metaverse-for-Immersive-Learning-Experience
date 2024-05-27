<%--
    Document   : index
    Created on : 12 Mar, 2024, 11:51:34 AM
    Author     : hithe
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Explore page</title>
        <style>
            /* Complete CSS with modifications */

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                background-color:white;
            }

            li, a, button {
                font-family: "Poppins", sans-serif;
                font-weight: 500;
                font-size: 20px;
                color: #000000;
                text-decoration: none;
            }

            header {
                display: flex;
                justify-content: space-around;
                align-items: center;
                padding: 20px;
                box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
            }

            .start-header {
                position: sticky;
                top: 0;
                background-color: #ffffff;
                padding: 20px;
                z-index: 1000;
            }

            .start-logo a {
                background: linear-gradient(to right, rgb(13,249,206), rgb(95,16,216));
                -webkit-background-clip: text;
                background-clip: text;
                font-size: 25px;
                color: transparent;
            }

            .start-logo {
                list-style: none;
            }

            .verify {
                display: flex;
            }

            .btn {
                margin-left: 80px;
            }

            button {
                padding: 9px 25px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }

            button:hover {
                background-color: rgb(13,249,206);
            }

            .typing-effect {
                font-family: "Poppins", sans-serif;
                text-align: center;
                margin-top: 50px;
                font-weight: 570;
                font-size: 60px;
            }

            .typing-effect .word {
                opacity: 0;
                display: inline-block;
                vertical-align: top;
                transition: opacity 0.8s ease-in-out;
            }

            .typing-effect .word:nth-child(1) {
                animation: typeWord 4s steps(5, end) forwards;
            }

            .typing-effect .word:nth-child(2) {
                animation: typeWord 4s steps(5, end) forwards;
            }

            .typing-effect .word:nth-child(3) {
                animation: typeWord 4s steps(5, end) forwards;
            }

            .typing-effect .word:nth-child(4) {
                animation: typeWord 4s steps(5, end) forwards;
            }

            .typing-effect .word:nth-child(5) {
                animation: typeWord 4s steps(6, end) forwards;
            }

            @keyframes typeWord {
                0% {
                    opacity: 0;
                }

                100% {
                    opacity: 1;
                }
            }

            .intro h5 {
                font-family: "Poppins", sans-serif;
                text-align: center;
                margin-top: 5px;
                font-size: 20px;
            }

            .categories-content {
                margin-top: 80px;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, auto));
                gap: 1.5rem;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                text-align: center;
            }

            .box img {
                max-width: 100%;
                height: auto;
                display: block;
                margin: 0 auto;
            }

            .box {
                padding: 25px 60px;
                border: 1px solid #e9ecef;
                border-radius: 20px;
                box-shadow: -15.729px -15.729px 50px rgb(255 255 255/10%);
                transition: all .40s ease;
                text-align: center;
            }

            .box:hover {
                transform: translateY(-15px);
                box-shadow: 0 0 10px rgb(13, 249, 206);
            }

            .box h3 {
                font-family: "Poppins", sans-serif;
                font-size: 30px;
                font-weight: 700;
                margin-bottom: 10px;
                line-height: 1.3;
                transition: all .40s ease;
            }

            .box p {
                font-family: "Poppins", sans-serif;
                font-size: 16px;
                font-weight: 500;
                margin-bottom: 20px;
                line-height: 1.3;
                transition: all .40s ease;
            }

            .connect {
                font-family: "Poppins", sans-serif;
                text-align: center;
                margin-top: 50px;
                font-weight: 570;
                font-size: 60px;
            }

            .connection {
                margin-top: 20px;
                margin-bottom: 40px;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, auto));
                gap: 1.5rem;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                text-align: center;
            }

            .boxes {
                padding: 25px 60px;
                border: 1px solid #e9ecef;
                border-radius: 20px;
                box-shadow: -11.729px -11.729px 32px rgb(255 255 255/15%);
                transition: all .40s ease;
            }

            .boxes:hover{
                box-shadow: 0 0 10px rgb(13, 249, 206);
            }

            .boxes h3 {
                font-family: "Poppins", sans-serif;
                font-size: 30px;
                font-weight: 700;
                margin-bottom: 10px;
                line-height: 1.3;
                transition: all .40s ease;
            }

            .boxes p {
                font-family: "Poppins", sans-serif;
                font-size: 16px;
                font-weight: 500;
                margin-bottom: 20px;
                line-height: 1.3;
                transition: all .40s ease;
            }

            .connection .boxes {
                word-wrap: break-word;
            }

            .abt {
                padding: 10px 25px;
                background-color: #4DDBFF;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }

            .abt:hover {
                background-color: aquamarine;
            }

            .random-img {
                font-family: "Poppins", sans-serif;
                text-align: center;
                margin-top: 50px;
                font-weight: 570;
                font-size: 30px;
                margin-bottom: 40px;
            }

            .slider {
                height: 250px;
                margin: auto;
                position: relative;
                width: 90%;
                display: grid;
                place-items: center;
                margin-bottom: 40px;
            }

            .slide-track {
                display: flex;
                width: calc(250px*10);
                animation: scroll 40s linear infinite;
            }

            @keyframes scroll {
                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(calc(-250px * 5));
                }
            }

            .slide {
                height: 200px;
                width: 250px;
                display: flex;
                align-items: center;
                padding: 15px;
                perspective: 100px;
            }

            img {
                width: 100%;
            }

            img:hover {
                transform: translateZ(20px);
            }

            .slider::before,
            .slider::after {
                content: '';
                height: 100%;
                position: absolute;
                width: 15%;
                z-index: 2;
            }

            .slider::before {
                top: 0;
                left: 0;
            }

            .slider::after {
                top: 0;
                right: 0;
                transform: rotateZ(180deg);
            }
        </style>
    </head>
    <body>
        <header class="start-header">
            <ul class="start-logo"><li ><a href="#">Eduverse</a></li></ul>
            <div class="verify">
                <a class="cta" href="User/login.jsp?logout=false"><button class="btn">Log in</button></a>
                <a class="cta" href="User/registration.jsp"><button class="btn">Sign up</button></a>
            </div>
        </header>
        <div class="intro">
            <div class="typing-effect">
                <span class="word">What</span>
                <span class="word">will</span>
                <span class="word">you</span>
                <span class="word">learn</span>
                <span class="word">today?</span>
            </div>
            <h5> Embark on an educational Journey where knowledge meets innovation in the immersive realms of EDUVERSE</h5>
        </div>
        <section class="categories" id="categories">
            <div class="categories-content">
                <div class="box">
                    <img src="Images/Dog.png" >
                    <h3>3D Models </h3>
                    <p>Mastering 3D modeling means shaping digital shapes and textures for realistic objects.</p>
                </div>

                <div class="box">
                    <img src="Images/anim.png">
                    <h3>Videos and Animations</h3>
                    <p>Animating requires mastering movement and timing for lifelike creations.</p>
                </div>

                <div class="box">
                    <img src="Images/Imm.png">
                    <h3>Interactive Metaverse</h3>
                    <p>Learning interactive metaverse involves mastering immersive environments for engaging experiences.</p>
                </div>

                <div class="box">
                    <img src="Images/Learn.png">
                    <h3>Immersive Learning </h3>
                    <p>Immersive learning involves engaging in interactive environments for enhanced understanding.</p>
                </div>
            </div>
        </section>

        <section>
            <h3 class="connect">Connect With Team</h3>
            <div class="connection">
                <div class="boxes">
                    <h3>About Us</h3>
                    <p>Want to know more about Eduverse?</p>
                    <a class="abt-btn" href="User/about1.jsp"><button class="abt">Click me</button></a>
                </div>
                <div class="boxes">
                    <h3>FAQ</h3>
                    <p>Here are frequently asked question about Eduverse</p>
                    <a class="abt-btn" href="User/faq1.jsp"><button class="abt">Click me</button></a>
                </div>
            </div>
        </section>

        <section>
            <h3 class="random-img">Browse through different number of educational experiences</h3>
            <div class="slider">
                <div class="slide-track">
                    <div class="slide">
                        <img src="Images/img1.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img2.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img3.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img4.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img5.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img6.jpg">
                    </div>

                    <div class="slide">
                        <img src="Images/img1.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img2.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img3.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img4.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img5.png">
                    </div>
                    <div class="slide">
                        <img src="Images/img6.jpg">
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>



