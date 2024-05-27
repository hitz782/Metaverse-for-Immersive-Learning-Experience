<%--
    Document   : meta
    Created on : 4 Apr, 2024, 9:00:35 PM
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
        <a-entity position="-4.8 0 -4" rotation="0 -90 0">
            <a-camera></a-camera>
        </a-entity>

        <!-- Light -->
        <a-light type="ambient" color="#FFF"></a-light>
        <a-light type="directional" intensity="0.5" position="1 1 0"></a-light>

        <!-- Class Model -->
        <a-assets>
            <a-asset-item id="classroom" src="../Models/classroom/scene.gltf"></a-asset-item>
        </a-assets>
        <a-entity gltf-model="#classroom" position="-0.10 0 0" rotation="0 0 0"></a-entity>

        <a-assets>
            <a-asset-item id="HumanCell" src="../Models/human_cell/scene.gltf"></a-asset-item>
        </a-assets>
        <a-entity gltf-model="#HumanCell" position="-0.2 1.2 -4" rotation="0 180 0"></a-entity>

        <!-- Plane acting as a button -->
        <a-plane id="clickable-plane" color="transparent" width="4" height="1.5"
                 event-set__enter="_event: mouseenter; color: #999"
                 event-set__leave="_event: mouseleave; color: transparent">
        </a-plane>

        <!-- Text on the plane -->
        <a-text id="clickable-text" value="Human Cell" color="white" position="0.5 1.8 -4" rotation="0 -90 0"
                align="center" width="4" wrap-count="30">
        </a-text>
    </a-entity>


</body>
</html>

