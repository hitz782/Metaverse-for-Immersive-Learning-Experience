<%--
    Document   : harddisk
    Created on : 31 Mar, 2024, 8:23:45 PM
    Author     : hithe
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>A-Frame Plant Cell Model</title>
        <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
    </head>
    <body style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0;">
        <h2 style="text-align: center;">Scroll the screen for better visibility</h2>
    <a-scene style="width: 80%; height: 80%;">
        <!-- Camera -->
        <a-entity camera position="0 1.6 0.5" rotation="0 180 0" look-controls></a-entity>

        <!-- Light -->
        <a-light type="ambient" color="#FFF"></a-light>
        <a-light type="directional" intensity="0.5" position="1 1 0"></a-light>

        <!-- Plant Cell Model -->
        <a-gltf-model id="plantCell" src="scene.gltf" scale="0.5 0.5 0.5" position="1 1 -2" rotation="-5 30 5"></a-gltf-model>

        <!-- Rotate 360 Degrees -->
        <a-entity id="rotateContainer" rotation="0 0 0" rotate-360></a-entity>
    </a-scene>

    <script>
        AFRAME.registerComponent('rotate-360', {
            init: function () {
                this.rotateContainer = document.getElementById('rotateContainer');
            },
            tick: function () {
                this.rotateContainer.object3D.rotation.y += 0.005; // Adjust rotation speed as needed
            }
        });
    </script>
</body>
</html>
