<%--
    Document   : faq
    Created on : 27 Mar, 2024, 10:46:10 PM
    Author     : hithe
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAQ</title>
        <link rel="stylesheet" href="../Css/navbar.css">
        <style>
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                background-color: #FFFFFF;
            }
            .faq-container {
                display: flex;
                flex-direction: column;
                align-items: center;

            }

            .faq {
                width: 50%; /* Adjust width as needed */
                background-color: #f1f1f1;
                padding: 20px;
                margin-bottom: 15px;
            }

            .faq:hover {
                background-color: #ddd;
            }

            .faq h2 {
                padding: 15px;
                cursor: pointer;
                text-align: left;
                border-bottom: 1px solid #ddd;
                margin-bottom: 10px;
                font-size: 18px;
                background-color: #f1f1f1;
            }

            .faq-content {
                padding: 0 15px;
                display: none;
                color: #888;
                font-size: 18px;

            }

            .container {
                display: flex;
                flex-direction: row;
                width: 100%;

            }

            .image-container {
                flex: 1;
                padding: 20px;
            }

            .text-container {
                flex: 1;
                padding: 150px;
                text-align: center;
            }

            .text-container h2 {
                margin-bottom: 15px;
            }

            .button {
                background-color: #4DDBFF;/* Green */
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 10px;
                cursor: pointer;
            }
            button:hover {
                background-color: rgb(13,249,206);
            }
        </style>
    </head>
    <body>
        <header class="sticky-header">
            <ul class="logo">
                <li><a href="#" class="start-logo">Eduverse</a></li>
            </ul>
            <ul class="nav_links">
                <li><a href="../index.jsp">Explore</a></li>
                <li><a href="about1.jsp">About</a></li>
                <li><a href="#">FAQs</a></li>
                <li><button onclick="location.href = 'login.jsp';">Login</button></li>
            </ul>
        </header>
        <h2 style="text-align: center;">FAQ's</h2>
        <div class="faq-container">
            <div class="faq">
                <h2> What is EduVerse ?</h2>
                <div class="faq-content">
                    <p>EduVerse is an immersive learning platform that combines cutting-edge
                        technology with educational content, offering a unique and engaging
                        learning experience. Our platform utilizes 3D models, animations,
                        and the metaverse to create an interactive environment for learners. </p>
                </div>
            </div>

            <div class="faq">
                <h2>What is immersive learning?</h2>
                <div class="faq-content">
                    <p>Immersive learning uses virtual reality, 3D models, and other interactive elements to create an engaging and
                        realistic learning experience. It can help you learn faster and retain information better than traditional
                        methods. </p>
                </div>
            </div>
            <div class="faq">
                <h2>How does immersive learning work on EduVerse ?</h2>
                <div class="faq-content">
                    <p>Immersive learning on EduVerse involves the use of 3D models and
                        animations to enhance the educational content. Learners can explore
                        subjects in a more interactive and visually stimulating way, making
                        complex concepts easier to understand. </p>
                </div>
            </div>
            <div class="faq">
                <h2>What courses are available on EduVerse ?</h2>
                <div class="faq-content">
                    <p>We offer a diverse range of courses across various subjects, including
                        science, technology, arts, and humanities. Our courses cater to learners
                        of all ages, providing a broad spectrum of educational opportunities. </p>
                </div>
            </div>
            <div class="faq">
                <h2>Is there a specific age group for EduVerse users?</h2>
                <div class="faq-content">
                    <p>No, EduVerse is designed to accommodate learners of all ages.
                        Whether you're a student, professional, or lifelong learner, you'll find
                        courses that suit your interests and educational goals. </p>
                </div>
            </div>
            <div class="faq">
                <h2>What can I expect from the 3D models and virtual environments?</h2>
                <div class="faq-content">
                    <p>Our platform boasts high-quality 3D models and immersive virtual environments that bring your learning to
                        life! Explore realistic simulations, interact with objects, and feel like you're truly "in" the learning
                        experience. </p>
                </div>
            </div>
            <div class="faq">
                <h2>Can I access EduVerse on different devices?</h2>
                <div class="faq-content">
                    <p>Yes, EduVerse is accessible on various devices, including desktops,
                        laptops, tablets, and mobile phones. This ensures flexibility and
                        convenience for users to learn anytime, anywhere </p>
                </div>
            </div>
            <div class="faq">
                <h2>How can I get started on EduVerse ?</h2>
                <div class="faq-content">
                    <p>To begin your educational journey on EduVerse , simply sign up for an
                        account on our website. Once registered, you can explore our courses,
                        choose your areas of interest, and start learning in an immersive
                        environment.</p>
                </div>
            </div>
            <div class="faq">
                <h2>Is EduVerse free to use?</h2>
                <div class="faq-content">
                    <p>While certain features are available for free, EduVerse also offers
                        premium courses and content. Explore our pricing plans for a more
                        comprehensive learning experience.</p>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="image-container">
                <img src="../Images/faq.png" alt="FAQ Image">
            </div>
            <div class="text-container">
                <h2>Couldn't find your answer?</h2>
                <p>We're here to help! Send us your question and we'll get back to you as soon as possible.</p>
                <a href="sendfaq.jsp" class="button">Send us your question</a>
            </div>

            <script>
                var faq = document.getElementsByClassName("faq");
                var i;

                for (i = 0; i < faq.length; i++) {
                    faq[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var faqContent = this.querySelector(".faq-content");
                        if (faqContent.style.display === "block") {
                            faqContent.style.display = "none";
                        } else {
                            faqContent.style.display = "block";
                        }
                    });
                }
            </script>

    </body>
</html>
