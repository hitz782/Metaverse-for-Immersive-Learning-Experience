<%--
    Document   : eye1
    Created on : 8 Apr, 2024, 12:04:46 PM
    Author     : hithe
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Eye</title>
        <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
    </head>
    <body>
    <a-scene>
        <!-- Camera -->
        <a-entity position="-4.8 0 -4" rotation="0 -90 0">
            <a-camera wasd-controls="acceleration: 20; fly: false"></a-camera>
        </a-entity>

        <!-- Light -->
        <a-light type="ambient" color="#FFF"></a-light>
        <a-light type="directional" intensity="0.5" position="1 1 0"></a-light>

        <!-- Class Model -->
        <a-assets>
            <a-asset-item id="classroom" src="../classroom/scene.gltf"></a-asset-item>
        </a-assets>
        <a-entity gltf-model="#classroom" position="-0.10 0 0" rotation="0 0 0"></a-entity>

        <a-assets>
            <a-asset-item id="eye" src="scene.gltf"></a-asset-item>
        </a-assets>
        <a-entity gltf-model="#eye" position="-1.2 1.4 -4" rotation="0 180 0" scale="0.005 0.005 0.005"></a-entity>

        <!-- Text on the plane -->
        <a-text id="clickable-text" value="Eye" color="white" position="0.5 2.4 -4" rotation="0 -90 0"
                align="center" width="4" wrap-count="30">
        </a-text>
    </a-entity>


</body>
</html>

