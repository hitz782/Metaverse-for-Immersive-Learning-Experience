<%--
    Document   : Human Cell
    Created on : 31 Mar, 2024, 7:17:34 PM
    Author     : hithe
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>A-Frame DNA Model</title>
        <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
    </head>
    <body>
    <a-scene>
        <!-- Camera -->
        <a-entity camera position="0 1.6 0.5" rotation="0 180 0" look-controls></a-entity>

        <!-- Light -->
        <a-light type="ambient" color="#FFF"></a-light>
        <a-light type="directional" intensity="0.5" position="1 1 0"></a-light>

        <!-- DNA Model -->
        <a-gltf-model id="plantcell" src="../human_cell/scene.gltf" scale="1 1 1" position="0 1 -1"></a-gltf-model>

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
